<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<div class="pageHeader">
	<div class="searchBar">
		<table class="searchContent">
			<tr>                   
				<td>子线id：${subFlowInfo.id }</td>
				<td>子线名称：${subFlowInfo.subFlowName }</td>
				<td>时间：<fmt:formatDate value="${subFlowInfo.startTime }" pattern="yyyy-MM-dd HH:mm" />~
						<fmt:formatDate value="${subFlowInfo.endTime }" pattern="yyyy-MM-dd HH:mm" /></td>
				<td>适用平台：${applicablePlatformMap[subFlowInfo.applicablePlatformId]}</td>
				<td>适用渠道：${expandCodeEnumTypeMap[subFlowInfo.expandCode]}</td>
				<td>适用会员等级：${userTypeMap[subFlowInfo.levelId]}</td>
			</tr>
		</table>
	</div>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="${path }/admin/permission/taskInfo/editRelation.do?rel=${rel}&eqSubFlowId=${eqSubFlowId}" rel="${rel}" target="dialog" width="750" height="200"><span>新增关系</span></a></li>
			<li><a class="delete" href="${path}/admin/permission/taskInfo/deleteRelation.do?rel=${rel}"
                   target="selectedTodo" postType="string" rel="ids" title="确定删除所选记录?"><span>删除关系</span> </a>
            </li>
			<li class="line">line</li>
		</ul>
	</div>

	<table class="table" width="100%" layoutH="90">
   		<thead>
			<tr>
				<th>ID<label style="float:left"><input type="checkbox" class="checkboxCtrl" group="ids" /></label></th>
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
				<th>序号</th>
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
							<td><input type="checkbox" name="ids" id="ids" value="${object.relationId}"/>${object.relationId}</td>
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
							<td><fmt:formatDate value="${object.startTime }" pattern="yyyy-MM-dd HH:mm" />~
								<fmt:formatDate value="${object.endTime }" pattern="yyyy-MM-dd HH:mm" />
							</td>
							<td><img alt="" src="${object.url }" width="50px;" height="50px;"></td>
							<td>${object.givePoint}</td>
							<td>${object.giveMoney}</td>
							<td>${object.giveCardName}</td>
							<td>${object.remark}</td>
							<td>${object.sequence}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
    <div style="clear:both"></div>
</div>

