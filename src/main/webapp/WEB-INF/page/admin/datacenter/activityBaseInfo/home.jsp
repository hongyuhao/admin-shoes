<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="/admin/datacenter/activityBaseInfo">
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pageTurn.page?1:pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${numPerPage }" />
	<input type="hidden" name="eqActivityStatus" value="${activityStatus }" />
	<input type="hidden" name="rel" value="${rel}"/>
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="/admin/datacenter/activityBaseInfo" method="post">
	<input type="hidden" name="rel" value="${rel}"/>
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					<label>活动状态:</label>
                    <select name="eqActivityStatus" id="activityStatus">
                        <option value="">不限</option>
                        <c:forEach items="${activityStatusMap}" var="entry">
                            <option value="${entry.key}">${entry.value}</option>
                        </c:forEach>
                    </select>
                    <script type="text/javascript">
                    	jQuery('#activityStatus').val("${eqActivityStatus }");
                    </script>
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
	   <ul class="toolBar">
	      <li><a class="add" href="/admin/datacenter/activityBaseInfo/edit" target="dialog" rel="editTag" mask="true" title="新增" width="620" height="500"><span>新增</span></a></li>
	      <li><a class="delete" href="/admin/datacenter/activityBaseInfo/audit?activityStatus=${DELETE }&rel=${rel}" target="selectedTodo" rel="inIdList" title="确定删除?"><span>删除</span></a></li>
		  <li><a class="icon" href="/admin/datacenter/activityBaseInfo/audit?activityStatus=${NORMAL }&rel=${rel}" target="selectedTodo" rel="inIdList" title="确定恢复正常状态?"><span>恢复正常</span></a></li>
		  <li><a class="icon" href="/admin/datacenter/activityBaseInfo/audit?activityStatus=${UNNORMAL }&rel=${rel}" target="selectedTodo" rel="inIdList" title="确定设为未开始状态?"><span>未开始</span></a></li>
		  <li><a class="icon" href="/admin/datacenter/activityBaseInfo/audit?activityStatus=${EXPIRATION }&rel=${rel}" target="selectedTodo" rel="inIdList" title="确定进行过期处理?"><span>过期</span></a></li>
	   </ul>
	</div>
	<table class="list" width="100%" layoutH="85">
		<thead>
			<tr>
				<th>id<label style="float:left"><input type="checkbox" class="checkboxCtrl" group="inIdList" /></label></th>	
				<th>名称</th>
				<th>合作方ID</th>
				<th>描述</th>
				<th>创建时间</th>
				<th>开始时间</th>
				<th>结束时间</th>
				<th>状态</th>
				<th>首页</th>
				<th>类型</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
				<c:choose>
					<c:when test="${null==activityBaseInfoList||activityBaseInfoList.isEmpty()}">
						<tr class="tatr2">
							<td colspan="11" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="o" items="${activityBaseInfoList}">
							<tr target="id" rel="${o.id}">
								<td>
									<input type="checkbox" name="inIdList" id="inIdList" value="${o.id}"/>${o.id}
								</td>
								<td>${o.activityName}</td>
								<td>${o.partnerId}</td>
								<td>${o.activityDesc}</td>
								<td><fmt:formatDate value="${o.createTime }" pattern="yyyy-MM-dd HH:mm" /></td>
								<td><fmt:formatDate value="${o.startTime }" pattern="yyyy-MM-dd HH:mm" /></td>
								<td><fmt:formatDate value="${o.endTime }" pattern="yyyy-MM-dd HH:mm" /></td>
								<td>${activityStatusMap.get(o.activityStatus)}</td>
								<td>${o.activityUrl}</td>
								<td>${o.activityType}</td>
								<td><a title="修改" target="dialog" href="${path}/admin/datacenter/activityBaseInfo/edit?id=${o.id}&rel=${rel}" rel="${rel}"  width="610" height="550"><span>修改</span></a>&nbsp;</td>
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