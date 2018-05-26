package com.recycle.manage.mapper;

import com.github.abel533.mapper.Mapper;
import com.recycle.manage.pojo.ItemCatDesc;

import java.util.List;


public interface ItemCatDescMapper extends Mapper<ItemCatDesc> {

    /**
     * 根据cat_id查询产品详细列表
     * 
     * @return
     */
    public List<ItemCatDesc> queryItemCatDescList(Long cat_id);

}
