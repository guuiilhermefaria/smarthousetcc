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
    var url = window.location.href;
    if (url.indexOf('sucesso') !== -1) {
        $.toast({
            text: "<h5>Salvo com sucesso!</h5>",
            bgColor: 'green',
            position: 'top-right',
            hideAfter: 2000
        });
    }
}
);
