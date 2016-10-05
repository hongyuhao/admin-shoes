<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
	
</script>

<form id="pagerForm" method="post" action="${path }/admin/activity/activityFightAcceptInfo">
	<input type="hidden" name="eqChallengerUserId" value="${eqChallengerUserId }"/>
	<input type="hidden" name="eqAcceptUserId" value="${eqAcceptUserId }"/>
	<input type="hidden" name="pageNum" value="${pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${pageTurn.pageSize }" />
	<input type="hidden" name="rel" value="${rel }" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${path }/admin/activity/activityFightAcceptInfo" method="post">
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						挑战者ID: <input type="text" value="${eqChallengerUserId}" name="eqChallengerUserId"></input>
					</td>
					<td>
						应战者ID: <input type="text" value="${eqAcceptUserId}" name="eqAcceptUserId"></input>
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
				<th>挑战者ID</th>
				<th>应战者ID</th>
				<th>约战信息ID</th>
				<th>战况</th>
				<th>挑战者步数</th>
				<th>应战者步数</th>
				<th>创建时间</th>
				<th>应战时间</th>
				<th>话题ID</th>
				<th>承诺内容</th>
			</tr>
		</thead>
		<tbody> 
  			<c:choose>
				<c:when test="${null == activityFlghtAcceptInfoList || activityFlghtAcceptInfoList.isEmpty()}">
					<tr class="tatr2">
						<td colspan="8" align="center">暂无数据</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${activityFlghtAcceptInfoList}" var="object">
					<tr>
						<td>${object.challengerUserId }</td>
						<td>${object.acceptUserId }</td>
						<td>${object.flghtId }</td>
						<td>${fightStatusMap.get(object.flghtStatus) }</td>
						<td>${object.challengerUserStep }</td>
						<td>${object.acceptUserStep }</td>
						<td><fmt:formatDate value="${object.createTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td><fmt:formatDate value="${object.acceptTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td>${object.topicId }</td>
						<td>${object.promiseContent }</td>
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

