package com.smarthouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RestController
@RequestMapping("/home")
public class IndexController {

    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView homePOST() {
        ModelAndView mv = new ModelAndView();
        return mv;
    }

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView homeGET() {
        ModelAndView mv = new ModelAndView("paginaInicial/pagina_inicial");

        return mv;
    }
}
