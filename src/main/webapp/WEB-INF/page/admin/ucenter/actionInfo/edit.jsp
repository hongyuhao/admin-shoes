<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
function processBack(response){
	alertMsg.correct(response.message);
	 $.pdialog.closeCurrent();
	 navTab.reload("${path }/admin/ucenter/actionInfo", "");
}

</script>
<c:choose>
	<c:when test="${model.id==0 ||empty model.id}">
		<c:set var="action" value="${path }/admin/ucenter/actionInfo/add.do"></c:set>
	</c:when>
	<c:otherwise>
		<c:set var="action" value="${path }/admin/ucenter/actionInfo/update.do"></c:set>
	</c:otherwise>
</c:choose>
<div class="pageContent">
	<form method="post" action="${action }" class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input name="id" type="hidden" size="75" value="${model.id }"/>
		<input type="hidden" name="rel" value="${rel}"/>
		<div class="pageFormContent" layoutH="57" align="left">
			<p class="nowrap">
            	<label>名称：</label>
				<input name="actionName" type="text"  value="${model.actionName }"  />
            </p>
			<p class="nowrap">
            	<label>标识：</label>
				<input name="actionType" type="text"  value="${model.actionType }"  ${model.status==2?'readonly':''}/>
            </p>
			<p class="nowrap">
	            <label>状态：</label>
	            <select id="status" name="status" >
 					<c:forEach var="taskActionStatusMap" items="${taskActionStatusMap}">
						<option value="${taskActionStatusMap.key }">${taskActionStatusMap.value }</option>
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
					<div class="button"><div class="buttonContent"><button type="button" class="close">返回</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>
