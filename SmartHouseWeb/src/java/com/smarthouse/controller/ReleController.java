package com.smarthouse.controller;

import com.smarthouse.model.entity.Rele;
import com.smarthouse.model.service.DispositivoService;
import com.smarthouse.model.service.ReleService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/rele")
public class ReleController implements BaseController<Rele>{

    private static final String RELE = "rele";
    private ReleService service = new ReleService();

    public ModelAndView save(@ModelAttribute Rele pojo, RedirectAttributes redAttr) {
        ModelAndView mv = new ModelAndView("redirect:/" + RELE);
        if (pojo.getId() == null) {
            service.create(pojo);
        } else {
            service.update(pojo);
        }
        return mv;
    }

    public ModelAndView readByCriteria() {
        ModelAndView mv = new ModelAndView(RELE + "/list");
        mv.addObject("list", service.readByCriteria(null));
        return mv;
    }

    public ModelAndView delete(@PathVariable Long id) {
        ModelAndView mv = new ModelAndView("redirect:/" + RELE);
        service.delete(id);
        return mv;
    }

    public ModelAndView get(Long id) {
        ModelAndView mv = new ModelAndView(RELE + "/form");
        DispositivoService ds = new DispositivoService();
        if (id != null) {
            mv.addObject("pojo", service.readById(id));
        }
        mv.addObject("list", service.readDispositivosToCombobox(null));
        return mv;
    }
}