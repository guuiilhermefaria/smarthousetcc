<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--<link rel="stylesheet" href="/code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">-->
<!--<link rel="stylesheet" href="/resources/demos/style.css">-->

<!--<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>-->
<style>
    .toggler { width: 300px; height: 120px; position: relative;}
    #button { padding: .5em 1em; text-decoration: none;    }
    .button { 
        width: 300px;
        background-color: #87CEEB;
        height: 150px;
        cursor: pointer;
        padding: 15px;
        margin-top: 15px;
        margin-left: 15px;
    }
    #button1 { background-color: #87CEEB;  }
    #button2 { background-color: #40E0D0;  }
    #button3 { background-color: #AFEEEE;  }
    #button4 { background-color: #FFE4E1;  }
    #button5 { background-color: #E6E6FA;  }
    #button6 { background-color: #FFF8DC;  }
    #button7 { background-color: #FA8072;  }
    #button8 { background-color: #CFCFCF;  }

    .button-header{
        height: 20px;
        background-color: #FFF;  
        color: #888;
        font-size: 12;
    }
    .effect { width: 90px; height: 90px; padding: 0.4em;left: 10px; position: relative; background: #fff;opacity: 0.50; }
    .effect h3 { margin: 0; padding: 0.4em; text-align: center; }
</style>

<script>
    $(function () {
        var state = false;
        $(".button").on("click", function () {
            var idButton = this.id;
            console.log(idButton);
            var num = idButton.replace("button", "");
            var effect = idButton.replace("button", "effect");
            //var estado = aux.replace("effect", "effect");
            //console.log($("input[name='estado" + num + "']").val());
            state = $("input[name='estado" + num + "']").val();
            if (state == "true") {
                desliga(effect, num);
                desligarAjax(num);
            } else {
                var tipo = ($("input[name='tipo" + num + "']").val());
                console.log(tipo);
                if (tipo == "start") {
                    ligaDesliga(effect, num);
                    ligardesligarAjax(num);
                } else {
                    liga(effect, num);
                    ligarAjax(num);
                }
            }
            state = !state;
        });

        function liga(aux, num) {

            //console.log("liga")
            $("#" + aux).html("Ligado")
            $("#" + aux).animate({
                backgroundColor: "#FFFACD",
                color: "#888",
                width: 90,
                opacity: 0.95,
                //height: "toggle"
                left: 160
            }, 500);
            $("input[name='estado" + num + "']").val(true);
        }

        function desliga(aux, num) {
            //console.log("desliga")

            $("#" + aux).html("Desligado")
            $("#" + aux).animate({
                backgroundColor: "#fff",
                color: "#888",
                width: 90,
                opacity: 0.50,
                left: 10
            }, 500);
            $("input[name='estado" + num + "']").val(false);
        }

        function ligaDesliga(aux, num) {
            console.log("ligaDesliga")
            liga(aux, num);
            setTimeout(function () {
                desliga(aux, num);
                console.log("AAAAAAAA");
            }, 1500);
            console.log("bbbbbbbb");
        }


        function ligarAjax(value) {
            console.log("ligou ajax");
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


//                var state = true;
//                $(".button").on("click", function () {
//                    alert(this.id);
//                    if (state) {
//                        $("#effect").html("Desligado")
//                        $("#effect").animate({
//                            backgroundColor: "#fff",
//                            color: "#888",
//                            width: 50,
//                            left: 10
//                        }, 500);
//                    } else {
//                        $("#effect").html("Ligado")
//                        $("#effect").animate({
//                            backgroundColor: "#FFFACD",
//                            color: "#888",
//                            width: 100,
////                            opacity: 0.25,
//                            //height: "toggle"
//                            left:150
//                        }, 500);
//                    }
//                    state = !state;
//                });
    });
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
                    </div>
                    <table>
                        <tr>
                            <td>
                                <div id="button1" class="button" >
                                    <div class="button-header">
                                        <h5>Sala</h5>
                                    </div>
                                    <div class="toggler">
                                        <input name="estado1" type="hidden" value="false"/>
                                        <input name="tipo1" type="hidden" value="ligar/desligar"/>
                                        <div id="effect1" class="effect ui-widget-content ui-corner-all">
                                            <h6>Lampada</h6>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div id="button2" class="button" >
                                    <div class="toggler">
                                        <input name="estado2" type="hidden" value="false"/>
                                        <input name="tipo2" type="hidden" value="start"/>
                                        <div id="effect2" class="effect ui-widget-content ui-corner-all">
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div id="button3" class="button" >
                                    <div class="toggler">
                                        <input name="estado3" type="hidden" value="false"/>
                                        <input name="tipo3" type="hidden" value="ligar/desligar"/>
                                        <div id="effect3" class="effect ui-widget-content ui-corner-all">
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div id="button4" class="button" >
                                    <div class="toggler">
                                        <input name="estado4" type="hidden" value="false"/>
                                        <input name="tipo4" type="hidden" value="start"/>
                                        <div id="effect4" class="effect ui-widget-content ui-corner-all">
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div id="button5" class="button" >
                                    <div class="toggler">
                                        <input name="estado5" type="hidden" value="false"/>
                                        <input name="tipo5" type="hidden" value="ligar/desligar"/>
                                        <div id="effect5" class="effect ui-widget-content ui-corner-all">
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div id="button6" class="button" >
                                    <div class="toggler">
                                        <input name="estado6" type="hidden" value="false"/>
                                        <input name="tipo6" type="hidden" value="start"/>
                                        <div id="effect6" class="effect ui-widget-content ui-corner-all">
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div id="button7" class="button" >
                                    <div class="toggler">
                                        <input name="estado7" type="hidden" value="false"/>
                                        <input name="tipo7" type="hidden" value="ligar/desligar"/>
                                        <div id="effect7" class="effect ui-widget-content ui-corner-all">
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div id="button8" class="button" >
                                    <div class="toggler">
                                        <input name="estado8" type="hidden" value="false"/>
                                        <input name="tipo8" type="hidden" value="start"/>
                                        <div id="effect8" class="effect ui-widget-content ui-corner-all">
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div><!-- /.box -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->