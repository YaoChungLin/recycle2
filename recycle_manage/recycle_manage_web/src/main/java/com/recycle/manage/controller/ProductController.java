package com.recycle.manage.controller;

import com.recycle.manage.pojo.ItemCatDesc;
import com.recycle.manage.service.ItemCatDescService;
import com.recycle.manage.service.ItemCatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RequestMapping("products")
@Controller
public class ProductController {

    @Autowired
    private ItemCatDescService itemCatDescService;

    @Autowired
    private ItemCatService itemCatService;

    /**
     * 产品页面
     * 查询该产品的版本数据给页面显示
     * @param itemCatId
     * @return
     */
    @RequestMapping(value = "{itemCatId}",method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView showProduct(@PathVariable("itemCatId") Long itemCatId ){
        ModelAndView mv=new ModelAndView("products");
        List<ItemCatDesc> itemCatDescs = this.itemCatDescService.queryListByCatId(itemCatId);

        String itemName = this.itemCatService.queryById(itemCatId).getName();

       /* //list转换成数组
        ItemCatDesc[] itemCatDescArray=new ItemCatDesc[itemCatDescs.size()];
        itemCatDescs.toArray(itemCatDescArray);
        mv.addObject("itemCatDescArray",itemCatDescArray);*/
        mv.addObject("itemCatId",itemCatId);
        mv.addObject("itemCatDescs",itemCatDescs);
        mv.addObject("itemName",itemName);

        return mv;

}

}
