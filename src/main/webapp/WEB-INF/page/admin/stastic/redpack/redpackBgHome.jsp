<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<%@ include file="/inc/drawChartLine.jsp"%>
<form id="pagerForm" method="post" action="/admin/stastic/redpackBgInDay/home?dataTypeId=2&rel=redpackBg&flag=1">
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pageTurn.page?1:pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${numPerPage }" />
	<input type="hidden" value="${number}" name="number" />
	<input type="hidden" value="${end}" name="end" />
	<input type="hidden" name="start" value="${start}"/>
</form>
<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="/admin/stastic/redpackBgInDay/home?dataTypeId=2&rel=redpackBg&flag=1" method="post">
		<div class="searchBar">
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
	<div id="chart${rel }" style="min-width: 300px; height: 350px; margin: 0 auto"></div>
	<table class="table" width="100%" layoutH="435">
		<thead>
			<tr>
				<th>总红包个数</th>
				<th>总红包钱数</th>
				<th>统计时间</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${null==redpackBgInDayList||redpackBgInDayList.isEmpty()}">
					<tr class="tatr2">
						<td colspan="11" align="center">暂无数据</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="user" items="${redpackBgInDayList}">
						<tr target="id" rel="">
							<td>
								${user.sumRedpackNum}
							</td>
							<td>${user.sumRedpackMoney}</td>
							<td><fmt:formatDate value="${user.createTime }" pattern="yyyy-MM-dd HH:mm" /></td>
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
  
<script>
var urlMap = 
	{ 
	  1:"/admin/stastic/redpackBpInDay/chart.json",
	  2:"/admin/stastic/redpackBgInDay/chart.json",
	  3:"/admin/stastic/redpackWeightInDay/chart.json"
	};
	$.ajax({
		type:'get',
		url:urlMap['${dataTypeId }'],
		dataType:'json',
		data:{
			start:'${start}',
			end:'${end}'
		},
		success: function(json){
			var dateList = json.dateList;
			var data = json.lineList;
			paintTrend(5, dateList, data, "chart${rel }");
		}
	});

</script>
