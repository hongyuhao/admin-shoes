<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="${path }/admin/ucenter/taskInfo">
	<input type="hidden" name="itStartTime" value="${itStartTime }"/>
	<input type="hidden" name="gtEndTime" value="${gtEndTime }" />
	<input type="hidden" name="isLookup" value="${isLookup }" />
	<input type="hidden" name="eqActionType" value="${eqActionType }"/>
	<input type="hidden" name="eqTaskType" value="${eqTaskType }"/>
	<input type="hidden" name="pageNum" value="${pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${pageTurn.pageSize }" />
	<input type="hidden" name="eqExpandCode" value="${eqExpandCode }" />
	<input type="hidden" name="eqApplicablePlatformId" value="${eqApplicablePlatformId }" />
	<input type="hidden" name="eqLevelId" value="${eqLevelId }" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return dwzSearch(this, 'dialog');" action="${path }/admin/ucenter/taskInfo" method="post">
 		<input type="hidden" name="itStartTime" value="${itStartTime }"/>
 		<input type="hidden" name="rel" value="${rel }"/>
 		<input type="hidden" name="eqTaskType" value="${eqTaskType }"/>
		<input type="hidden" name="gtEndTime" value="${gtEndTime }" />
		<input type="hidden" name="isLookup" value="${isLookup }" />
		<input type="hidden" name="eqExpandCode" value="${eqExpandCode }" />
		<input type="hidden" name="eqApplicablePlatformId" value="${eqApplicablePlatformId }" />
		<input type="hidden" name="eqLevelId" value="${eqLevelId }" />
		<div class="searchBar">
			<table class="searchContent">
				<tr>                   
					<td>                                                                               
						动作类型：
					</td>
					<td>
						<select  name="eqActionType" id="eqActionType" class="combox">
							<option value="">请选择</option>
							<c:forEach items="${actionList}" var="entry">
								<option value="${entry.actionType}">${entry.actionName}</option>
							</c:forEach>
						</select>
					</td>
					<td>
						<div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div>
					</td>
				</tr>
			</table>
		</div>
	</form>
	<script type="text/javascript">
		$('#eqActionType').val("${eqActionType }");
	</script>
</div>
<div class="pageContent">
	<table class="table" width="100%" layoutH="90">
      	<thead>
			<tr>
				<th></th>
				<th>动作</th>
				<th>完成次数</th>
				<th>完成金额</th>
				<th>周期</th>
				<th>周期内最多次数</th>
				<th>有效时间</th>
				<th>图标url</th>
				<th>赠送积分</th>
				<th>赠送金额</th>
				<th>赠送优惠券</th>
				<th>备注</th>
			</tr>
		</thead>
		<tbody> 
  			<c:choose>
				<c:when test="${null==taskInfoList||taskInfoList.isEmpty()}">
					<tr class="tatr2">
						<td colspan="8" align="center">暂无数据</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${taskInfoList}" var="object">
						<tr>
							<td><a class="btnSelect" href="javascript:$.bringBack({taskId:'${object.id }', taskName:'${object.remark }'})">返回</a></td>
							<td>
								<c:forEach items="${actionList}" var="actionList">
									<c:if test="${object.actionType == actionList.actionType }">
									${actionList.actionName}
									</c:if>
								</c:forEach>
							</td>
							<td>${object.completeNum}</td>
							<td>${object.completeMoney}</td>
							<td>${taskCycleMap[object.cycle]}</td>
							<td>${object.numberUpperLimit}</td>
							<td><fmt:formatDate value="${object.startTime }" pattern="yyyy-MM-dd" />~
								<fmt:formatDate value="${object.endTime }" pattern="yyyy-MM-dd" />
							</td>
							<td><img alt="" src="${object.url }" width="50px;" height="50px;"></td>
							<td>${object.givePoint}</td>
							<td>${object.giveMoney}</td>
							<td>${object.giveCardName}</td>
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

