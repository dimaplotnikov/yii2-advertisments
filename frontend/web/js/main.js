$(document).on("click", '.delete_profile_img', function (e) {
    e.preventDefault();
    var isTrue = confirm("Удалить изображение?");
    if(isTrue==true){
        var href=$(this).attr('href');
        $(this).parent('div').parent('div').remove();
        $.get( href );
    }
});
$(document).on("click", '.delete_product_img', function (e) {
    e.preventDefault();
    var isTrue = confirm("Удалить изображение?");
    if(isTrue==true){
        var href=$(this).attr('href');
        $(this).parent('div').parent('div').remove();
        $.get( href );
    }
});
$(document).on("click", '.delete_comment', function (e) {
    e.preventDefault();
    var isTrue = confirm("Удалить изображение?");
    if(isTrue==true){
        var href=$(this).attr('href');
        $(this).parent('div').parent('div').parent('div').parent('div').remove();
        $.get( href );
    }
});
