<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--Validacao dispositivo-->
<script src="<c:url value="/resources/validacaoJS/validacaoDispositivo.js"/>" type="text/javascript"></script>

<div class="content-wrapper">
    <section class="content-header">
        <h1>
            Dispositivos
        </h1>
        <ol class="breadcrumb">
            <li><a href="<c:url value="/home"/>"><i class="fa fa-dashboard"></i> Ínicio</a></li>
            <li><a href="<c:url value="/dispositivo"/>">Novo Dispositivo</a></li>
            <li class="active">Dispositivo</li>
        </ol>
    </section>
    <!-- Principal content -->
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">Novo Dispositivo</h3>
                    </div>
                    <c:url value="/dispositivo" var="url"/>
                    <!--Formulário de cadastro Dispositivo-->
                    <form role="form" method="POST" action="${url}" onsubmit="return validateRegisterDispositivo()">
                        <input type="hidden" id="id" placeholder="id" name="id" value="${pojo.id}">
                        <div class="box-body">
                            <!--Campo input nome-->
                            <div id="input-nome" class="form-group">
                                <label for="nome">Nome</label>
                                <input type="text" class="form-control" id="nome" onkeypress="ocultaErro(this.name)" name="nome" value="${pojo.nome}">
                                <span class="glyphicon glyphicon-remove form-control-feedback" style="display: none"></span>
                            </div>
                            <div id="nomeError" class="fieldError" style="display: none">Campo nome obrigatório!</div>
                            <!--Listagem tipos de ligacao que pode ser cadastrado no dispositivo-->
                            <div class="form-group">
                                <label for="tipo_de_ligacao">Tipos de Ligação do Dispositivo</label> 
                                <select class="form-control" name="tipo_de_ligacao.id">
                                    <option selected disabled>Selecione...</option>                    
                                    <c:if test="${not empty list2}">
                                        <c:forEach items="${list2}" var="tipo_de_ligacao">
                                            <option value="${tipo_de_ligacao.id}"<c:if test="${tipo_de_ligacao.id == pojo.tipo_de_ligacao.id}">selected=</c:if>>${tipo_de_ligacao.nome}</option>
                                        </c:forEach>
                                    </c:if>
                                </select>
                            </div>
                            <!--Lista de cômodos para um dispositivo ser atrelado-->
                            <div class="form-group">
                                <label for="comodo">Cômodo</label>
                                <select class="form-control" name="comodo.id">
                                    <option value="" selected>Selecione...</option>                       
                                    <c:if test="${not empty list}">                                
                                        <c:forEach items="${list}" var="comodo">
                                            <option value="${comodo.id}"<c:if test="${comodo.id == pojo.comodo.id}">selected=</c:if>>${comodo.nome}</option>
                                        </c:forEach>
                                    </c:if>
                                </select>
                            </div>
                        </div>
                        <div class="box-footer">
                            <a class="btn btn-danger" href="${url}">Cancelar</a>
                            <button type="submit" class="btn btn-primary">Cadastrar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</div>

