<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>

<form id="pagerForm" method="post" action="${path }/admin/wxpay/WXCloseorder">
	<input type="hidden" name="pageNum" value="${pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${pageTurn.pageSize }" />
	<input type="hidden" name="rel" value="${rel }" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${path }/admin/wxpay/WXCloseorder" method="post">
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
			 <%-- <li><a class="add" href="${path }/admin/wxpay/WXCloseorder/edit.do?rel=${rel}" rel="${rel}" target="dialog" width="650" height="550"><span>添加</span></a></li>
			 <li><a class="delete" href="${path }/admin/wxpay/WXCloseorder/delete.do?rel=${rel}" target="selectedTodo" rel="ids" title="确定删除?"><span>删除</span></a></li>
			<li class="line">line</li> --%>
		</ul>
	</div>

	 <div layoutH="92">
        <table class="list" width="100%" id="WXCloseorderList">
            <thead>
			<tr>
				<th><label style="float:left"><input type="checkbox" class="checkboxCtrl" group="ids" /></label>ID</th>
				<th>订单号</th>
				<th>返回状态码</th>
				<th>返回信息</th>
				<th>错误代码</th>
				<th>错误描述</th>
				<th>请求时间</th>
				<th>操作</th>
			</tr>
		</thead>
		  <tbody> 
		  			<c:choose>
						<c:when test="${null==WXCloseorderList||WXCloseorderList.isEmpty()}">
							<tr class="tatr2">
								<td colspan="12" align="center">暂无数据</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${WXCloseorderList}" var="red">
								<tr target="id" rel="${red.id}">
								<td>
									<input type="checkbox" name="ids" id="ids" value="${red.id}"/>${red.id}
								</td>
								<td>${red.outTradeNo}</td>
								<td>${red.returnCode}</td>
								<td>${red.returnMsg}</td>
								<td>${red.errCode }</td>
								<td>${red.errCodeDes }</td>
								<td><fmt:formatDate value="${red.createTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td>
								
								<%-- <a title="修改" target="dialog"  width="650" height="550" href="${path}/admin/wxpay/WXCloseorder/edit?id=${red.id}&rel=${rel}" rel="${rel}" ><span>修改</span></a> --%>&nbsp;
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

