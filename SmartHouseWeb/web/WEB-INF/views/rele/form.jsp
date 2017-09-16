<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--Validação relé-->
<script src="<c:url value="/resources/validacaoJS/validacaoRele.js"/>" type="text/javascript"></script>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Relé
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Ínicio</a></li>
            <li><a href="<c:url value="/rele"/>">Novo Relé</a></li>
            <li class="active">Relé</li>
        </ol>
    </section>
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">Novo Relé</h3>
                    </div><!-- /.box-header -->
                    <c:url value="/rele" var="url" />
                    <!-- form start -->                    
                    <form role="form" method="POST" action="${url}" onsubmit="return validateRegisterRele()">
                        <input type="hidden" id="id" placeholder="id" name="id" value="${pojo.id}">
                        <div class="box-body">
                            <div id="input-nome" class="form-group">
                                <label for="nome">Nome</label>
                                <input type="text" class="form-control" id="nome" onkeypress="ocultaErro(this.name)" name="nome" value="${pojo.nome}">
                                <span class="form-control-feedback" style="display: none"></span>
                                <div id="nomeError" class="fieldError" style="display: none">Campo nome obrigatório!</div>
                            </div>
                            <div id="input-porta" class="form-group">
                                <label for="porta">Porta</label>
                                <input type="text" class="form-control" id="porta" onkeypress="ocultaErro(this.name)" name="porta" value="${pojo.porta}">
                                <span class="form-control-feedback" style="display: none"></span>
                                <div id="portaError" class="fieldError" style="display: none">Campo porta obrigatório!</div>
                            </div>
                            <!--Lista dos dispositivos a serem atrelados aos relés-->
                            <div class="form-group">
                                <label for="dispositivo">Dispositivo</label>                         
                                <select class="form-control" name="dispositivo.id">
                                    <option value="" selected >Selecione...</option>                       
                                    <c:if test="${not empty list}">
                                        <c:forEach items="${list}" var="dispositivo">
                                            <option value="${dispositivo.id}"<c:if test="${dispositivo.id == pojo.dispositivo.id}">selected=</c:if>>${dispositivo.nome}</option>
                                        </c:forEach>
                                    </c:if>
                                </select>
                            </div>  
                        </div>                        
                        <div class="box-footer">
                            <button type="submit" class="btn btn-primary">Enviar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</div>
<script type="text/javascript">
    $(function () {
        $("#example1").dataTable();
        $('#example2').dataTable({
            "bPaginate": true,
            "bLengthChange": false,
            "bFilter": false,
            "bSort": true,
            "bInfo": true,
            "bAutoWidth": false
        });
    });
</script>
