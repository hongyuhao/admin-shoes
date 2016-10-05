<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
function processBack(response){
	alertMsg.correct(response.message);
	 $.pdialog.closeCurrent();
	 navTab.reload("${path }/admin/permission/userRoleRelation/", "");
}

</script>
<div class="pageContent">
	<form method="post" action='/admin/permission/userRoleRelation/${null==model?"add":"update"}' class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<div class="pageFormContent" layoutH="56">
			<input type="hidden" name="rel" value="${rel }"/>
			<input type="hidden" name="id" value="${model.id }"/>
			<input type="hidden" name="createTime" value="${model.createTime }"/>
			<input type="hidden" name="userId" value="${user.id }"/>
			<p class="nowrap">
				<label>正在编辑用户:</label>
				<input type="text" name="userName" readonly="readonly" value="${user.name}">
			</p>
			<p class="nowrap">
				<label>角色名称:</label>
				<input class="digits " name="roleId" id="roleId" type="hidden" 
						suggestFields="roleId" value="${model.roleId }" lookupGroup="" />
				<input name="roleName" id="roleName" type="text"
						suggestFields="roleName" value=""
						lookupGroup="" readonly="true"/> 
				<a class="btnLook" href="/admin/permission/role/?isLookup=1&rel=searchRole" lookupgroup="">查找带回</a>
			</p>	
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>

