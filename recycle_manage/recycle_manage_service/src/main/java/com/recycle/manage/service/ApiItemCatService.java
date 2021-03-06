package com.recycle.manage.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.recycle.common.ItemCatData;
import com.recycle.common.ItemCatResult;
import com.recycle.common.service.RedisService;
import com.recycle.manage.pojo.ItemCat;


@Service
public class ApiItemCatService extends BaseService<ItemCat>{
    
    @Autowired
    private RedisService redisService;
    
    private static final ObjectMapper MAPPER=new ObjectMapper();
    
    private static final String REDIS_KEY="RECYCLE_MANAGE_TIME_CAT_API";
    private static final Integer REDIS_TIME=60*60*24*30*3;
    
    /*
     * 全部查询，并且生成树状结构
     */
    
    public ItemCatResult queryAllToTree(){
        ItemCatResult result=new ItemCatResult();
        
        try {
            //先 从缓存中命中，如果命中的话返回，没有命中，程序继续执行
            String cacheDate=this.redisService.get(REDIS_KEY);
            if(StringUtils.isNotEmpty(cacheDate)){
                //命中
                return MAPPER.readValue(cacheDate, ItemCatResult.class);
            }
        } catch (Exception e) {
            e.printStackTrace();        }
        
        // 全部查出，并且在内存中生成树形结构
        List<ItemCat> cats = super.queryAll();

        // 转为map存储，key为父节点ID，value为数据集合
        Map<Long, List<ItemCat>> itemCatMap = new HashMap<Long, List<ItemCat>>();
        for (ItemCat itemCat : cats) {
            if (!itemCatMap.containsKey(itemCat.getParentId())) {
                itemCatMap.put(itemCat.getParentId(), new ArrayList<ItemCat>());
            }
            itemCatMap.get(itemCat.getParentId()).add(itemCat);
        }

        // 封装一级对象
        List<ItemCat> itemCatList1 = itemCatMap.get(0L);
        for (ItemCat itemCat : itemCatList1) {
            ItemCatData itemCatData = new ItemCatData();
            itemCatData.setUrl("/rest/products/" + itemCat.getId() + ".html");
        /*    itemCatData.setName("<a href='" + itemCatData.getUrl() + "'>" + itemCat.getName() + "</a>");*/
            itemCatData.setName( itemCat.getName());
            result.getItemCats().add(itemCatData);
            if (!itemCat.getIsParent()) {
                continue;
            }

            // 封装二级对象
            List<ItemCat> itemCatList2 = itemCatMap.get(itemCat.getId());
            List<ItemCatData> itemCatData2 = new ArrayList<ItemCatData>();
            itemCatData.setItems(itemCatData2);
            for (ItemCat itemCat2 : itemCatList2) {
                ItemCatData id2 = new ItemCatData();
                id2.setName(itemCat2.getName());
                id2.setUrl("/rest/products/" + itemCat2.getId() + ".html");
                itemCatData2.add(id2);
                if (itemCat2.getIsParent()) {
                    // 封装三级对象
                    List<ItemCat> itemCatList3 = itemCatMap.get(itemCat2.getId());
                    List<String> itemCatData3 = new ArrayList<String>();
                    id2.setItems(itemCatData3);
                    for (ItemCat itemCat3 : itemCatList3) {
                        itemCatData3.add("/rest/products/" + itemCat3.getId() + ".html|" + itemCat3.getName());
                    }
                }
            }
            if (result.getItemCats().size() >= 14) {
                break;
            }
        }
        
        try {
            //将数据库查询结果写入到缓存中
            this.redisService.set(REDIS_KEY, MAPPER.writeValueAsString(result),REDIS_TIME);
        } catch (Exception e) {
           e.printStackTrace();
        }
        
        return result;
        
        
    }

   

}
