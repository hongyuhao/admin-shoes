<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<%@ include file="/inc/drawChartLine.jsp"%>
<form id="pagerForm" method="post" action="/admin/stastic/user/activation/list?rel=activation&type=activation_users">
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pageTurn.page?1:pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${numPerPage }" />
	<input type="hidden" value="${number}" name="number" />
	<input type="hidden" name="end" value="${end}" />
	<input type="hidden" name="start" value="${start}"/>
</form>
<div class="pageHeader">
	<tr>
		<td>
			总用户数: <span id ="sum${rel }"></span>
		</td>
	</tr>
	<form onsubmit="return navTabSearch(this);" action="/admin/stastic/user/activation/list?rel=activation&type=activation_users" method="post">
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						今日激活用户数: <span id ="num${rel }"></span>
					</td>
					<td>
						开始时间: <input type="text" name="start" class="date" dateFmt="yyyy-MM-dd" value="${start}" style="width:180px"/>
 
					</td>
					<td>
						结束时间: <input type="text" name="end" class="date" dateFmt="yyyy-MM-dd" value="${end}" style="width:180px"/>
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
	<div id="chart${rel }" style="min-width: 300px; height: 340px; margin: 0 auto"></div>
	<table class="table" width="100%" layoutH="438">
		<thead>
			<tr>
				<th>用户ID</th>
				<th>用户昵称</th>
				<th>来源渠道</th>
				<th>邀请人ID</th>
				<th>注册时间</th>
				<th>关注公众号时间</th>
				<th>取消关注时间</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${null==userActionDetailList||userActionDetailList.isEmpty()}">
					<tr class="tatr2">
						<td colspan="11" align="center">暂无数据</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="user" items="${userActionDetailList}">
						<tr target="id" rel="${user.userId}">
							<td>
								${user.userId}
							</td>
							<td>${user.nickName}</td>
							<td>${user.channelCode}</td>
							<td>${user.senderUserId}</td>
							<td><fmt:formatDate value="${user.registerTime }" pattern="yyyy-MM-dd HH:mm" /></td>
							<td><fmt:formatDate value="${user.mpFollowTime }" pattern="yyyy-MM-dd HH:mm" /></td>
							<td><fmt:formatDate value="${user.mpUnfollowTime }" pattern="yyyy-MM-dd HH:mm" /></td>
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
var	start = '${start }';
var	end = '${end }';
	$.ajax({
		type:'get',
		url:'/admin/stastic/usersInDay/chart.json',
		dataType:'json',
		data:{
			type:'${type}',
			start:start,
			end:end
		},
		success: function(json){
			var dateList = json.dateList;
			var data = json.lineList;
			paintTrend(1, dateList, data, "chart${rel }");
		}
	});

	$.ajax({
		type:'get',
		url:"/admin/stastic/user/actionDetail/count.json",
		dataType:'json',
		data:{type:2},
		success: function(json){
			$("#num${rel }").html(json.num);
			$("#sum${rel }").html(json.sum);
		}
	});
</script>