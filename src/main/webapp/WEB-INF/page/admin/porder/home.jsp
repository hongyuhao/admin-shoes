<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="/admin/porder">
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pageTurn.page?1:pageTurn.page}" />
	<input type="hidden" name="numPerPage" value="${numPerPage}" />
	<input type="hidden" name="eqOrderId" value="${eqOrderId}" />
	<input type="hidden" name="rel" value="${rel}"/>
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="/admin/porder" method="post">
	<input type="hidden" name="rel" value="${rel}"/>
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					订单号: <input type="text" value="${eqOrderId}" name="eqOrderId"/>
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
	   </ul>
	</div>
	<table class="list" width="100%" layoutH="85">
		<thead>
			<tr>
				<th>ID</th>
<!-- 				<th>消息类型</th> -->
				<th>订单号</th>
				<th>产品</th>
				<th>型号</th>
				<th>下单数量</th>
				<th>下单时间</th>
				<th>支付时间</th>
				<th>完成时间</th>
				<th>订单状态</th>
				<th>用户ID</th>
			</tr>
		</thead>
		<tbody>
				<c:choose>
					<c:when test="${null==porderList||porderList.isEmpty()}">
						<tr class="tatr2">
							<td colspan="11" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="o" items="${porderList}">
							<tr target="id" rel="${o.id}">
								<td>
									${o.id}
								</td>
								<td>${o.orderId}</td>
								<td>${o.pid}</td>
								<td>${o.psid}</td>
								<td>${o.productNum}</td>
								<td>${o.beginTime}</td>
								<td>${o.payTime}</td>
								<td>${o.finshTime}</td>
								<td>${o.status}</td>
								<td>${o.userId}</td>
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