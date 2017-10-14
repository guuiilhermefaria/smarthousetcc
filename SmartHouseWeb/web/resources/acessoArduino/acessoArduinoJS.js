$(function () {
    window.onload = function () {
        temporizadorReles();
        temporizadorTempUmid();
    }
    var state = false;
    $(".onoffswitch-label").on("click", function () {
        var onOff = this.id;
        var num = onOff.replace("onoffswitch-label", "");
        console.log("*************************");
        console.log($("#myonoffswitch" + num).is(":checked"));

        if ($("#myonoffswitch" + num).is(":checked")) {
            desligarAjax(num);
        } else {
            var tipo = ($("input[name='tipo" + num + "']").val());
            if (tipo == "Injetar") {
                ligarDesligarAjax(num);
            } else {
                ligarAjax(num);
            }
        }
//        if (state == "true") {
//            desligarAjax(num);
//            desliga(effect, num);
//        } else {
//            var tipo = ($("input[name='tipo" + num + "']").val());
//            if (tipo == "Injetar") {
//                ligarDesligarAjax(num);
//                ligaDesliga(effect, num);
//            } else {
//                ligarAjax(num);
//                liga(effect, num);
//            }
//        }
        //state = !state;
    });

    function buscaReles() {
        $.ajax({
            type: 'GET',
            dataType: 'json',
            timeout: 2000, //2 second timeout
            url: 'http://192.168.0.110', //URL solicitada
            success: function (data) { //O HTML é retornado em 'data'
                console.log("");
                console.log("----------------");
                $.each(data[0], function (key, val) {
                    console.log("*** " + key + "-" + val);
                    confereReles(key, val);
                    $("#foraRede").hide(500);
                });
            },
            error: function (jqXHR, textStatus, errorThrown) {
                //console.log("AAAAAAAAAAA");
                $("#foraRede").show(400);
            }
        });
    }
    function buscaTempUmid() {
        $.ajax({
            type: 'GET',
            dataType: 'json',
            timeout: 2000, //2 second timeout
            url: 'http://192.168.0.110', //URL solicitada
            success: function (data) { //O HTML é retornado em 'data'
                $('#umidade').html("Umidade do ar: " + data[1].umidade);
                $('#temperatura').html("Temperatura do ambiente: " + data[1].temperatura);
                $("#foraSensorTemp").hide(1000);
                $("#foraSensorUmid").hide(1000);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                $("#foraSensorTemp").show(400);
                $("#foraSensorUmid").show(400);
            }
        });
    }

    function temporizadorReles() {
        buscaReles();
        setTimeout(function () {
            temporizadorReles();
        }, 2000);
    }
    function temporizadorTempUmid() {
        buscaTempUmid();
        setTimeout(function () {
            temporizadorTempUmid();
        }, 2000);
    }

    function confereReles(rel, val) {
        var num = (rel.substring(4, 5));
        if (val == '1') {
            $("input[name='estado" + num + "']").val(true);
            if (!$("#myonoffswitch" + num).is(":checked")) {
                $("#onoffswitch-label" + num).click();
            }
        } else {
            $("input[name='estado" + num + "']").val(false);
            if ($("#myonoffswitch" + num).is(":checked")) {
                $("#onoffswitch-label" + num).click();
            }
        }
    }

    function liga(aux, num) {
        $("#" + aux).html("Ligado")
        $("#" + aux).animate({
            backgroundColor: "#FFFACD",
            color: "#888",
            width: 90,
            opacity: 0.95,
            //height: "toggle"
            left: 130
        }, 500);
        $("input[name='estado" + num + "']").val(true);
    }

    function desliga(aux, num) {
        $("#" + aux).html("Desligado")
        $("#" + aux).animate({
            backgroundColor: "#fff",
            color: "#888",
            width: 90,
            opacity: 0.50,
            left: 5
        }, 500);
        $("input[name='estado" + num + "']").val(false);
    }

    function ligaDesliga(aux, num) {
        liga(aux, num);
        setTimeout(function () {
            desliga(aux, num);
        }, 1500);
    }

    function ligarAjax(value) {
        $.ajax({
            type: 'POST',
            dataType: 'json',
            url: 'http://192.168.0.110/?ligar' + value,
            success: function (data) {
            },
            error: function (jqXHR, textStatus, errorThrown) {
            }
        });
    }

    function ligarDesligarAjax(value) {
        $.ajax({
            type: 'POST',
            dataType: 'json',
            url: 'http://192.168.0.110/?ligarDesligar' + value,
            success: function (data) {
            },
            error: function (jqXHR, textStatus, errorThrown) {
            }
        });
    }
    function desligarAjax(value) {
        $.ajax({
            type: 'POST',
            dataType: 'json',
            url: 'http://192.168.0.110/?desligar' + value, //URL solicitada
            success: function (data) { //O HTML é retornado em 'data'
            }
        });
    }
});