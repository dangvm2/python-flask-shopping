//mask number for textbox
function isNumberKey(evt){
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}

//quantity changed and leave input
function txtQuantityFocusout(itemCode) {
    
    var txt = document.getElementById(itemCode)
    if (txt.value > 1000) {
        txt.value = 1000
    }

    $.ajax({
        url: '/editQuantityCart',
        data: JSON.stringify({"itemCode": txt.id, "quantity": txt.value}),
        type: 'POST',
        contentType: "application/json; charset=utf-8",
        success: function(response) {
            var json = $.parseJSON(response)
            console.log(json[0].result);
            if (json[0].result == "1") {
                var output_totalFinalPrice = json[0].totalFinalPrice.toLocaleString(
                    undefined,
                    { minimumFractionDigits: 0 }
                  );
                $('#lblTotalFinalPrice').text(output_totalFinalPrice);
                $('#lblTotalPrice').text(output_totalFinalPrice);
    
                var output_totalPrice = json[0].totalPrice.toLocaleString(
                    undefined,
                    { minimumFractionDigits: 0 }
                  );
                $('#lblTotalPrice_Line_'+itemCode+'').text(output_totalPrice + " đ");

            }
        },
        error: function(error) {
            console.log(error);
        }
    });

}



//post create order
function createOrder() {

    var txtCustomerName = document.getElementById("txtCustomerName")
    var txtCustomerPhone = document.getElementById("txtCustomerPhone")
    var txtAddress = document.getElementById("txtAddress")
    var txtRemark = document.getElementById("txtRemark")

    if (txtCustomerName.value == "") {
        txtCustomerName.focus()
        showAlert('Bạn chưa nhập <b>Tên người nhận</b>', "2")
        return
    }
    if (txtCustomerPhone.value == "") {
        txtCustomerPhone.focus()
        showAlert('Bạn chưa nhập <b>Số điện thoại người nhận</b>', "2")
        return
    }
    if (txtAddress.value == "") {
        txtAddress.focus()
        showAlert('Bạn chưa nhập <b>Địa chỉ giao hàng</b>', "2")
        return
    }

    $.ajax({
        url: '/createOrder',
        data: JSON.stringify({"CustomerName": txtCustomerName.value, "CustomerPhone": txtCustomerPhone.value, "Address": txtAddress.value, "Remark": txtRemark.value}),
        type: 'POST',
        contentType: "application/json; charset=utf-8",
        success: function(response) {
            
            document.write(response)

            //scroll to top
            $('html, body').animate({
                    scrollTop: $(".lbltextHeader").offset().top
                }, 800, function(){
            
                window.location.hash = ".lbltextHeader";
            });

            /*var json = $.parseJSON(response)
            if (json[0].result == "1") {
                console.log('ok')
            } else {
                console.log(json[0].error)
            }*/
        },
        error: function(error) {
            console.log(error);
        }
    });
}

//delete item
function deleteItem(itemCode) {

    $.ajax({
        url: '/deleteItem',
        data: JSON.stringify({"itemCode": itemCode}),
        type: 'POST',
        contentType: "application/json; charset=utf-8",
        success: function(response) {
            var json = $.parseJSON(response)
            if (json[0].result == "1") {
                console.log('deleted')

                if (json[0].cartCount == 0) {
                    location.reload()
                }
                $('#lblCart').html("[" + json[0].cartCount + "]")

                document.getElementById("row_"+itemCode).remove()

                var output_totalFinalPrice = json[0].totalFinalPrice.toLocaleString(
                    undefined,
                    { minimumFractionDigits: 0 }
                  );
                $('#lblTotalFinalPrice').text(output_totalFinalPrice);

                var output_totalPrice = json[0].totalPrice.toLocaleString(
                    undefined,
                    { minimumFractionDigits: 0 }
                  );
                $('#lblTotalPrice').text(output_totalPrice);

                var output_totalDiscount = json[0].totalDiscount.toLocaleString(
                    undefined,
                    { minimumFractionDigits: 0 }
                  );
                $('#lblTotalDiscount').text(output_totalDiscount);

            } else {
                console.log(json[0].error)
            }
        },
        error: function(error) {
            console.log(error);
        }
    });

}

//validate txtCustomerPhone
/*$(document).ready(function(){
    document.getElementById("txtCustomerPhone").onkeyup = checkPhone;
    console.log("onke")
});
function checkPhone() {
    console.log("event")
    var phone = document.getElementById("txtCustomerPhone").value;
    var phoneNum = phone.replace(/[^\d]/g, '');

    if(phoneNum.length > 6 && phoneNum.length < 11) {   
        document.getElementById("txtCustomerPhone").style.borderColor="transparent";
        return true;
    } 

    else if(phoneNum.length < 7 || phoneNum.length > 10) {
        document.getElementById("txtCustomerPhone").style.borderColor="red";
        return false;
    }
}*/

/*
function showAlert(text, type) {

    var idName = "";
    switch (type){
        case "1":   //success
            idName = "#success-alert";
            break;
        case "2":   //warning
            idName = "#warning-alert";
            break;
        default:
            idName = "#success-alert";
    }
        
    $(idName).html(text);

    $(idName).stop(true).fadeTo(200,1);

    $(idName).fadeTo(2000, 500).slideUp(200, function() {
      $(idName).slideUp(200);
    });
}
*/