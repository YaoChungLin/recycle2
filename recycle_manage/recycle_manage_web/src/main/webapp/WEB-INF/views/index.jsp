<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数码回收后台管理系统</title>
<jsp:include page="/commons/common-js.jsp"></jsp:include>
<style type="text/css">
	.content {
		padding: 10px 10px 10px 10px;
	}
</style>
</head>
<body class="easyui-layout">
    <div data-options="region:'west',title:'菜单',split:true" style="width:180px;">
    	<ul id="menu" class="easyui-tree" style="margin-top: 10px;margin-left: 5px;">
         	<li>
         		<span>产品管理</span>
         		<ul>
	         		<li data-options="attributes:{'url':'/rest/page/item-cat'}">产品分类管理</li>
	         		<li data-options="attributes:{'url':'/rest/page/item-cat-desc'}">产品管理</li>
	         	</ul>
         	</li>
			<li>
				<span>用户管理</span>
				<ul>
					<li data-options="attributes:{'url':'/rest/page/user-add'}">新增用户</li>
					<li data-options="attributes:{'url':'/rest/page/user-list'}">查询用户</li>
				</ul>
			</li>
			<li>
				<span>订单管理</span>
				<ul>
					<li data-options="attributes:{'url':'/rest/page/order-list'}">订单列表</li>
					<li data-options="attributes:{'url':'/rest/page/order-list-cat'}">订单分类列表</li>
				</ul>
			</li>
			<li>
				<span>广告管理</span>
				<ul>
					<li data-options="attributes:{'url':'/rest/page/content-category'}">广告分类管理</li>
					<li data-options="attributes:{'url':'/rest/page/content'}">广告管理</li>
				</ul>
			</li>
         </ul>
    </div>
    <div data-options="region:'center',title:''">
    	<div id="tabs" class="easyui-tabs">
		    <div title="首页" style="padding:20px;">
		        	
		    </div>
		</div>
    </div>
    
<script type="text/javascript">
$(function(){
	$('#menu').tree({
		onClick: function(node){
			if($('#menu').tree("isLeaf",node.target)){
				var tabs = $("#tabs");
				var tab = tabs.tabs("getTab",node.text);
				if(tab){
					tabs.tabs("select",node.text);
				}else{
					tabs.tabs('add',{
					    title:node.text,
					    href: node.attributes.url,
					    closable:true,
					    bodyCls:"content"
					});
				}
			}
		}
	});
});
</script>
</body>
</html>