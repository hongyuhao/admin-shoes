<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<%@ include file="/inc/drawChartLine.jsp"%>
<form id="pagerForm" method="post" action="/admin/stastic/measure?dataTypeId=${dataTypeId }">
	<input type="hidden" id="pageNum" name="pageNum" value="${pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${pageTurn.pageSize }" />
	<input type="hidden" name="end" value="${end}"  />
	<input type="hidden" name="start" value="${start}"/>
	<input type="hidden" name="rel" value="${rel}"/>
	<input type="hidden" name="recordMode" value="${recordMode}"/>
</form>

<div class="pageContent" >
	<div class="pageHeader">
		<form onsubmit="return navTabSearch(this);" action="/admin/stastic/measure?dataTypeId=${dataTypeId }&rel=${rel}" method="post">
			<div class="searchBar">
				<table class="searchContent">
					<tr>
						<td>测量方式：<select name="recordMode">
									<option value="0" ${recordMode==0? 'selected':'' }>全部</option>
									<option value="1" ${recordMode==1? 'selected':'' }>手动填写</option>
									<option value="2" ${recordMode==2? 'selected':'' }>云服务同步</option>
									<option value="3" ${recordMode==3? 'selected':'' }>微信设备同步</option>
									</select></td>
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
		<div id="chart${rel }" style="min-width: 300px; height: 300px;"></div>
		<table class="table" width="100%" layoutH="400">
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
</div>

  
<script>
var urlMap = 
	{ 0:"/admin/stastic/testInDay/chart.json",
	  1:"/admin/stastic/testBpInDay/chart.json",
	  2:"/admin/stastic/testBgInDay/chart.json",
	  3:"/admin/stastic/testWeightInDay/chart.json"
	};
	$.ajax({
		type:'get',
		url:urlMap['${dataTypeId }'],
		dataType:'json',
		data:{'type':'${recordMode}',
			'start':'${start}',
			'end': '${end}'},
		success: function(json){
			var dateList = json.dateList;
			var data = json.lineList;
			paintTrend(2, dateList, data, "chart${rel }");
		}
	});

</script>
