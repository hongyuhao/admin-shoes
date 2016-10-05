<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
	
</script>
<form id="pagerForm" method="post" action="${path}/admin/ucenter/integralPromotionGoodsRelation/insuranceList">
    <input type="hidden" name="pageNum" value="${pageTurn.page}"/>
    <input type="hidden" name="numPerPage" value="${pageTurn.pageSize}"/>
</form>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
		</ul>
	</div>
	<table class="table" width="100%" layoutH="90">
   		<thead>
			<tr>
				<th><label style="float:left"><input type="checkbox" class="checkboxCtrl" group="ids" /></label>ID</th>
				<th>保险名称</th>
				<th>保险公司</th>
				<th>保险有效期（单位：天）</th>
				<th>保险产品编号</th>
				<th>保险类型</th>
				<th>操作</th>
			</tr>
		</thead>
		  <tbody> 
		  			<c:choose>
						<c:when test="${null==insuranceList||insuranceList.isEmpty()}">
							<tr class="tatr2">
								<td colspan="12" align="center">暂无数据</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${insuranceList}" var="insurance">
								<tr target="id" rel="${insurance.id}">
								<td>
									<input type="radio" name="ids" id="ids" value="${insurance.id}"/>${insurance.id}
								</td>
								<td>${insurance.name}</td>
								<td>${insurance.company}</td>
								<td>${insurance.validDate}</td>
								<td>${insurance.productId }</td>
								<td>${insuranceTypeMap[insurance.type]}</td>
								<td><a class="btnSelect" href="javascript:$.bringBack({relationId:'${insurance.id}',relationName:'${insurance.name}'})"
                       				title="查找带回">选择</a></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
		</tbody>
	</table>

    <div style="clear:both"></div>
    <div class="panelBar">
        <%@ include file="/inc/admin_pagination.jsp" %>
    </div>
</div>