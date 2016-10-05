<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="#rel#">
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pageTurn.page?1:pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${numPerPage }" />
	<input type="hidden" value="${lkTitle}" name="lkTitle" />
	<input type="hidden" name="rel" value="${rel}"/>
	<input type="hidden" name="isLookup" value="${isLookup }"/>
	
<%-- 	<input type="hidden" name="eqGoodsId" value="${goodsBaseInfo.id }"/> --%>
<%-- 	<input type="hidden" name="isLookup" value="${isLookup}"/> --%>
</form>
<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return dwzSearch(this, 'dialog');" action="/admin/mall/partnerGoodsInfo/list?isLookup=1" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					商品名: <input type="text" value="${lkTitle}" name="lkTitle" ></input>
				</td>
 				<input type="hidden" name="rel" value="${rel}"/>
				<td>
					<div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div>
				</td>
			</tr>
		</table>
	</div>
	</form>
</div>
<div class="pageContent">
    <div layoutH="60">
		<table class="list" width="100%"  targetType="dialog">
			<thead>
				<tr>
					<th>商品id</th>
					<th>商品名</th>
					<th>合作方名</th>
					<th>图片</th>
					<th width="10">查找带回</th>
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
								<td>${o.goodsId}</td>
								<td>${o.title}</td>
								<td>${o.partnerName}</td>
								<td><img src="${o.coverImgUrl}" width="60" height="60"/></td>
								<td><a class="btnSelect" href="javascript:$.bringBack({goodsId:'${o.goodsId}',goodsName:'${o.title}',partnerId:'${o.partnerId}',coverImgUrl:'${o.coverImgUrl}',partnerUrl:'${o.linkUrl}',partnerGoodsId:'${o.partnerGoodsId}',salePrice:'${o.salePrice}'})" title="查找带回">选择</a></td>
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
