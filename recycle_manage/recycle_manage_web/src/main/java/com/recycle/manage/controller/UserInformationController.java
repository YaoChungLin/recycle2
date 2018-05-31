package com.recycle.manage.controller;

import com.recycle.manage.pojo.Order;
import com.recycle.manage.pojo.User;
import com.recycle.manage.service.ItemCatService;
import com.recycle.manage.service.OrderManageService;
import com.recycle.manage.service.UserManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@RequestMapping("UserInformation")
@Controller
public class UserInformationController {

    @Autowired
    private UserManageService userManageService;

    @Autowired
    private OrderManageService orderManageService;


    @RequestMapping(value = "/query/{username}",method = RequestMethod.GET)
    public ModelAndView queryUserInfoByUsername(@PathVariable(value = "username") String username){
        ModelAndView mv=new ModelAndView("UserInfo");
        User user=new User();
        user.setUsername(username);

        User queryUser = this.userManageService.queryOne(user);
        mv.addObject("user",queryUser);

        Order order=new Order();
        order.setUser_name(username);
        List<Order> orders = this.orderManageService.queryListByWhere(order);
        mv.addObject("orders",orders);

        return mv;

    }
}
