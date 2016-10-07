<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">

function processBack(response){
	alertMsg.correct(response.message);
	 $.pdialog.closeCurrent();
	 navTab.reload("${path }/admin/user", "");
}
//图片上传==============end==========
</script>
<div class="pageContent">
	<form method="post" action="/admin/user/${not empty model.id ? "update" :"add"}"
		 class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input name="id" type="hidden" size="75" value="${model.id }"/>
		<input type="hidden" name="rel" value="${rel}"/>
		<div class="pageFormContent" layoutH="57" align="left">
			<p class="nowrap">
            	<label>用户名：</label>
				<input name="username" type="text"  value="${model.username }" class="required"/>
			</p>
			<p class="nowrap">
				<label>密码：</label>
				<textarea name="password" type="text"  value="${model.password }" class="required"/>
			</p>
			<p class="nowrap">
				<label>真实姓名：</label>
				<input name="realname" type="text"  value="${model.realname }"/>
			</p>
			<p class="nowrap">
				<label>身份证：</label>
				<input name="identity" type="text"  value="${model.identity }"/>
			</p>
			<p class="nowrap">
				<label>用户类型：</label>
				<select name="typeId">
					<option value="0" ${model.typeId == 0?'selected':''}>超级管理员</option>
					<option value="1" ${model.typeId == 1?'selected':''}>管理员</option>
					<option value="2" ${model.typeId == 2?'selected':''}>普通用户</option>
				</select>
			</p>
		</div>
		
		<div class="formBar">
			<ul>
			<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">返回</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>
