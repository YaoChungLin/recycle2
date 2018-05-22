package com.recycle.manage.service;

import com.recycle.manage.pojo.ItemCat;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


@Service
public class ItemCatService extends BaseService<ItemCat> {

    public void saveItemCat(ItemCat itemCat) {
        itemCat.setId(null);
        itemCat.setIsParent(false);
        itemCat.setSortOrder(1);
        itemCat.setStatus(1);
        super.save(itemCat);

        // 判断该节点的父节点的isParent是否为true，不是，需要修改为true
        ItemCat parent = super.queryById(itemCat.getParentId());
        if (!parent.getIsParent()) {
            parent.setIsParent(true);
            super.update(parent);
        }
    }

    public void deleteAll(ItemCat itemCat) {
        List<Object> ids = new ArrayList<Object>();
        ids.add(itemCat.getId());

        // 递归查找该节点下的所有子节点id
        this.findAllSubNode(ids, itemCat.getId());

        super.deleteByIds(ids, ItemCat.class, "id");

        // 判断该节点是否还有兄弟节点，如果没有，修改父节点的isParent为false
        ItemCat record = new ItemCat();
        record.setParentId(itemCat.getParentId());
        List<ItemCat> list = super.queryListByWhere(record);
        if (null == list || list.isEmpty()) {
            ItemCat parent = new ItemCat();
            parent.setId(itemCat.getParentId());
            parent.setIsParent(false);
            super.updateSelective(parent);
        }
    }

    private void findAllSubNode(List<Object> ids, Long pid) {
        ItemCat record = new ItemCat();
        record.setParentId(pid);
        List<ItemCat> list = super.queryListByWhere(record);
        for (ItemCat itemCat : list) {
            ids.add(itemCat.getId());
            // 判断该节点是否为父节点，如果是，继续调用该方法查找子节点
            if (itemCat.getIsParent()) {
                // 开始递归
                findAllSubNode(ids, itemCat.getId());
            }
        }
    }

}
