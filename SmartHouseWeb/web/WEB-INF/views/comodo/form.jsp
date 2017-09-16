<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--Validação cômodo-->
<script src="<c:url value="/resources/validacaoJS/validacaoComodo.js"/>" type="text/javascript"></script>

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
                        <h3 class="box-title" >Novo Cômodo</h3>
                    </div><!-- /.box-header -->
                    <c:url value="/comodo" var="url" />
                    <!-- form start -->                    
                    <form id="formComodo" role="form" method="POST" action="${url}" onsubmit="return validateRegisterComodo()">
                        <input type="hidden" id="id" placeholder="id" name="id" value="${pojo.id}"/>
                        <div class="box-body">
                            <div id="nomeSuccess" class="fieldError"  style="color: #f00; display: none">
                                Cadastro efetuado com sucesso!
                            </div>
                            <div id="input-nome" class="form-group ">
                                <label for="nome">Nome</label>
                                <input type="text" class="form-control" id="nome" name="nome" onkeypress="ocultaErro(this.name);//mostraSucesso(this.name)" value="${pojo.nome}">
                                <span class="form-control-feedback" style="display: none"></span>
                            </div>
                            <div id="nomeError" class="fieldError" style="display: none">Campo nome obrigatório!</div>
                            <!--<div id="nomeError" class="fieldError" style="color: #f00; display: none"></div>-->
                        </div><!-- /.box-body -->
                        <div class="box-footer">
                            <button type="submit" class="btn btn-primary">Enviar</button>
                        </div>
                    </form>
                    <!--                    <form id="formExemplo" data-toggle="validator" role="form">
                                            <div class="form-group">
                                                <label for="textNome" class="control-label">Nome</label>
                                                <input id="textNome" class="form-control" placeholder="Digite seu Nome..." type="text" required>
                                            </div>
                    
                                            <div class="form-group">
                                                <label for="inputEmail" class="control-label">Email</label>
                                                <input id="inputEmail" class="form-control" placeholder="Digite seu E-mail" type="email" 
                                                       data-error="Por favor, informe um e-mail correto." required>
                                                <div class="help-block with-errors"></div>
                                            </div>
                    
                                            <div class="form-group">
                                                <label for="inputPassword" class="control-label">Senha</label>
                                                <input type="password" class="form-control" id="inputPassword" placeholder="Digite sua Senha..."  
                                                       data-minlength="6" required>
                                                <span class="help-block">Mínimo de seis (6) digitos</span>
                                            </div>
                    
                                            <div class="form-group">
                                                <label for="inputConfirm" class="control-label">Confirme a Senha</label>
                                                <input type="password" class="form-control" id="inputConfirm" placeholder="Confirme sua Senha..." 
                                                       data-match="#inputPassword" data-match-error="Atenção! As senhas não estão iguais." required>
                                                <div class="help-block with-errors"></div>
                                            </div>
                    
                                            <div class="form-group">
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" data-error="Você deve marcar este campo!" required> Marque este item.
                                                    </label>
                                                    <div class="help-block with-errors"></div>
                                                </div>
                                            </div>
                    
                                            <div class="form-group">
                                                <button type="submit" class="btn btn-primary">Enviar</button>
                                            </div>
                                        </form>-->
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