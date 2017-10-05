package com.smarthouse.controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface BaseController<E> {
    
    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView save(@ModelAttribute E pojo, RedirectAttributes redAttr);

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView readByCriteria();

    @RequestMapping(value = "{id}/excluir",method = RequestMethod.GET)
    public ModelAndView delete(@PathVariable Long id, RedirectAttributes redAttr);

    @RequestMapping(value = "/show", method = RequestMethod.GET)
    public ModelAndView get(Long id);

}
