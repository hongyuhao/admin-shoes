<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
	
</script>

<form id="pagerForm" method="post" action="${path }/admin/ucenter/actionInfo">
	<input type="hidden" name="eqId" value="${eqId }"/>
	<input type="hidden" name="pageNum" value="${pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${pageTurn.pageSize }" />
	<input type="hidden" name="rel" value="${rel }" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${path }/admin/ucenter/actionInfo" method="post">
	<div class="searchBar">

	</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="${path }/admin/ucenter/actionInfo/edit.do?rel=${rel}" rel="${rel}" target="dialog" width="610" height="550"><span>添加</span></a></li>
			<li><a class="delete" href="${path }/admin/ucenter/actionInfo/delete.do?rel=${rel}" target="selectedTodo" rel="ids" title="确定删除?"><span>删除</span></a></li>
			<li class="line">line</li>
		</ul>

	</div>
		<table class="table" width="100%" layoutH="90">
            <thead>
			<tr>
				<th>ID<label style="float:left"><input type="checkbox" class="checkboxCtrl" group="ids" /></label></th>
				<th>名称</th>
				<th>标识</th>
				<th>状态</th>
				<th width="120">操作</th>
			</tr>
		</thead>
		  <tbody> 
		  			<c:choose>
						<c:when test="${null==actionInfoList||actionInfoList.isEmpty()}">
							<tr class="tatr2">
								<td colspan="5" align="center">暂无数据</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${actionInfoList}" var="actionInfoList">
								<tr target="id" rel="${actionInfoList.id}">
								<td>
									<input type="checkbox" name="ids" id="ids" value="${actionInfoList.id};${actionInfoList.status}"/>${actionInfoList.id}
								</td>
								<td>${actionInfoList.actionName}</td>
								<td>${actionInfoList.actionType}</td>
								<td>${taskActionStatusMap[actionInfoList.status]}</td>
								<td><a title="修改" target="dialog" href="${path}/admin/ucenter/actionInfo/edit?id=${actionInfoList.id}&rel=${rel}" rel="${rel}"  width="610" height="550"><span>修改</span></a>&nbsp;
								</td>
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

