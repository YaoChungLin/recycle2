package com.recycle.manage.controller;

import com.recycle.common.EasyUIResult;
import com.recycle.common.utils.CookieUtils;
import com.recycle.manage.pojo.Order;
import com.recycle.manage.pojo.User;
import com.recycle.manage.service.OrderManageService;
import com.recycle.manage.service.UserManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;


@RequestMapping("order")
@Controller
public class OrderManageController {
    
    @Autowired
    private OrderManageService orderManageService;

    @Autowired
    private UserManageService userManageService;

    public static final String COOKIE_NAME = "TT_TOKEN";

    /**
     * 添加订单（下单）
     */
    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity<Void> addOrder(@RequestBody Order order,HttpServletRequest request){
        try {
            String token = CookieUtils.getCookieValue(request, COOKIE_NAME);
            User user = this.userManageService.queryUserByToken(token);

            Boolean bool=this.orderManageService.saveOrder(order,user);
            if (!bool) {//评估价为0，参数出错
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
            }
            return ResponseEntity.status(HttpStatus.CREATED).build();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
    }

    /**
     *  根据内容分类id查询分类列表
     *
     * @param
     * @param page
     * @param rows
     * @return
     */
    @RequestMapping(value = "catlist",method = RequestMethod.GET)
    public ResponseEntity<EasyUIResult> queryListByItemCat(@RequestParam("item_cat") Long item_cat,
                                                              @RequestParam(value = "page", defaultValue = "1") Integer page,
                                                              @RequestParam(value = "rows", defaultValue = "10") Integer rows) {
        try {
            EasyUIResult easyUIResult = this.orderManageService.queryListByItemCat(item_cat, page, rows);
            return ResponseEntity.ok(easyUIResult);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
    }


    /**
     * 查询订单（分页）
     */
    @RequestMapping(method=RequestMethod.GET)
    public ResponseEntity<EasyUIResult> queryOrderList(
            @RequestParam(value="page",defaultValue="1") Integer page,
            @RequestParam(value="rows",defaultValue="30")Integer rows){
        try {
            return ResponseEntity.ok(this.orderManageService.queryOrderList(page, rows));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
    }


    /**
     * 删除订单
     */
    @RequestMapping(value="delete",method=RequestMethod.POST)
    public ResponseEntity<Void> deleteOrder(@RequestParam("ids") Long ids){
        try {
            if(ids==null){
                //参数有误，400
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
            }
            Boolean bool = this.orderManageService.deleteOrder(ids);
            if (!bool){
                //删除失败
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
            }
            return ResponseEntity.status(HttpStatus.CREATED).build();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
    }

    /**
     * 改变订单状态值（1——交易成功；0——交易取消；2——已取件；3——核实中；4——已付款；5——已提交）
     * @param ids
     * @return
     */
    @RequestMapping(value="changeStatus",method= RequestMethod.POST)
    public ResponseEntity<Void> removeOrder(@RequestParam("ids") Long ids ,@RequestParam("param") Integer param){
        try {
            if(ids==null){
                //参数有误，400
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
            }
            Boolean bool = this.orderManageService.removeOrder(ids,param);
            if (!bool){
                //失败
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
            }
            return ResponseEntity.status(HttpStatus.CREATED).build();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
    }
    


}
