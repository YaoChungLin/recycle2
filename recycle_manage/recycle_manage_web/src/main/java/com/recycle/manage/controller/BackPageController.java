package com.recycle.manage.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/*
 * 后台页面通用的页面跳转
 */
@RequestMapping("page")
@Controller
public class BackPageController {
    
    @RequestMapping(value="{pageName}",method= RequestMethod.GET)
    public String toPage(@PathVariable("pageName") String pageName){

        return pageName;
    }
}
