package com.smarthouse.controller;

import com.smarthouse.model.service.ComodoService;
import com.smarthouse.model.service.DispositivoService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/monitorar")
public class MonitorarCasaController {

    private static final String MONITORAR = "monitorar";
    private ComodoService cs = new ComodoService();
    private DispositivoService ds  = new DispositivoService();
    
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView monitorar() {
        ModelAndView mv = new ModelAndView(MONITORAR + "/form");
        return mv;
    }

    @RequestMapping(value = "/monitorarHouse", method = RequestMethod.GET)
    public ModelAndView monitorarHouse() {
        ModelAndView mv = new ModelAndView(MONITORAR + "/monitorar");
        mv.addObject("list", cs.readAll());
        return mv;
    }
}
