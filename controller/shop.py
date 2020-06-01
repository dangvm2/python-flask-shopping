from flask import Flask, render_template, url_for, request, json, session, Blueprint
from controller.zHelper import *
from flaskext.mysql import MySQL
from model.Products import DTO_Products

shop_blueprint = Blueprint('shop', __name__,)#for route

app = Flask(__name__)
app.config.from_object("config")
mysql = MySQL(app)

@shop_blueprint.route("/shop/viewShop")
def viewShop():
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
                    Price = item[2],
                    PriceAfterDiscount = item[3],
                    DiscountPercent = item[4],
                    UnitName = item[5],
                    StatusCode = item[6],
                    ImgUrl = item[7],
                    Description = item[8]
                ))
    except Exception as e:
        #return json.dumps({'error':str(e)})
        return json.dumps({'error':'database error'})
    finally:
        conn.commit()
        cursor.close() 
        conn.close()
        
    return render_template("shop.html", arrPro = arrPro)


# @shop_blueprint.route("/shop/keyword=<keyword>")
# @shop_blueprint.route("/shop/keyword=<keyword>&page=<page>")
@shop_blueprint.route("/shop/search")
def shopSearch():
    arrPro = []
    maxPage = 0
    arrCateExist = [1]

    keyword = request.args.get('keyword')
    page = request.args.get('page')
    cate = request.args.get('cate')
     #validate keyword
    if keyword is None:
        keyword = ""
    #validate page
    if page is None:
        page = "1"
    if page == "0":
        page = "1"
    if not page.isdigit():
        page = "1"
    #validate cate
    if cate is None:
        cate = "1"
    
    #call DB
    try:
        conn = mysql.connect()
        cursor = conn.cursor()
        cursor.callproc('spSearchProduct', [keyword, 2, cate])
        data = cursor.fetchall()

        if data is 0:
            arrPro = None
        else:
            for item in data:
                maxPage = item[0]

                if item[11] not in arrCateExist:
                    arrCateExist.append(item[11])

                #filter with page number
                if page != str(item[0]):
                    continue

                arrPro.append(DTO_Products(
                    p_ItemCode = item[2],
                    itemName = item[3],
                    Price = item[4],
                    PriceAfterDiscount = item[5],
                    DiscountPercent = item[6],
                    UnitName = item[7],
                    StatusCode = item[8],
                    ImgUrl = "" + item[9],
                    Description = item[10],
                    PageIndex = item[0]
                ))
    except Exception as e:
        #return json.dumps({'error':str(e)})
        return json.dumps({'error':'database error'})
    finally:
        conn.commit()
        cursor.close() 
        conn.close()
    
    return render_template("shop.html", arrPro = arrPro, page = page, maxPage = maxPage, keyword = keyword, cate = cate, arrCateExist = arrCateExist)