package com.smarthouse.controller;

import com.smarthouse.model.entity.Recado;
import com.smarthouse.model.entity.Usuario;
import com.smarthouse.model.service.RecadoService;
import java.sql.Timestamp;
import javax.servlet.http.HttpSession;
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
@RequestMapping("/recado")
public class RecadoController implements BaseController<Recado>{

    private static final String RECADO = "recado";
    private RecadoService service = new RecadoService();

    @Override
    public ModelAndView save(Recado pojo, RedirectAttributes redAttr) {
        return null;
    }
    
    @RequestMapping(value = "/save",method = RequestMethod.POST)
    public ModelAndView save(@ModelAttribute Recado pojo, HttpSession session) {
        ModelAndView mv = new ModelAndView("redirect:/" + RECADO);
        if (pojo.getId() == null) {
            Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
            pojo.setUsuario(usuario);
            pojo.setDataHoraRecado(new Timestamp(System.currentTimeMillis()));
            service.create(pojo);
        } else {
            service.update(pojo);
        }
        return mv;
    }

    public ModelAndView readByCriteria() {
        ModelAndView mv = new ModelAndView(RECADO + "/list");
        mv.addObject("list", service.readByCriteria(null));
        return mv;
    }

    public ModelAndView delete(@PathVariable Long id) {
        ModelAndView mv = new ModelAndView("redirect:/" + RECADO);
        service.delete(id);
        return mv;
    }

    public ModelAndView get(Long id) {
        ModelAndView mv = new ModelAndView(RECADO + "/form");
        if (id != null) {
            mv.addObject("entity", service.readById(id));
        }
        return mv;
    }
}
