package com.recycle.manage.controller;

import com.recycle.common.EasyUIResult;
import com.recycle.common.utils.CookieUtils;
import com.recycle.manage.pojo.User;
import com.recycle.manage.service.UserManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@RequestMapping("user")
@Controller
public class UserManageController {
    
    @Autowired
    private UserManageService userManageService;

    private static final String COOKIE_NAME = "TT_TOKEN";

    /**
     * 检查用户，电话，邮箱是否可用
     */
    @RequestMapping(value="{param}/{type}",method=RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<Boolean> check(@PathVariable("param") String param,
                                         @PathVariable("type") Integer type){
        try {
            Boolean bool=this.userManageService.check(param,type);
            if(null==bool) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
            }
            return ResponseEntity.ok(bool);
        } catch (Exception e) {
            // TODO: handle exception
        }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
    }



    /**
     * 根据token查询用户信息
     *
     * @param token
     * @return
     *//*
    @RequestMapping(value = "{token}", method = RequestMethod.GET)
    public ResponseEntity<User> queryUserByToken(@PathVariable("token") String token) {
        try {
            User user = this.userManageService.queryUserByToken(token);
            if (null == user) {
                // 资源不存在
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
            }
            return ResponseEntity.ok(user);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);

    }*/

    /**
     * 查询用户（分页）
     */
    @RequestMapping(method=RequestMethod.GET)
    public ResponseEntity<EasyUIResult> queryUserList(
            @RequestParam(value="page",defaultValue="1") Integer page,
            @RequestParam(value="rows",defaultValue="30")Integer rows){
        try {
            return ResponseEntity.ok(this.userManageService.queryUserList(page, rows));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
    }

    /**
     * 登录
     *
     * @param
     * @return
     */
      @RequestMapping(value = "doLogin", method = RequestMethod.POST)
        public String doLogin(String login_phone,String login_password, HttpServletRequest request, HttpServletResponse response) throws Exception {
            try {
                String token = this.userManageService.doLogin(login_phone, login_password);
                if (StringUtils.isEmpty(token)) {
                    //账号/密码错误
                    return "loginAndRegister";
                }
                //登录成功
                CookieUtils.setCookie(request, response, COOKIE_NAME, token);
                return "indexFirst";
            } catch (Exception e) {
                e.printStackTrace();
            }
                //服务器出错
                return "failure";
        }

   /* @RequestMapping(value = "doLogin", method = RequestMethod.POST)
    public ResponseEntity<Void> doLogin(@RequestBody User user, HttpServletRequest request, HttpServletResponse response) {
        try {
            String token = this.userManageService.doLogin(user.getPhone(), user.getPassword());
            if (StringUtils.isEmpty(token)) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
            }

            CookieUtils.setCookie(request, response, COOKIE_NAME, token);
            return ResponseEntity.status(HttpStatus.CREATED).build();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
    }*/


    /**
     * 新增用户
     */
    @RequestMapping( value = "doRegister",method=RequestMethod.POST)
    public String registerUser( User user){
        try {
            if(StringUtils.isEmpty(user.getUsername())){
                //参数有误，400
                return "failure";
            }
            Boolean bool=this.userManageService.saveUser(user);
            if(!bool){
                //保存失败
                return "failure";
            }
                return "loginAndRegister";
        } catch (Exception e) {
            e.printStackTrace();
        }
        //服务器出错
       return "failure";
    }

    @RequestMapping( value = "saveuser",method=RequestMethod.POST)
    public ResponseEntity<Void> saveUser( User user){
        try {
            if(StringUtils.isEmpty(user.getUsername())){
                //参数有误，400
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
            }
            Boolean bool=this.userManageService.saveUser(user);
            if(!bool){
                //保存失败
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
            }
            return ResponseEntity.status(HttpStatus.CREATED).build();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
    }


    /**
     * 修改用户信息
     */
    @RequestMapping(method=RequestMethod.PUT)
    public ResponseEntity<Void> updateUser(User user){
        try {
            if(StringUtils.isEmpty(user.getId())){
                //参数有误，400
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
            }
            Boolean bool=this.userManageService.updateUser(user);
            if (!bool){
                //修改失败
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
            }
            return ResponseEntity.status(HttpStatus.CREATED).build();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
    }
    
    /**
     * 删除用户
     */
    @RequestMapping(value="delete",method=RequestMethod.POST)
    public ResponseEntity<Void> deleteUser(@RequestParam("ids") Long ids){
        try {
            if(ids==null){
                //参数有误，400
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
            }
            Boolean bool = this.userManageService.deleteUser(ids);
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
     * 拉黑用户
     */
    @RequestMapping(value="remove",method=RequestMethod.POST)
    public ResponseEntity<Void> removeUser(@RequestParam("ids") Long ids){
        try {
            if(ids==null){
                //参数有误，400
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
            }
            Boolean bool = this.userManageService.removeUser(ids);
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
    
    /**
     * 加入白名单
     */
    @RequestMapping(value="reshelf",method=RequestMethod.POST)
    public ResponseEntity<Void> reshelfUser(@RequestParam("ids") Long ids){
        try {
            if(ids==null){
                //参数有误，400
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
            }
            Boolean bool = this.userManageService.reshelfUser(ids);
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

    /**
     * 设置管理员
     */
    @RequestMapping(value="setmanager",method=RequestMethod.POST)
    public ResponseEntity<Void> setManager(@RequestParam("ids") Long ids){
        try {
            if(ids==null){
                //参数有误，400
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
            }
            Boolean bool = this.userManageService.setManager(ids);
            if(!bool){
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
