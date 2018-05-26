package com.recycle.manage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.recycle.common.ItemCatResult;
import com.recycle.manage.service.ApiItemCatService;


@RequestMapping("api/item/cat")
@Controller
public class ApiItemCatController {

    @Autowired
    private ApiItemCatService apiItemCatController;

    
    /*
     * 对外提供接口查询商品类目数据
     */
    @RequestMapping(method=RequestMethod.GET)
    public ResponseEntity<ItemCatResult> queryItemCat(){
        try {
            System.out.print("ffff");
            ItemCatResult itemCatResult=this.apiItemCatController.queryAllToTree();
            return ResponseEntity.ok(itemCatResult);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
    }
}
