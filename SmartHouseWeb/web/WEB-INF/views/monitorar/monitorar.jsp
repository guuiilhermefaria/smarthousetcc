<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--<link rel="stylesheet" href="/code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">-->
<!--<link rel="stylesheet" href="/resources/demos/style.css">-->

<!--<script src="https://code.jquery.com/jquery-1.12.4.js"></script>-->
<script src="<c:url value="/resources/bootstrap/js/jquery-1.12.4.js"/>"></script>
<script src="<c:url value="/resources/bootstrap/js/jquery-ui.js"/>"></script>
<!--<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>-->
<style>
    .toggler { width: 200px; height: 60px; position: relative;}
    #button { padding: .5em 1em; text-decoration: none;    }
    .button { 
        background-color: #ff9600;
        height: 80px;
        cursor: pointer;
        padding: 10px;
        margin-left:  3px;        
    }
    .form-comodo {
        width: 300px;
        background-color: #3c8dbc;
        cursor: pointer;
        padding: 15px;
        margin-top: 15px;
        margin-left: 15px;
    }
    /*    #button1 { background-color: #87CEEB;  }
        #button2 { background-color: #40E0D0;  }
        #button3 { background-color: #AFEEEE;  }
        #button4 { background-color: #FFE4E1;  }
        #button5 { background-color: #E6E6FA;  }
        #button6 { background-color: #FFF8DC;  }
        #button7 { background-color: #FA8072;  }
        #button8 { background-color: #CFCFCF;  }*/

    .button-header{
        height: 20px;
        background-color: #FFF;  
        color: #333;
        font-size: 16px;
    }
    h6{
        height: 25px;
        background-color: #FFF;  
        color: #333;
        font-size: 12px;
        font-style: italic;
    }
    .effect { width: 90px; height: 60px; padding: 0.4em;left: 10px; position: relative; background: #fff;opacity: 0.50; }
    .effect h3 { margin: 0; padding: 0.4em; text-align: center; }
</style>

<script>
    $(function () {
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
                    ligardesligarAjax(num);
                } else {
                    liga(effect, num);
                    ligarAjax(num);
                }
            }
            state = !state;
        });
        $(".button2").on("click", function () {
            //alert("button200");
            console.log("Antes");

            $.ajax({
                url: 'http://192.168.0.110/',
                type: "GET",
                data: "?ligar",
                dataType: "html"

            }).done(function (resposta) {
                console.log("Sucessoooo-------------");
                console.log(resposta);
                alert(resposta);

            }).fail(function (jqXHR, textStatus) {
                console.log("Request failed: " + textStatus);

            }).always(function () {
                console.log("completou");
            });



//            $.ajax({
//                url: 'http://192.168.0.110/', //URL solicitada
//                type: "POST",
//                header: 'Access-Control-Allow-Origin': '*',
//                success: function (data) { //O HTML é retornado em 'data'
//                    console.log(data); //Se sucesso um alert com o conteúdo retornado pela URL solicitada será exibido.
//                    console.log("Sucesso"); //Se sucesso um alert com o conteúdo retornado pela URL solicitada será exibido.
//                },
//                error: function (jqXHR, textStatus, errorThrown) {
//                    console.log("Sem sucesso"); //Se sucesso um alert com o conteúdo retornado pela URL solicitada será exibido.
//                }
//            });

            console.log("Dps");
        });

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
            }, 1000);
        }

        function ligarAjax(value) {
            $.ajax({
                type: 'POST',
                url: 'http://192.168.0.110/?ligar' + value, //URL solicitada
                success: function (data) { //O HTML é retornado em 'data'
                    console.log(data); //Se sucesso um alert com o conteúdo retornado pela URL solicitada será exibido.
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log("Sem sucesso"); //Se sucesso um alert com o conteúdo retornado pela URL solicitada será exibido.
                }
            });
        }
        function desligarAjax(value) {
            $.ajax({
                url: 'http://192.168.0.110/?desligar' + value, //URL solicitada
                success: function (data) { //O HTML é retornado em 'data'
                    //alert(data); //Se sucesso um alert com o conteúdo retornado pela URL solicitada será exibido.
                }
            });
        }
        function ligardesligarAjax(value) {
            $.ajax({
                url: 'http://192.168.0.110/?ligarDesligar' + value, //URL solicitada
                success: function (data) { //O HTML é retornado em 'data'
                    // alert(data); //Se sucesso um alert com o conteúdo retornado pela URL solicitada será exibido.
                }
            });
        }
    }
    );
//    function confereRele() {
//    var invocation = new XMLHttpRequest();
//    var url = 'http://192.168.0.110/';
//    $.ajax({
//    invocation.open('GET', url, true);
//    invocation.withCredentials = true;
//    invocation.onreadystatechange = handler;
//    invocation.send();
//    });
//    };
</script>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Cômodos
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Ínicio</a></li>
            <li><a href="<c:url value="/comodo"/>">Novo Cômodo</a></li>
            <li class="active">Cômodo</li>
        </ol>
    </section>
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">Gerenciar Casa</h3>
                        <button id="confere" class="confere" onclick="confereRele()">Conferir</button>
                        <button id="button2" class="button2" >Button2</button>
                        <div class="box-body">
                            <c:forEach items="${list}" var="comodo">
                                <c:if test="${comodo.dispositivos != null && !comodo.dispositivos.isEmpty()}">
                                    <c:forEach items="${comodo.dispositivos}" var="dispositivo">
                                        <div class="col-md-4">
                                            <div class="box box-danger" style="width: 330px;min-height: 220px;">
                                                <div class="box-header">
                                                    <h3 class="box-title">${comodo.nome}</h3>
                                                    <div class="col-md-12" style="padding-top: 10px;">
                                                        <div class="box box-solid box-primary"  style="min-height: 150px;">
                                                            <div class="box-header">
                                                                <h3 class="box-title">${dispositivo.nome} 
                                                                    <c:if test="${dispositivo.rele != null}">
                                                                        <!--- $ {dispositivo.rele.porta}-->                                                                        
                                                                    </c:if>
                                                                </h3>
                                                            </div>
                                                            <div class="box-body">
                                                                <c:if test="${dispositivo.rele != null}">
                                                                    <div id="button${dispositivo.rele.porta}" class="button" >
                                                                        <div class="toggler">
                                                                            <input name="estado${dispositivo.rele.porta}" type="hidden" value="false"/>
                                                                            <!--<input name="tipo$ {dispositivo.rele.porta}" type="hidden" value="start"/>-->
                                                                            <input name="tipo${dispositivo.rele.porta}" type="hidden" value="${dispositivo.tipo_de_ligacao.nome}"/>
                                                                            <div id="effect${dispositivo.rele.porta}" class="effect ui-widget-content ui-corner-all">
                                                                                Desligado
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </c:if>
                                                            </div>
                                                            <c:if test="${dispositivo.rele == null}">
                                                                <div class="box-footer">
                                                                    <code>Nenhum relé atrelado!</code>
                                                                </div>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${comodo.dispositivos == null || comodo.dispositivos.isEmpty()}">
                                    <div class="col-md-4">
                                        <div class="box box-warning" style="width: 330px;min-height: 220px;">
                                            <div class="box-header">
                                                <h3 class="box-title">${comodo.nome}</h3>
                                                <div class="col-md-12" style="padding-top: 10px;">
                                                    <div class="box box-default"  style="min-height: 150px;">
                                                        <h3 class="box-title">${dispositivo.nome}</h3>
                                                        <div class="box-footer">
                                                            <code>Nenhum dispositivo atrelado!</code>
                                                        </div>                                                        
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>