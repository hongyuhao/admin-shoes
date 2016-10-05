<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="/admin/mall/goodsRecommend">
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pageTurn.page?1:pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${numPerPage }" />
	<input type="hidden" name="rel" value="${rel}"/>
</form>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="/admin/mall/goodsRecommend/edit?rel=${rel}" target="dialog" rel="editTag" mask="true" title="新增" width="620" height="250"><span>新增</span></a></li>
			<li><a class="delete" href="/admin/mall/goodsRecommend/delete?rel=${rel}" target="selectedTodo" rel="inIdList" title="确定删除?"><span>删除</span></a></li>
		</ul>
	</div>
	<table class="list" width="100%" layoutH="55">
		<thead>
			<tr>
				<th>ID<label style="float:left"></label></th>
				<th>推荐位置</th>
				<th>数据类型</th>
				<th>测量等级</th>
				<th>推荐药品</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${null==goodsRecommendList||goodsRecommendList.isEmpty()}">
					<tr class="tatr2">
						<td colspan="11" align="center">暂无数据</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="o" items="${goodsRecommendList}">
						<tr>
							<td><input name="inIdList" value="${o.id}" type="checkbox" />${o.id }</td>
							<td>${PAGE_LOCATION_MAP[o.forumId] }</td>
							<td>${DATA_TYPE_INFO_MAP[o.dataTypeId] }</td>
							<td>${DATA_TYPE_LEVEL_MAP[o.dataLevel] }</td>
							<td>${o.goodsTitle}[id:${o.goodsId }]</td>
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