<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>

<form id="pagerForm" method="post" action="${path }/admin/wxpay/userOrder">
	<input type="hidden" name="pageNum" value="${pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${pageTurn.pageSize }" />
	<input type="hidden" name="rel" value="${rel }" />
	<input type="hidden" name="eqOrderSn" value="${eqOrderSn }" />
	<input type="hidden" name="eqOpenId" value="${eqOpenId }" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${path }/admin/wxpay/userOrder" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					订单号：
				</td>
				<td>
					<input type="text" size="15" name="eqOrderSn" value="${eqOrderSn }"/>
				</td>
				
				<td>
					openid：
				</td>
				<td>
					<input type="text" size="15" name="eqOpenId" value="${eqOpenId }"/>
				</td>
				<td>
					金额：
				</td>
				<td>
					<input type="text" size="15" name="eqMoney" value="${eqMoney }"/>
				</td>
				<td>
					订单状态：
				</td>
				<td>
					<select id="eqOrderStatus" name="eqOrderStatus" >
						<c:forEach var="o" items="${orderStatusMap}">
							<option value="${o.key }">${o.value }</option>
						</c:forEach>
					</select>
					<script type="text/javascript">
						$("#eqOrderStatus").val("${eqOrderStatus}");
					</script>
					<%-- <input type="text" size="15" name="eqOrderStatus" value="${eqOrderStatus }"/> --%>
				</td>
				<td>
					支付状态：
				</td>
				<td>
					<select id="eqPayStatus" name="eqPayStatus" >
						<c:forEach var="o" items="${payStatusformMap}">
							<option value="${o.key }">${o.value }</option>
						</c:forEach>
					</select>
					<script type="text/javascript">
						$("#eqPayStatus").val("${eqPayStatus}");
					</script>
					<%-- <input type="text" size="15" name="eqOrderStatus" value="${eqOrderStatus }"/> --%>
				</td>
				<td>
					<div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div>
				</td>
				
			</tr>
		</table>
		<script type="text/javascript">
			//jQuery('#eqCardStatus').val("${eqStatus }");
		</script>
	</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			 <%-- <li><a class="add" href="${path }/admin/wxpay/userOrder/edit.do?rel=${rel}" rel="${rel}" target="dialog" width="650" height="550"><span>添加</span></a></li>
			 <li><a class="delete" href="${path }/admin/wxpay/userOrder/delete.do?rel=${rel}" target="selectedTodo" rel="ids" title="确定删除?"><span>删除</span></a></li>
			<li class="line">line</li> --%>
		</ul>
	</div>

	 <div layoutH="92">
        <table class="list" width="100%" id="WXNotifyOrderList">
            <thead>
			<tr>
				<th><label style="float:left"><input type="checkbox" class="checkboxCtrl" group="ids" /></label>ID</th>
				<th>微信订单号</th>
				<th>用户ID</th>
				<!-- <th>用户openid</th>
				<th>用户IP</th> -->
				<th>金额</th>
				<th>支付类型</th>
				<th>支付状态</th>
				<th>订单渠道</th>
				<th>所属平台</th>
				<th>订单状态</th>    
				<!-- <th>运费</th> 
				<th>收货地址</th>
				<th>收货人</th>
				<th>联系电话</th>
				<th>收货状态</th> -->
				<th>合作方ID</th>
				<th>合作方用户ID</th>
				<th>合作方订单号</th>
				<th>备注</th>
				<th>支付时间</th>
				<th>创建时间</th>
				<th>操作</th>
			</tr>
		</thead>
		  <tbody> 
		  			<c:choose>
						<c:when test="${null==userOrderList||userOrderList.isEmpty()}">
							<tr class="tatr2">
								<td colspan="12" align="center">暂无数据</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${userOrderList}" var="order">
								<tr target="id" rel="${order.id}">
								<td>
									<input type="checkbox" name="ids" id="ids" value="${order.id}"/>${order.id}
								</td>
								<td>${order.orderSn}</td>
								<td>${order.userId}</td>
								<%-- <td>${order.openId}</td>
								<td>${order.userIp }</td> --%>
								<td>${order.money}</td>
								<td>${orderPayTypeMap[order.payType]}</td>
								<td>${payStatusformMap[order.payStatus]}</td>
								<td>${order.expandCode }</td>
								<td>${order.applicablePlatformId}</td>
								<td>${orderStatusMap[order.orderStatus]}</td>
								<%-- <td>${order.freight}</td>
								<td>${order.shippingAddress }</td>
								<td>${order.shippingName }</td>
								<td>${order.shippingPhone}</td>
								<td>${orderShippingStatusMap[order.shipmentStatus]}</td> --%>
								<td>${order.partnerId}</td>
								<td>${order.partnerUserId }</td>
								<td>${order.partnerOrderSn }</td>
								<td>${order.remark }</td>
								<td><fmt:formatDate value="${order.payTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td><fmt:formatDate value="${order.createTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td>&nbsp;
								<a title="查看 商品" target="dialog"  width="650" height="550" href="${path}/admin/wxpay/orderGoods?orderId=${order.orderSn}&rel=${rel}" rel="${rel}" ><span>查看商品</span></a>&nbsp;
								<c:if test="${admin:permission(USER_ID,VERIFY,'paycenter_order',DELETE) }">
								<a title="退款" target="dialog"  width="650" height="550" href="${path}/admin/wxpay/userOrder/refund?orderId=${order.orderSn}&rel=${rel}" rel="${rel}" ><span>退款</span></a>
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
</div>

