<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="#rel#">
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pageTurn.page?1:pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${numPerPage }" />
	<input type="hidden" name="rel" value="${rel}"/>
	<input type="hidden" name="eqDataTypeId" value="${eqDataTypeId}"/>
	<input type="hidden" name="isLookup" value="${isLookup}"/>
</form>
<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return dwzSearch(this, 'dialog');" action="/admin/datacenter/dataConclusionsInfo/list?isLookup=1" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					等级: <input type="text" value="${likeLevel}" name="likeLevel" ></input>
				</td>
				<td>
					<div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div>
				</td>
			</tr>
		</table>
	</div>
	</form>
</div>
<div class="pageContent">
    <div layoutH="60">
		<table class="list" width="100%"  targetType="dialog">
			<thead>
				<tr>
					<th>级别</th>
					<th width="10">查找带回</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${null==dataConclusionsInfoList||dataConclusionsInfoList.isEmpty()}">
						<tr class="tatr2">
							<td colspan="11" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="o" items="${dataConclusionsInfoList}">
							<tr target="id" rel="${o.id}">
								<td>${o.level}</td>
								<td><a class="btnSelect" href="javascript:$.bringBack({level:'${o.level}'})" title="查找带回">选择</a></td>
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
