function validateRegisterUsuario() {
    var retorno = true;
    if ($('#nome').val() === "") {
        retorno = false;
        $('#nomeError').css('display', 'block');
        $('#nomeError').css('color', '#f00');
        $('.form-control-feedback').addClass('glyphicon glyphicon-remove');
        $('.form-control-feedback').css('display', 'block');
        $('#input-nome').addClass('has-error has-feedback');
    }
    if ($('#email').val() === "") {
        retorno = false;
        $('#emailError').css('display', 'block');
        $('#emailError').css('color', '#f00');
        $('.form-control-feedback').addClass('glyphicon glyphicon-remove');
        $('.form-control-feedback').css('display', 'block');
        $('#input-email').addClass('has-error has-feedback');
    }
    if ($('#senha').val() === "") {
        retorno = false;
        $('#senhaError').css('display', 'block');
        $('#senhaError').css('color', '#f00');
        $('.form-control-feedback').addClass('glyphicon glyphicon-remove');
        $('.form-control-feedback').css('display', 'block');
        $('#input-senha').addClass('has-error has-feedback');
    }
    if (document.getElementById("senha").value === "") {
        retorno = false;
        document.getElementById('senhaError').style.display = 'block';
    }
    return retorno;
}
;

function ocultaErro(name) {
    $('#input-' + name).removeClass('has-error has-feedback');
    $('.glyphicon glyphicon-remove').removeClass('display', 'none');
    $('#' + name + 'Error').css('display', 'none');
    $('.form-control-feedback').css('display', 'none');
}