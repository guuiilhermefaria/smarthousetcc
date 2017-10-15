<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--Validação dispositivo e toasty de cadastro e exclusão-->
<script src="<c:url value="/resources/validacaoJS/validacaoDispositivo.js"/>" type="text/javascript"></script>
<link rel="stylesheet" href="<c:url value="/resources/toast/jquery.toast.min.css"/>">
<script src="<c:url value="/resources/toast/jquery.toast.min.js"/>" type="text/javascript"></script>

<div class="content-wrapper">
    <section class="content-header">
        <h1>
            Dispositivos
        </h1>
        <ol class="breadcrumb">
            <li><a href="<c:url value="/home"/>"><i class="fa fa-dashboard"></i> Ínicio</a></li>
            <li><a href="<c:url value="/dispositivo"/>">Dispositivos</a></li>
            <li class="active">Lista de Dispositivos</li>
        </ol>
    </section>
    <!-- Principal content -->
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">Lista de Dispositivos</h3>
                    </div>
                    <input type="hidden" value="${sucesso}" id="sucesso">
                    <input type="hidden" value="${deletado}" id="deletado">
                    <div class="box-body">
                        <!--Tabela de listagem de Dispositivos-->
                        <table id="tabelaDispositivo" class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th width="50%">Nome</th>
                                    <th width="20%">Cômodo</th>
                                    <th width="15%">Tipo de Ligação</th>
                                    <th width="15%">Editar Excluir</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <c:forEach items="${list}" var="dispositivo">
                                        <td>${dispositivo.nome}</td>
                                        <td>${dispositivo.comodo.nome}</td>
                                        <td>${dispositivo.tipo_de_ligacao.nome}</td>
                                        <td>
                                            <a href="<c:url value="/dispositivo/show?id=${dispositivo.id}"/>" class="btn btn-sm btn-primary"><spam class="glyphicon glyphicon-edit"></spam></a>
                                            <a href="<c:url value="/dispositivo/${dispositivo.id}/excluir"/>" class="btn btn-sm btn-danger"><spam class="glyphicon glyphicon-trash"></spam></a>
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
