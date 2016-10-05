<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="/admin/permission/roleResourceRelation">
	<input type="hidden" id="roleId" name="roleId" value="${role.id}" />
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pager.page?1:pager.page }" />
	<input type="hidden" value="${rel}" name="rel">
</form>

<div class="pageHeader">
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						正在编辑角色“${role.name }”的权限
					</td>
				</tr>
			</table>
		</div>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
		    <li><a class="add" href="/admin/permission/roleResourceRelation/edit?roleId=${role.id}&rel=${rel}" target="dialog" rel="editRoleResourceRelation" mask="true"><span>新增</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th>序号</th>
				<th>资源名称</th>
				<th>动作</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
				<c:choose>
					<c:when test="${null==roleResourceRelationList||roleResourceRelationList.isEmpty()}">
						<tr class="tatr2">
							<td colspan="11" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="object" items="${roleResourceRelationList}">
							<tr target="object" rel="${object.id}">
								<td>${object.id}</td>
								<td>${object.resourceName}[${object.resourceCode }]</td>
								<td>${object.operationName}[${object.operation }]</td>
								<td>
									<a target="ajaxTodo" rel="deleteRoleResourceRelation${object.id}" href="/admin/permission/roleResourceRelation/delete?id=${object.id}&rel=deleteRoleResourceRelation${object.id}">删</a>
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
