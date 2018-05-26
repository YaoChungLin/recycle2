<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<div style="padding:10px 10px 10px 10px">
	<form id="itemeEditForm" class="itemForm" method="post">
		<input type="hidden" name="id"/>
	    <table cellpadding="5">
			<tr>
				<td>用户名:</td>
				<td><input class="easyui-textbox" type="text" name="username" data-options="required:true" style="width: 280px;"></input></td>
			</tr>
			<tr>
				<td>密码:</td>
				<td><input class="easyui-textbox" type="text" name="password" data-options="required:true" style="width: 280px;"></input></td>
			</tr>
			<tr>
				<td>手机号:</td>
				<td><input class="easyui-textbox" type="text" name="phone" data-options="required:true" style="width: 280px;"></input></td>
			</tr>
			<tr>
				<td>邮箱:</td>
				<td><input class="easyui-textbox" type="text" name="email" data-options="required:false" style="width: 280px;"></input></td>
			</tr>
	        <tr>
	            <td>头像:</td>
				<td>
					<input type="hidden" name="image" />
					<a href="javascript:void(0)" class="easyui-linkbutton onePicUpload">图片上传</a>
				</td>
	        </tr>
			<input type="hidden" name="ismanager"/>
			<input type="hidden" name="status"/>
	    </table>
	</form>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
	</div>
</div>
<script type="text/javascript">

    $(function(){
        TT.initOnePicUpload();
    });

	function submitForm(){
		if(!$('#itemeEditForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
		//提交到后台的RESTful
		$.ajax({
		   type: "PUT",
		   url: "/rest/user",
		   data: $("#itemeEditForm").serialize(),
		   statusCode:{
			   201:function(){
				    $.messager.alert('提示','修改用户信息成功!','info',function(){
					$("#itemEditWindow").window('close');
					$("#itemList").datagrid("reload");
				    });
			   },
			   500:function(){
				   $.messager.alert('提示','修改用户信息失败!');
			   },
			   400:function(){
				   $.messager.alert('提示','参数有误，请检查后提交!');
			   }
		   }
		  
		});
	}
</script>
