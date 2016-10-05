<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp" %>
<form id="pagerForm" action="/admin/mall/categoryBaseInfo">
	<input type="hidden" name="type" value="lookup"/>
	<input type="hidden" name="pageNum" value="${pageNum}" />
	<input type="hidden" name="numPerPage" value="${numPerPage}" />
	<input type="hidden" name="likeCategoryName" value="${likeCategoryName}" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" method="post" action="/admin/mall/categoryBaseInfo" onsubmit="return dwzSearch(this, 'dialog');">
	<input type="hidden" name="type" value="lookup"/>
	<div class="searchBar">
		<ul class="searchContent">	  
			<li>
				<label>分类名:</label>
				<input class="textInput" name="likeCategoryName" value="${likeCategoryName }" type="text">
			</li>
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
			</ul>
		</div>
	</div>
	</form>
</div>
<div class="pageContent">
	<table class="table" layoutH="118" targetType="dialog" width="100%">
		<thead>
			<tr>
				<th>分类ID</th>
				<th>分类名</th>
				<th>父级分类名</th>
				<th width="80">查找带回</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${null==categoryBaseInfoList||categoryBaseInfoList.isEmpty()}">
					<tr class="tatr2">
						<td colspan="11" align="center">暂无数据</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${categoryBaseInfoList }" var="o">
						<tr>
							<td>${o.id }</td>
							<td>${o.categoryName }</td>
							<td>${o.parentCategoryName }</td>
							<td>
								<a class="btnSelect" href="javascript:$.bringBack({categoryId:${o.id }, categoryName:'${o.categoryName }'});" title="查找带回">选择</a>
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
