<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core"prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>--%>
<html>
    <head>        
        <meta charset="UTF-8">
        <title>Smarthouse</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- Bootstrap 3.3.2 -->
        <link href="<c:url value="/resources/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css" />
        <!-- Font Awesome Icons -->
        <link href="<c:url value="/resources/bootstrap/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="<c:url value="/resources/bootstrap/css/ionicons.min.css"/>" rel="stylesheet" type="text/css" />
        <!-- DATA TABLES -->
        <link href="<c:url value="/resources/plugins/datatables/dataTables.bootstrap.css"/>" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="<c:url value="/resources/dist/css/AdminLTE.min.css"/>" rel="stylesheet" type="text/css" />
        <!-- AdminLTE Skins. Choose a skin from the css/skins 
             folder instead of downloading all of them to reduce the load. -->
        <link href="<c:url value="/resources/dist/css/skins/_all-skins.min.css"/>" rel="stylesheet" type="text/css" />
        <!--teste-->
        <link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/jquery-ui.css"/>">
        <link rel="stylesheet" href="<c:url value="/resources/demos/style.css"/>">
        <!--Jquery-->
        <script src="<c:url value="/resources/plugins/jQuery/jQuery-2.1.3.min.js"/>"></script>
        <script src="<c:url value="/resources/bootstrap/js/jquery-1.12.4.js"/>"></script>
        <script src="<c:url value="/resources/bootstrap/js/jquery-ui.js"/>"></script>

    </head>
    <body class="skin-blue">
        <div class="wrapper"></div>
        <jsp:include page="header.jsp" />
        <jsp:include page="menu.jsp" />
        <jsp:include page="${partial}" />
        <jsp:include page="footer.jsp" />
    </body>

    <!-- Bootstrap 3.3.2 JS -->
    <script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <!-- DATA TABES SCRIPT -->
    <script src="<c:url value="/resources/plugins/datatables/jquery.dataTables.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/plugins/datatables/dataTables.bootstrap.js"/>" type="text/javascript"></script>
    <!-- SlimScroll -->
    <script src="<c:url value="/resources/plugins/slimScroll/jquery.slimscroll.min.js"/>" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='<c:url value="/resources/plugins/fastclick/fastclick.min.js"/>'></script>
    <!-- AdminLTE App -->
    <script src="<c:url value="/resources/dist/js/app.min.js"/>" type="text/javascript"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="<c:url value="/resources/dist/js/demo.js"/>" type="text/javascript"></script>
</html>