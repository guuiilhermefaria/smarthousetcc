<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--Validação usuário-->
<script src="<c:url value="/resources/validacaoJS/validacaoUsuario.js"/>" type="text/javascript"></script>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Usuário
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Ínicio</a></li>
            <li><a href="<c:url value="/usuario"/>">Novo Usuário</a></li>
            <li class="active">Usuário</li>
        </ol>
    </section>
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">Novo Usuário</h3>
                    </div><!-- /.box-header -->
                    <c:url value="/usuario" var="url" />
                    <!-- form start -->                    
                    <form role="form" method="POST" action="${url}" onsubmit="return validateRegisterUsuario()">
                        <input type="hidden" id="id" placeholder="id" name="id" value="${pojo.id}">
                        <div class="box-body">
                            <div id="input-nome" class="form-group">
                                <label for="nome">Nome</label>
                                <input type="text" class="form-control" id="nome" onkeypress="ocultaErro(this.name)" placeholder="nome" name="nome" value="${pojo.nome}">
                                <span class="form-control-feedback" style="display: none"></span>
                                <div id="nomeError" class="fieldError" style="display: none">Campo nome obrigatório!</div>
                            </div>
                            <div id="input-email" class="form-group">
                                <label for="email">Email</label>
                                <input type="email" class="form-control" id="email" onkeypress="ocultaErro(this.name)" placeholder="email" name="email" value="${pojo.email}">
                                <span class="form-control-feedback" style="display: none"></span>
                                <div id="emailError" class="fieldError" style="display: none">Campo email obrigatório!</div>
                            </div>
                            <div id="input-senha" class="form-group">
                                <label for="senha">Senha</label>
                                <input type="password" class="form-control" id="senha" minlength="3" onkeypress="ocultaErro(this.name)" placeholder="senha" name="senha" value="${pojo.senha}">
                                <span class="form-control-feedback" style="display: none"></span>
                                <div id="senhaError" class="fieldError" style="display: none">Campo senha obrigatório!</div>
                            </div>
                            <div class="form-group">
                                <label for="tipo_usuario">Tipos de Usuário</label> 
                                <select class="form-control" name="tipo_usuario.id">
                                    <option selected disabled>Selecione...</option>                    
                                    <c:if test="${not empty list}">
                                        <c:forEach items="${list}" var="tipo_usuario">
                                            <option value="${tipo_usuario.id}"<c:if test="${tipo_usuario.id == pojo.tipo_usuario.id}">selected=</c:if>>${tipo_usuario.nome}</option>
                                        </c:forEach>
                                    </c:if>
                                </select>
                            </div>                            
                        </div><!-- /.box-body -->                       
                        <div class="box-footer">
                            <button type="submit" class="btn btn-primary">Enviar</button>
                        </div>
                    </form>
                </div><!-- /.box -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
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
