<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="<c:url value="/resources/bootstrap/js/jquery-1.12.4.js"/>"></script>
<script src="<c:url value="/resources/bootstrap/js/jquery-ui.js"/>"></script>
<script src="<c:url value="/resources/acessoArduino/acessoArduinoJS.js"/>" type="text/javascript"></script>

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
    .button-header{
        height: 20px;
        background-color: #FFF;  
        color: #333;
        font-size: 16px;
    }
    #foraRede{
        background-color: #F00;  
        color: #FFF;
        font-size: 12px;
        height: 25px;
    }
    #errorRede{
        color: #FFF;
        font-size: 15px;
        padding-top: 6px;
        padding-left: 6px;
        font-weight: bold;
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

    /*botao onoff*/
    .onoffswitch {
        position: relative; width: 140px;
        -webkit-user-select:none; 
        -moz-user-select:none; 
        -ms-user-select: none;
    }
    .onoffswitch-checkbox {
        display: none;
    }
    .onoffswitch-label {
        display: block; overflow: hidden; cursor: pointer;
        border: 2px solid #999999; border-radius: 20px;
    }
    .onoffswitch-inner {
        display: block; width: 200%; margin-left: -100%;
        transition: margin 0.3s ease-in 0s;
    }
    .onoffswitch-inner:before, .onoffswitch-inner:after {
        display: block; float: left; width: 50%; height: 30px; padding: 0; line-height: 30px;
        font-size: 14px; color: white; font-family: Trebuchet, Arial, sans-serif; font-weight: bold;
        box-sizing: border-box;
    }
    .onoffswitch-inner:before {
        content: "ON";
        padding-left: 10px;
        background-color: #3C8DBC; color: #FFFFFF;
    }
    .onoffswitch-inner:after {
        content: "OFF";
        padding-right: 10px;
        background-color: #FFFFFF; color: #999999;
        text-align: right;
    }
    .onoffswitch-switch {
        display: block; width: 23px; margin: 6px;
        background: #FFFFFF;
        position: absolute; top: 0; bottom: 0;
        right: 106px;
        border: 2px solid #999999; border-radius: 20px;
        transition: all 0.3s ease-in 0s; 
    }
    .onoffswitch-checkbox:checked + .onoffswitch-label .onoffswitch-inner {
        margin-left: 0;
    }
    .onoffswitch-checkbox:checked + .onoffswitch-label .onoffswitch-switch {
        right: 0px; 
    }
</style>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Cômodos
        </h1>
        <ol class="breadcrumb">
            <li><a href="<c:url value="/home"/>"><i class="fa fa-dashboard"></i> Ínicio</a></li>
            <li class="active">Gerenciar Casa</li>
        </ol>
    </section>
    <!-- Principal content -->
    <section class="content">
        <div id="foraRede" ><h3 id="errorRede">Fora da rede</h3></div>
        <div class="row">
            <div class="col-xs-12">
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">Gerenciar Casa</h3>
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
                                                                <h3 class="box-title">${dispositivo.nome}</h3>
                                                            </div>
                                                            <div class="box-body">
                                                                <c:if test="${dispositivo.rele != null}">
                                                                    <div class="button" >
                                                                        <div class="onoffswitch" >
                                                                            <input name="tipo${dispositivo.rele.porta}" type="hidden" value="${dispositivo.tipo_de_ligacao.nome}"/>
                                                                            <input type="checkbox" name="estado${dispositivo.rele.porta}" 
                                                                                   class="onoffswitch-checkbox" id="myonoffswitch${dispositivo.rele.porta}">
                                                                            <label class="onoffswitch-label" id="onoffswitch-label${dispositivo.rele.porta}" for="myonoffswitch${dispositivo.rele.porta}">
                                                                                <span class="onoffswitch-inner"></span>
                                                                                <span class="onoffswitch-switch"></span>
                                                                            </label>
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
                        <div class="col-md-4">
                            <div class="box box-danger" style="width: 330px;min-height: 220px;">
                                <div class="box-header">
                                    <h3 class="box-title">Umidade</h3>
                                    <div class="col-md-12" style="padding-top: 10px;">
                                        <div class="box box-solid box-primary" style="min-height: 150px;">
                                            <div class="box-header">
                                                <h3 class="box-title">Umidade</h3>
                                            </div>
                                            <div class="box-body">
                                                <h2 class="text-center" id="umidade"></h2>
                                                <div id="foraSensorUmid" ><h3 id="foraSensorUmid">Sensor de Umidade desligado</h3></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="box box-danger" style="width: 330px;min-height: 220px;">
                                <div class="box-header">
                                    <h3 class="box-title">Temperatura</h3>
                                    <div class="col-md-12" style="padding-top: 10px;">
                                        <div class="box box-solid box-primary" style="min-height: 150px;">
                                            <div class="box-header">
                                                <h3 class="box-title">Temperatura</h3>
                                            </div>
                                            <div class="box-body">
                                                <h2 class="text-center" id="temperatura"></h2>
                                                <div id="foraSensorTemp" ><h3 id="foraSensorTemp">Sensor de Temperatura desligado</h3></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>