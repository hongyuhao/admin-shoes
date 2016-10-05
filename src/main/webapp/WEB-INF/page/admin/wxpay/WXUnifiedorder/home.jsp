<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>

<form id="pagerForm" method="post" action="${path }/admin/wxpay/WXUnifiedorder">
	<input type="hidden" name="pageNum" value="${pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${pageTurn.pageSize }" />
	<input type="hidden" name="rel" value="${rel }" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${path }/admin/wxpay/WXUnifiedorder" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					商户订单号：
				</td>
				<td>
					<input type="text" size="15" name="eqOutTradeNo" value="${eqOutTradeNo }"/>
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
			 <%-- <li><a class="add" href="${path }/admin/wxpay/WXUnifiedorder/edit.do?rel=${rel}" rel="${rel}" target="dialog" width="650" height="550"><span>添加</span></a></li>
			 <li><a class="delete" href="${path }/admin/wxpay/WXUnifiedorder/delete.do?rel=${rel}" target="selectedTodo" rel="ids" title="确定删除?"><span>删除</span></a></li>
			<li class="line">line</li> --%>
		</ul>
	</div>

	 <div layoutH="92">
        <table class="list" width="100%" id="WXUnifiedorderList">
            <thead>
			<tr>
				<th><label style="float:left"><input type="checkbox" class="checkboxCtrl" group="ids" /></label>ID</th>
				<th>订单号</th>
				<th>openid</th>
				<th>预支付ID</th>
				<th>货币类型 </th>
				<th>总金额</th>
				<th>交易类型</th>
				<th>二维码链接</th>
				<th>商品描述 </th>
				<th>商品详情</th>
				<th>返回状态码</th>
				<th>返回信息</th>
				<th>业务结果</th>
				<th>错误代码</th>
				<th>错误描述</th>
				<th>创建时间</th>
				<th>交易起始时间</th>
				<th>交易结束时间</th>
				<th>操作</th>
			</tr>
		</thead>
		  <tbody> 
		  			<c:choose>
						<c:when test="${null==WXUnifiedorderList||WXUnifiedorderList.isEmpty()}">
							<tr class="tatr2">
								<td colspan="12" align="center">暂无数据</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${WXUnifiedorderList}" var="red">
								<tr target="id" rel="${red.id}">
								<td>
									<input type="checkbox" name="ids" id="ids" value="${red.id}"/>${red.id}
								</td>
								<td>${red.outTradeNo}</td>
								<td>${red.openid}</td>
								<td>${red.prepayId}</td>
								<td>${red.feeType }</td>
								<td>${red.totalFee }</td>
								<td>${red.tradeType}</td>
								<td>${red.codeUrl}</td>
								<td>${red.goodsBody}</td>
								<td>${red.goodsDetail }</td>
								<td>${red.returnCode }</td>
								<td>${red.returnMsg }</td>
								<td>${red.resultCode }</td>
								<td>${red.errCode }</td>
								<td>${red.errCodeDes }</td>
								<td><fmt:formatDate value="${red.createTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td><fmt:formatDate value="${red.timeStart }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td><fmt:formatDate value="${red.timeExpire }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td><a title="关闭订单" target="dialog"  width="650" height="550" href="${path}/admin/wxpay/WXUnifiedorder/close?orderId=${red.outTradeNo}&rel=${rel}" rel="${rel}" ><span>关闭订单</span></a>&nbsp;
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

