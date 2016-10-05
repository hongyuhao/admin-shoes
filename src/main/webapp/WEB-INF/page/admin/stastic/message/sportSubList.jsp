<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<%@ include file="/inc/drawChartLine.jsp"%>

<form id="pagerForm" onsubmit="return divSearch(this, '${targetTab}');" action="/admin/stastic/messageAlertSportInDay/subList?targetTab=${targetTab }" method="post">
	<input type="hidden" id="pageNum" name="pageNum" value="${pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${pageTurn.pageSize }" />
	<input type="hidden" name="end" id="end" value="${end}"  />
	<input type="hidden" name="start" id="start" value="${start}"/>
	<input type="hidden" name="rel" value="${rel }" />
</form>
<div class="pageContent" style="border-left:1px #B8D0D6 solid;border-right:1px #B8D0D6 solid">
	 <table class="table" width="100%" layoutH="425" rel="${targetTab }">
		<thead>
			<tr>
				<th>日期</th>
				<th>消息打开数</th>
				<th>总消息数</th>
				<th>打开率</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${null==messageAlertSportInDayList||messageAlertSportInDayList.isEmpty()}">
					<tr class="tatr2">
						<td colspan="11" align="center">暂无数据</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="message" items="${messageAlertSportInDayList}">
						<tr>
							<td><fmt:formatDate value="${message.createTime }" pattern="yyyy-MM-dd HH:mm" /></td>
							<td>
								${message.sumOpen}
							</td>
							<td>${message.sumAlert}</td>
							<td><fmt:formatNumber value="${message.sumOpen/(message.sumAlert)*100}" pattern="##.##" minFractionDigits="2" ></fmt:formatNumber>%</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>
<div style="clear:both"></div>
<div class="panelBar">
    <%@ include file="/inc/admin_pagination_ajax.jsp" %>
</div>

<script>
    $('#pagerForm').remove();
	$.ajax({
		type:'get',
		url:'/admin/stastic/messageAlertSportInDay/chart.json',
		dataType:'json',
		data: {
			start:'${start}',
			end:'${end}'
		},
		success: function(json){
			var dateList = json.dateList;
			var data = json.lineList;
			paintTrend(3, dateList, data, "chart_msg");
		}
	});
</script>