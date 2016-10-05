<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp" %>
<script type="text/javascript">
function processBack(response){
	alertMsg.correct(response.message);
	 $.pdialog.closeCurrent();
	 navTab.reload("${path }/admin/ucenter/roleOperCode", "");
}

</script>
<div class="pageContent">
	<form method="post" action='/admin/ucenter/roleOperCode/${null==model?"add":"update"}' class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<div class="pageFormContent" layoutH="56">
			<input type="hidden" name="parentRel" value="${parentRel }"/>
			<%-- <input type="hidden" name="id" value="${model.id }"> --%>
			<c:choose>
				<c:when test="${null!=model }">
					<p class="nowrap">
						<label>操作码ID:</label>
						<input type="text" id="id" name="id" class="required" ${null!=model?'readonly=readonly':'' } value="${model.id}">
					</p>
				</c:when>
				<c:otherwise>
					<input type="hidden" name="id" id="id"/>
				</c:otherwise>
			</c:choose>
			<p class="nowrap">
				<label>操作名:</label>
				<input type="text" id="operText" name="operText" ${oper=='view'?'readonly=readonly':'' } value="${model.operText}" />
				<input type="hidden" name="parentId" name="0"/>
			</p>
			<p class="nowrap">
				<label>操作码:</label>
				<input type="text" id="operCode" name="operCode"  ${oper=='view'?'readonly=readonly':'' } min="0" value="${model.operCode}">
			</p>
		</div>
		<div class="formBar">
			<c:if test="${oper != 'view' }">
				<ul>
					<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
					<li>
						<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
					</li>
				</ul>
			</c:if>
		</div>
	</form>
</div>

