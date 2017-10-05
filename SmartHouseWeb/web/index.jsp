<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>SmartHouse</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <link href="<c:url value="/resources/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css" />
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/dist/css/AdminLTE.min.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/plugins/iCheck/square/blue.css"/>" rel="stylesheet" type="text/css" />
    </head>
    <body class="login-page">
        <div class="login-box">
            <div class="login-logo">
                <a href="<c:url value="/"/>"><b>Smart</b>house</a>
            </div><!-- /.login-logo -->
            <div class="login-box-body">
                <p class="login-box-msg">Entre para comecar sua sessão</p>
                <form action="efetuaLogin" method="post">
                    <div class="form-group has-feedback">
                        <input type="email" class="form-control" placeholder="Email" id="email" name="email" value=""/>
                        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <input type="password" class="form-control" placeholder="Senha" id="senha" name="senha" value=""/>
                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                    </div>
                    <div class="row">
                        <div class="col-xs-8">    
                            <div class="checkbox icheck">
                                <label>
                                    <input type="checkbox"> Lembrar-me
                                </label>
                            </div>                        
                        </div>
                        <div class="col-xs-4">
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block btn-flat">Logar</button>
                </form>
                <a href="#">Esqueceu a senha?</a><br>
            </div>
        </div>
        <script src="<c:url value="/resources/plugins/jQuery/jQuery-2.1.3.min.js"/>"></script>
        <script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/resources/plugins/iCheck/icheck.min.js"/>" type="text/javascript"></script>
        <script>
            $(function () {
                $('input').iCheck({
                    checkboxClass: 'icheckbox_square-blue',
                    radioClass: 'iradio_square-blue',
                    increaseArea: '20%' // optional
                });
            });
        </script>
    </body>
</html>