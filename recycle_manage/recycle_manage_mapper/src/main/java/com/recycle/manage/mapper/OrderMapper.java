package com.recycle.manage.mapper;

import com.github.abel533.mapper.Mapper;
import com.recycle.manage.pojo.Order;

import java.util.List;


public interface OrderMapper extends Mapper<Order> {

    /**
     * 根据item_cat查询订单列表，并且按照更新时间倒序排序
     *
     * @return
     */
    public List<Order> queryOrderList(Long item_cat);
}
