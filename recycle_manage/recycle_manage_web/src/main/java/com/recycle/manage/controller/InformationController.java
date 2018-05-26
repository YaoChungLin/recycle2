package com.recycle.manage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("information")
@Controller
public class InformationController {


    /**
     * 订单个人信息填写页面
     * @return
     */
    @RequestMapping(value = "write",method = RequestMethod.GET)
    public ModelAndView toInfomation(){
        ModelAndView mv=new ModelAndView("information");
        return  mv;
    }


}
