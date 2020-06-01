from flaskext.mysql import MySQL
from flask import Flask, render_template, url_for, request, json, session, Blueprint
from model.Products import DTO_Products, DTO_Cart, DTO_ProductSingle, getDetailProduct
#import locale #for Format
import array
from controller.zHelper import *

#locale.setlocale(locale.LC_ALL, '')#for Format

index_blueprint = Blueprint('index', __name__,)#for route

app = Flask(__name__)
app.config.from_object("config")
mysql = MySQL(app)

@index_blueprint.route("/")
def index():
    arrPro = []
    
    try:
        conn = mysql.connect()
        cursor = conn.cursor()
        cursor.callproc('spGetAllProducts')
        data = cursor.fetchall()

        if data is 0:
            arrPro = None
        else:
            for item in data:
                arrPro.append(DTO_Products(
                    p_ItemCode = item[0],
                    itemName = item[1],
                    #Price = f'{item[2]:,}',
                    Price = item[2],
                    PriceAfterDiscount = item[3],
                    DiscountPercent = item[4],
                    UnitName = item[5],
                    StatusCode = item[6],
                    ImgUrl = item[7],
                    Description = item[8]
                ))
    except Exception as e:
        return json.dumps({'error':str(e)})
        #return json.dumps({'error':'database error'})
    finally:
        conn.commit()
        cursor.close() 
        conn.close()
        
    return render_template("index.html", arrPro = arrPro)



@index_blueprint.route("/addToCart", methods=["POST"])
def addToCart():
    arrItemsCart = []
    
    if session.get("Cart"):
        arrItemsCart = json.loads(session["Cart"], object_hook=dict_to_obj)

    l_itemCode = request.form["itemCode"]
    # l_itemName = request.form["itemName"]
    # l_price = request.form["price"]
    # l_imgUrl = request.form["imgUrl"]
    # l_description = request.form["description"]
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
            item.p_Quantity += 1
            l_exists = True
            break

    if not l_exists:
        arrItemsCart.append(DTO_Cart(
            p_ItemCode = l_itemCode
            , p_ItemName = l_itemName
            , p_Price = float(l_price)
            , p_ImgUrl = l_imgUrl
            , p_Description = l_description
            , p_Quantity = 1
            , p_Discount = 0
            , p_UnitName = l_unit
            , p_TotalPrice = float(l_price)
            ))
    
    session["Cart"] = json.dumps(arrItemsCart, default = convert_to_dict, indent = 4, sort_keys=True)
    session["GuestInfo"] = {"cartCount": len(arrItemsCart)}

    return json.dumps([{"result": "1", "sessionCount": len(arrItemsCart), "itemName": l_itemName}])




