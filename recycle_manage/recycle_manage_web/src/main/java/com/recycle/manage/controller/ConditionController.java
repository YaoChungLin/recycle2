package com.recycle.manage.controller;

import com.recycle.manage.pojo.Condition;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("condition")
@Controller
public class ConditionController {

    @RequestMapping(value = "evaluate",method = RequestMethod.POST)
    public ResponseEntity<Float> evaluate(@RequestBody Condition condition){
        try {
            //初始化评估价
            Float evaluatePrice=new Float(0);
            //获取初始价格和各种情况的百分比
            float startPrice = Float.parseFloat(condition.getStartPrice());
            float border = Float.parseFloat(condition.getBorder())/100;
            float face= Float.parseFloat(condition.getFace())/100;
            float screen = Float.parseFloat(condition.getScreen())/100;
            float services = Float.parseFloat(condition.getServices())/100;
            //计算评估价
            evaluatePrice=startPrice*border*face*screen*services;
            //保留两位小数
            evaluatePrice=(float)(Math.round(evaluatePrice*100))/100;


            if (evaluatePrice==0) {//评估价为0，参数出错
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
            }
            return ResponseEntity.ok(evaluatePrice);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
    }
}
