<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<div style="padding:10px 10px 10px 10px">
	<form id="itemcatdescAddForm" class="itemcatdescForm" method="post">
		<input type="hidden" name="cat_id"/>
	    <table cellpadding="2">
	        <tr>
	            <td>版本:</td>
	            <td><input class="easyui-textbox" type="text" name="version" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>

	        <tr>
	            <td>原始价格:</td>
				<td><input class="easyui-textbox" type="text" name="price" data-options="required:true" style="width: 280px;"></input></td>
	            </td>
	        </tr>

	    </table>
	</form>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="itemcatdescAddPage.submitForm()">提交</a>
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="itemcatdescAddPage.clearForm()">重置</a>
	</div>
</div>
<script type="text/javascript">
	var itemcatdescAddEditor ;
	$(function(){
		itemcatdescAddEditor = TT.createEditor("#itemcatdescAddForm [name=itemcatdesc]");
		$("#itemcatdescAddForm [name=cat_id]").val($("#itemCategoryTree").tree("getSelected").id);
	});
	
	var itemcatdescAddPage  = {
			submitForm : function (){
				if(!$('#itemcatdescAddForm').form('validate')){
					$.messager.alert('提示','表单还未填写完成!');
					return ;
				}

				
				//提交到后台的RESTful
				$.ajax({
				   type: "POST",
				   url: "/rest/itemcatdesc",
				   data: $("#itemcatdescAddForm").serialize(),
				   success: function(msg){
					   $.messager.alert('提示','新增内容成功!');
   						$("#itemList").datagrid("reload");
   						TT.closeCurrentWindow();
				   },
				   error: function(){
					   $.messager.alert('提示','新增内容失败!');
				   }
				});
			},
			clearForm : function(){
				$('#itemcatdescAddForm').form('reset');
				itemcatdescAddEditor.html('');
			}
	};
</script>
