function validateRegisterDispositivo() {
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
;
$(function () {
    var msg = $('#sucesso').val();
    if (msg != "") {
        $.toast({
            text: "<h5>" + msg + "!</h5>",
            bgColor: 'green',
            position: {top: 115, right : 21},
            hideAfter: 2000,
            icon: 'success',
            showHideTransition: 'plain', 
            stack: false
        });
    }
}
);
$(function () {
    var msg = $('#deletado').val();
    if (msg != "") {
        $.toast({
            text: "<h5>" + msg + "!</h5>",
            bgColor: 'red',
            position: {top: 115, right : 21},
            hideAfter: 2000,
            icon: 'success',
            showHideTransition: 'plain', 
            stack: false
        });
    }
}
);