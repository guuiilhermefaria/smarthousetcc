package com.smarthouse.controller;

import com.smarthouse.model.entity.Usuario;
import com.smarthouse.model.service.TipoUsuarioService;
import com.smarthouse.model.service.UsuarioService;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/perfil")
public class PerfilController {

    public static final String PERFIL = "perfil";
    private static final UsuarioService service = new UsuarioService();
    private static final TipoUsuarioService tus = new TipoUsuarioService();

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView get(HttpSession session) {
        ModelAndView mv = new ModelAndView("perfil/perfil_usuario");
        Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
        if (usuario.getId() != null) {
            Usuario pojo = service.readById(usuario.getId());
            pojo.setSenha("");
            mv.addObject("pojo", pojo);
        }
        mv.addObject("list", tus.readByCriteria(null));

        return mv;
    }

    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView save(@ModelAttribute Usuario pojo, RedirectAttributes redAttr, HttpSession session) {
        ModelAndView mv = new ModelAndView("redirect:/" + PERFIL);
        if (pojo.getId() != null) {
            service.update(pojo);
            redAttr.addFlashAttribute("sucesso", "Usuário atualizado com sucesso");
        }
        return mv;
    }
}
