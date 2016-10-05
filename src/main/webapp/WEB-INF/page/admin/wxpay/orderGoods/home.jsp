<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>

<form id="pagerForm" method="post" action="${path }/admin/wxpay/orderGoods">
	<input type="hidden" name="pageNum" value="${pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${pageTurn.pageSize }" />
	<input type="hidden" name="rel" value="${rel }" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${path }/admin/wxpay/orderGoods" method="post">
	<div class="searchBar">
		<script type="text/javascript">
			//jQuery('#eqCardStatus').val("${eqStatus }");
		</script>
	</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			 <%-- <li><a class="add" href="${path }/admin/wxpay/orderGoods/edit.do?rel=${rel}" rel="${rel}" target="dialog" width="650" height="550"><span>添加</span></a></li>
			 <li><a class="delete" href="${path }/admin/wxpay/orderGoods/delete.do?rel=${rel}" target="selectedTodo" rel="ids" title="确定删除?"><span>删除</span></a></li>
			<li class="line">line</li> --%>
		</ul>
	</div>

	 <div layoutH="92">
        <table class="list" width="100%" id="orderGoodsList">
            <thead>
			<tr>
				<th><label style="float:left"><input type="checkbox" class="checkboxCtrl" group="ids" /></label>ID</th>
				<th>订单号</th>
				<th>商品ID</th>
				<th>商品名称</th>
				<th>原价</th>
				<th>优惠价</th>
				<th>图片</th>
				<th>数量</th>
			</tr>
		</thead>
		  <tbody> 
		  			<c:choose>
						<c:when test="${null==orderGoodsList||orderGoodsList.isEmpty()}">
							<tr class="tatr2">
								<td colspan="12" align="center">暂无数据</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${orderGoodsList}" var="order">
								<tr target="id" rel="${order.id}">
								<td>
									<input type="checkbox" name="ids" id="ids" value="${order.id}"/>${order.id}
								</td>
								<td>${order.orderSn}</td>
								<td>${order.goodsId}</td>
								<td>${order.goodsName }</td>
								<td>${order.goodsPrice}</td>
								<td>${order.promotionPrice}</td>
								<td>${order.imgUrl}</td>
								<td>${order.goodsNum }</td>
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

