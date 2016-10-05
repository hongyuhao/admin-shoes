<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<div class="pageHeader">
	<div class="searchBar">
		<table class="searchContent">
			<tr>                   
				<td>主线id：${totalFlowInfo.id }</td>
				<td>主线名称：${totalFlowInfo.totalFlowName }</td>
				<td>时间：<fmt:formatDate value="${totalFlowInfo.startTime }" pattern="yyyy-MM-dd HH:mm" />~
								<fmt:formatDate value="${totalFlowInfo.endTime }" pattern="yyyy-MM-dd HH:mm" /></td>
				<td>适用平台：${applicablePlatformMap[totalFlowInfo.applicablePlatformId]}</td>
				<td>适用渠道：${expandCodeEnumTypeMap[totalFlowInfo.expandCode]}</td>
				<td>适用会员等级：${userTypeMap[totalFlowInfo.levelId]}</td>
			</tr>
		</table>
	</div>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="${path }/admin/ucenter/subFlowInfo/editRelation.do?rel=${rel}&eqTotalFlowId=${eqTotalFlowId}" rel="${rel}" target="dialog" width="750" height="200"><span>新增关系</span></a></li>
			<li><a class="delete" href="${path}/admin/ucenter/subFlowInfo/deleteRelation.do?rel=${rel}"
                   target="selectedTodo" postType="string" rel="ids" title="确定删除所选记录?"><span>删除关系</span> </a>
            </li>
			<li class="line">line</li>
		</ul>
	</div>

	<table class="table" width="100%" layoutH="90">
      	<thead>
			<tr>
				<th>ID<label style="float:left"><input type="checkbox" class="checkboxCtrl" group="ids" /></label></th>
				<th>名称</th>
				<th>有效时间</th>
				<th>图标</th>
				<th>备注</th>
				<th>序号</th>
				<th>任务</th>
			</tr>
		</thead>
		<tbody> 
  			<c:choose>
				<c:when test="${null==subFlowInfoList||subFlowInfoList.isEmpty()}">
					<tr class="tatr2">
						<td colspan="8" align="center">暂无数据</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${subFlowInfoList}" var="object">
						<tr>
							<td><input type="checkbox" name="ids" id="ids" value="${object.relationId}"/>${object.relationId}</td>
							<td>${object.subFlowName}</td>
							<td><fmt:formatDate value="${object.startTime }" pattern="yyyy-MM-dd HH:mm" />~
								<fmt:formatDate value="${object.endTime }" pattern="yyyy-MM-dd HH:mm" />
							</td>	
							<td><img alt="" src="${object.url }" width="50px;" height="50px;"></td>
							<td>${object.remark }</td>
							<td>${object.sequence }</td>
							<td>
			                   <a href="${path }/admin/ucenter/taskInfo/listRelation.do?eqSubFlowId=${object.id}&rel=taskListRelation" target="navTab" rel="taskListRelation" title="子线任务">任务</a>
			                </td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
    <div style="clear:both"></div>
</div>

