<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="/admin/stastic/user/familyInfo">
	<input type="hidden" id="pageNum" name="pageNum" value="${pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${pageTurn.pageSize }" />
	<input type="hidden" value="${memberCount}" name="memberCount" />
	<input type="hidden" value="${endTime}" name="endTime" />
	<input type="hidden" name="startTime" value="${startTime}"/>
	<input type="hidden" name="rel" value="${rel}"/>
</form>
<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="/admin/stastic/user/familyInfo" method="post">
		<input type="hidden" name="rel" value="${rel}"/>
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						所有家庭数（和查询条件无关）: ${familyCount }
					</td>
				</tr>
				<tr>
					<td>
						开始时间: <input id="startTime" type="text" name="startTime" class="date" dateFmt="yyyy-MM-dd" value="${startTime}" style="width:180px"/>
					</td>
					<td>
						结束时间: <input id="endTime" type="text" name="endTime" class="date" dateFmt="yyyy-MM-dd" value="${endTime}" style="width:180px"/>
					</td>
					<td>
						家庭成员数＞<input type="text" value="${memberCount}" name="memberCount"></input>
					</td>
					<td>
						<div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div>
					</td>
				</tr>
			</table>
		</div>
	</form>
</div>
<div class="pageContent">
	<table class="list" width="100%" layoutH="100">
		<thead>
			<tr>
				<th>家名（关注公众账号的家庭数，不包括取消关注）</th>
				<th>家庭成员数</th>
				<th>注册时间</th>
			</tr>
		</thead>
		<tbody>
				<c:choose>
					<c:when test="${null==familyInfoList||familyInfoList.isEmpty()}">
						<tr class="tatr2">
							<td colspan="11" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="family" items="${familyInfoList}">
							<tr target="id" rel="${family.id}">
								<td>
									<%-- <img src = "${family.imgUrl }" width="100" height="100"></img> --%>
									${family.familyName}
								</td>
								<td>${family.memberCount}</td>
								<td><fmt:formatDate value="${family.createTime }" pattern="yyyy-MM-dd HH:mm" /></td>
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