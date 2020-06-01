from flask import Flask, render_template, url_for, request, json, session, Blueprint
from flaskext.mysql import MySQL
from controller.zHelper import validateEmail
from model.Products import DTO_Category

layout_blueprint = Blueprint('layout', __name__,)#for route

app = Flask(__name__)
app.config.from_object("config")
mysql = MySQL(app)

@layout_blueprint.route("/layout/Subscribe", methods=["POST"])
def Subscribe():

    l_email = request.json["Email"]
    if validateEmail(l_email) == False:
        return json.dumps([{'result': "0", 'mess': 'Địa chỉ Email này không hợp lệ, vui lòng thử lại.'}])

    l_result = ""
    l_mess = ""

    try:
        conn = mysql.connect()
        cursor = conn.cursor()
        cursor.callproc('spCreateSubscriber', [l_email])
        data = cursor.fetchall()

        if data is 0:
            arrPro = None
        else:
            l_result = data[0][0]
            l_mess = data[0][1]
    except Exception as e:
        #return json.dumps({'error':str(e)})
        return json.dumps([{'result': "0", 'mess': 'Database error'}])
    finally:
        conn.commit()
        cursor.close() 
        conn.close()

    return json.dumps([{"result": l_result, 'mess': l_mess}])


#@layout_blueprint.route("/layout/GetAllCategory", methods=["POST"])
def GetAllCategory(fromPg, categoryCode = 1, keyword = "", page = 1, arrCateExist = []):

    htmlCategory = ""

    try:
        conn = mysql.connect()
        cursor = conn.cursor()
        cursor.callproc('sp_GetAllCategory')
        data = cursor.fetchall()

        if data is 0:
            htmlCategory = ""
        else:
            for item in data:
                if fromPg == "layout":  #call from layout.html
                    htmlCategory += "<a class='dropdown-item' href='/shop/search?cate=" + str(item[0]) + "'>" + item[1] + "</a>"
                else:   #call from shop.html
                    if item[0] in arrCateExist:
                        if str(item[0]) == categoryCode:
                            htmlCategory += "<li><a href='/shop/search?keyword=" + keyword + "&page=" + page + "&cate=" + str(item[0]) + "' class='active'>" + item[1] + "</a></li>"
                        else:
                            htmlCategory += "<li><a href='/shop/search?keyword=" + keyword + "&page=" + page + "&cate=" + str(item[0]) + "'>" + item[1] + "</a></li>"
                    
    except Exception as e:
        #return json.dumps({'error':str(e)})
        return json.dumps([{'result': "0", 'mess': 'Database error'}])
    finally:
        conn.commit()
        cursor.close() 
        conn.close()

    return htmlCategory