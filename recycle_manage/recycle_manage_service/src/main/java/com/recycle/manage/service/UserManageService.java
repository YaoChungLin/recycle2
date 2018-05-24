package com.recycle.manage.service;

import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.recycle.common.EasyUIResult;
import com.recycle.common.service.RedisService;
import com.recycle.manage.mapper.UserMapper;
import com.recycle.manage.pojo.User;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.abel533.entity.Example;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;



@Service
public class UserManageService extends BaseService<User>{
        
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private RedisService redisService;

    private static final ObjectMapper MAPPER = new ObjectMapper();

    private static final Integer REDIS_TIME = 60 * 30;

    /**
     * 检查用户名，手机号以及邮箱是否重复
     */
    public Boolean check(String param, Integer type) {
        User record=new User();
        switch (type) {
            case 1:
                record.setUsername(param);
                break;
            case 2:
                record.setPhone(param);
                break;
            case 3:
                record.setEmail(param);
                break;

            default:
                return null;
        }
        return this.userMapper.selectOne(record)==null;
    }

    /**
     * 登录
     * @param phone
     * @param password
     * @return
     * @throws Exception
     */
    public String doLogin(String phone, String password) throws Exception {

        User record = new User();
        record.setPhone(phone);
        User user = this.userMapper.selectOne(record);
        if (null == user) {
            // 用户不存在
            return null;
        }

        if (!StringUtils.equals(DigestUtils.md5Hex(password),user.getPassword())) {
            // 密码错误
            return null;
        }

        // 登录成功，将用户的信息保存到Redis中
        String token = user.getUsername();
        /*String token = DigestUtils.md5Hex(user.getUsername()+ System.currentTimeMillis());*/

        this.redisService.set("TOKEN_" + token, MAPPER.writeValueAsString(user), REDIS_TIME);

        return token;
    }



    /**
     *
     * 查询用户（分页）
     */
    public EasyUIResult queryUserList(Integer page, Integer rows){
        //设置分页参数
        PageHelper.startPage(page,rows);
        
        Example example=new Example(User.class);

        List<User> users = this.userMapper.selectByExample(example);
        
        PageInfo<User> pageInfo=new PageInfo<User>(users);
        
        return new EasyUIResult(pageInfo.getTotal(),pageInfo.getList());
    }

    /**
     * 新增用户
     */
    public Boolean saveUser(User user){
        //初始值
        user.setId(null);
        user.setIsmanager(0);
        user.setStatus(1);
        user.setEmail(null);
        //密码加密处理，使用MD5
        user.setPassword(DigestUtils.md5Hex(user.getPassword()));
        return super.save(user)==1;
    }
    
    /**
     * 修改用户信息
     */
    public Boolean updateUser(User user){
        return super.updateSelective(user)==1;
    }
    
    
    /**
     * 删除用户
     */
    public Boolean deleteUser(Long ids){
        return this.deleteById(ids)==1;
    }
    
    /**
     * 拉黑用户
     */
    public Boolean removeUser(Long ids){
        User user = this.queryById(ids);
        user.setStatus(0);
        return  this.updateUser(user);
    }

    /**
     * 放入白名单
     */
    public Boolean reshelfUser(Long ids){
        User user = this.queryById(ids);
        user.setStatus(1);
        return this.updateUser(user);
    }

    /**
     * 设置管理员
     */
    public Boolean setManager(Long ids){
        User user = this.queryById(ids);
        if(user.getIsmanager()==1){
            user.setIsmanager(0);
        }else {
            user.setIsmanager(1);
        }
        return this.updateUser(user);
    }

    public User queryUserByToken(String token) {
        String key = "TOKEN_" + token;
        String jsonData = this.redisService.get(key);
        if (StringUtils.isEmpty(jsonData)) {
            // 登录超时
            return null;
        }

        //重新设置Redis中的生存时间
        this.redisService.expire(key, REDIS_TIME);

        try {
            return MAPPER.readValue(jsonData, User.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


}
