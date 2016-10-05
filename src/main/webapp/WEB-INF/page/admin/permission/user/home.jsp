<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="/admin/permission/user">
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pager.page?1:pager.page }" />
	<input type="hidden" value="${likeAccount}" name="likeAccount" />
	<input type="hidden" value="${likeName}" name="likeName" />
	<input type="hidden" value="${rel}" name="rel">
</form>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="/admin/permission/user" method="post">
		<input type="hidden" value="${rel}" name="rel">
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						账号: <input type="text" value="${likeAccount}" name="likeAccount"/>
					</td>
					<td>
						姓名: <input type="text" value="${likeName}" name="likeName" />
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
	<div class="panelBar">
		<ul class="toolBar">
		    <li><a class="add" href="/admin/permission/user/edit" target="dialog" rel="editUser" mask="true" height="350"><span>新增</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th>序号</th>
				<th>名称</th>
				<th>账号</th>
				<th>公司</th>
				<th>部门</th>
				<th>等级</th>
				<th>状态</th>
				<th>创建时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
				<c:choose>
					<c:when test="${null==userList||userList.isEmpty()}">
						<tr class="tatr2">
							<td colspan="11" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="object" items="${userList}">
							<tr target="object" rel="${object.id}">
								<td>${object.id}</td>
								<td>${object.name}</td>	
								<td>${object.account}</td>
								<td>${companyMap[object.company]}</td>
								<td>${departmentMap[object.department]}</td>
								<td>${jobGradeMap[object.jobGrade]}</td>
								<td>${recordStatusMap[object.status]}</td>
								<td><fmt:formatDate value="${object.createTime }" pattern="yyyy-MM-dd HH:mm:dd" /></td>
								<td>
									<a title="${object.name}" rel="updateUser${object.id}" target="dialog" mask="true" href="/admin/permission/user/edit?id=${object.id}&rel=${rel}" width="750" height="320">编</a>
									<a target="ajaxTodo" rel="deleteUser${object.id}" href="/admin/permission/user/delete?id=${object.id}&rel=deleteUser${object.id}">删</a>
									<a target="navTab" rel="homeUserRoleRelation" href="/admin/permission/userRoleRelation/?userId=${object.id}&rel=homeUserRoleRelation" title="用户:${object.name}">角</a>
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