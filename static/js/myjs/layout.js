//on load
$(function() {
    //$("#txtSearchProduct").focus();

    //Click subscribe
    $('#btnSubscribe').click(function(e) {
        
        var email = document.getElementById('txtSubscribe').value
        
        $.ajax({
            url: '/layout/Subscribe',
            data: JSON.stringify({"Email": email}),
            type: 'POST',
            contentType: "application/json; charset=utf-8",
            success: function(response) {
                var json = $.parseJSON(response)
                
                if (json[0].result == '1') {
                    showAlert(json[0].mess, "1")
                    document.getElementById('txtSubscribe').value = ""
                }
                else {
                    showAlert(json[0].mess, "2")
                }

            },
            error: function(error) {
                console.log(error);
            }
        });

    });

    //Search Product
    $('#btnSearchProduct').click(function(e) {
        var keyword = document.getElementById("txtSearchProduct").value
        window.location.href = "/shop/search?keyword=" + keyword
    });

    $("#txtSearchProduct").on("keypress", function(e){
        if (e.keyCode == 13) {
            var keyword = document.getElementById("txtSearchProduct").value
            window.location.href = "/shop/search?keyword=" + keyword
        }
    });
});

//Alert
function showAlert(text, type) {

    var idName = "";
    switch (type){
        case "1":   //success
            idName = "#success-alert";
            break;
        case "2":   //warning
            idName = "#warning-alert";
            break;
        case "3":   //error
            idName = "#danger-alert";
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