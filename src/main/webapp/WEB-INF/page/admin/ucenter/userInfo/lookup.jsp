<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp" %>
<form id="pagerForm" action="/admin/ucenter/user/accountInfo">
	<input type="hidden" name="oper" value="lookup"/>
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${model.numPerPage}" />
	<input type="hidden" name="orderField" value="${param.orderField}" />
	<input type="hidden" name="orderDirection" value="${param.orderDirection}" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" method="post" action="/admin/ucenter/user/accountInfo" onsubmit="return dwzSearch(this, 'dialog');">
	<input type="hidden" name="oper" value="lookup"/>
	<div class="searchBar">
		<ul class="searchContent">
			<li>
				<label>用户ID:</label>
				<input class="textInput" name="eqId" value="${eqId }" type="text">
			</li>	  
			<li>
				<label>用户名:</label>
				<input class="textInput" name="eqAccountName" value="${eqAccountName }" type="text">
			</li>
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
			</ul>
		</div>
	</div>
	</form>
</div>
<div class="pageContent">

	<table class="table" layoutH="118" targetType="dialog" width="100%">
		<thead>
			<tr>
				<th orderfield="id">用户ID</th>
				<th orderfield="accountName">用户名</th>
				<th width="80">查找带回</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${null==userBaseAccountInfoList||userBaseAccountInfoList.isEmpty()}">
					<tr class="tatr2">
						<td colspan="11" align="center">暂无数据</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${userBaseAccountInfoList }" var="user">
						<tr>
							<td>${user.id }</td>
							<td>${user.accountName }</td>
							<td>
								<a class="btnSelect" href="javascript:$.bringBack({id:${user.id }, accountName:'${user.accountName }'});$('#userId').val('${user.id }');" title="查找带回">选择</a>
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>
<div style="clear:both"></div>
<div class="panelBar">
    <%@ include file="/inc/admin_pagination.jsp" %>
</div>
