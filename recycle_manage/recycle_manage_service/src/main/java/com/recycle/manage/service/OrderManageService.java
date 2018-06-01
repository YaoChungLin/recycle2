package com.recycle.manage.service;


import com.github.abel533.entity.Example;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import com.recycle.common.EasyUIResult;
import com.recycle.manage.mapper.OrderMapper;
import com.recycle.manage.pojo.ItemCat;
import com.recycle.manage.pojo.Order;
import com.recycle.manage.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;


@Service
public class OrderManageService extends BaseService<Order>{
        
    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private ItemCatService itemCatService;

    /**
     * 添加订单（下单）
     */

    public Boolean saveOrder(Order order,User user){

        order.setId(null);
        order.setStatus("已提交");
        order.setUser_id(user.getId());
        order.setUser_name(user.getUsername());
        //生成订单ID，规则：userid+当前时间戳
        order.setOrder_id(order.getUser_id()+""+System.currentTimeMillis());
        ItemCat itemCat = this.itemCatService.queryById(order.getItem_cat());
        order.setItem_image(itemCat.getImage());
        return super.save(order)==1;

    }

    /**
     * 根据内容分类id查询分类列表
     * @param item_cat
     * @param page
     * @param rows
     * @return
     */
    public EasyUIResult queryListByItemCat(Long item_cat, Integer page, Integer rows) {
        PageHelper.startPage(page, rows);
        List<Order> list = this.orderMapper.queryOrderList(item_cat);
        PageInfo<Order> pageInfo = new PageInfo<Order>(list);
        return new EasyUIResult(pageInfo.getTotal(), pageInfo.getList());
    }


    /**
     *
     * 查询订单（分页）
     */
    public EasyUIResult queryOrderList(Integer page, Integer rows){
        //设置分页参数
        PageHelper.startPage(page,rows);
        
        Example example=new Example(User.class);

        List<Order> orders = this.orderMapper.selectByExample(example);
        
        PageInfo<Order> pageInfo=new PageInfo<Order>(orders);
        
        return new EasyUIResult(pageInfo.getTotal(),pageInfo.getList());
    }


    
    /**
     * 删除订单
     */
    public Boolean deleteOrder(Long ids){
        return this.deleteById(ids)==1;
    }



    /**
     * 改变订单状态值（1——交易成功；0——交易取消；2——已取件；3——寄件中；4——核实中；5——已付款；6——已提交）
     */
    public Boolean removeOrder(Long ids,String param){
        Order order=this.queryById(ids);
        order.setStatus(param);
        return this.orderMapper.updateByPrimaryKey(order)==1;
    }
}
