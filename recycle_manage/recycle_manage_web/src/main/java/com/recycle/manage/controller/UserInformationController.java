package com.recycle.manage.controller;

import com.recycle.common.utils.CookieUtils;
import com.recycle.manage.pojo.Order;
import com.recycle.manage.pojo.User;
import com.recycle.manage.service.OrderManageService;
import com.recycle.manage.service.UserManageService;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;


@RequestMapping("UserInformation")
@Controller
public class UserInformationController {

    @Autowired
    private UserManageService userManageService;

    @Autowired
    private OrderManageService orderManageService;

    @Autowired
    private UserManageController userManageController;


    public static final String COOKIE_NAME = "TT_TOKEN";
    /**
     * 查询用户信息和该用户的订单信息
     * @param username
     * @return
     */
    @RequestMapping(value = "/query/{username}",method = RequestMethod.GET)
    public ModelAndView queryUserInfoAndOrderInfoByUsername(@PathVariable(value = "username") String username){
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

    /**
     * 编辑用户信息（回显数据)
     * @param username
     * @return
     */
    @RequestMapping(value = "/edit/{username}",method = RequestMethod.GET)
    public ModelAndView queryUserInfoByUsername(@PathVariable(value = "username") String username){
        ModelAndView mv=new ModelAndView("EditInfo");
        User user=new User();
        user.setUsername(username);

        User queryUser = this.userManageService.queryOne(user);
        mv.addObject("user",queryUser);

        return mv;

    }

    /**
     * 编辑用户密码（回显数据)
     * @param username
     * @return
     */
    @RequestMapping(value = "/editPassword/{username}",method = RequestMethod.GET)
    public ModelAndView queryUserPasswordByUsername(@PathVariable(value = "username") String username){
        ModelAndView mv=new ModelAndView("EditPassword");
        User user=new User();
        user.setUsername(username);
        User queryUser = this.userManageService.queryOne(user);
        mv.addObject("user",queryUser);
        return mv;

    }

    /**
     * 修改用户信息
     */
    @RequestMapping(value = "update",method = RequestMethod.POST)
    public ModelAndView updateUserInfo(String phone,String email,HttpServletRequest request){
        ModelAndView succeedmv=new ModelAndView("succeed");
        ModelAndView failmv=new ModelAndView("failed");
        try {
            String token = CookieUtils.getCookieValue(request, COOKIE_NAME);
            User user = this.userManageService.queryUserByToken(token);
            user.setPhone(phone);
            user.setEmail(email);

            Boolean bool = this.userManageService.updateUser(user);
            if (!bool) {
                failmv.addObject("msg","修改出错！!!请稍后再试");
                return failmv;
            }
            succeedmv.addObject("msg","修改");
            return succeedmv;

        } catch (Exception e) {
            e.printStackTrace();
        }
        //服务器出错
        failmv.addObject("msg","服务出错！请稍后再试！");
        return failmv;
    }

    /**
     * 检查用户旧密码
     */
    @RequestMapping(value = "checkPass",method = RequestMethod.POST)
    public ResponseEntity<Void> checkPass(@RequestBody User user,HttpServletRequest request){
        try {
            String token = CookieUtils.getCookieValue(request, COOKIE_NAME);
            User user2 = this.userManageService.queryUserByToken(token);
            boolean bool = StringUtils.equals(DigestUtils.md5Hex(user.getPassword()), user2.getPassword());
            if (bool) {
                return ResponseEntity.status(HttpStatus.CREATED).build();
            }else {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
    }

    /**
     * 修改用户密码
     */
    @RequestMapping(value = "updatePass",method = RequestMethod.POST)
    public ModelAndView updateUserPass(String password,HttpServletRequest request,HttpServletResponse response){
        ModelAndView succeedmv=new ModelAndView("succeed");
        ModelAndView failmv=new ModelAndView("failed");
        try {
            String token = CookieUtils.getCookieValue(request, COOKIE_NAME);
            User user = this.userManageService.queryUserByToken(token);
            user.setPassword(DigestUtils.md5Hex(password));

            Boolean bool = this.userManageService.updateUser(user);
            if (!bool) {
                failmv.addObject("msg","修改出错！!!请稍后再试");
                return failmv;
            }
            this.userManageController.doLogout(request,response,user);
            succeedmv.addObject("msg","修改");
            return succeedmv;

        } catch (Exception e) {
            e.printStackTrace();
        }
        //服务器出错
        failmv.addObject("msg","服务出错！请稍后再试！");
        return failmv;
    }
}
