<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="${path }/admin/ucenter/totalFlowInfo">
	<input type="hidden" name="likeTotalFlowName" value="${likeTotalFlowName }"/>
	<input type="hidden" name="gtStartTime" value="${gtStartTime }"/>
	<input type="hidden" name="itStartTime" value="${itStartTime }" />
	<input type="hidden" name="pageNum" value="${pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${pageTurn.pageSize }" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${path }/admin/ucenter/totalFlowInfo" method="post">
		<div class="searchBar">
			<table class="searchContent">
				<tr>                   
					<td>主线名称：</td>
                    <td><input type="text" name="likeTotalFlowName" value="${likeTotalFlowName }"/></td>
					<td>
						开始时间：
					</td>
					<td>
						<input type="text" value="${gtStartTime}" name="gtStartTime" class="date" dateFmt="yyyy-MM-dd HH:mm" readonly="true" style="float:left;"/>
						<a class="inputDateButton" href="javascript:;" style="float:left;">选择</a>
					</td>
					<td>
						结束时间：
					</td>
					<td>
						<input type="text" value="${itStartTime}" name="itStartTime" class="date" dateFmt="yyyy-MM-dd HH:mm" readonly="true" style="float:left;"/>
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
			<li><a class="add" href="${path }/admin/ucenter/totalFlowInfo/edit.do" rel="${rel}" target="dialog" width="750" height="500"><span>新增</span></a></li>
			<%--<li><a class="delete" href="${path}/admin/ucenter/totalFlowInfo/delete?rel=${rel}"
                   target="selectedTodo" rel="inIdList" title="确定删除所选记录?"><span>删除</span> </a>
            </li>--%>
			<li class="line">line</li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="115">
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
				<th>操作</th>
			</tr>
		</thead>
		<tbody> 
  			<c:choose>
				<c:when test="${null==totalFlowInfoList||totalFlowInfoList.isEmpty()}">
					<tr class="tatr2">
						<td colspan="8" align="center">暂无数据</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${totalFlowInfoList}" var="object">
						<tr>
							<td>${object.id}</td>
							<td>${object.totalFlowName}</td>
							<td><fmt:formatDate value="${object.startTime }" pattern="yyyy-MM-dd HH:mm" />~
								<fmt:formatDate value="${object.endTime }" pattern="yyyy-MM-dd HH:mm" />
							</td>	
							<td><img alt="" src="${object.url }" width="50px;" height="50px;"></td>
							<td>${object.remark }</td>
							<td>${applicablePlatformMap[object.applicablePlatformId]}</td>
							<td>${expandCodeEnumTypeMap[object.expandCode]}</td>
							<td>${userTypeMap[object.levelId]}</td>
							<td>
			                    <a href="${path }/admin/ucenter/totalFlowInfo/edit.do?id=${object.id}" target="dialog" width="800"
			                       height="600" rel="addDialog" title="编辑">编辑</a>
			                    <a href="${path }/admin/ucenter/subFlowInfo/listRelation.do?eqTotalFlowId=${object.id}&rel=subListRelation" target="navTab" rel="subListRelation" title="子线">子线</a>
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

