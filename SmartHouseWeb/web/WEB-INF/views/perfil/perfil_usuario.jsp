<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="<c:url value="/resources/validacaoJS/validacaoPerfilUsuario.js"/>" type="text/javascript"></script>
<link rel="stylesheet" href="<c:url value="/resources/toast/jquery.toast.min.css"/>">
<script src="<c:url value="/resources/toast/jquery.toast.min.js"/>" type="text/javascript"></script>

<div class="content-wrapper">
    <section class="content-header">
        <h1>
            Usuário
        </h1>
        <ol class="breadcrumb">
            <li><a href="<c:url value="/home"/>"><i class="fa fa-dashboard"></i> Ínicio</a></li>
            <li class="active">Perfil do Usuário</li>
        </ol>
    </section>
    <!-- Principal content -->
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">Perfil do Usuário</h3>
                    </div>
                    <input type="hidden" value="${sucesso}" id="sucesso">
                    <c:url value="/perfil" var="url" />
                    <!-- Formulário de cadastro de Usuário -->                    
                    <form role="form" method="POST" action="${url}" onsubmit="return validateRegisterUsuario()">
                        <input type="hidden" id="id" placeholder="id" name="id" value="${pojo.id}">
                        <div class="box-body">
                            <!--Campo input nome-->
                            <div id="input-nome" class="form-group">
                                <label for="nome">Nome</label>
                                <input type="text" class="form-control" id="nome" onkeypress="ocultaErro(this.name)" placeholder="nome" name="nome" value="${pojo.nome}">
                                <span class="form-control-feedback" style="display: none"></span>
                                <div id="nomeError" class="fieldError" style="display: none">Campo nome obrigatório!</div>
                            </div>
                            <!--Campo input email-->
                            <div id="input-email" class="form-group">
                                <label for="email">Email</label>
                                <input type="email" class="form-control" id="email" onkeypress="ocultaErro(this.name)" placeholder="email" name="email" value="${pojo.email}">
                                <span class="form-control-feedback" style="display: none"></span>
                                <div id="emailError" class="fieldError" style="display: none">Campo email obrigatório!</div>
                            </div>
                            <!--Campo input senha-->
                            <div id="input-senha" class="form-group">
                                <label for="senha">Senha</label>
                                <input type="password" class="form-control" id="senha" minlength="3" onkeypress="ocultaErro(this.name)" placeholder="senha" name="senha" value="${pojo.senha}">
                                <span class="form-control-feedback" style="display: none"></span>
                                <div id="senhaError" class="fieldError" style="display: none">Campo senha obrigatório!</div>
                            </div>
                            <!--Opções do tipo do usuário a ser cadastrado-->
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
                        </div>
                        <div class="box-footer">
                            <button type="submit" class="btn btn-primary">Atualizar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</div>

