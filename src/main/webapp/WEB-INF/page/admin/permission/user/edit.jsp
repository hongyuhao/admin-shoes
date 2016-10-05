<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp" %>
<script type="text/javascript">
function processBack(response){
	alertMsg.correct(response.message);
	 $.pdialog.closeCurrent();
	 navTab.reload("${path }/admin/permission/user/", "");
}

</script>
<div class="pageContent">
	<form method="post" action='/admin/permission/user/${null==model?"add":"update"}' class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<div class="pageFormContent" layoutH="56">
			<input type="hidden" name="rel" value="${rel }"/>
			<input type="hidden" name="id" value="${model.id }"/>
			<input type="hidden" name="createTime" value="${model.createTime }"/>
			<input type="hidden" name="passwd" value="${model.passwd }"/>
			<p class="nowrap">
				<label>用户名称:</label>
				<input type="text" name="name" value="${model.name}">
			</p>
			<p class="nowrap">
				<label>用户账号:</label>
				<input type="text" name="account" value="${model.account}">
			</p>
			<p class="nowrap">
				<label>密码 <c:if test="${not empty model}">(填写则修改，空白则不改)</c:if>:</label>
				<input type="text" name="newPasswd" value="">
			</p>
			<p class="nowrap">
				<label>公司:</label>
				<select id="company" name="company" >
 					<c:forEach var="companyMap" items="${companyMap}">
						<option value="${companyMap.key }">${companyMap.value }</option>
					</c:forEach>
	            </select>
           		<script type="text/javascript">
					$("#company").val("${model.company}");
				</script>
			</p>
			<p class="nowrap">
				<label>部门:</label>
				<select id="department" name="department" >
 					<c:forEach var="departmentMap" items="${departmentMap}">
						<option value="${departmentMap.key }">${departmentMap.value }</option>
					</c:forEach>
	            </select>
           		<script type="text/javascript">
					$("#department").val("${model.department}");
				</script>
			</p>
			<p class="nowrap">
				<label>职级:</label>
				<select id="jobGrade" name="jobGrade" >
 					<c:forEach var="jobGradeMap" items="${jobGradeMap}">
						<option value="${jobGradeMap.key }">${jobGradeMap.value }</option>
					</c:forEach>
	            </select>
           		<script type="text/javascript">
					$("#jobGrade").val("${model.jobGrade}");
				</script>
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

