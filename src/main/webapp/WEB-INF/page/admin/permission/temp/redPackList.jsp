<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
	
</script>
<form id="pagerForm" method="post" action="${path}/admin/permission/taskInfo/redPackList">
    <input type="hidden" name="pageNum" value="${pageTurn.page}"/>
    <input type="hidden" name="numPerPage" value="${pageTurn.pageSize}"/>
</form>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
		</ul>
	</div>
	<table class="table" width="100%" layoutH="90">
   		<thead>
			<tr>
				<th><label style="float:left"><input type="checkbox" class="checkboxCtrl" group="ids" /></label>ID</th>
				<th>红包名称</th>
				<th>开始时间</th>
				<th>结束时间</th>
				<th>创建时间</th>
				<th>操作</th>
			</tr>
		</thead>
		  <tbody> 
		  			<c:choose>
						<c:when test="${null==redPackList||redPackList.isEmpty()}">
							<tr class="tatr2">
								<td colspan="12" align="center">暂无数据</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${redPackList}" var="pack">
								<tr target="id" rel="${pack.id}">
								<td>${pack.actName}</td>
								<td>${ucenter:dateFormat(pack.startTime,"yyyy-MM-dd HH:mm:ss") }</td>
								<td>${ucenter:dateFormat(pack.endTime,"yyyy-MM-dd HH:mm:ss") }</td>
								<td>${ucenter:dateFormat(pack.createTime,"yyyy-MM-dd HH:mm:ss") }</td>
								<td><a class="btnSelect" href="javascript:$.bringBack({giveRedPacketId:'${pack.id}',giveRedPacketName:'${pack.actName}'})"
                       				title="查找带回">选择</a></td>
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

