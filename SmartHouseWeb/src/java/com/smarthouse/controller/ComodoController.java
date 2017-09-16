package com.smarthouse.controller;

import com.smarthouse.model.entity.Comodo;
import com.smarthouse.model.service.ComodoService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/comodo")
public class ComodoController implements BaseController<Comodo> {

    private static final String COMODO = "comodo";
    private ComodoService service = new ComodoService();
    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView save(@ModelAttribute Comodo pojo, RedirectAttributes redAttr) {
        ModelAndView mv = new ModelAndView("redirect:/" + COMODO);
        if (pojo.getId() == null) {
            service.create(pojo);
            redAttr.addFlashAttribute("sucesso", "Cômodo criado com sucesso!");
        } else {
            service.update(pojo);
            redAttr.addFlashAttribute("sucesso", "Cômodo atualizado com sucesso!");
        }
        return mv;
    }

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView readByCriteria() {
        ModelAndView mv = new ModelAndView(COMODO + "/list");
        mv.addObject("list", service.readByCriteria(null));
        return mv;
    }

    @RequestMapping(value = "/form/{id}", method = RequestMethod.GET)
    public ModelAndView getPojo(@PathVariable Long id) {
        ModelAndView mv = new ModelAndView(COMODO + "/form");
        if (id != null) {
            mv.addObject("pojo", service.readById(id));
        }
        return mv;
    }

    @RequestMapping(value = "{id}/excluir", method = RequestMethod.GET)
    public ModelAndView delete(@PathVariable Long id) {
        ModelAndView mv = new ModelAndView("redirect:/" + COMODO);
        service.delete(id);
        return mv;
    }

    @RequestMapping(value = "/show", method = RequestMethod.GET)
    public ModelAndView get(Long id) {
        ModelAndView mv = new ModelAndView(COMODO + "/form");
        if (id != null) {
            mv.addObject("pojo", service.readById(id));
        }
        return mv;
    }
}
