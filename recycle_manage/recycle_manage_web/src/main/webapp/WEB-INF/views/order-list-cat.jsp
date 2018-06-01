<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="easyui-panel" title="Nested Panel" data-options="width:'100%',minHeight:500,noheader:true,border:false" style="padding:10px;">
    <div class="easyui-layout" data-options="fit:true">
        <div data-options="region:'west',split:false" style="width:250px;padding:5px" >
            <ul id="orderCategoryTree" class="easyui-tree" data-options="url:'/rest/item/cat',animate: true,method : 'GET'">
            </ul>
        </div>
        <div data-options="region:'center'" style="padding:5px">
            <table class="easyui-datagrid" id="orderList" data-options="toolbar:orderListToolbar,singleSelect:false,collapsible:true,pagination:true,method:'get',pageSize:20,url:'/rest/order/catlist',queryParams:{item_cat:0}">
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
				<th data-options="field:'item_desc',width:235">产品情况</th>
				<th data-options="field:'item_recycle_price',width:60">回收价格</th>
				<th data-options="field:'status',width:60,align:'center'">状态</th>
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
	var tree = $("#orderCategoryTree");
	var datagrid = $("#orderList");
	tree.tree({
		onClick : function(node){
			if(tree.tree("isLeaf",node.target)){
				datagrid.datagrid('reload', {
                    item_cat :node.id
		        });
			}
		}
	});
});

function getSelectionsIds(){
    var itemList = $("#orderList");
    var sels = itemList.datagrid("getSelections");
    var ids = [];
    for(var i in sels){
        ids.push(sels[i].id);
    }
    ids = ids.join(",");
    return ids;
}

var orderListToolbar = [{
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