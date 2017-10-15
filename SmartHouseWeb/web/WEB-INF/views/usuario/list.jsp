<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--Validação Usuário e toasty de cadastro e exclusão-->
<script src="<c:url value="/resources/validacaoJS/validacaoUsuario.js"/>" type="text/javascript"></script>
<link rel="stylesheet" href="<c:url value="/resources/toast/jquery.toast.min.css"/>">
<script src="<c:url value="/resources/toast/jquery.toast.min.js"/>" type="text/javascript"></script>
<div class="content-wrapper">
    <section class="content-header">
        <h1>
            Usuários
        </h1>
        <ol class="breadcrumb">
            <li><a href="<c:url value="/home"/>"><i class="fa fa-dashboard"></i> Ínicio</a></li>
            <li><a href="<c:url value="/usuario"/>">Usuários</a></li>
            <li class="active">Lista de Usuários</li>
        </ol>
    </section>
    <!-- Principal content -->
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">Lista de Usuários</h3>
                    </div>
                    <input type="hidden" value="${sucesso}" id="sucesso">
                    <input type="hidden" value="${deletado}" id="deletado">
                    <div class="box-body">
                        <table id="example2" class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th width="40%">Nome</th>
                                    <th width="10%">Email</th>
                                    <th width="20%">Tipo de Usuário</th>
                                    <th width="15%">Editar-Excluir</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${list}" var="usuario">
                                    <tr>
                                        <td>${usuario.nome}</td>
                                        <td>${usuario.email}</td>
                                        <td>${usuario.tipo_usuario.nome}</td>
                                        <td>
                                            <a href="<c:url value="/usuario/show?id=${usuario.id}"/>" class="btn btn-sm btn-primary"><spam class="glyphicon glyphicon-edit"></spam></a>
                                            <a href="<c:url value="/usuario/${usuario.id}/excluir"/>" class="btn btn-sm btn-danger"><spam class="glyphicon glyphicon-trash"></spam></a>
                                        </td>
                                    </tr>
                                </c:forEach>      
                                <c:if test="${empty list}">
                                    <tr>
                                        <td colspan="3">Lista Vazia</td>
                                    </tr>
                                </c:if>                                
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
