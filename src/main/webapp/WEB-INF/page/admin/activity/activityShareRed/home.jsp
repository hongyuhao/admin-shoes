<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
	
</script>

<form id="pagerForm" method="post" action="${path }/admin/activity/activityShareRed">
	<input type="hidden" name="eqShareId" value="${eqShareId }"/>
	<input type="hidden" name="pageNum" value="${pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${pageTurn.pageSize }" />
	<input type="hidden" name="rel" value="${rel }" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${path }/admin/activity/activityShareRed" method="post">
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						分享ID: <input type="text" value="${eqShareId}" name="eqShareId"></input>
					</td>
					<td>
						<div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div>
					</td>
				</tr>
			</table>
		</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
		</ul>
	</div>

	<table class="table" width="100%" layoutH="115">
 		<thead>
			<tr>
				<th>分享ID</th>
				<th>红包状态</th>
				<th>用户ID</th>
				<th>OpenId</th>
          		<th>创建时间</th>
          		<th>新用户</th>  
          		<th>发送状态</th>  
          		<th>分享用户ID</th>
          		<th>金额</th>      
			</tr>
		</thead>
		<tbody> 
  			<c:choose>
				<c:when test="${null == activityShareRedList || activityShareRedList.isEmpty()}">
					<tr class="tatr2">
						<td colspan="8" align="center">暂无数据</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${activityShareRedList}" var="object">
					<tr>
						<td>${object.shareId }</td>
						<td>${object.redpackStatus }</td>
						<td>${object.userId }</td>
						<td>${object.openId }</td>
						<td><fmt:formatDate value="${object.createTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td>${object.isNewUser }</td>
						<td>${object.sendStatus }</td>
						<td>${object.shareUserId }</td>
						<td>${object.money }</td>
					</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
    <div style="clear:both"></div>
    <div class="panelBar">
        <%@ include file="/inc/admin_pagination.jsp" %>
    </div>
</div>

