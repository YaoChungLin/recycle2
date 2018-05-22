package com.recycle.manage.controller;

import com.recycle.common.EasyUIResult;
import com.recycle.manage.pojo.Content;
import com.recycle.manage.service.ContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@RequestMapping("content")
@Controller
public class ContentController {

    @Autowired
    private ContentService contentService;

    /**
     * 新增内容
     * 
     * @param content
     * @return
     */
    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity<Void> saveContent(Content content) {
        try {
            content.setId(null);
            this.contentService.save(content);
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
    public ResponseEntity<EasyUIResult> queryListByCategoryId(@RequestParam("categoryId") Long categoryId,
                                                              @RequestParam(value = "page", defaultValue = "1") Integer page,
                                                              @RequestParam(value = "rows", defaultValue = "10") Integer rows) {
        try {
            EasyUIResult easyUIResult = this.contentService.queryListByCategoryId(categoryId, page, rows);
            return ResponseEntity.ok(easyUIResult);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
    }

    /**
     * 修改内容
     * @param content
     * @return
     */
    @RequestMapping(value = "edit",method=RequestMethod.POST)
    public ResponseEntity<Void> updateContent(Content content){
        try {
            if(StringUtils.isEmpty(content.getTitle())){
                //参数有误，400
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
            }
            Boolean bool=this.contentService.updateContent(content);
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

    /*
     * 删除用户
     */
    @RequestMapping(value="delete",method=RequestMethod.POST)
    public ResponseEntity<Void> deleteUser(@RequestParam("ids") Long[] ids){
        try {
            if(ids==null){
                //参数有误，400
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
            }
            this.contentService.deleteContent(ids);
           /* Boolean bool = this.contentService.deleteContent(ids);
            if (!bool){
                //删除失败
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
            }*/
            return ResponseEntity.status(HttpStatus.CREATED).build();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
    }

}
