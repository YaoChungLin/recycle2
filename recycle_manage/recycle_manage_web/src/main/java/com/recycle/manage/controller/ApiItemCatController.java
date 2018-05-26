package com.recycle.manage.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.recycle.common.ItemCatResult;
import com.recycle.manage.service.ApiItemCatService;
import org.springframework.web.bind.annotation.ResponseBody;


@RequestMapping("api/item/cat")
@Controller
public class ApiItemCatController {

    @Autowired
    private ApiItemCatService apiItemCatService;

    private static final ObjectMapper MAPPER=new ObjectMapper();

    
    /*
     * 对外提供接口查询商品类目数据
     */
    @RequestMapping(method=RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<String> queryItemCat(){
        try {
            ItemCatResult itemCatResult=this.apiItemCatService.queryAllToTree();
            //对象转换为json字符串
            String itemCatResultString= MAPPER.writeValueAsString(itemCatResult);
            return ResponseEntity.ok(itemCatResultString);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
    }
}
