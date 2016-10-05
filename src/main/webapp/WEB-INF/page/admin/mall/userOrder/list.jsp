<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="/admin/mall/userBookingRecord">
	<input type="hidden" id="pageNum" name="pageNum" value="${pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${pageTurn.pageSize }" />
	<input type="hidden" name="rel" value="${rel}"/>
</form>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="/admin/mall/userBookingRecord" method="post">
	<input type="hidden" value="${rel==null ? parentRel : rel}" name="parentRel">
	</form>

</div>

<div class="pageContent">
	<table class="table" width="90%">
		<thead>
			<tr>
				<th>ID<label style="float:left"></label></th>
				<th>用户Id</th>
				<th>添加数量</th>
				<th>商品名称</th>

			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${null==userBookingRecordList||userBookingRecordList.isEmpty()}">
					<tr class="tatr2">
						<td colspan="11" align="center">暂无数据</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="o" items="${userBookingRecordList}">
						<tr>
							<td><input name="inIdList" value="${o.id}" type="checkbox" />${o.id }</td>
							<td>${o.userId }</td>
							<td>${o.bookNum}</td>
							<td>${o.goodsName}</td>
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