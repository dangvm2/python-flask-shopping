from flask import Flask, render_template, url_for, request, json, session, Blueprint
from controller.zHelper import *
from flaskext.mysql import MySQL

cart_blueprint = Blueprint('cart', __name__,)#for route

app = Flask(__name__)
app.config.from_object("config")
mysql = MySQL(app)

@cart_blueprint.route("/showCart")
def showCart():
    arrItemsCart = []
    
    if session.get("Cart"):
        arrItemsCart = json.loads(session["Cart"], object_hook=dict_to_obj)

    return render_template("cart.html", arrItemsCart = arrItemsCart)


@cart_blueprint.route("/editQuantityCart", methods=["POST"])
def editQuantityCart():
    
    l_totalPrice = 0
    l_totalFinalPrice = 0

    if session.get("Cart"):
        arrItemsCart = json.loads(session["Cart"], object_hook=dict_to_obj)
        l_itemCode = request.json["itemCode"]
        l_quantity = request.json["quantity"]
        if l_quantity == "":
            l_quantity = "0"
        
        for item in arrItemsCart:
            if item.p_ItemCode == l_itemCode:
                item.p_Quantity = int(l_quantity)
                l_totalPrice = item.p_Price * item.p_Quantity
            item.p_TotalPrice = item.p_Price * item.p_Quantity

            l_totalFinalPrice += item.p_TotalPrice
        
        session["Cart"] = json.dumps(arrItemsCart, default = convert_to_dict, indent = 4, sort_keys=True)

        return json.dumps([{ "result": "1", "totalFinalPrice": l_totalFinalPrice, "totalPrice": l_totalPrice }])
    else:
        return json.dumps([{ "result": "0" }])
    

@cart_blueprint.route("/createOrder", methods=["POST"])
def createOrder():
    if not session.get("Cart"):
            return render_template("cart.html")
    
    l_result = ""
    try:
        conn = mysql.connect()
        cursor = conn.cursor()

        jsonHeader = ""
        jsonDetails = ""

        l_comma = ""
        l_totalPrice = 0
        l_totalDiscountPrice = 0

        arrItemsCart = json.loads(session["Cart"], object_hook=dict_to_obj)
        for item in arrItemsCart:
            l_totalPrice += item.p_TotalPrice
            l_totalDiscountPrice += item.p_Discount
            jsonDetails_item = ['' + l_comma + '{"LineNum" : "' + str(arrItemsCart.index(item)) + '"'
                                ,', "ItemCode" : "' + item.p_ItemCode + '"'
                                ,', "ItemName" : "' + item.p_ItemName + '"'
                                ,', "Price" : "' + str(item.p_Price) + '"'
                                ,', "Quantity" : "' + str(item.p_Quantity) + '"'
                                ,', "DiscountPrice" : "' + str(item.p_Discount) + '"'
                                ,', "TotalPrice" : "' + str(item.p_TotalPrice) + '"'
                                ,', "ImgUrl" : "' + item.p_ImgUrl + '"'
                                ,', "Description" : "' + item.p_Description + '"' +'}']
            jsonDetails += "".join(jsonDetails_item)
            l_comma = ","
        
        jsonDetails = '[' + jsonDetails+ ']'
        
        jsonHeader = "".join(['{"OrderStatus" : 1'
                                ,', "Address" : "' + request.json["Address"] + '"'
                                ,', "CustomerName" : "' + request.json["CustomerName"] + '"'
                                ,', "CustomerPhone" : "' + request.json["CustomerPhone"] + '"'
                                ,', "Remark" : "' + request.json["Remark"] + '"'
                                ,', "TotalPrice" : "' + str(l_totalPrice) + '"'
                                ,', "DiscountPrice" : "' + str(l_totalDiscountPrice) + '"'
                                ,', "TotalFinalPrice" : "' + str(l_totalPrice - l_totalDiscountPrice) + '"' + '}'])
        
        args = (jsonHeader, jsonDetails)
        
        cursor.callproc('spCreateOrder', args)
        data = cursor.fetchall()
        
        if data is 0:
            arrPro = None
        else:
            l_result = data[0][0]
            # for item in data:
            #     print(item[0])
    except Exception as e:
        return json.dumps([{"result": "0", "error": str(e)}])
        #return json.dumps({'error':'database error'})
    finally:
        conn.commit()
        cursor.close() 
        conn.close()

    session.pop("Cart", None)
    session["GuestInfo"] = {"cartCount": "0"}
    return render_template("cart.html", textHeader = "Đơn hàng đã được đặt, chúng tôi sẽ liên hệ và giao hàng cho bạn.", textButton = "Tiếp tục mua hàng", res = json.dumps([{ "result": l_result }]))
    #return json.dumps([{ "result": l_result }])


@cart_blueprint.route("/deleteItem", methods=["POST"])
def deleteItem():
    if not session.get("Cart"):
        return render_template("cart.html")

    arrItemsCart = json.loads(session["Cart"], object_hook=dict_to_obj)
    l_itemRemove = None
    l_totalPrice = 0
    l_totalDiscountPrice = 0
    l_totalFinalPrice = 0

    for item in arrItemsCart:
        if str(item.p_ItemCode) == str(request.json["itemCode"]):
            l_itemRemove = item
        else:
            l_totalPrice += item.p_TotalPrice
            l_totalDiscountPrice += item.p_Discount
    
    arrItemsCart.remove(l_itemRemove)
    l_totalFinalPrice = l_totalPrice - l_totalDiscountPrice

    session["Cart"] = json.dumps(arrItemsCart, default = convert_to_dict, indent = 4, sort_keys=True)
    session["GuestInfo"] = {"cartCount": len(arrItemsCart)}

    return json.dumps([{ "result": "1", "totalFinalPrice": l_totalFinalPrice, "totalPrice": l_totalPrice
                , "totalDiscount": l_totalDiscountPrice, "cartCount": len(arrItemsCart)}])

