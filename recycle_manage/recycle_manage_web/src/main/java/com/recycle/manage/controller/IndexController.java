package com.recycle.manage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("front")
@Controller
public class IndexController {
    @Autowired
    private ApiItemCatController apiItemCatController;

    /**
     * 前台首页
     * 查询商品类目数据给导航
     */
    @RequestMapping(value = "index",method= RequestMethod.GET)
    @ResponseBody
    public ModelAndView toIndexPage(){
        ModelAndView mv=new ModelAndView("indexFirst");

        ResponseEntity<String> itemCatResult = this.apiItemCatController.queryItemCat();
        String itemCatResultString = itemCatResult.getBody();

        mv.addObject("itemCatResultString",itemCatResultString);
        return mv;
    }


    /**
     * 查询商品类目数据给导航
     */
    @RequestMapping(value = "api",method= RequestMethod.GET)
    @ResponseBody
    public String toApi(){
        ResponseEntity<String> itemCatResult = this.apiItemCatController.queryItemCat();
        String itemCatResultString = itemCatResult.getBody();
        System.out.print(itemCatResultString);
        return itemCatResultString;
    }
}
