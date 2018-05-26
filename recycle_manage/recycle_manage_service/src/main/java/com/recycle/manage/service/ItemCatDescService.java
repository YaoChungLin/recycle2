package com.recycle.manage.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.recycle.common.EasyUIResult;
import com.recycle.manage.mapper.ItemCatDescMapper;
import com.recycle.manage.pojo.ItemCatDesc;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ItemCatDescService extends BaseService<ItemCatDesc> {

    @Autowired
    private ItemCatDescMapper itemCatDescMapper;

    /**
     * 根据catid分页查询
     */
    public EasyUIResult queryListByCatId(Long cat_id, Integer page, Integer rows) {
        PageHelper.startPage(page, rows);
        List<ItemCatDesc> list = this.itemCatDescMapper.queryItemCatDescList(cat_id);
        PageInfo<ItemCatDesc> pageInfo = new PageInfo<ItemCatDesc>(list);
        return new EasyUIResult(pageInfo.getTotal(), pageInfo.getList());
    }

    /**
     * 根据catid查询
     * @param cat_id
     * @return
     */
    public List<ItemCatDesc> queryListByCatId(Long cat_id) {
        return this.itemCatDescMapper.queryItemCatDescList(cat_id);
    }

    /*
     * 修改内容
     */
    public Boolean updateItemCatDesc(ItemCatDesc itemCatDesc){
        return super.updateSelective(itemCatDesc)==1;
    }


    /*
     * 删除内容
     */
    public Boolean deleteItemCatDesc(Long ids){
        return this.deleteById(ids)==1;
    }

}
