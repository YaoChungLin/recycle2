package com.recycle.manage.controller;

import com.recycle.common.ItemCatResult;
import com.recycle.manage.service.ApiItemCatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("front")
@Controller
public class IndexController {
    @Autowired
    private ApiItemCatService apiItemCatController;

    /**
     * 前台首页
     * 查询商品类目数据给导航
     */
    @RequestMapping(value = "index",method= RequestMethod.GET)
    @ResponseBody
    public ModelAndView toIndexPage(){
        ModelAndView mv=new ModelAndView("indexFirst");
        ItemCatResult itemCatResult=this.apiItemCatController.queryAllToTree();
        System.out.print(itemCatResult);
        mv.addObject("itemCatResult",itemCatResult);
        return mv;
    }
}
