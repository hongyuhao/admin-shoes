<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>

<form id="pagerForm" method="post" action="${path }/admin/wxpay/redPackResult">
	<input type="hidden" name="redPackId" value="${redPackId }"/>
	<input type="hidden" name="likeTitle" value="${likeActName }" />
	<input type="hidden" name="pageNum" value="${pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${pageTurn.pageSize }" />
	<input type="hidden" name="rel" value="${rel }" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${path }/admin/wxpay/redPackResult" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					红包ID：
				</td>
				<td>
					<input type="text" size="15" name="redPackId" value="${redPackId }"/>
				</td>
				<td>
					openid：
				</td>
				<td>
					<input type="text" size="15" name="eqOpenId" value="${eqOpenId }"/>
				</td>
               
				
				<td>
					<div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div>
				</td>
			</tr>
		</table>
	</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<%--  <li><a class="add" href="${path }/admin/wxpay/redPackResult/edit.do?rel=${rel}" rel="${rel}" target="dialog" width="650" height="550"><span>添加</span></a></li>
			 <li><a class="delete" href="${path }/admin/wxpay/redPackResult/delete.do?rel=${rel}" target="selectedTodo" rel="ids" title="确定删除?"><span>删除</span></a></li>
			<li class="line">line</li> --%>
		</ul>
	</div>

	 <div layoutH="92">
        <table class="list" width="100%" id="redPackResultList">
            <thead>
			<tr>
				<th><label style="float:left"><input type="checkbox" class="checkboxCtrl" group="ids" /></label>ID</th>
				<th>用户ID</th>
				<th>红包ID</th>
				<th>状态码</th>
				<th>返回信息</th>
				<th>业务结果</th>
				<th>错误代码</th>
				<th>错误代码描述 </th>
				<th>商户订单号</th>
				<th>付款金额</th>
				<th>支付时间</th>
				<th>操作</th>
			</tr>
		</thead>
		  <tbody> 
		  			<c:choose>
						<c:when test="${null==redPackResultList||redPackResultList.isEmpty()}">
							<tr class="tatr2">
								<td colspan="12" align="center">暂无数据</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${redPackResultList}" var="redPackResult">
								<tr target="id" rel="${redPackResult.id}">
								<td>
									<input type="checkbox" name="ids" id="ids" value="${redPackResult.id}"/>${redPackResult.id}
								</td>
								<td>${redPackResult.openId}</td>
								<td>${redPackResult.redPackId}</td>
								<td>${redPackResult.returnCode}</td>
								<td>${redPackResult.returnMsg }</td>
								<td>${redPackResult.resultCode }</td>
								<td>${redPackResult.errCode }</td>
								<td>${redPackResult.errCodeDes }</td>
								<td>${redPackResult.mchBillno }</td>
								<td>${redPackResult.totalAmount }</td>
								<td><fmt:formatDate value="${redPackResult.createTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td><a href="${path }/admin/wxpay/redPackResult/applyResult?redpackId=${redPackResult.redPackId}&billNo=${redPackResult.mchBillno}&openId=${redPackResult.openId}" target="dialog" rel="${rel}"  width="480" height="350"><span>查看领取</span></a></td>
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

