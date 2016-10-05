<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
	
</script>

<form id="pagerForm" method="post" action="${path }/admin/activity/shareRecordLog">
	<input type="hidden" name="eqUserId" value="${eqUserId }"/>
	<input type="hidden" name="pageNum" value="${pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${pageTurn.pageSize }" />
	<input type="hidden" name="rel" value="${rel }" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${path }/admin/activity/shareRecordLog" method="post">
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						用户ID: <input type="text" value="${eqUserId}" name="eqUserId"></input>
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
			    <th>ID</th>
				<th>用户ID</th>
				<th>目标ID</th>
				<th>活动ID</th>
				<th>创建时间</th>

			</tr>
		</thead>
		<tbody> 
  			<c:choose>
				<c:when test="${null == shareRecordLogList || shareRecordLogList.isEmpty()}">
					<tr class="tatr2">
						<td colspan="8" align="center">暂无数据</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${shareRecordLogList}" var="object">
					<tr>
					    <td>${object.id }</td>
						<td>${object.userId }</td>
						<td>${object.targetId }</td>
						<td>${object.activityId }</td>
						<td><fmt:formatDate value="${object.createTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
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

