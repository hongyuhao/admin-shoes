<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<%@ include file="/inc/drawChartLine.jsp"%>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="/admin/stastic/activityStastic" method="post">
		<div class="searchBar">
			<input type="hidden" value="${rel }" name="${rel }"/>
			<table class="searchContent">
				<tr>
				
					<td>
						开始时间: <input  type="text" name="start" class="date" dateFmt="yyyy-MM-dd" value="${start}" style="width:180px"/>
 
					</td>
					<td>
						结束时间: <input  type="text" name="end" class="date" dateFmt="yyyy-MM-dd" value="${end}" style="width:180px"/>
					</td>
					<td>
						<div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div>
					</td>
				</tr>
			</table>
		</div>
	</form>
</div>
<div class="pageContent" >
	<div id="chart${rel }" style="min-width: 300px; height: 400px; margin: 0 auto"></div>
</div>
<script>
	$.ajax({
		type:'get',
		url:'/admin/stastic/activityStastic/chart.json',
		dataType:'json',
		data:{
			start:'${start}',
			end:'${end}'
		},
		success: function(json){
			var dateList = json.multipleChart.dateList;
			var data = json.multipleChart.lineList;
			paintTrend(6, dateList, data,"chart${rel }");
		}
	});

</script>
