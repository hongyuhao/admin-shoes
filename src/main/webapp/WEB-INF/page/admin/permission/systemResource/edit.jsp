<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp" %>
<script type="text/javascript">
function processBack(response){
	alertMsg.correct(response.message);
	 $.pdialog.closeCurrent();
	 navTab.reload("${path }/admin/permission/systemResource", "");
}

</script>
<div class="pageContent">
	<form method="post" action='/admin/permission/systemResource/${null==model?"add":"update"}' class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<div class="pageFormContent" layoutH="56">
			<input type="hidden" name="parentRel" value="${parentRel }"/>
			<input type="hidden" name="id" value="${model.id }"/>
			<p class="nowrap">
				<label>资源名称:</label>
				<input type="text" name="name" class="required" value="${model.name}">
			</p>
			<p class="nowrap">
				<label>资源码:</label>
				<input type="text" name="code" class="required" value="${model.code}">
			</p>
			<p class="nowrap">
	            <label>状态：</label>
	            <select id="status" name="status" >
 					<c:forEach var="recordStatusMap" items="${recordStatusMap}">
						<option value="${recordStatusMap.key }">${recordStatusMap.value }</option>
					</c:forEach>
	            </select>
           		<script type="text/javascript">
					$("#status").val("${model.status}");
				</script>
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

