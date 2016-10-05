<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>

<form id="pagerForm" method="post" action="/admin/tmp/orders">
	<input type="hidden" id="pageNum" name="pageNum" value="${pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${pageTurn.pageSize }" />
	<input type="hidden" name="eqOrderNum" value="${eqOrderNum}">
	<input type="hidden" name="eqStatus" value="${eqStatus}">
	<input type="hidden" value="${gtCreateTime}" name="gtCreateTime" />
	<input type="hidden" value="${ltCreateTime}" name="ltCreateTime" />
	<input type="hidden" name="rel" value="${rel}"/>
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="/admin/tmp/orders" method="post">
	<input type="hidden" value="${rel==null ? parentRel : rel}" name="parentRel">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					订单号 <input type="text"  value="${eqOrderNum}" name="eqOrderNum"></input>
				</td>
				<td>
					<div style="float: left;">订单状态: </div><div style="float: left;">
					    <select name="eqStatus" id="eqStatusSelector">
							<option value="">--请选择--</option>
							<c:forEach items="${ORDER_ADDRESS_STATUS_MAP }" var="map">
								<option value="${map.key}" >${map.value }</option>
							</c:forEach>
						</select></div>
						<script type="text/javascript">
						$('#eqStatusSelector').val('${eqStatus}');
						</script>
				</td>
				<td>手机号码：<input type="text"  value="${phone}" name="phone"></input></td>
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
			 <%-- <li>
				<a class="icon" href="/admin/userOrder/export?rel=${rel}" rel="inIdList" target="dwzExport" title="实要导出这些记录吗？"><span>导出Excel</span></a>
			</li> --%>
		</ul>
	</div>
	<table class="list" width="100%" layoutH="100">
		<thead>
			<tr>
				<th>订单号</th>
				<th>订单总金额</th>
				<th>收货人</th>
				<th>收货人手机</th>
				<th>收获人地址</th>
				<th>发货状态</th>
				<th>快递公司</th>
				<th>快递单号</th>
				<th>下单时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${null==ordersList||ordersList.isEmpty()}">
					<tr class="tatr2">
						<td colspan="11" align="center">暂无数据</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="o" items="${ordersList}">
						<tr>
							<td>${o.orderNum }</td>
							<td>${o.total }</td>
							<td>${o.consignee}</td>
							<td>${o.phone}</td>
							<td>${o.address}</td>
							
							<td>${ORDER_STATUS_MAP[o.status] }</td>
							<td>
								<c:if test="${not empty o.expressType }">
									${LOGISTICS_COMPANY_MAP[o.expressType]}
								</c:if>
							</td>
							<td>${o.expressNum}</td>
							<td><fmt:formatDate value="${o.createdAt}" pattern="yyyy-MM-dd HH:mm"/></td>
							<td>
							<!--mask="true" fresh="false"  -->
									<c:if test="${empty o.expressType && o.status == ORDER_ADDRESS_STATUS_NORMAL}">
									<a href="admin/tmp/orders/edit.html?id=${o.id }" target="dialog" width="650" height="500" rel="deliveryOrder">发货</a>
									</c:if>
									<c:if test="${not empty o.expressType }">
										<a title="打印面单" rel="surface_${o.id }" target="_blank" mask="true" href="/admin/tmp/orders/surface/detail?id=${o.id }&oper=detail&parentRel=${rel==null ? parentRel : rel}" >打印面单</a>
										<%-- <a title="查看物流" rel="logistic_info_${o.id }" target="dialog" mask="true" fresh="false" width="850" height="600"  href="/admin/orders/logistic/detail?addressId=${o.id }&oper=detail&parentRel=${rel==null ? parentRel : rel}" >物流查询</a> --%>
									</c:if>
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