package com.recycle.manage.service;

import java.util.List;

import com.recycle.common.EasyUIResult;
import com.recycle.manage.mapper.ContentMapper;
import com.recycle.manage.pojo.Content;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class ContentService extends BaseService<Content> {

    @Autowired
    private ContentMapper contentMapper;

    public EasyUIResult queryListByCategoryId(Long categoryId, Integer page, Integer rows) {
        PageHelper.startPage(page, rows);
        List<Content> list = this.contentMapper.queryContentList(categoryId);
        PageInfo<Content> pageInfo = new PageInfo<Content>(list);
        return new EasyUIResult(pageInfo.getTotal(), pageInfo.getList());
    }

    /*
     * 修改内容
     */
    public Boolean updateContent(Content content){
        return super.updateSelective(content)==1;
    }


    /*
     * 删除内容
     */
    public void deleteContent(Long [] ids){
        for(int i=0;i<ids.length;i++){
            this.deleteById(ids[i]);
        }
    }

}
