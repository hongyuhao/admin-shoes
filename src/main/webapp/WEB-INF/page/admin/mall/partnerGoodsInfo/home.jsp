<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="/admin/mall/partnerGoodsInfo">
	<input type="hidden" name="eqGoodsId" value="${goodsBaseInfo.id }" />
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pageTurn.page?1:pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${numPerPage }" />
	<input type="hidden" name="rel" value="${rel}"/>
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="/admin/mall/partnerGoodsInfo" method="post">
		<input type="hidden" name="rel" value="${rel}"/>
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						当前编辑药品：${goodsBaseInfo.title}
					</td>
				</tr>
			</table>
		</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="/admin/mall/partnerGoodsInfo/edit?eqGoodsId=${eqGoodsId }" target="dialog" rel="${eqGoodsId }" mask="true" title="新增" width="900" height="620"><span>新增</span></a></li>
		</ul>
	</div>
	<table class="list" width="100%" layoutH="100">
		<thead>
			<tr>
				<th>ID<label style="float:left"></label></th>
				<th>合作方名称</th>
				<th>封面图片</th>
				<th>市场价</th>
				<th>销售价</th>
				<th>优惠价</th>
				<th>销售状态</th>
				<!-- <th>商品序列号</th> -->
				<th>库存状态</th>
				<th>条形码</th>
				<th>购买数量限制</th>
				<th>添加时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
				<c:choose>
					<c:when test="${null==partnerGoodsInfoList||partnerGoodsInfoList.isEmpty()}">
						<tr class="tatr2">
							<td colspan="11" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="o" items="${partnerGoodsInfoList}">
							<tr target="id" rel="${o.id}">
								<td>
									${o.id}
								</td>
								<td>${o.partnerName }</td>
								<td><img src="${o.goodsImgUrl}" width="60" height="60"/></td>
								<td>${o.marketPrice/100 }元</td>
								<td>${o.salePrice/100 }元</td>
								<td>${o.preferentialPrice/100 }元</td>
								<td>${GOODS_PARTNER_SALE_STATUS_MAP[o.onSaleStatus] }</td>
								<%-- <td>${o.seriesNumber }</td> --%>
								<td>${GOODS_PARTNER_STOCK_STATUS_MAP[o.stock] }</td>
								<td>${o.barcode }</td>
								<td>${o.buyLimit }</td>
								<td><fmt:formatDate value="${o.createTime }" pattern="yyyy-MM-dd" /></td>
								<td>
									<a title="药品：${goodsBaseInfo.title}" rel="partnerGoodsInfoEdit" target="dialog" mask="true" href="/admin/mall/partnerGoodsInfo/edit?id=${o.id}&eqGoodsId=${o.goodsId}&parentRel=${rel==null ? parentRel : rel}" width="900" height="620">编辑</a>
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