<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="/admin/product">
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pageTurn.page?1:pageTurn.page}" />
	<input type="hidden" name="numPerPage" value="${numPerPage}" />
	<input type="hidden" name="rel" value="${rel}"/>
	<input type="hidden" name="lkTitle" value="${lkTitle}"/>
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="/admin/product" method="post">
	<input type="hidden" name="rel" value="${rel}"/>
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					<label>产品名称:</label>
                   	<input name="lkTitle" placeholder="输入产品名称" value="${lkTitle}"/>
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
	      <li><a class="add" href="/admin/product/edit" target="dialog" rel="editTag" mask="true" title="新增" width="620" height="500"><span>新增</span></a></li>
			<li><a class="delete" href="/admin/product/delete?rel=${rel}" target="selectedTodo" rel="inIdList" title="确定删除?"><span>删除</span></a></li>
	   </ul>
	</div>
	<table class="list" width="100%" layoutH="85">
		<thead>
			<tr>
				<th>ID<label style="float:left"><input type="checkbox" class="checkboxCtrl" group="inIdList" /></label></th>
<!-- 				<th>消息类型</th> -->
				<th>产品名称</th>
				<th>产品描述</th>
				<th>品牌</th>
				<th>产品类型</th>
				<th>热门标记</th>
				<th>主图</th>
				<th>图1</th>
				<th>图2</th>
				<th>图3</th>
				<th>原价</th>
				<th>现价</th>
				<th>销量</th>
			</tr>
		</thead>
		<tbody>
				<c:choose>
					<c:when test="${null==productList||productList.isEmpty()}">
						<tr class="tatr2">
							<td colspan="13" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="o" items="${productList}">
							<tr target="id" rel="${o.id}">
								<td>
									<input type="checkbox" name="inIdList" id="inIdList" value="${o.id}"/>${o.id}
								</td>
								<td>${o.title}</td>
								<td>${o.summary}</td>
								<td>${o.brandId}</td>
								<td>
									<c:if test="${o.typeId == 1}">女鞋</c:if>
									<c:if test="${o.typeId == 2}">男鞋</c:if>
									<c:if test="${o.typeId == 3}">童鞋</c:if>
								</td>
								<td>${o.hot == 1 ? '普通': '热卖'}</td>
								<td>${o.mainImg}</td>
								<td>${o.firstImg}</td>
								<td>${o.secondImg}</td>
								<td>${o.thirdImg}</td>
								<td>${o.lastPrice}</td>
								<td>${o.nowPrice}</td>
								<td>${o.saled}</td>
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