<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp" %>
<div class="pageContent">
	<form method="post" action='/admin/ucenter/user/familymember/${null==family?"add":"update"}' class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		<div class="pageFormContent" layoutH="56">
			<input type="hidden" name="parentRel" value="${parentRel }"/>
			<input type="hidden" name="id" value="${family.id }">
			<input type="hidden" name="createTime" value="${family.createTime }">
			<c:choose>
				<c:when test="${null!=family }">
					<p class="nowrap">
						<label>所属用户ID:</label>
						<input type="text" id="userId" name="userId" class="required" ${null!=family?'readonly=readonly':'' } value="${family.userId}">
					</p>
				</c:when>
				<c:otherwise>
					<input type="hidden" name="userId" id="userId" class="required"/>
				</c:otherwise>
			</c:choose>
			<p class="nowrap">
				<label>所属用户:</label>
				<c:if test="${null != family }">
					<input type="text" id="accountName" name="accountName" class="required" ${null!=family?'readonly=readonly':'' } value="${family.accountName}">
				</c:if>
				<c:if test="${null == family }">
					<input class="required" name="user.accountName" type="text" postField="keyword" lookupGroup="user"/>
					<input type="hidden" class="required" name="user.id" type="text" postField="keyword" lookupGroup="user"/>
					<a class="btnLook" href="/admin/ucenter/user/accountInfo?oper=lookup" lookupGroup="user">查找带回</a>
				</c:if>
			</p>
			<p class="nowrap">
				<label>称谓:</label>
				<input type="text" id="relatives" name="relatives" class="required" ${oper=='view'?'readonly=readonly':'' } value="${family.relatives}">
			</p>
			<p class="nowrap">
				<label>年龄:</label>
				<input type="text" id="age" name="age" class="required" ${oper=='view'?'readonly=readonly':'' } min="0" value="${family.age}">
			</p>
			<p class="nowrap">
				<label>性别:</label>
				<c:forEach items="${sexMap}" var="sexEntry">
					<span><input type="radio" name="sex" ${family.sex==sexEntry.key?'checked=checked':''  } ${oper=='view'?'disabled=disabled':''} value="${sexEntry.key }">${sexEntry.value}</span>
				</c:forEach>
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

