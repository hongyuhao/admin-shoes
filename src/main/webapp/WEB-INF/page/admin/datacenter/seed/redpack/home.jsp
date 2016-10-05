<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="/admin/datacenter/seedUserRedpackRecord">
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pageTurn.page?1:pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${numPerPage }" />
	<input type="hidden" value="${eqUserId}" name="eqUserId" />
	<input type="hidden" value="${eqDataTypeId}" name="eqDataTypeId" />
	<input type="hidden" name="rel" value="${rel}"/>
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="/admin/datacenter/seedUserRedpackRecord" method="post">
	<input type="hidden" name="rel" value="${rel}"/>
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					用户Id: <input type="text" value="${eqUserId}" name="eqUserId"></input>
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
	<div class="panelBar">
		<!-- <ul class="toolBar">
			<li><a class="add" href="/admin/datacenter/userObtainInfo/edit" target="dialog" rel="editTag" mask="true" title="新增" width="620" height="500"><span>新增</span></a></li>
			<li><a class="delete" href="/admin/datacenter/userObtainInfo/delete" target="selectedTodo" rel="inIdList" title="确定删除?"><span>删除</span></a></li>
		</ul> -->
	</div>
	<table class="list" width="100%" layoutH="100">
		<thead>
			<tr>
				<th>ID<label style="float:left"><input type="checkbox" class="checkboxCtrl" group="inIdList" /></label></th>	
				<th>用户Id</th>
				<th>获取红包</th>
				<th>活动Id</th>
				<th>device_id</th>
				<th>发送红包时间</th>
			</tr>
		</thead>
		<tbody>
				<c:choose>
					<c:when test="${null==seedUserRedpackRecordList||seedUserRedpackRecordList.isEmpty()}">
						<tr class="tatr2">
							<td colspan="11" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="o" items="${seedUserRedpackRecordList}">
							<tr target="id" rel="${o.id}">
								<td>
									<input type="checkbox" name="inIdList" id="inIdList" value="${o.id}"/>${o.id}
								</td>
								<td>${o.userId}</td>
								<td>${(o.money*0.01) }</td>
								<td>${o.activityId}</td>
								<td>${o.deviceId}</td>
								<td><fmt:formatDate value="${o.sendTime }" pattern="yyyy-MM-dd HH:mm" /></td>
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