from flask import Flask, render_template, url_for, request, json, session, Blueprint, redirect
from flaskext.mysql import MySQL
from model.Products import DTO_ProductSingle, DTO_Cart, getDetailProduct
from controller.zHelper import *

detail_blueprint = Blueprint('detail', __name__,)#for route

app = Flask(__name__)
app.config.from_object("config")
mysql = MySQL(app)

@detail_blueprint.route("/detail/<id>")
def showDetail(id):
    #arrPro = []
    
    # try:
    #     conn = mysql.connect()
    #     cursor = conn.cursor()
    #     cursor.callproc('spGetProductDetail', [id])
    #     data = cursor.fetchall()
    #     print(1)
    #     print(data)

    #     if data is 0:
    #         arrPro = None
    #     else:
    #         for item in data:
    #             arrPro.append(DTO_ProductSingle(
    #                 p_ItemCode = id,
    #                 p_ItemName = item[0],
    #                 p_Price = item[1],
    #                 p_UnitName = item[2],
    #                 p_ImgUrl = item[3],
    #                 p_Description = item[4]
    #             ))
    #             break

    # except Exception as e:
    #     return json.dumps({'error':str(e)})
    #     #return json.dumps({'error':'database error'})
    # finally:
    #     conn.commit()
    #     cursor.close() 
    #     conn.close()

    #return render_template("detail.html", arrPro = arrPro)

    #arrPro = []
    
    success, arrPro = getDetailProduct(id)
    
    if success == True:
        return render_template("detail.html", arrPro = arrPro)
    else:
        return render_template("detail.html")

    


@detail_blueprint.route("/detail/AddToCart", methods=["POST"])
def AddToCart():
    arrItemsCart = []
    
    if session.get("Cart"):
        arrItemsCart = json.loads(session["Cart"], object_hook=dict_to_obj)

    l_itemCode = request.json["itemCode"]
    l_quantity = request.json["quantity"]
    # l_itemName = request.json["itemName"]
    # l_price = request.json["price"]
    # l_imgUrl = request.json["imgUrl"]
    # l_description = request.json["description"]
    l_itemName = ""
    l_price = 0
    l_imgUrl = ""
    l_description = ""
    l_unit = ""
    
    success, arrPro = getDetailProduct(l_itemCode)
    if success == True:
        l_itemName = arrPro[0].p_ItemName
        l_price = arrPro[0].p_Price
        l_imgUrl = arrPro[0].p_ImgUrl
        l_description = arrPro[0].p_Description
        l_unit = arrPro[0].p_UnitName
    else:
        return json.dumps([{"result": "0", "mess": "Lỗi khi thêm sản phẩm vào giỏ hàng, vui lòng thử lại."}])
    
    l_exists = False
    for item in arrItemsCart:
        if item.p_ItemCode == l_itemCode:
            item.p_Quantity += int(l_quantity)
            item.p_TotalPrice = item.p_Quantity * item.p_Price
            l_exists = True
            break

    if not l_exists:
        arrItemsCart.append(DTO_Cart(
            p_ItemCode = l_itemCode
            , p_ItemName = l_itemName
            , p_Price = float(l_price)
            , p_ImgUrl = l_imgUrl
            , p_Description = l_description
            , p_Quantity = int(l_quantity)
            , p_Discount = 0
            , p_UnitName = l_unit
            , p_TotalPrice = float(l_price)
            ))
    
    session["Cart"] = json.dumps(arrItemsCart, default = convert_to_dict, indent = 4, sort_keys=True)
    session["GuestInfo"] = {"cartCount": len(arrItemsCart)}

    #return redirect(url_for("cart.showCart"))
    return json.dumps([{"result": "1", "url": "/showCart"}])
    #return redirect(url_for(".showCart"))