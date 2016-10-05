<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="/admin/mall/goodsCategoryRelation">
	<input type="hidden" name="eqGoodsId" value="${goodsBaseInfo.id }" />
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pageTurn.page?1:pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${numPerPage }" />
	<input type="hidden" name="rel" value="${rel}"/>
</form>

<div class="pageHeader">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					当前编辑药品：${goodsBaseInfo.title}
				</td>
			</tr>
		</table>
	</div>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="/admin/mall/goodsCategoryRelation/edit?eqGoodsId=${goodsBaseInfo.id }&rel=${rel}" target="dialog" rel="editTag" mask="true" title="新增" width="620" height="500"><span>新增</span></a></li>
			<li><a class="delete" href="/admin/mall/goodsCategoryRelation/delete?rel=${rel}" target="selectedTodo" rel="inIdList" title="确定删除?"><span>删除</span></a></li>
		</ul>
	</div>
	<table class="list" width="100%" layoutH="100">
		<thead>
			<tr>
				<th>分类ID<label style="float:left"></label></th>
				<th>分类名称</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${null==goodsCategoryRelationList||goodsCategoryRelationList.isEmpty()}">
					<tr class="tatr2">
						<td colspan="11" align="center">暂无数据</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="o" items="${goodsCategoryRelationList}">
						<tr target="id" rel="${o.categoryId}">
							<td><input name="inIdList" value="${o.id}" type="checkbox" />${o.categoryId }</td>
							<td>${o.categoryName }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>