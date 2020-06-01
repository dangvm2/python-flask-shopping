class DTO_Products:
    def __init__(self, p_ItemCode, itemName, Price, PriceAfterDiscount, DiscountPercent, UnitName, StatusCode, ImgUrl, Description
    , PageIndex = 0):
        self.p_ItemCode = p_ItemCode
        self.itemName = itemName
        self.Price = Price
        self.PriceAfterDiscount = PriceAfterDiscount
        self.DiscountPercent = DiscountPercent
        self.UnitName = UnitName
        self.StatusCode = StatusCode
        self.ImgUrl = ImgUrl
        self.Description = Description
        self.PageIndex = PageIndex

class DTO_ProductSingle:
    def __init__(self, p_ItemCode, p_ItemName, p_Price, p_UnitName, p_ImgUrl, p_Description):
        self.p_ItemCode = p_ItemCode
        self.p_ItemName = p_ItemName
        self.p_Price = p_Price
        self.p_UnitName = p_UnitName
        self.p_ImgUrl = p_ImgUrl
        self.p_Description = p_Description

class DTO_Cart:
    def __init__(self, p_ItemCode, p_ItemName, p_Price, p_ImgUrl, p_Description, p_Quantity, p_Discount, p_UnitName, p_TotalPrice):
        self.p_ItemCode = p_ItemCode
        self.p_ItemName = p_ItemName
        self.p_Price = p_Price
        self.p_ImgUrl = p_ImgUrl
        self.p_Description = p_Description
        self.p_Quantity = p_Quantity
        self.p_Discount = p_Discount
        self.p_UnitName = p_UnitName
        self.p_TotalPrice = p_TotalPrice

class DTO_Category:
    def __init__(self, p_CategoryCode, p_CategoryName):
        self.p_CategoryCode = p_CategoryCode
        self.p_CategoryName = p_CategoryName


from flask import Flask
from flaskext.mysql import MySQL

app = Flask(__name__)
app.config.from_object("config")
mysql = MySQL(app)

def getDetailProduct(id):
    
    arrPro = []

    try:
        conn = mysql.connect()
        cursor = conn.cursor()
        cursor.callproc('spGetProductDetail', [id])
        data = cursor.fetchall()
        
        if data is 0:
            arrPro = None
        else:
            for item in data:
                arrPro.append(DTO_ProductSingle(
                    p_ItemCode = id,
                    p_ItemName = item[0],
                    p_Price = item[1],
                    p_UnitName = item[2],
                    p_ImgUrl = item[3],
                    p_Description = item[4]
                ))
                break
        
    except Exception as e:
        print(e)
        return False, arrPro
    finally:
        conn.commit()
        cursor.close() 
        conn.close()

    return True, arrPro