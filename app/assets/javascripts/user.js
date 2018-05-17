$(document).ready(function() {
    $(".login").hide()
    $('.incognito_button').on('click', function () {
        if ($('.swap').is(":visible")){
            $('.login').show()
            $('.swap').hide()
        }
        else{
            $('.swap').show()
            $('.login').hide()
        }
        return false;
    })

     
});


