$(document).ready(function() {
    
    //hide alert on load
    //$("#success-alert").hide();
    
});

//Add product to cart
$(function() {
    $('.btnAddCart').click(function(e) {
        var nameLinkClicked = $(this).attr("name");

        $.ajax({
            url: '/addToCart',
            data: $('form[name=' + nameLinkClicked + ']').serialize(),
            type: 'POST',
            success: function(response) {
                var json = $.parseJSON(response)
                
                if (json[0].result == '1') {
                    $("#lblCart").text('[' + json[0].sessionCount + ']');

                    //showAlert('Đã thêm <b>' + json[0].itemName + '</b> vào giỏ hàng.');
                    showAlert('Đã thêm <b>' + json[0].itemName + '</b> vào giỏ hàng.', "1")
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

/*
function showAlert(text) {
    $("#success-alert").html(text);

    $("#success-alert").stop(true).fadeTo(200,1);

    $("#success-alert").fadeTo(2000, 500).slideUp(200, function() {
      $("#success-alert").slideUp(200);
    });
}
*/
