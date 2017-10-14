package com.smarthouse.controller.filter;

import com.smarthouse.model.entity.Usuario;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AAFilter extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        boolean shallPass = false;
        String context = "";
        String uri = request.getRequestURI();
        //Resources, login
        if (uri.endsWith("/")
                || uri.endsWith("efetuaLogin")
                || uri.contains("resources")) {
            return true;
        }
        HttpSession session = request.getSession();
        Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
        if (usuario != null) {
            shallPass = true;
            if (usuario.getTipo_usuario().getNome().equals("Morador")) {
                if (uri.contains(context + "/usuario/show")) {
                    shallPass = false;
                }
                if (uri.contains(context + "/usuario")) {
                    shallPass = false;
                }
                if (uri.contains(context + "/relatoriousuario")) {
                    shallPass = false;
                }
            }
            if (usuario.getTipo_usuario().getNome().equals("Administrador")) {
                if (uri.contains(context + "/comodo/show")) {
                    shallPass = false;
                }
                if (uri.contains(context + "/comodo")) {
                    shallPass = false;
                }
                if (uri.contains(context + "/relatoriocomodo")) {
                    shallPass = false;
                }
                if (uri.contains(context + "/dispositivo/show")) {
                    shallPass = false;
                }
                if (uri.contains(context + "/dispositivo")) {
                    shallPass = false;
                }
                if (uri.contains(context + "/relatoriodispositivo")) {
                    shallPass = false;
                }
                if (uri.contains(context + "/rele/show")) {
                    shallPass = false;
                }
                if (uri.contains(context + "/rele")) {
                    shallPass = false;
                }
                if (uri.contains(context + "/relatoriorele")) {
                    shallPass = false;
                }
                if (uri.contains(context + "/recado/show")) {
                    shallPass = false;
                }
                if (uri.contains(context + "/recado")) {
                    shallPass = false;
                }
                if (uri.contains(context + "/monitorar/monitorarHouse")) {
                    shallPass = false;
                }
            }
        }
        if (!shallPass) {
            response.sendRedirect("/SmartHouse/permissao-negada");
        }
        return shallPass;
    }

}
