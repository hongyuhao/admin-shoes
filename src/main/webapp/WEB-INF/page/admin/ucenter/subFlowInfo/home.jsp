<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="${path }/admin/ucenter/subFlowInfo">
	<input type="hidden" name="likeSubFlowName" value="${likeSubFlowName }"/>
	<input type="hidden" name="gtStartTime" value="${gtStartTime }"/>
	<input type="hidden" name="itStartTime" value="${itStartTime }" />
	<input type="hidden" name="pageNum" value="${pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${pageTurn.pageSize }" />
	<input type="hidden" name="eqLevelId" value="${eqLevelId }" />
	<input type="hidden" name="eqApplicablePlatformId" value="${eqApplicablePlatformId }" />
	<input type="hidden" name="eqExpandCode" value="${eqExpandCode }" />
	<input type="hidden" name="rel" value="${rel }" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${path }/admin/ucenter/subFlowInfo" method="post">
		<div class="searchBar">
			<table class="searchContent">
				<tr>                   
					<td>子线名称：<input type="text" name="likeSubFlowName" value="${likeSubFlowName }"/></td>
					<td>                                                                               
						适用用户等级：
						<select id="eqLevelId" name="eqLevelId">
							<option value="">请选择</option>
							<c:forEach var="object" items="${userTypeMap}">
								<option value="${object.key }">${object.value }</option>
							</c:forEach>
						</select>
					</td>
					<td>                                                                               
						适用平台：
						<select id="eqApplicablePlatformId" name="eqApplicablePlatformId">
							<option value="">请选择</option>
							<c:forEach var="object" items="${applicablePlatformMap}">
								<option value="${object.key }">${object.value }</option>
							</c:forEach>
						</select>
					</td>
					<td>
						适用渠道：
						<select id="eqExpandCode" name="eqExpandCode">
							<option value="">请选择</option>
							<c:forEach var="object" items="${expandCodeEnumTypeMap}">
								<option value="${object.key }">${object.value }</option>
							</c:forEach>
						</select>
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td>
						开始时间：
					</td>
					<td>
						<input type="text" value="${gtStartTime}" name="gtStartTime" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true" style="float:left;"/>
						<a class="inputDateButton" href="javascript:;" style="float:left;">选择</a>
					</td>
					<td>
						结束时间：
					</td>
					<td>
						<input type="text" value="${itStartTime}" name="itStartTime" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true" style="float:left;"/>
						<a class="inputDateButton" href="javascript:;" style="float:left;">选择</a>
					</td>
					<td>
						<div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div>
					</td>
				</tr>
			</table>
			<script type="text/javascript">
				$("#eqLevelId").val("${eqLevelId}");
				$("#eqApplicablePlatformId").val("${eqApplicablePlatformId}");
				$("#eqExpandCode").val("${eqExpandCode}");
			</script>
		</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="${path }/admin/ucenter/subFlowInfo/edit.do" rel="${rel}" target="dialog" width="750" height="400"><span>新增</span></a></li>
			<%--<li><a class="delete" href="${path}/admin/ucenter/subFlowInfo/delete?rel=${rel}"
                   target="selectedTodo" rel="inIdList" title="确定删除所选记录?"><span>删除</span> </a>
            </li>--%>
			<li class="line">line</li>
		</ul>
	</div>

	<table class="table" width="100%" layoutH="135">
            <thead>
			<tr>
				<th></th>
				<th>名称</th>
				<th>有效时间</th>
				<th>图标</th>
				<th>备注</th>
				<th>适用平台</th>
				<th>适用渠道</th>
				<th>适用用户等级</th>
				<th>赠送积分</th>
				<th>赠送金额</th>
				<th>赠送优惠券</th>
				<th>操作</th>
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
							<td>${object.id}</td>
							<td>${object.subFlowName}</td>
							<td><fmt:formatDate value="${object.startTime }" pattern="yyyy-MM-dd HH:mm" />~
								<fmt:formatDate value="${object.endTime }" pattern="yyyy-MM-dd HH:mm" />
							</td>	
							<td><img alt="" src="${object.url }" width="50px;" height="50px;"></td>
							<td>${object.remark }</td>
							<td>${applicablePlatformMap[object.applicablePlatformId]}</td>
							<td>${expandCodeEnumTypeMap[object.expandCode]}</td>
							<td>${userTypeMap[object.levelId]}</td>
							<td>${object.givePoint}</td>
							<td>${object.giveMoney}</td>
							<td>${object.giveCardName}</td>
							<td>
			                    <a href="${path }/admin/ucenter/subFlowInfo/edit.do?id=${object.id}" target="dialog" width="800"
			                       	height="400" rel="addDialog" title="编辑">编辑</a>
			                    <a href="${path }/admin/ucenter/taskInfo/listRelation.do?eqSubFlowId=${object.id}&rel=taskListRelation"
			                    	target="navTab" rel="taskListRelation" title="子线任务">任务</a>
			                </td>
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

