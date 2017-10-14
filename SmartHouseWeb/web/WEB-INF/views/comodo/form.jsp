<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--Validação cômodo-->
<script src="<c:url value="/resources/validacaoJS/validacaoComodo.js"/>" type="text/javascript"></script>

<div class="content-wrapper">
    <section class="content-header">
        <h1>
            Cômodos
        </h1>
        <ol class="breadcrumb">
            <li><a href="<c:url value="/home"/>"><i class="fa fa-dashboard"></i> Ínicio</a></li>
            <li><a href="<c:url value="/comodo"/>">Novo Cômodo</a></li>
            <li class="active">Cômodo</li>
        </ol>
    </section>
    <!-- Principal content -->
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title" >Novo Cômodo</h3>
                    </div>
                    <c:url value="/comodo" var="url" />
                    <!-- Form de cadastro de cômodo -->                    
                    <form id="formComodo" role="form" method="POST" action="${url}" onsubmit="return validateRegisterComodo()">
                        <input type="hidden" id="id" placeholder="id" name="id" value="${pojo.id}"/>
                        <div class="box-body">
                            <div id="nomeSuccess" class="fieldError"  style="color: #f00; display: none">
                                Cadastro efetuado com sucesso!
                            </div>
                            <!--Campo input nome-->
                            <div id="input-nome" class="form-group ">
                                <label for="nome">Nome</label>
                                <input type="text" class="form-control" id="nome" name="nome" onkeypress="ocultaErro(this.name);//mostraSucesso(this.name)" value="${pojo.nome}">
                                <span class="form-control-feedback" style="display: none"></span>
                            </div>
                            <div id="nomeError" class="fieldError" style="display: none">Campo nome obrigatório!</div>
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