package com.smarthouse.controller;

import com.smarthouse.model.entity.Usuario;
import com.smarthouse.model.service.UsuarioService;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("efetuaLogin")
public class LoginController {

    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView efetuaLogin(HttpSession session, Usuario usuarioALogar) throws Exception {
        ModelAndView mv = null;
        UsuarioService service = new UsuarioService();
        Usuario usuario = service.login(usuarioALogar.getEmail(), usuarioALogar.getSenha());
        if (usuario != null) {
            session.setAttribute("usuarioLogado", usuario);
            mv = new ModelAndView("redirect:/home");
        } else {
            mv = new ModelAndView("redirect:/");
        }
        return mv;
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public ModelAndView logout(HttpSession session) throws Exception {
        ModelAndView mv = new ModelAndView("redirect:/");
        session.removeAttribute("usuarioLogin");
        return mv;
    }
}
