<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="/admin/permission/systemResource">
	<input type="hidden" name="isLookup" value="${isLookup }" />
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pager.page?1:pager.page }" />
	<input type="hidden" value="${likeCode}" name="likeCode" />
	<input type="hidden" value="${likeName}" name="likeName" />
	<input type="hidden" value="${rel}" name="rel">
</form>

<div class="pageHeader">
	<form onsubmit="return dwzSearch(this, 'dialog');" action="/admin/permission/systemResource" method="post">
		<input type="hidden" value="${rel}" name="rel">
		<input type="hidden" name="isLookup" value="${isLookup }" />
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						资源码: <input type="text" value="${likeCode}" name="likeCode"/>
					</td>
					<td>
						资源名称: <input type="text" value="${likeName}" name="likeName" />
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
	
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th>序号</th>
				<th>资源名称</th>
				<th>资源码</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
				<c:choose>
					<c:when test="${null==systemResourceList||systemResourceList.isEmpty()}">
						<tr class="tatr2">
							<td colspan="11" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="object" items="${systemResourceList}">
							<tr target="object" rel="${object.id}">
								<td>${object.id}</td>
								<td>${object.name}</td>	
								<td>${object.code}</td>
								<td>${recordStatusMap[object.status]}</td>
								<td><a class="btnSelect" href="javascript:$.bringBack({resourceId:'${object.id }', resourceName:'${object.name }'})">返回</a>
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