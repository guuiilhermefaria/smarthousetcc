$(function () {
    window.onload = function () {
        temporizadorReles();
    }
    var state = false;
    $(".button").on("click", function () {
        var idButton = this.id;
        var num = idButton.replace("button", "");
        var effect = idButton.replace("button", "effect");
        state = $("input[name='estado" + num + "']").val();
        if (state == "true") {
            desliga(effect, num);
            desligarAjax(num);
        } else {
            var tipo = ($("input[name='tipo" + num + "']").val());
            if (tipo == "Injetar") {
                ligaDesliga(effect, num);
//                ligarDesligarAjax(num);
            } else {
                ligarAjax(num);
                liga(effect, num);
            }
        }
        state = !state;
    });
//
//    $(".button3").on("click", function () {
//        buscaReles();
//    });

    function buscaReles() {
        $.ajax({
            url: 'http://192.168.0.110/',
            type: "GET",
            data: "",
            dataType: "html"

        }).done(function (resposta) {
            trataRetorno(resposta);
        }).fail(function (jqXHR, textStatus) {
//            console.log("Request failed: " + textStatus);
        }).always(function () {
//            console.log("completou");
        });
    }

    function trataRetorno(data) {
        //data = data.replaceAll(" ", "");
        //alert(data);
        var rele1 = (data.substring(0, 7));
        var rele2 = (data.substring(9, 16));
        var rele3 = (data.substring(18, 25));
        var rele4 = (data.substring(27, 34));
        var rele5 = (data.substring(36, 43));
        var rele6 = (data.substring(45, 52));
        var rele7 = (data.substring(54, 61));
        var rele8 = (data.substring(63, 70));
        confereReles(rele1);
        confereReles(rele2);
        confereReles(rele3);
        confereReles(rele4);
        confereReles(rele5);
        confereReles(rele6);
        confereReles(rele7);
        confereReles(rele8);
    }

    function temporizadorReles() {
//        console.log("");
        buscaReles();
        setTimeout(function () {
            temporizadorReles();
        }, 2000);
    }

    function confereReles(rel) {
        var rele = (rel.substring(4, 5));
        var numRele = rele;
        var valorRele = (rel.substring(6, 7));
//        console.log(numRele);
//        console.log(valorRele);
        rele = "effect" + rele;
//        console.log("rele" + rele + " num" + numRele + " val-" + valorRele);
        if (valorRele === '1') {
//            console.log("Releeee" + rele);
            liga(rele, valorRele);
            $("input[name='estado" + numRele + "']").val(true);
        } else {
            desliga(rele, valorRele);
            $("input[name='estado" + numRele + "']").val(false);
//                console.log($("input[name='estado" + numRele + "']").val());
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
        ligarAjax(num);
        setTimeout(function () {
            desliga(aux, num);
            desligarAjax(num);
        }, 500);
    }

    function ligarAjax(value) {
        $.ajax({
            type: 'POST',
            url: 'http://192.168.0.110/?ligar' + value, //URL solicitada
            success: function (data) { //O HTML é retornado em 'data'
//                    console.log("Ligou"); //Se sucesso um alert com o conteúdo retornado pela URL solicitada será exibido.
//                    liga("effect" + value, value);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                //console.log("Sem sucesso"); //Se sucesso um alert com o conteúdo retornado pela URL solicitada será exibido.
            }
        });
    }
    function desligarAjax(value) {
        $.ajax({
            url: 'http://192.168.0.110/?desligar' + value, //URL solicitada
            success: function (data) { //O HTML é retornado em 'data'
//                    desliga("effect" + value, value);
            }
        });
    }
});