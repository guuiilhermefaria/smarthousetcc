package com.smarthouse.controller;

import com.smarthouse.model.entity.Dispositivo;
import com.smarthouse.model.service.ComodoService;
import com.smarthouse.model.service.DispositivoService;
import com.smarthouse.model.service.TipoDeLigacaoService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/dispositivo")
public class DispositivoController implements BaseController<Dispositivo> {

    private static final String DISPOSITIVO = "dispositivo";
    private DispositivoService service = new DispositivoService();
    private TipoDeLigacaoService tdls = new TipoDeLigacaoService();
    private ComodoService cs = new ComodoService();

    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView save(@ModelAttribute Dispositivo pojo, RedirectAttributes redAttr) {
        ModelAndView mv = new ModelAndView("redirect:/" + DISPOSITIVO);
        if (pojo.getId() == null) {
            service.create(pojo);
            redAttr.addFlashAttribute("sucesso", "Dispositivo criado com sucesso");
        } else {
            service.update(pojo);
            redAttr.addFlashAttribute("sucesso", "Dispositivo atualizado com sucesso");
        }
        return mv;
    }

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView readByCriteria() {
        ModelAndView mv = new ModelAndView(DISPOSITIVO + "/list");
        mv.addObject("list", service.readByCriteria(null));
        return mv;
    }

    @RequestMapping(value = "{id}/excluir", method = RequestMethod.GET)
    public ModelAndView delete(@PathVariable Long id, RedirectAttributes redAttr) {
        ModelAndView mv = new ModelAndView("redirect:/" + DISPOSITIVO);
        service.delete(id);
        redAttr.addFlashAttribute("deletado", "Dispositivo deletado com sucesso");
        return mv;
    }

    @RequestMapping(value = "/show", method = RequestMethod.GET)
    public ModelAndView get(Long id) {
        ModelAndView mv = new ModelAndView(DISPOSITIVO + "/form");

        if (id != null) {
            mv.addObject("pojo", service.readById(id));
        }
        mv.addObject("list", cs.readByCriteria(null));
        mv.addObject("list2", tdls.readByCriteria(null));
        return mv;
    }
}
