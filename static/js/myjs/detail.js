$(document).ready(function(){
    
    $('.quantity-right-plus').click(function(e){
        
        e.preventDefault();
        var quantity = parseInt($('#txtQuantity').val());
        
        $('#txtQuantity').val(quantity + 1);
        
    });

    $('.quantity-left-minus').click(function(e){
        
        e.preventDefault();
        var quantity = parseInt($('#txtQuantity').val());
        
        if (quantity>1) {
            $('#txtQuantity').val(quantity - 1);
        }
    });

    $('#btnAddToCard').click(function(e){
        e.preventDefault();

        var l_itemCode = document.getElementById("lblItemCode").value
        var l_quantity = document.getElementById("txtQuantity").value
        // var l_itemName = document.getElementById("lblItemName").value
        // var l_price = document.getElementById("lblPrice").value
        // var l_imgUrl = document.getElementById("lblImgUrl").value
        // var l_description = document.getElementById("lblDescription").value
        
        $.ajax({
            url: '/detail/AddToCart',
            //data: JSON.stringify({"itemCode": l_itemCode, "itemName": l_itemName, "quantity": l_quantity, "price": l_price, "imgUrl": l_imgUrl, "description": l_description}),
            data: JSON.stringify({"itemCode": l_itemCode, "quantity": l_quantity}),
            type: 'POST',
            contentType: "application/json; charset=utf-8",
            success: function(response) {
                //console.log(response);
                //document.write(response);
                var json = $.parseJSON(response)                
                if (json[0].result == "1") {
                    window.location.href = json[0].url;
                } else {
                    showAlert(json[0].mess, "3")
                }
            },
            error: function(error) {
                console.log(error);
            }
        });

    });
    
});

