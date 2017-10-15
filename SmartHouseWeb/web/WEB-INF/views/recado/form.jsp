<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="content-wrapper">
    <section class="content-header">
        <h1>
            Recado
        </h1>
        <ol class="breadcrumb">
            <li><a href="<c:url value="/home"/>"><i class="fa fa-dashboard"></i> Ínicio</a></li>
            <li><a href="<c:url value="/recado"/>">Novo Recado</a></li>
            <li class="active">Recado</li>
        </ol>
    </section>
    <!-- Principal content -->
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box box-primary">
                    <div class='box-header'>
                        <h3 class='box-title'>Novo Recado <small></small></h3>
                    </div>
                    <div class='box-body pad'>
                        <c:url value="/recado/save" var="url" />
                        <!-- Formulário para enviar Recado -->                    
                        <form role="form" method="POST" action="${url}">
                            <input type="hidden" id="id" placeholder="id" name="id" value="${pojo.id}">
                            <!--Campo textarea para escrever o conteúdo da mensagem-->
                            <textarea class="textarea" name="recado" placeholder="Digite seu recado..." style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
                            <div class="box-footer">
                                <a class="btn btn-danger" href="<c:url value="/recado" />">Cancelar</a>
                                <button type="submit" class="btn btn-primary">Cadastrar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>









