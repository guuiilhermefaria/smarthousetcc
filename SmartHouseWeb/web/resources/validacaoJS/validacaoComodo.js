function validateRegisterComodo() {
    var retorno = true;
    if ($('#nome').val() === "") {
        retorno = false;
        $('#nomeError').css('display', 'block');
        $('#nomeError').css('color', '#f00');
        $('.form-control-feedback').addClass('glyphicon glyphicon-remove');
        $('.form-control-feedback').css('display', 'block');
        $('#input-nome').addClass('has-error has-feedback');
    }
    return retorno;
}
;
function ocultaErro(name) {
    $('#input-nome').removeClass('has-error has-feedback');
    $('.glyphicon glyphicon-remove').removeClass('display', 'none');
    $('#' + name + 'Error').css('display', 'none');
    $('.form-control-feedback').css('display', 'none');
}
//function mostraSucesso(name) {
//    if ($('#nome').val !== "") {
//        $('.form-control-feedback').addClass('glyphicon glyphicon-ok');
//        $('.form-control-feedback').css('display', 'block');
//        $('#input-nome').addClass('has-success has-feedback');
//    }
//}

$(function () {
    var url = window.location.href;
    var msg = $('#sucesso').val();
    if (msg !== -1) {
        $.toast({
            text: "<h5>" + msg + "!</h5>",
            bgColor: 'green',
//            position: 'mid-center',
            position: {top: 115, right : 21},
            hideAfter: 2000,
            icon: 'success',
            showHideTransition: 'plain', 
            stack: false
        });
    }
}
);
//$(function () {
//    var url = window.location.href;
//    if (url.indexOf('sucesso') !== -1) {
//        $.toast({
//            text: "<h5>Cômodo salvo com sucesso!</h5>",
//            bgColor: 'green',
////            position: 'mid-center',
//            position: {top: 115, right : 21},
//            hideAfter: 2000,
//            icon: 'success',
//            showHideTransition: 'plain', 
//            stack: false
//        });
//    }
//}
//);
