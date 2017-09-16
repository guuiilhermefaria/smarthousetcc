<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Relés
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Ínicio</a></li>
            <li><a href="<c:url value="/comodo"/>">Relés</a></li>
            <li class="active">Lista de Relés</li>
        </ol>
    </section>
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">Lista de Relés</h3>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <table id="example2" class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th width="55%">Nome</th>
                                    <th width="10%">Porta</th>
                                    <th width="20%">Dispositivo</th>
                                    <th width="15%">Editar-Excluir</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${list}" var="rele">
                                    <tr>
                                        <td>${rele.nome}</td>
                                        <td>${rele.porta}</td>
                                        <td>${rele.dispositivo.nome}</td>
                                        <td>
                                            <a href="<c:url value="/rele/show?id=${rele.id}"/>" class="btn btn-sm btn-primary"><spam class="glyphicon glyphicon-edit"></spam></a>
                                            <a href="<c:url value="/rele/${rele.id}/excluir"/>" class="btn btn-sm btn-danger"><spam class="glyphicon glyphicon-trash"></spam></a>
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
                    </div><!-- /.box-body -->
                </div><!-- /.box -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
