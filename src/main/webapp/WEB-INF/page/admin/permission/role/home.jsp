<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
	
</script>

<form id="pagerForm" method="post" action="/admin/permission/role">
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pager.page?1:pager.page }" />
	<input type="hidden" value="${likeName}" name="likeName" />
	<input type="hidden" value="${rel}" name="rel">
</form>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="/admin/permission/role" method="post">
		<input type="hidden" value="${rel}" name="rel">
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						角色名称: <input type="text" value="${likeName}" name="likeName" />
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
		    <li><a class="add" href="/admin/permission/role/edit" target="dialog" rel="editRole" mask="true"><span>新增</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th>序号</th>
				<th>角色名称</th>
				<th>状态</th>
				<th>创建时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
				<c:choose>
					<c:when test="${null==roleList||roleList.isEmpty()}">
						<tr class="tatr2">
							<td colspan="11" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="object" items="${roleList}">
							<tr target="object" rel="${object.id}">
								<td>${object.id}</td>
								<td>${object.name}</td>
								<td>${recordStatusMap[object.status]}</td>
								<td><fmt:formatDate value="${object.createTime }" pattern="yyyy-MM-dd HH:mm:dd" /></td>
								<td>
									<a title="${object.name}" rel="updateRole${object.id}" target="dialog" mask="true" href="/admin/permission/role/edit?id=${object.id}&parentRel=${rel != null ? rel : parentRel}" width="750" height="320">编</a>
									<a target="ajaxTodo" rel="deleteRole${object.id}" href="/admin/permission/role/delete?id=${object.id}&rel=deleteRole${object.id}">删</a>
									<a target="navTab" rel="homeRoleResourceRelation" href="/admin/permission/roleResourceRelation/?roleId=${object.id}&rel=homeRoleResourceRelation" title="角色:${object.name}">权</a>
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
