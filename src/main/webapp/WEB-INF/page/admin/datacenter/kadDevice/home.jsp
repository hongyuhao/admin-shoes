<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="/admin/datacenter/redpackDeviceRelation">
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pageTurn.page?1:pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${numPerPage }" />
	<input type="hidden" value="${eqUserId}" name="eqUserId" />
	<input type="hidden" value="${eqOpenId}" name="eqOpenId" />
	<input type="hidden" value="${eqOrderSn}" name="eqOrderSn" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="/admin/datacenter/redpackDeviceRelation" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					订单号: <input type="text" value="${eqOrderSn}" name="eqOrderSn"></input>
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
	<table class="list" width="100%" layoutH="100">
		<thead>
			<tr>
				<th>ID</th>
				<th>用户ID</th>
				<th>订单号</th>
				<th>openId</th>
				<th>deviceId</th>
				<th>设备编码</th>
				<th>激活状态</th>
				<th>激活时间</th>
			</tr>
		</thead>
		<tbody>
				<c:choose>
					<c:when test="${null==redpackDeviceRelationList||redpackDeviceRelationList.isEmpty()}">
						<tr class="tatr2">
							<td colspan="11" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="o" items="${redpackDeviceRelationList}">
							<tr target="id" rel="${o.id}">
								<td>
									${o.id}
								</td>
								<td>${o.userId}</td>
								<td>${o.orderSn}</td>
								<td>${o.openId}</td>
								<td>${o.deviceId}</td>
								<td>${o.deviceSn}</td>
								<td>${recordStatusMap[o.activateStatus]}</td>
								<td><fmt:formatDate value="${o.activateTime }" pattern="yyyy-MM-dd HH:mm" /></td>
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