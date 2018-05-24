package com.recycle.manage.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.recycle.common.utils.CookieUtils;
import com.recycle.manage.pojo.User;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


public class UserLoginHandlerInterceptor implements HandlerInterceptor {

    public static final String COOKIE_NAME = "TT_TOKEN";

    @Autowired
    private UserManageService userManageService;


    /**
     * 根据token查询用户信息
     *
     * @param token
     * @return
     */
    public User queryUserByToken(String token) {
        try {
            User user = this.userManageService.queryUserByToken(token);
            if (null == user) {
                // 资源不存在
                return null;
            }
            return user;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;

    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {


        UserThreadLocal.set(null);//清空本地线程中的User对象数据
        String loginUrl = "/rest/page/loginAndRegister";
        String token = CookieUtils.getCookieValue(request, COOKIE_NAME);

        if (StringUtils.isEmpty(token)) {
            // 未登录，跳转到登录页面
            response.sendRedirect(loginUrl);
            return false;
        }


        User user = this.queryUserByToken(token);

        if (null == user) {
            // 登录超时，跳转到登录页面
            response.sendRedirect(loginUrl);
            return false;
        }
        UserThreadLocal.set(user);//将user对象放置再本地线程中，方便在controller和Service中获取
        // 登录成功
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
            Exception ex) throws Exception {
       
    }

}
