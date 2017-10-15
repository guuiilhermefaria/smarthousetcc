<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<aside class="main-sidebar" style="position: fixed;">
    <section class="sidebar" style="height: auto;">
        <ul class="sidebar-menu">
            <li class="header">CADASTRO</li>
                <c:if test="${usuarioLogado.tipo_usuario.nome == 'Administrador'}">
                <!--Op��es para cadastro e listagem de usu�rios-->
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-user"></i> <span>Usu�rio</span>
                        <i class="fa fa-angle-left pull-right"></i>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="<c:url value="/usuario/show"/>"><i class="fa fa-edit"></i> Novo</a></li>
                        <li><a href="<c:url value="/usuario"/>"><i class="fa fa-list"></i> Listar</a></li>
                    </ul>
                </li>   
            </c:if>
            <c:if test="${usuarioLogado.tipo_usuario.nome == 'Morador'}">
                <!--Op��es para cadastro e listagem de c�modos-->
                <li class="treeview">
                    <a href="#">
                    <!--<a href="< c:url value="/comodo/show"/>">-->
                        <i class="fa fa-home"></i> <span>C�modo</span>
                        <i class="fa fa-angle-left pull-right"></i>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="<c:url value="/comodo/show"/>"><i class="fa fa-edit"></i> Novo</a></li>
                        <li><a href="<c:url value="/comodo"/>"><i class="fa fa-list"></i> Listar</a></li>
                    </ul>
                </li>     
                <!--Op��es para cadastro e listagem de dispositivos-->
                <li class="treeview">
                    <a href="<c:url value="/dispositivo"/>">
                        <i class="fa fa-lightbulb-o"></i>
                        <span>Dispositivo</span>
                        <i class="fa fa-angle-left pull-right"></i>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="<c:url value="/dispositivo/show"/>"><i class="fa fa-edit"></i> Novo</a></li>
                        <li><a href="<c:url value="/dispositivo"/>"><i class="fa fa-list"></i> Listar</a></li>
                    </ul>
                </li>
                <!--Op��es para cadastro e listagem de rel�s-->
                <li class="treeview">
                    <a href="<c:url value="/rele/show"/>"">
                        <i class="fa fa-plus-square"></i> <span>Rel�</span>
                        <i class="fa fa-angle-left pull-right"></i>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="<c:url value="/rele/show"/>"><i class="fa fa-edit"></i> Novo</a></li>
                        <li><a href="<c:url value="/rele"/>"><i class="fa fa-list"></i> Listar</a></li>
                    </ul>
                </li>
                <!--Op��es para cadastro de recados-->
                <li class="treeview">
                    <a href="<c:url value="/recado/show"/>"">
                        <i class="fa fa-envelope-o"></i> <span>Recado</span>
                        <i class="fa fa-angle-left pull-right"></i>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="<c:url value="/recado/show"/>"><i class="fa fa-edit"></i> Novo</a></li>
                        <li><a href="<c:url value="/recado"/>"><i class="fa fa-list"></i> Listar</a></li>
                    </ul>
                </li>          
                <li class="header">GERENCIAR</li>
                <!--Listagens de dispositivos a serem gerenciados-->
                <li class="treeview">
                    <a href="<c:url value="/monitorar"/>">
                        <i class="fa fa-eye"></i> <span>Gerenciar Casa</span>
                    </a>
                </li>
            </c:if>
            <li class="header">RELAT�RIO</li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-files-o"></i> <span>Relat�rios</span>
                </a>
                <ul class="treeview-menu">
                    <!--Relat�rios para Moradores-->
                    <c:if test="${usuarioLogado.tipo_usuario.nome == 'Morador'}">
                        <li><a href="<c:url value="/relatoriocomodo"/>" target="_blank"><i class="fa fa-circle-o"></i> C�modo</a></li>
                        <li><a href="<c:url value="/relatoriodispositivo"/>" target="_blank"><i class="fa fa-circle-o"></i> Dispositivo</a></li>
                        <li><a href="<c:url value="/relatoriorele"/>" target="_blank"><i class="fa fa-circle-o"></i> Rel�</a></li>
                        </c:if>
                    <!--Relat�rios para Administradores-->
                    <c:if test="${usuarioLogado.tipo_usuario.nome == 'Administrador'}">
                        <li><a href="<c:url value="/relatoriousuario"/>" target="_blank"><i class="fa fa-circle-o"></i> Usu�rio</a></li>
                        </c:if>
                </ul>
            </li>
        </ul>
    </section>
</aside>