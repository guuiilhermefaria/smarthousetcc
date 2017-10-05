<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<header class="main-header">
    <a href="<c:url value="#"/>" class="logo"><b>Smart</b>house</a>
    <nav class="navbar navbar-static-top" role="navigation">
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <c:if test="${usuarioLogado.tipo_usuario.nome == 'morador'}">
                    <li class="dropdown messages-menu">
                        <a href="" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-envelope-o"></i>
                            <span class="label label-success"></span>
                        </a>
                    </li>                                
                </c:if>
                <!--Dropdown para mostrar o Nome do usu�rio e deslogar da aplica��o-->
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <span class="hidden-xs">${usuarioLogado.nome}</span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="user-header">
                            <p>
                                ${usuarioLogado.nome}
                                <small>Smarthouse - 2017</small>
                            </p>
                        </li>                        
                        <!--Rodap� do Header-->
                        <li class="user-footer">
                            <div class="pull-right">
                                <a href="<c:url value="/efetuaLogin/logout"/>" class="btn btn-default btn-flat">Sair</a>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header>
