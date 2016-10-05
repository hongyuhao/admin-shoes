<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>

<form id="pagerForm" method="post" action="/admin/mall/userOrder">
	<input type="hidden" id="pageNum" name="pageNum" value="${pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${pageTurn.pageSize }" />
	<input type="hidden" name="eqExpressSn" value="${eqExpressSn}">
	<input type="hidden" name="eqOrderSn" value="${eqOrderSn}">
	<input type="hidden" name="eqPartnerId" value="${eqPartnerId}">
	<input type="hidden" name="eqStatus" value="${eqStatus}">
	<input type="hidden" value="${gtCreateTime}" name="gtCreateTime" />
	<input type="hidden" value="${ltCreateTime}" name="ltCreateTime" />
	<input type="hidden" name="rel" value="${rel}"/>
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="/admin/mall/userOrder" method="post">
	<input type="hidden" value="${rel==null ? parentRel : rel}" name="parentRel">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					快递单号 <input type="text"  value="${eqExpressSn}" name="eqExpressSn"></input>
				</td>
				<td>
					订单号 <input type="text"  value="${eqOrderSn}" name="eqOrderSn"></input>
				</td>
				<td><div style="float: left;">合作方</div><div style="float: left;"><select name="eqPartnerId" id="eqPartnerId">
					<option value="">不限</option>
					<c:forEach items="${PARTNER_INFO_MAP }" var="map">
						<option value="${map.key }">${map.value }</option>
					</c:forEach>
				</select></div>
				<script type="text/javascript">
				$('#eqPartnerId').val('${eqPartnerId}');
				</script>
				</td>
				<td>
					<div style="float: left;">订单状态: </div><div style="float: left;"><select name="eqStatus" id="eqStatus" >
							<option value="">--请选择--</option>
								<option value="-1" >未知状态</option>
								<option value="0" >未支付</option>
								<option value="1" >已复核</option>
								<option value="3" >已付款</option>
								<option value="4" >已审核</option>
								<option value="5" >未复核</option>
								<option value="7" >已生成</option>
								<option value="8" >已出库</option>
								<option value="9" >已发货</option>
								<option value="10" >已作废</option>
								<option value="11" >已完成</option>
								<option value="12" >已隐藏</option>
						</select></div>
					<script type="text/javascript">
				        $('#eqStatus').val('${eqStatus}');
				   </script>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<table><tr>
					<td>下单时间:</td>
					<td>
						<input type="text" value="${gtCreateTime}" name="gtCreateTime" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true" style="float:left;"/>
					</td>
					<td>~</td>
					<td>
						<input type="text" value="${ltCreateTime}" style="float:left;" name="ltCreateTime" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true"/>
					</td>
					
					</tr></table>
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
			 <li>
				<a class="icon" href="/admin/mall/userOrder/export?rel=${rel}" rel="inIdList" target="dwzExport" title="实要导出这些记录吗？"><span>导出Excel</span></a>
			</li>
		</ul>
	</div>
	<table class="list" width="250%" layoutH="118">
		<thead>
			<tr>
				<th><input type="checkbox" group="inIdList" class="checkboxCtrl"></th>
				<th>用户Id</th>
				<th>订单号</th>
				<!-- <th>订单详情链接</th> -->
				<!-- <th>合作方ID</th> -->
				<th>合作方名称</th>
				<!-- <th>平台ID</th> -->
				<th>下单时间</th>
				<th>订单状态</th>
				<th>订单总价</th>
				<th>省</th>
				<th>市</th>
				<th>区</th>
				<th>街道</th>
				<th>收货人</th>
				<th>联系方式</th>
				<th>快递单号</th>
				
				<th>出货人</th>
				<th>验收人</th>
				
				<th width="122px">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${null==userOrderList||userOrderList.isEmpty()}">
					<tr class="tatr2">
						<td colspan="11" align="center">暂无数据</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="o" items="${userOrderList}">
						<tr>
							<td><input name="inIdList" value="${o.id}" type="checkbox" />${o.id }</td>
							<td>${o.userId }</td>
							<td>${o.orderSn}</td>
							<%-- <td>${o.orderUrl}</td> --%>
							<%-- <td>${o.partnerId}</td> --%>
							<td>${o.partnerName}</td>
							<%-- <td>${o.openPlatformId}</td> --%>
							<td><fmt:formatDate value="${o.createTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td>${PARTNER_ORDER_STATUS_MAP[o.status] }</td>
							<td>${o.totalPrice}</td>
							<td>${o.province}</td>
							<td>${o.city}</td>
							<td>${o.region}</td>
							<td>${o.street}</td>
							<td>${o.consignee}</td>
							<td>${o.phone}</td>
							<td>${o.expressSn }</td>
							 
							<td>${o.outGoingMan }</td>
							<td>${o.checkMan }</td>
							
							<td>
							<a title="详情" rel="userBookingRecordList" target="dialog" mask="true" href="/admin/mall/userBookingRecord/orderlist?eqOrderSn=${o.orderSn}">详情</a>
							&nbsp;&nbsp;
						    <c:if test="${o.status=='3'or o.status=='4'or o.status=='5'or o.status=='7'}">
							<a title="确定退款？" target="ajaxTodo" href="/admin/mall/userOrder/refund?id=${o.id}&parentRel=${rel==null ? parentRel : rel}">退款</a>
							</c:if>
							&nbsp;&nbsp;
							<c:if test="${o.status=='3'or o.status=='4'or o.status=='5'or o.status=='7'}">
							<a title="发货" rel="${o.userId }" target="dialog" mask="true"href="/admin/mall/userOrder/edit?id=${o.id}&oper=edit&parentRel=${rel==null ? parentRel : rel}" >发货</a>
							</c:if>
							<c:if test="${o.status=='8' or o.status=='9'}">
								<a title="打印面单" rel="${o.userId }" target="_blank" mask="true" href="/admin/mall/electronicSurface/detail?orderSn=${o.orderSn}&oper=detail&parentRel=${rel==null ? parentRel : rel}" >打印面单</a>
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