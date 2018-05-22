<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="easyui-panel" title="Nested Panel" data-options="width:'100%',minHeight:500,noheader:true,border:false" style="padding:10px;">
    <div class="easyui-layout" data-options="fit:true">
        <div data-options="region:'west',split:false" style="width:250px;padding:5px">
            <ul id="itemCategoryTree" class="easyui-tree" data-options="url:'/rest/item/cat',animate: true,method : 'GET'">
            </ul>
        </div>
        <div data-options="region:'center'" style="padding:5px">
            <table class="easyui-datagrid" id="itemList" data-options="toolbar:itemListToolbar,singleSelect:false,collapsible:true,pagination:true,method:'get',pageSize:20,url:'/rest/itemcatdesc',queryParams:{cat_id:0}">
		    <thead>
		        <tr>
		            <th data-options="field:'id',width:30">ID</th>
		            <th data-options="field:'version',width:120">版本</th>
		            <th data-options="field:'price',width:120">原始价格</th>
		            <th data-options="field:'created',width:130,align:'center',formatter:TAOTAO.formatDateTime">创建日期</th>
		            <th data-options="field:'updated',width:130,align:'center',formatter:TAOTAO.formatDateTime">更新日期</th>
		        </tr>
		    </thead>
		</table>
        </div>
    </div>
</div>
<script type="text/javascript">
$(function(){
	var tree = $("#itemCategoryTree");
	var datagrid = $("#itemList");
	tree.tree({
		onClick : function(node){
			if(tree.tree("isLeaf",node.target)){
				datagrid.datagrid('reload', {
					cat_id :node.id
		        });
			}
		}
	});
});
var itemListToolbar = [{
    text:'新增',
    iconCls:'icon-add',
    handler:function(){
    	var node = $("#itemCategoryTree").tree("getSelected");
    	if(!node || !$("#itemCategoryTree").tree("isLeaf",node.target)){
    		$.messager.alert('提示','新增内容必须选择一个内容分类!');
    		return ;
    	}
    	TT.createWindow({
			url : ""
		}); 
    }
},{
    text:'编辑',
    iconCls:'icon-edit',
    handler:function(){
    	var ids = TT.getSelectionsIds("#itemList");
    	if(ids.length == 0){
    		$.messager.alert('提示','必须选择一个内容才能编辑!');
    		return ;
    	}
    	if(ids.indexOf(',') > 0){
    		$.messager.alert('提示','只能选择一个内容!');
    		return ;
    	}
		TT.createWindow({
			url : "",
			onLoad : function(){
				var data = $("#itemList").datagrid("getSelections")[0];
				$("#itemEditForm").form("load",data);
				
				// 实现图片
				if(data.pic){
					$("#itemEditForm [name=pic]").after("<a href='"+data.pic+"' target='_blank'><img src='"+data.pic+"' width='80' height='50'/></a>");
				}
				
				itemEditEditor.html(data.item);
			}
		});
    }
},{
    text:'删除',
    iconCls:'icon-cancel',
    handler:function(){
    	var ids = TT.getSelectionsIds("#itemList");
    	if(ids.length == 0){
    		$.messager.alert('提示','未选中商品!');
    		return ;
    	}
    	$.messager.confirm('确认','确定删除ID为 '+ids+' 的内容吗？',function(r){
    	    if (r){
                var params = {"ids":ids};
                $.ajax({
                    type: "POST",
                    url: "",
                    data: params,
                    statusCode:{
                        201:function(){
                            $.messager.alert('提示','删除用户成功!','info',function(){
                                $("#itemList").datagrid("reload");
                            });
                        },
                        500:function(){
                            $.messager.alert('提示','删除用户失败!');
                        },
                        400:function(){
                            $.messager.alert('提示','参数有误，请检查后提交!');
                        }
                    }

                });
    	    }
    	});
    }
}];
</script>