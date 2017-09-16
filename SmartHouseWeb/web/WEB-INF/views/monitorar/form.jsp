<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    </div><!-- /.box-header -->
                        <button onclick="ligar()">Ligar1</button>
                        <button onclick="desligar()">Desligar1</button>
                        <button onclick="ligardesligar()">Ligar-Desligar1</button>
                        <p>-----------------------------------------------------</p>
                        <button onclick="ligar2()">Ligar2</button>
                        <button onclick="desligar2()">Desligar2</button>
                        <button onclick="ligardesligar2()">Ligar-Desligar2</button>
                        <p>-----------------------------------------------------</p>
                        <button onclick="ligar3()">Ligar3</button>
                        <button onclick="desligar3()">Desligar3</button>
                        <button onclick="ligardesligar3()">Ligar-Desligar3</button>
                        <p>-----------------------------------------------------</p>
                        <button onclick="ligar4()">Ligar4</button>
                        <button onclick="desligar4()">Desligar4</button>
                        <button onclick="ligardesligar4()">Ligar-Desligar4</button>
                        <p>-----------------------------------------------------</p>
                        <button onclick="ligar5()">Ligar5</button>
                        <button onclick="desligar5()">Desligar5</button>
                        <button onclick="ligardesligar5()">Ligar-Desligar5</button>
                        <p>-----------------------------------------------------</p>
                        <button onclick="ligar6()">Ligar6</button>
                        <button onclick="desligar6()">Desligar6</button>
                        <button onclick="ligardesligar6()">Ligar-Desligar6</button>
                        <p>-----------------------------------------------------</p>
                        <button onclick="ligar7()">Ligar7</button>
                        <button onclick="desligar7()">Desligar7</button>
                        <button onclick="ligardesligar7()">Ligar-Desligar7</button>
                        <p>-----------------------------------------------------</p>
                        <button onclick="ligar8()">Ligar8</button>
                        <button onclick="desligar8()">Desligar8</button>
                        <button onclick="ligardesligar8()">Ligar-Desligar8</button>
                        
                        <div id="testeAjax">
                    </div>
                </div><!-- /.box -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
<!--<script src="<c :url value="/resources/plugins/jQuery/jQuery-2.1.3.min.js"/>"></script>-->

<script type="text/javascript">
    function ligar() {
//        document.getElementById("testeAjax").append("asdasd");
        $.ajax({
            type: 'POST',
//            url: '/SmartHouse/usuario', //URL solicitada
            url: 'http://192.168.0.110/?ligar1', //URL solicitada
            success: function (data) { //O HTML é retornado em 'data'
                alert(data); //Se sucesso um alert com o conteúdo retornado pela URL solicitada será exibido.
            }
        });
    }
    function desligar() {
//        document.getElementById("testeAjax").append("asdasd");
        $.ajax({
            url: 'http://192.168.0.110/?desligar1', //URL solicitada
            success: function (data) { //O HTML é retornado em 'data'
                alert(data); //Se sucesso um alert com o conteúdo retornado pela URL solicitada será exibido.
            }
        });
    }
    function ligardesligar() {
//        document.getElementById("testeAjax").append("asdasd");
        $.ajax({
            url: 'http://192.168.0.110/?ligarDesligar1', //URL solicitada
            success: function (data) { //O HTML é retornado em 'data'
                alert(data); //Se sucesso um alert com o conteúdo retornado pela URL solicitada será exibido.
            }
        });
    }
    //relés 2
    function ligar2() {
//        document.getElementById("testeAjax").append("asdasd");
        $.ajax({
            type: 'POST',
//            url: '/SmartHouse/usuario', //URL solicitada
            url: 'http://192.168.0.110/?ligar2', //URL solicitada
            success: function (data) { //O HTML é retornado em 'data'
                alert(data); //Se sucesso um alert com o conteúdo retornado pela URL solicitada será exibido.
            }
        });
    }
    function desligar2() {
//        document.getElementById("testeAjax").append("asdasd");
        $.ajax({
            url: 'http://192.168.0.110/?desligar2', //URL solicitada
            success: function (data) { //O HTML é retornado em 'data'
                alert(data); //Se sucesso um alert com o conteúdo retornado pela URL solicitada será exibido.
            }
        });
    }
    function ligardesligar2() {
//        document.getElementById("testeAjax").append("asdasd");
        $.ajax({
            url: 'http://192.168.0.110/?ligarDesligar2', //URL solicitada
            success: function (data) { //O HTML é retornado em 'data'
                alert(data); //Se sucesso um alert com o conteúdo retornado pela URL solicitada será exibido.
            }
        });
    }
    //relés 3
    function ligar3() {
//        document.getElementById("testeAjax").append("asdasd");
        $.ajax({
            type: 'POST',
//            url: '/SmartHouse/usuario', //URL solicitada
            url: 'http://192.168.0.110/?ligar3', //URL solicitada
            success: function (data) { //O HTML é retornado em 'data'
                alert(data); //Se sucesso um alert com o conteúdo retornado pela URL solicitada será exibido.
            }
        });
    }
    function desligar3() {
//        document.getElementById("testeAjax").append("asdasd");
        $.ajax({
            url: 'http://192.168.0.110/?desligar3', //URL solicitada
            success: function (data) { //O HTML é retornado em 'data'
                alert(data); //Se sucesso um alert com o conteúdo retornado pela URL solicitada será exibido.
            }
        });
    }
    function ligardesligar3() {
//        document.getElementById("testeAjax").append("asdasd");
        $.ajax({
            url: 'http://192.168.0.110/?ligarDesligar3', //URL solicitada
            success: function (data) { //O HTML é retornado em 'data'
                alert(data); //Se sucesso um alert com o conteúdo retornado pela URL solicitada será exibido.
            }
        });
    }
    //relés 4
    function ligar4() {
//        document.getElementById("testeAjax").append("asdasd");
        $.ajax({
            type: 'POST',
//            url: '/SmartHouse/usuario', //URL solicitada
            url: 'http://192.168.0.110/?ligar4', //URL solicitada
            success: function (data) { //O HTML é retornado em 'data'
                alert(data); //Se sucesso um alert com o conteúdo retornado pela URL solicitada será exibido.
            }
        });
    }
    function desligar4() {
//        document.getElementById("testeAjax").append("asdasd");
        $.ajax({
            url: 'http://192.168.0.110/?desligar4', //URL solicitada
            success: function (data) { //O HTML é retornado em 'data'
                alert(data); //Se sucesso um alert com o conteúdo retornado pela URL solicitada será exibido.
            }
        });
    }
    function ligardesligar4() {
//        document.getElementById("testeAjax").append("asdasd");
        $.ajax({
            url: 'http://192.168.0.110/?ligarDesligar4', //URL solicitada
            success: function (data) { //O HTML é retornado em 'data'
                alert(data); //Se sucesso um alert com o conteúdo retornado pela URL solicitada será exibido.
            }
        });
    }
    //relés 5
    function ligar5() {
//        document.getElementById("testeAjax").append("asdasd");
        $.ajax({
            type: 'POST',
//            url: '/SmartHouse/usuario', //URL solicitada
            url: 'http://192.168.0.110/?ligar5', //URL solicitada
            success: function (data) { //O HTML é retornado em 'data'
                alert(data); //Se sucesso um alert com o conteúdo retornado pela URL solicitada será exibido.
            }
        });
    }
    function desligar5() {
//        document.getElementById("testeAjax").append("asdasd");
        $.ajax({
            url: 'http://192.168.0.110/?desligar5', //URL solicitada
            success: function (data) { //O HTML é retornado em 'data'
                alert(data); //Se sucesso um alert com o conteúdo retornado pela URL solicitada será exibido.
            }
        });
    }
    function ligardesligar5() {
//        document.getElementById("testeAjax").append("asdasd");
        $.ajax({
            url: 'http://192.168.0.110/?ligarDesligar5', //URL solicitada
            success: function (data) { //O HTML é retornado em 'data'
                alert(data); //Se sucesso um alert com o conteúdo retornado pela URL solicitada será exibido.
            }
        });
    }
    //relés 6
    function ligar6() {
//        document.getElementById("testeAjax").append("asdasd");
        $.ajax({
            type: 'POST',
//            url: '/SmartHouse/usuario', //URL solicitada
            url: 'http://192.168.0.110/?ligar6', //URL solicitada
            success: function (data) { //O HTML é retornado em 'data'
                alert(data); //Se sucesso um alert com o conteúdo retornado pela URL solicitada será exibido.
            }
        });
    }
    function desligar6() {
//        document.getElementById("testeAjax").append("asdasd");
        $.ajax({
            url: 'http://192.168.0.110/?desligar6', //URL solicitada
            success: function (data) { //O HTML é retornado em 'data'
                alert(data); //Se sucesso um alert com o conteúdo retornado pela URL solicitada será exibido.
            }
        });
    }
    function ligardesligar6() {
//        document.getElementById("testeAjax").append("asdasd");
        $.ajax({
            url: 'http://192.168.0.110/?ligarDesligar6', //URL solicitada
            success: function (data) { //O HTML é retornado em 'data'
                alert(data); //Se sucesso um alert com o conteúdo retornado pela URL solicitada será exibido.
            }
        });
    }
    //relés 7
    function ligar7() {
//        document.getElementById("testeAjax").append("asdasd");
        $.ajax({
            type: 'POST',
//            url: '/SmartHouse/usuario', //URL solicitada
            url: 'http://192.168.0.110/?ligar7', //URL solicitada
            success: function (data) { //O HTML é retornado em 'data'
                alert(data); //Se sucesso um alert com o conteúdo retornado pela URL solicitada será exibido.
            }
        });
    }
    function desligar7() {
//        document.getElementById("testeAjax").append("asdasd");
        $.ajax({
            url: 'http://192.168.0.110/?desligar7', //URL solicitada
            success: function (data) { //O HTML é retornado em 'data'
                alert(data); //Se sucesso um alert com o conteúdo retornado pela URL solicitada será exibido.
            }
        });
    }
    function ligardesligar7() {
//        document.getElementById("testeAjax").append("asdasd");
        $.ajax({
            url: 'http://192.168.0.110/?ligarDesligar7', //URL solicitada
            success: function (data) { //O HTML é retornado em 'data'
                alert(data); //Se sucesso um alert com o conteúdo retornado pela URL solicitada será exibido.
            }
        });
    }
    //relés 8
    function ligar8() {
//        document.getElementById("testeAjax").append("asdasd");
        $.ajax({
            type: 'POST',
//            url: '/SmartHouse/usuario', //URL solicitada
            url: 'http://192.168.0.110/?ligar8', //URL solicitada
            success: function (data) { //O HTML é retornado em 'data'
                alert(data); //Se sucesso um alert com o conteúdo retornado pela URL solicitada será exibido.
            }
        });
    }
    function desligar8() {
//        document.getElementById("testeAjax").append("asdasd");
        $.ajax({
            url: 'http://192.168.0.110/?desligar8', //URL solicitada
            success: function (data) { //O HTML é retornado em 'data'
                alert(data); //Se sucesso um alert com o conteúdo retornado pela URL solicitada será exibido.
            }
        });
    }
    function ligardesligar8() {
//        document.getElementById("testeAjax").append("asdasd");
        $.ajax({
            url: 'http://192.168.0.110/?ligarDesligar8', //URL solicitada
            success: function (data) { //O HTML é retornado em 'data'
                alert(data); //Se sucesso um alert com o conteúdo retornado pela URL solicitada será exibido.
            }
        });
    }
</script>