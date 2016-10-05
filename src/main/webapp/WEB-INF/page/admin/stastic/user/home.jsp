<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="/admin/stastic/user/stastic">
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pageTurn.page?1:pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${numPerPage }" />
	<input type="hidden" value="${number}" name="number" />
	<input type="hidden" value="${endTime}" name="endTime" />
	<input type="hidden" name="startTime" value="${startTime}"/>
</form>
<link rel="stylesheet" type="text/css" href="css/easyui.css">
<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="/admin/stastic/user/stastic" method="post">
		<input type="hidden" name="rel" value="${rel}"/>
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						开始时间: <input  type="text" name="startTime" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${startTime}" style="width:180px"/>
 
					</td>
					<td>
						结束时间: <input  type="text" name="endTime" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${endTime}" style="width:180px"/>
					</td>
					<td>
						家庭成员数＞<input type="text" value="${number}" name="number"></input>
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
			<li><a class="add" href="/admin/stastic/userObtainInfo/edit" target="dialog" rel="editTag" mask="true" title="新增" width="620" height="500"><span>新增</span></a></li>
			<li><a class="delete" href="/admin/stastic/userObtainInfo/delete" target="selectedTodo" rel="inIdList" title="确定删除?"><span>删除</span></a></li>
		</ul> -->
	</div>
	<table class="list" width="100%" layoutH="100">
		<thead>
			<tr>
				<th>家主名称</th>
				<th>家庭成员数</th>
				<th>注册时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
				<c:choose>
					<c:when test="${null==familyList||familyList.isEmpty()}">
						<tr class="tatr2">
							<td colspan="11" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="family" items="${familyList}">
							<tr target="id" rel="${family.id}">
								<td>
									<%-- <img src = "${family.imgUrl }" width="100" height="100"></img> --%>
									${family.name}
								</td>
								<td>${family.memberNumber}</td>
								<td><fmt:formatDate value="${family.createTime }" pattern="yyyy-MM-dd HH:mm" /></td>
								<td>
									<a title="查看明细" target="dialog" href="${path}/user/stastic/user/attention/family?userId=${family.userId}&imgUrl=${family.imgUrl }&name=${family.name}" width="950" height="600"><span>查看明细</span></a>
								</td>
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