<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="${path }/admin/ucenter/subFlowInfo">
	<input type="hidden" name="likeSubFlowName" value="${likeSubFlowName }"/>
	<input type="hidden" name="itStartTime" value="${itStartTime }"/>
	<input type="hidden" name="gtEndTime" value="${gtEndTime }" />
	<input type="hidden" name="isLookup" value="${isLookup }" />
	<input type="hidden" name="pageNum" value="${pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${pageTurn.pageSize }" />
	<input type="hidden" name="eqExpandCode" value="${eqExpandCode }" />
	<input type="hidden" name="eqApplicablePlatformId" value="${eqApplicablePlatformId }" />
	<input type="hidden" name="eqLevelId" value="${eqLevelId }" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return dwzSearch(this, 'dialog');" action="${path }/admin/ucenter/subFlowInfo" method="post">
		<input type="hidden" name="itStartTime" value="${itStartTime }"/>
		<input type="hidden" name="gtEndTime" value="${gtEndTime }" />
		<input type="hidden" name="isLookup" value="${isLookup }" />
		<input type="hidden" name="eqExpandCode" value="${eqExpandCode }" />
		<input type="hidden" name="eqApplicablePlatformId" value="${eqApplicablePlatformId }" />
		<input type="hidden" name="eqLevelId" value="${eqLevelId }" />
		<div class="searchBar">
			<table class="searchContent">
				<tr>                   
					<td>子线名称：</td>
                    <td><input type="text" name="likeSubFlowName" value="${likeSubFlowName }"/></td>
					<td>
						<div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div>
					</td>
				</tr>
			</table>
		</div>
	</form>
</div>
<div class="pageContent">
	<table class="table" width="100%" layoutH="90">
      	<thead>
			<tr>
				<th></th>
				<th>名称</th>
				<th>有效时间</th>
				<th>图标</th>
				<th>备注</th>
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
							<td><a class="btnSelect" href="javascript:$.bringBack({subFlowId:'${object.id }', subFlowName:'${object.subFlowName }'})">返回</a></td>
							<td>${object.subFlowName}</td>
							<td><fmt:formatDate value="${object.startTime }" pattern="yyyy-MM-dd HH:mm" />~
								<fmt:formatDate value="${object.endTime }" pattern="yyyy-MM-dd HH:mm" />
							</td>	
							<td><img alt="" src="${object.url }" width="50px;" height="50px;"></td>
							<td>${object.remark }</td>
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

