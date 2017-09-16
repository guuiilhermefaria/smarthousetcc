package com.smarthouse.controller;

import com.smarthouse.model.entity.Usuario;
import com.smarthouse.model.service.TipoUsuarioService;
import com.smarthouse.model.service.UsuarioService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RestController
@RequestMapping("/usuario")
public class UsuarioController implements BaseController<Usuario>{

    private static final String USUARIO = "usuario";
    private static final String RELATORIO = "relatorio";
    private static final String ADMINISTRADOR = "administrador";

    private UsuarioService service = new UsuarioService();
    private TipoUsuarioService tus = new TipoUsuarioService();

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView loginAdministradorGet() {
        ModelAndView mv = new ModelAndView(ADMINISTRADOR + "/pagina_inicial_adm");

        return mv;
    }

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public ModelAndView loginAdministradorPost() {
        ModelAndView mv = new ModelAndView();
        return mv;
    }

    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView save(@ModelAttribute Usuario pojo, RedirectAttributes redAttr) {
        ModelAndView mv = new ModelAndView("redirect:/" + USUARIO);
        if (pojo.getId() == null) {
            service.create(pojo);
        } else {
            service.update(pojo);
        }
        return mv;
    }
   
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView readByCriteria() {
        ModelAndView mv = new ModelAndView(USUARIO + "/list");
        mv.addObject("list", service.readByCriteria(null));
        return mv;
    }

    @RequestMapping(value = "{id}/excluir", method = RequestMethod.GET)
    public ModelAndView delete(@PathVariable Long id) {
        ModelAndView mv = new ModelAndView("redirect:/" + USUARIO);
        service.delete(id);
        return mv;
    }

    @RequestMapping(value = "/show", method = RequestMethod.GET)
    public ModelAndView get(Long id) {
        ModelAndView mv = new ModelAndView(USUARIO + "/form");
        if (id != null) {
            mv.addObject("pojo", service.readById(id));
        }
        mv.addObject("list", tus.readByCriteria(null));
        return mv;
    }
}
