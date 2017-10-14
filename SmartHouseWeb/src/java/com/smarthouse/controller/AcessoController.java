package com.smarthouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/permissao-negada")
public class AcessoController {

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView redirect() {
        ModelAndView mv = new ModelAndView("permissao_negada/permissao_negada");
        return mv;
    }

}
