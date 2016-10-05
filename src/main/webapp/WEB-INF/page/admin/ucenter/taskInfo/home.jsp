<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
	
</script>

<form id="pagerForm" method="post" action="${path }/admin/ucenter/taskInfo">
	<input type="hidden" name="eqId" value="${eqId }"/>
	<input type="hidden" name="eqTaskType" value="${eqTaskType }"/>
	<input type="hidden" name="eqActionType" value="${eqActionType }"/>
	<input type="hidden" name="eqCycle" value="${eqCycle }"/>
	<input type="hidden" name="pageNum" value="${pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${pageTurn.pageSize }" />
	<input type="hidden" name="eqLevelId" value="${eqLevelId }" />
	<input type="hidden" name="eqApplicablePlatformId" value="${eqApplicablePlatformId }" />
	<input type="hidden" name="eqExpandCode" value="${eqExpandCode }" />
	<input type="hidden" name="rel" value="${rel }" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${path }/admin/ucenter/taskInfo" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>                                                                               
					任务类型：
					<select  name="eqTaskType" id="eqTaskType">
						<option value="">请选择</option>
						<c:forEach items="${taskTypeMap}" var="entry">
							<option value="${entry.key}">${entry.value}</option>
						</c:forEach>
					</select>
				</td>
				<td>                                                                               
					动作类型：
					<select  name="eqActionType" id="eqActionType">
						<option value="">请选择</option>
						<c:forEach items="${actionList}" var="entry">
							<option value="${entry.actionType}">${entry.actionName}</option>
						</c:forEach>
					</select>
				</td>
				<td>                                                                               
					周期：
					<select  name="eqCycle" id="eqCycle">
						<option value="">请选择</option>
						<c:forEach items="${taskCycleMap}" var="entry">
							<option value="${entry.key}">${entry.value}</option>
						</c:forEach>
					</select>
				</td>
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
					适用渠道：
					<select id="eqExpandCode" name="eqExpandCode">
						<option value="">请选择</option>
						<c:forEach var="object" items="${expandCodeEnumTypeMap}">
							<option value="${object.key }">${object.value }</option>
						</c:forEach>
					</select>
				</td>
				<td>
					<div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div>
				</td>
			</tr>
		</table>
		<script type="text/javascript">
			$('#eqTaskType').val("${eqTaskType }");
			$('#eqActionType').val("${eqActionType }");
			$('#eqCycle').val("${eqCycle }");
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
			<li><a class="add" href="${path }/admin/ucenter/taskInfo/edit.do?rel=${rel}" rel="${rel}" target="dialog" width="800" height="550"><span>添加</span></a></li>
			<li><a class="delete" href="${path }/admin/ucenter/taskInfo/delete.do?rel=${rel}" target="selectedTodo" rel="ids" title="只有未启用和过期的任务才能删除,确定删除?"><span>删除</span></a></li>
			<li class="line">line</li>
		</ul>
	</div>

		<table class="table" width="130%" layoutH="138">
            <thead>
			<tr>
				<th>ID<!-- <label style="float:left"><input type="checkbox" class="checkboxCtrl" group="ids" /></label> --></th>
				<th>任务类型</th>
				<th>任务状态</th>
				<th>动作</th>
				<th>完成次数</th>
				<th>完成金额</th>
				<th>周期</th>
				<th>周期内最多次数</th>
				<th>连续天数</th>
				<th>有效时间</th>
				<th>图标url</th>
				<th>赠送积分</th>
				<th>赠送金额</th>
				<th>赠送优惠券</th>
				<th>赠送微信红包</th>
				<th>标题</th>
				<th>领取类型</th>
				<th>卡券类型</th>
				<th>领取策略</th>
				<th>领取总量</th>
				<th>可领取量</th>
				<th>适用开放平台</th>
				<th>适用平台</th>
				<th>适用渠道</th>
				<th>适用用户等级</th>
				<th>操作</th>
			</tr>
		</thead>
		  <tbody> 
  			<c:choose>
				<c:when test="${null==taskInfoList||taskInfoList.isEmpty()}">
					<tr class="tatr2">
						<td colspan="14" align="center">暂无数据</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${taskInfoList}" var="object">
						<tr target="id" rel="${object.id}">
							<td>
								<input type="radio" name="ids" id="ids" value="${object.id}"/>${object.id}
							</td>
							<td>${taskTypeMap[object.taskType]}</td>
							<td>${taskActionStatusMap[object.status]}</td>
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
							<td>${object.days}</td>
							<td><fmt:formatDate value="${object.startTime }" pattern="yyyy-MM-dd HH:mm" />~
								<fmt:formatDate value="${object.endTime }" pattern="yyyy-MM-dd HH:mm" />
							</td>
							<td><img alt="" src="${object.url }" width="50px;" height="50px;"></td>
							<td>${object.givePoint}</td>
							<td>${object.giveMoney}</td>
							<td>${object.giveCardName}</td>
							<td>${object.giveRedPacketName}</td>
							<td>${object.title}</td>
							<td>${taskGetTypeMap[object.getType]}</td>
							<td>${object.cardType}</td>
							<td>${taskGetStrategyMap[object.getStrategy]}</td>
							<td>${object.getSum}</td>
							<td>${object.getNum}</td>
							<td>${openPlatformMap[object.openPlatformId] }</td>
							<td>${applicablePlatformMap[object.applicablePlatformId]}</td>
							<td>${expandCodeEnumTypeMap[object.expandCode]}</td>
							<td>${userTypeMap[object.levelId]}</td>
							<td>
<%-- 								<c:forEach items="${actionList}" var="actionList"> --%>
<%-- 									<c:if test="${object.actionType == actionList.actionType }"> --%>
										<c:if test="${object.status == 1 }">
											<a title="修改" target="dialog" href="${path}/admin/ucenter/taskInfo/edit?id=${object.id}&rel=${rel}" rel="${rel}"  width="800" height="550"><span>修改</span></a>&nbsp;
										</c:if>
<%-- 									</c:if> --%>
<%-- 								</c:forEach> --%>
								<a title="查看" target="_blank" href="${object.taskUrl}"><span>查看</span></a>	
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

