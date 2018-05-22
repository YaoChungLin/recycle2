package com.recycle.manage.controller;

import com.recycle.common.EasyUIResult;
import com.recycle.manage.pojo.ItemCatDesc;
import com.recycle.manage.service.ItemCatDescService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@RequestMapping("itemcatdesc")
@Controller
public class ItemCatDescController {

    @Autowired
    private ItemCatDescService itemCatDescService;

    /**
     * 新增内容
     * 
     * @param
     * @return
     */
    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity<Void> saveItemCatDesc(ItemCatDesc itemCatDesc) {
        try {
            itemCatDesc.setId(null);
            this.itemCatDescService.save(itemCatDesc);
            return ResponseEntity.status(HttpStatus.CREATED).build();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
    }

    /**
     *  根据内容分类id查询分类列表
     *  
     * @param categoryId
     * @param page
     * @param rows
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<EasyUIResult> queryListByCatId(@RequestParam("cat_id") Long catId,
                                                              @RequestParam(value = "page", defaultValue = "1") Integer page,
                                                              @RequestParam(value = "rows", defaultValue = "10") Integer rows) {
        try {
            EasyUIResult easyUIResult = this.itemCatDescService.queryListByCatId(catId,page,rows);
            return ResponseEntity.ok(easyUIResult);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
    }

    /**
     * 修改内容
     * @param
     * @return
     */
    @RequestMapping(value = "edit",method=RequestMethod.POST)
    public ResponseEntity<Void> updateItemCatDesc(ItemCatDesc itemCatDesc){
        try {
            if(StringUtils.isEmpty(itemCatDesc.getVersion())){
                //参数有误，400
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
            }
            Boolean bool=this.itemCatDescService.updateItemCatDesc(itemCatDesc);
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


    @RequestMapping(value="delete",method=RequestMethod.POST)
    public ResponseEntity<Void> deleteItemCatDesc(@RequestParam("ids") Long ids){
        try {
            if(ids==null){
                //参数有误，400
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
            }
            Boolean bool = this.itemCatDescService.deleteItemCatDesc(ids);
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

}
