<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
	
</script>
<form id="pagerForm" method="post" action="${path}/admin/ucenter/taskInfo/promotionList?sendCardType=2&showType=2">
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
				<th>卡劵名称</th>
				<th>卡劵类型</th>
				<th>优惠金额</th>
				<th>最低消费</th>
				<th>开始时间</th>
				<th>结束时间</th>
				<th>创建时间</th>
				<th>领取次数</th>
				<th>操作</th>
			</tr>
		</thead>
		  <tbody> 
		  			<c:choose>
						<c:when test="${null==promotionList||promotionList.isEmpty()}">
							<tr class="tatr2">
								<td colspan="12" align="center">暂无数据</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${promotionList}" var="card">
								<tr target="id" rel="${card.id}">
								<td>
									<input type="radio" name="ids" id="ids" value="${card.id}"/>${card.id}
								</td>
								<td>${card.title}</td>
								<td>${card.isWechatCard == 1 ? '微信卡券':'普通卡券'}</td>
								<td>${card.reduceValue}</td>
								<td>${card.leastCost}</td>
								<td>${ucenter:dateFormat(card.beginTime,"yyyy-MM-dd HH:mm:ss") }</td>
								<td>${ucenter:dateFormat(card.endTime,"yyyy-MM-dd HH:mm:ss") }</td>
								<td>${ucenter:dateFormat(card.createDate,"yyyy-MM-dd HH:mm:ss") }</td>
								<td>${card.getLimit}</td>
								<td><a class="btnSelect" href="javascript:$.bringBack({giveCardId:'${card.id}',giveCardName:'${card.title}',cardType:'${card.isWechatCard }',wxCardId:'${card.wxCardId }'})"
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

