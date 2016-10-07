<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="/admin/brand">
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pageTurn.page?1:pageTurn.page}" />
	<input type="hidden" name="numPerPage" value="${numPerPage}" />
	<input type="hidden" name="rel" value="${rel}"/>
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="/admin/product" method="post">
	<input type="hidden" name="rel" value="${rel}"/>
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					消息内容: <input type="text" value="${lkContent}" name="lkContent"/>
				</td>
				<td>
					<label>品牌名称:</label>
                   	<input name="lkBrandName" placeholder="输入品牌名称"/>
				</td>
				<td>
<!-- 					<label>数据格式:</label> -->
<!--                     <select name="eqDataFormat" id="dataFormat"> -->
<!--                         <option value="">不限</option> -->
<%--                         <c:forEach items="${dataFormatMap}" var="entry"> --%>
<%--                             <option value="${entry.key}">${entry.value}</option> --%>
<%--                         </c:forEach> --%>
<!--                     </select> -->
<!--                     <script type="text/javascript"> -->
<%-- //                     	jQuery('#dataFormat').val("${eqDataFormat }"); --%>
<!--                     </script> -->
<!-- 				</td> -->
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
	<table class="list" width="100%" layoutH="85">
		<thead>
			<tr>
				<th>ID<label style="float:left"><input type="checkbox" class="checkboxCtrl" group="inIdList" /></label></th>
<!-- 				<th>消息类型</th> -->
				<th>产品ID</th>
				<th>型号ID</th>
				<th>数量</th>
				<th>用户ID</th>
			</tr>
		</thead>
		<tbody>
				<c:choose>
					<c:when test="${null==shoppingCartList||shoppingCartList.isEmpty()}">
						<tr class="tatr2">
							<td colspan="11" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="o" items="${shoppingCartList}">
							<tr target="id" rel="${o.id}">
								<td>
									<input type="checkbox" name="inIdList" id="inIdList" value="${o.id}"/>${o.id}
								</td>
								<td>${o.pid}</td>
								<td>${o.psid}</td>
								<td>${o.cartNum}</td>
								<td>${o.userId}</td>
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