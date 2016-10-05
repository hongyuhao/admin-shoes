<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
	
</script>

<form id="pagerForm" method="post" action="${path }/admin/ucenter/userIntegralRecord">
	<input type="hidden" name="eqUserId" value="${eqUserId }"/>
	<input type="hidden" name="gtIntegralTime" value="${gtIntegralTime }"/>
	<input type="hidden" name="itIntegralTime" value="${itIntegralTime }" />
	<input type="hidden" name="pageNum" value="${pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${pageTurn.pageSize }" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${path }/admin/ucenter/userIntegralRecord" method="post">
		<input type="hidden" name="eqUserId" value="${eqUserId }"/>
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						时间查询：
					</td>
					<td>
						<input type="text" value="${gtIntegralTime}" name="gtIntegralTime" class="date" dateFmt="yyyy-MM-dd 00:00:00" readonly="true" style="float:left;"/>
						<a class="inputDateButton" href="javascript:;" style="float:left;">选择</a>
					</td>
					<td>
						<input type="text" value="${itIntegralTime}" name="itIntegralTime" class="date" dateFmt="yyyy-MM-dd 23:59:59" readonly="true" style="float:left;"/>
						<a class="inputDateButton" href="javascript:;" style="float:left;">选择</a>
					</td>
					<td>
						<div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div>
					</td>
				</tr>
			</table>
		</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="${path }/admin/ucenter/userIntegralBalance/edit.do?id=${eqUserId }" rel="${rel}" target="dialog" width="610" height="550"><span>修改用户积分</span></a></li>
			<li class="line">line</li>
		</ul>
	</div>

	<table class="table" width="100%" layoutH="115">
 		<thead>
			<tr>
				<th>用户</th>
				<th>积分</th>
				<th>获取方式</th>
				<th>处理时间</th>
				<th>平台</th>
				<th>渠道</th>
				<th>说明</th>
			</tr>
		</thead>
		<tbody> 
  			<c:choose>
				<c:when test="${null==userIntegralRecordList||userIntegralRecordList.isEmpty()}">
					<tr class="tatr2">
						<td colspan="8" align="center">暂无数据</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${userIntegralRecordList}" var="object">
					<tr>
						<td>${object.accountName}(${object.userId})</td>
						<td>${object.integralNum}</td>
						<td>${userIntegralRecordTypeMap[object.type]}</td>
						<td><fmt:formatDate value="${object.integralTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td>${applicablePlatformMap[object.applicablePlatformId]}</td>
						<td>${expandCodeEnumTypeMap[object.expandCode]}</td>
						<td>${object.remark}</td>
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