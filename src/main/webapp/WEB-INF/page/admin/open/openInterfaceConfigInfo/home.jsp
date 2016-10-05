<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="#rel#">
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pageTurn.page?1:pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${numPerPage }" />
	<input type="hidden" value="${eqAppId}" name="eqAppId" />
	<input type="hidden" value="${likeInterfaceName}" name="likeInterfaceName" />
	<input type="hidden" value="${eqOpenUrl}" name="eqOpenUrl" />
	<input type="hidden" value="${eqServiceId}" name="eqServiceId" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="/admin/open/openInterfaceConfigInfo" method="post">
	<input type="hidden" value="${eqAppId}" name="eqAppId" />
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					接口名称: <input type="text" value="${likeInterfaceName}" name="likeInterfaceName" ></input>
				</td>
				<td>
					开放平台url: <input type="text" value="${eqOpenUrl}" name="eqOpenUrl"></input>
				</td>
				<td>
                    <label>服务: </label>
                    <select name="eqServiceId" id="eqService">
                        <option value=" ">不限</option>
                        <c:forEach items="${serviceMap}" var="entry">
                            <option value="${entry.key}">${entry.value}</option>
                        </c:forEach>
                    </select>
                    <script type="text/javascript">
                    	jQuery('#eqService').val("${eqServiceId}");
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
			<li><a class="add" href="/admin/open/openInterfaceConfigInfo/edit?appId=${eqAppId }" target="dialog" rel="editTag" mask="true" title="新增" width="620" height="500"><span>新增</span></a></li>
			<li><a class="delete" href="/admin/open/openInterfaceConfigInfo/delete" target="selectedTodo" rel="inIdList" title="确定删除?"><span>删除</span></a></li>
		</ul>
	</div>
	<table class="list" width="100%" layoutH="100">
		<thead>
			<tr>
				<th>ID<label style="float:left"><input type="checkbox" class="checkboxCtrl" group="inIdList" /></label></th>
				<th>接口名称</th>
				<th>开放平台url</th>
				<th>服务url</th>
				<th>服务</th>
				<th>应用id</th>
				<th>是否需要签名</th>
				<th>是否有访问权限</th>
				<th>是否需要登录</th>
				<th>应用授权权限</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
				<c:choose>
					<c:when test="${null==openInterfaceConfigInfoList||openInterfaceConfigInfoList.isEmpty()}">
						<tr class="tatr2">
							<td colspan="11" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="o" items="${openInterfaceConfigInfoList}">
							<tr target="id" rel="${o.id}">
								<td>
									<input type="checkbox" name="inIdList" id="inIdList" value="${o.id}"/>${o.id}
								</td>
								<td>${o.interfaceName}</td>
								<td>${o.openUrl}</td>
								<td>${o.serviceUrl}</td>
								<td>${serviceMap[o.serviceId]}</td>
								<td>${o.appId}</td>
								<td>${isSignMap[o.isSign]}</td>
								<td>${isVisitMap[o.isVisit]}</td>
								<td>${isLoginMap[o.isLogin]}</td>
								<td>${o.scope}</td>
								<td>
									<a title="修改" target="dialog" href="${path}/admin/open/openInterfaceConfigInfo/edit?id=${o.id}&appId=${o.appId }" rel="openInterfaceConfigInfoAdd"  width="610" height="550"><span>修改</span></a>&nbsp;
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