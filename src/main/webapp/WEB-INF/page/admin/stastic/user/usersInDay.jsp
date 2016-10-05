<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<%@ include file="/inc/drawChartLine.jsp"%>

<div class="pageHeader">
	<table class="list" width="100%" >
		<thead>
			<tr>
				<th>新增用户（昨日）</th>
				<th>激活用户（昨日）</th>
				<th>活跃用户（昨日）</th>
				<th>总用户数（昨日）</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${null==usersInDay}">
					<tr class="tatr2">
						<td colspan="11" align="center">暂无数据</td>
					</tr>
				</c:when>
				<c:otherwise>

					<tr>
						<td>${usersInDay.addedUsers }</td>
						<td>${usersInDay.activationUsers}</td>
						<td>${usersInDay.activeUsers }</td>
						<td>${usersInDay.sumUsers }</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>
<div class="pageContent">
<input type="button" style="width:200px;height:42px;font-size:16px" value="新增用户" onclick="getUsersInDay('added_users')"; />
<input type="button" style="width:200px;height:42px;font-size:16px" value="激活用户" onclick="getUsersInDay('activation_users')"; />
<input type="button" style="width:200px;height:42px;font-size:16px" value="活跃用户" onclick="getUsersInDay('active_users')"; />
<input type="button" style="width:200px;height:42px;font-size:16px" value="总用户数" onclick="getUsersInDay('sum_users')"; />
<div id="chart${rel }" style="min-width: 300px; height: 400px; margin: 0 auto">
<script type="text/javascript">
getUsersInDay('added_users');
function getUsersInDay(type){
	var sumDay = 30;
	$.ajaxSettings.global=false;
	$.ajax({
		type: 'get',
		url: '/admin/stastic/usersInDay/chart.json',
		dataType: 'json',
		data: {
			type:type,
			sumDay:sumDay,
			rel:"${rel}"
		},
		success: function(json){
			var dateList = json.dateList;
			var lineList = json.lineList;
			paintTrend(1, dateList, lineList, "chart${rel }");
		}
	});
	$.ajaxSettings.global=true;
}
</script>
</div>
</div>
