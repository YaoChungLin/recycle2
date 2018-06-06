<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<table class="easyui-datagrid" id="orderList" title="订单列表"
       data-options="singleSelect:false,collapsible:true,pagination:true,url:'/rest/order',method:'get',pageSize:30,toolbar:toolbar">
    <thead>
        <tr>
        	<th data-options="field:'ck',checkbox:true"></th>
        	<th data-options="field:'id',width:30">ID</th>
            <th data-options="field:'order_id',width:150">订单ID</th>
            <th data-options="field:'user_name',width:70">用户名</th>
            <th data-options="field:'receiver_name',width:70">寄件人</th>
            <th data-options="field:'receiver_phone',width:100">寄件人电话</th>
            <th data-options="field:'receiver_state',width:70">省份</th>
            <th data-options="field:'receiver_city',width:70">城市</th>
            <th data-options="field:'receiver_district',width:70">区/县</th>
            <th data-options="field:'receiver_address',width:200">地址</th>
            <th data-options="field:'bookdate',width:70">预约时间</th>
            <th data-options="field:'item_cat',width:70">产品分类</th>
            <th data-options="field:'item_name',width:100">产品机型</th>
            <th data-options="field:'item_desc',width:235">产品情况</th>
            <th data-options="field:'item_recycle_price',width:60">回收价格</th>
            <th data-options="field:'status',width:60,align:'center'">状态</th>
            <th data-options="field:'created',width:130,align:'center',formatter:TAOTAO.formatDateTime">创建日期</th>
            <th data-options="field:'updated',width:130,align:'center',formatter:TAOTAO.formatDateTime">更新日期</th>
        </tr>
    </thead>
</table>
<script>

    function getSelectionsIds(){
    	var orderList = $("#orderList");
    	var sels = orderList.datagrid("getSelections");
    	var ids = [];
    	for(var i in sels){
    		ids.push(sels[i].id);
    	}
    	ids = ids.join(",");
    	return ids;
    }
    
    var toolbar = [{
        text:'删除',
        iconCls:'icon-cancel',
        handler:function(){
            var ids = getSelectionsIds();
            if(ids.length == 0){
                $.messager.alert('提示','未选中任何订单!');
                return ;
            }
            $.messager.confirm('确认','确定删除ID为 '+ids+' 的订单吗？',function(r){
                if (r){
                    var params = {"ids":ids};
                    $.ajax({
                        type: "POST",
                        url: "/rest/order/delete",
                        data: params,
                        statusCode:{
                            201:function(){
                                $.messager.alert('提示','删除订单成功!','info',function(){
                                    $("#itemEditWindow").window('close');
                                    $("#orderList").datagrid("reload");
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
        text:'已取件',
        iconCls:'icon-remove',
        handler:function(){
        	var ids = getSelectionsIds();
        	if(ids.length == 0){
        		$.messager.alert('提示','未选中订单!');
        		return ;
        	}
        	$.messager.confirm('确认','确定对ID为 '+ids+' 的订单做“已取件”操作吗？',function(r){
        	    if (r){
        	    	var params = {"ids":ids,"param":"已取件"};
        	    	$.ajax({
         	 		   type: "POST",
         	 		   url: "/rest/order/changeStatus",
         	 		   data: params,
         	 		   statusCode:{
         	 			   201:function(){
         	 				    $.messager.alert('提示','操作成功!','info',function(){
         	 					$("#itemEditWindow").window('close');
         	 					$("#orderList").datagrid("reload");
         	 				    });
         	 			   },
         	 			   500:function(){
         	 				   $.messager.alert('提示','操作失败!');
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
        text:'已提交',
        iconCls:'icon-remove',
        handler:function(){
            var ids = getSelectionsIds();
            if(ids.length == 0){
                $.messager.alert('提示','未选中订单!');
                return ;
            }
            $.messager.confirm('确认','确定对ID为 '+ids+' 的订单做“已提交”操作吗？',function(r){
                if (r){
                    var params = {"ids":ids,"param":"已提交"};
                    $.ajax({
                        type: "POST",
                        url: "/rest/order/changeStatus",
                        data: params,
                        statusCode:{
                            201:function(){
                                $.messager.alert('提示','操作成功!','info',function(){
                                    $("#itemEditWindow").window('close');
                                    $("#orderList").datagrid("reload");
                                });
                            },
                            500:function(){
                                $.messager.alert('提示','操作失败!');
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
        text:'核实中',
        iconCls:'icon-remove',
        handler:function(){
            var ids = getSelectionsIds();
            if(ids.length == 0){
                $.messager.alert('提示','未选中订单!');
                return ;
            }
            $.messager.confirm('确认','确定对ID为 '+ids+' 的订单做“核实中”操作吗？',function(r){
                if (r){
                    var params = {"ids":ids,"param":"核实中"};
                    $.ajax({
                        type: "POST",
                        url: "/rest/order/changeStatus",
                        data: params,
                        statusCode:{
                            201:function(){
                                $.messager.alert('提示','操作成功!','info',function(){
                                    $("#itemEditWindow").window('close');
                                    $("#orderList").datagrid("reload");
                                });
                            },
                            500:function(){
                                $.messager.alert('提示','操作失败!');
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
        text:'已付款',
        iconCls:'icon-remove',
        handler:function(){
            var ids = getSelectionsIds();
            if(ids.length == 0){
                $.messager.alert('提示','未选中订单!');
                return ;
            }
            $.messager.confirm('确认','确定对ID为 '+ids+' 的订单做“已付款”操作吗？',function(r){
                if (r){
                    var params = {"ids":ids,"param":"已付款"};
                    $.ajax({
                        type: "POST",
                        url: "/rest/order/changeStatus",
                        data: params,
                        statusCode:{
                            201:function(){
                                $.messager.alert('提示','操作成功!','info',function(){
                                    $("#itemEditWindow").window('close');
                                    $("#orderList").datagrid("reload");
                                });
                            },
                            500:function(){
                                $.messager.alert('提示','操作失败!');
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
        text:'交易成功',
        iconCls:'icon-remove',
        handler:function(){
            var ids = getSelectionsIds();
            if(ids.length == 0){
                $.messager.alert('提示','未选中订单!');
                return ;
            }
            $.messager.confirm('确认','确定对ID为 '+ids+' 的订单做“交易成功”操作吗？',function(r){
                if (r){
                    var params = {"ids":ids,"param":"交易成功"};
                    $.ajax({
                        type: "POST",
                        url: "/rest/order/changeStatus",
                        data: params,
                        statusCode:{
                            201:function(){
                                $.messager.alert('提示','操作成功!','info',function(){
                                    $("#itemEditWindow").window('close');
                                    $("#orderList").datagrid("reload");
                                });
                            },
                            500:function(){
                                $.messager.alert('提示','操作失败!');
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
        text:'交易取消',
        iconCls:'icon-remove',
        handler:function(){
            var ids = getSelectionsIds();
            if(ids.length == 0){
                $.messager.alert('提示','未选中订单!');
                return ;
            }
            $.messager.confirm('确认','确定对ID为 '+ids+' 的订单做“交易取消”操作吗？',function(r){
                if (r){
                    var params = {"ids":ids,"param":"交易取消"};
                    $.ajax({
                        type: "POST",
                        url: "/rest/order/changeStatus",
                        data: params,
                        statusCode:{
                            201:function(){
                                $.messager.alert('提示','操作成功!','info',function(){
                                    $("#itemEditWindow").window('close');
                                    $("#orderList").datagrid("reload");
                                });
                            },
                            500:function(){
                                $.messager.alert('提示','操作失败!');
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