<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="content-wrapper" >
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Recados
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Ínicio</a></li>
            <li><a href="<c:url value="/recado"/>">Recados</a></li>
            <li class="active">Lista de Recados</li>
        </ol>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">Lista de Recados</h3>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <c:if test="${not empty list}">
                            <div class="row">              
                                <c:forEach items="${list}" var="recado" varStatus="i">                           
                                    <div class="col-md-4">
                                        <!-- Primary box -->
                                        <div class="box box-solid box-primary">
                                            <div class="box-header">
                                                <h3 class="box-title">${recado.usuario.nome}</h3>
                                                <div class="box-tools pull-right">
                                                    <button class="btn btn-primary btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                                    <c:if test="${usuarioLogado.nome == recado.usuario.nome}"><a href="<c:url value="/recado/${recado.id}/excluir"/>" class="btn btn-primary btn-sm"><spam class="glyphicon glyphicon-trash"></spam></a></c:if>
                                                    </div>
                                                </div>
                                                <div class="box-body">
                                                    <p>
                                                    ${recado.recado}                                                    
                                                </p>
                                            </div><!-- /.box-body -->
                                            <div class="box-footer ">
                                                <code>Enviado em <fmt:formatDate pattern="dd/MM/yyyy" value="${recado.dataHoraRecado}"/> às <fmt:formatDate pattern="HH:mm" value="${recado.dataHoraRecado}" type="time"/></code>
                                            </div><!-- /.box-footer-->
                                        </div><!-- /.box -->
                                    </div><!-- /.col -->
                                </c:forEach>
                            </div><!-- /.row -->
                        </c:if>
                    </div><!-- /.box-body -->
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
