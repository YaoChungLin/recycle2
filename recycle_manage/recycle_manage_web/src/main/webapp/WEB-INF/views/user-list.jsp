<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<table class="easyui-datagrid" id="itemList" title="用户列表"
       data-options="singleSelect:false,collapsible:true,pagination:true,url:'/rest/user',method:'get',pageSize:30,toolbar:toolbar">
    <thead>
        <tr>
        	<th data-options="field:'ck',checkbox:true"></th>
        	<th data-options="field:'id',width:60">用户ID</th>
            <th data-options="field:'username',width:200">用户名</th>
            <th data-options="field:'password',width:100">密码</th>
            <th data-options="field:'phone',width:100">手机号</th>
            <th data-options="field:'email',width:70">邮箱</th>
            <th data-options="field:'ismanager',width:100,formatter:TAOTAO.formatIsManagerStatus">是否为管理员</th>
            <th data-options="field:'image',width:100,formatter:TAOTAO.formatUrl">头像</th>
            <th data-options="field:'status',width:60,align:'center',formatter:TAOTAO.formatItemStatus">状态</th>
            <th data-options="field:'created',width:130,align:'center',formatter:TAOTAO.formatDateTime">创建日期</th>
            <th data-options="field:'updated',width:130,align:'center',formatter:TAOTAO.formatDateTime">更新日期</th>
        </tr>
    </thead>
</table>
<div id="itemEditWindow" class="easyui-window" title="编辑用户" data-options="modal:true,closed:true,iconCls:'icon-save',href:'/rest/page/user-edit'" style="width:80%;height:80%;padding:10px;">
</div>
<script>

    function getSelectionsIds(){
    	var itemList = $("#itemList");
    	var sels = itemList.datagrid("getSelections");
    	var ids = [];
    	for(var i in sels){
    		ids.push(sels[i].id);
    	}
    	ids = ids.join(",");
    	return ids;
    }
    
    var toolbar = [{
        text:'新增',
        iconCls:'icon-add',
        handler:function(){
            $(".tree-title:contains('新增用户')").parent().click();
        }
    },{
        text:'编辑',
        iconCls:'icon-edit',
        handler:function(){
        	var ids = getSelectionsIds();
        	if(ids.length == 0){
        		$.messager.alert('提示','必须选择一个用户才能编辑!');
        		return ;
        	}
        	if(ids.indexOf(',') > 0){
        		$.messager.alert('提示','只能选择一个用户!');
        		return ;
        	}
        	
        	$("#itemEditWindow").window({
        		onLoad :function(){
        			//回显数据
        			var data = $("#itemList").datagrid("getSelections")[0];
        			$("#itemeEditForm").form("load",data);

        			TAOTAO.init({
        				"pics" : data.image,
        				fun:function(node){
        					TAOTAO.changeItemParam(node, "itemeEditForm");
        				}
        			});
        		}
        	}).window("open");
        }
    },{
        text:'删除',
        iconCls:'icon-cancel',
        handler:function(){
            var ids = getSelectionsIds();
            if(ids.length == 0){
                $.messager.alert('提示','未选中用户!');
                return ;
            }
            $.messager.confirm('确认','确定删除ID为 '+ids+' 的用户吗？',function(r){
                if (r){
                    var params = {"ids":ids};
                    $.ajax({
                        type: "POST",
                        url: "/rest/user/delete",
                        data: params,
                        statusCode:{
                            201:function(){
                                $.messager.alert('提示','删除用户成功!','info',function(){
                                    $("#itemEditWindow").window('close');
                                    $("#itemList").datagrid("reload");
                                });
                            },
                            500:function(){
                                $.messager.alert('提示','删除失败!');
                            },
                            400:function(){
                                $.messager.alert('提示','参数有误，请检查后提交!');
                            }
                        }

                    });
                }
            });
        }
    },'-',{
        text:'黑名单',
        iconCls:'icon-remove',
        handler:function(){
        	var ids = getSelectionsIds();
        	if(ids.length == 0){
        		$.messager.alert('提示','未选中用户!');
        		return ;
        	}
        	$.messager.confirm('确认','确定拉黑ID为 '+ids+' 的用户吗？',function(r){
        	    if (r){
        	    	var params = {"ids":ids};
        	    	$.ajax({
         	 		   type: "POST",
         	 		   url: "/rest/user/remove",
         	 		   data: params,
         	 		   statusCode:{
         	 			   201:function(){
         	 				    $.messager.alert('提示','用户拉黑成功!','info',function(){
         	 					$("#itemEditWindow").window('close');
         	 					$("#itemList").datagrid("reload");
         	 				    });
         	 			   },
         	 			   500:function(){
         	 				   $.messager.alert('提示','用户拉黑失败!');
         	 			   },
         	 			   400:function(){
         	 				   $.messager.alert('提示','参数有误，请检查后提交!');
         	 			   }
         	 		   }
         	 		  
         	 		});
        	    }
        	});
        }
    },{
        text:'恢复到白名单',
        iconCls:'icon-remove',
        handler:function(){
        	var ids = getSelectionsIds();
        	if(ids.length == 0){
        		$.messager.alert('提示','未选中用户!');
        		return ;
        	}
        	$.messager.confirm('确认','确定把ID为 '+ids+' 的用户拉进白名单吗？',function(r){
        	    if (r){
        	    	var params = {"ids":ids};
        	    	
        	    	$.ajax({
          	 		   type: "POST",
          	 		   url: "/rest/user/reshelf",
          	 		   data: params,
          	 		   statusCode:{
          	 			   201:function(){
          	 				    $.messager.alert('提示','用户已成功拉进白名单!','info',function(){
          	 					$("#itemEditWindow").window('close');
          	 					$("#itemList").datagrid("reload");
          	 				    });
          	 			   },
          	 			   500:function(){
          	 				   $.messager.alert('提示','用户拉进白名单失败!');
          	 			   },
          	 			   400:function(){
          	 				   $.messager.alert('提示','参数有误，请检查后提交!');
          	 			   }
          	 		   }
          	 		  
          	 		});
        	    }
        	});
        }
    },{
        text:'管理员',
        iconCls:'icon-remove',
        handler:function(){
            var ids = getSelectionsIds();
            if(ids.length == 0){
                $.messager.alert('提示','未选中用户!');
                return ;
            }

                    var params = {"ids":ids};

                    $.ajax({
                        type: "POST",
                        url: "/rest/user/setmanager",
                        data: params,
                        statusCode:{
                            201:function(){
                                $.messager.alert('提示','设置成功!','info',function(){
                                    $("#itemEditWindow").window('close');
                                    $("#itemList").datagrid("reload");
                                });
                            },
                            500:function(){
                                $.messager.alert('提示','设置失败!');
                            },
                            400:function(){
                                $.messager.alert('提示','参数有误，请检查后提交!');
                            }
                        }

                    });
        }
    }];
</script>