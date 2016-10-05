<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="/admin/stastic/user/bleeding/list">
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pageTurn.page?1:pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${numPerPage }" />
	<input type="hidden" value="${number}" name="number" />
	<input type="hidden" value="${endTime}" name="endTime" />
	<input type="hidden" name="startTime" value="${startTime}"/>
</form>
<div class="pageHeader">
	<tr>
		<td>
			总沉默用户: ${pageTurn.rowCount }
		</td>
	</tr>
</div>
<div class="pageContent">
	<table class="list" width="100%" layoutH="100">
		<thead>
			<tr>
				<th>用户ID</th>
				<th>用户昵称</th>
				<th>来源渠道</th>
				<th>邀请人ID</th>
				<th>注册时间</th>
				<th>关注公众号时间</th>
				<th>取消关注时间</th>
			</tr>
		</thead>
		<tbody>
				<c:choose>
					<c:when test="${null==userActionDetailList||userActionDetailList.isEmpty()}">
						<tr class="tatr2">
							<td colspan="11" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="user" items="${userActionDetailList}">
							<tr target="id" rel="${user.userId}">
								<td>
									${user.userId}
								</td>
								<td>${user.nickName}</td>
								<td>${user.channelCode}</td>
								<td>${user.senderUserId}</td>
								<td><fmt:formatDate value="${user.registerTime }" pattern="yyyy-MM-dd HH:mm" /></td>
								<td><fmt:formatDate value="${user.mpFollowTime }" pattern="yyyy-MM-dd HH:mm" /></td>
								<td><fmt:formatDate value="${user.mpUnfollowTime }" pattern="yyyy-MM-dd HH:mm" /></td>
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