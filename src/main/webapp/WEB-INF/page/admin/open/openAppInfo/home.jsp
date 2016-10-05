<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
function processBack(response){
	DWZ.ajaxDone(response);
	if (response[DWZ.keys.statusCode] == DWZ.statusCode.ok){
		alertMsg.correct(response.message);
	 	$.pdialog.closeCurrent();
	 	navTab.reload("${path }/admin/open/openAppInfo", "");
	}
}
</script>

<form id="pagerForm" method="post" action="/admin/open/openAppInfo">
	<input type="hidden" name="eqPartnerId" value="${eqPartnerId }" />
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pageTurn.page?1:pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${numPerPage }" />
	<input type="hidden" value="${eqId}" name="eqId" />
	<input type="hidden" value="${likeAppId}" name="likeAppId" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="/admin/open/openAppInfo" method="post">
		<input type="hidden" name="eqPartnerId" value="${eqPartnerId }" />
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						ID: <input type="text" value="${eqId}" name="eqId"></input>
					</td>
					<td>
						名称: <input type="text" value="${likeAppId}" name="likeAppId" ></input>
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
			<li><a class="add" href="/admin/open/openAppInfo/edit?eqPartnerId=${eqPartnerId }" target="dialog" rel="editTag" mask="true" title="新增" width="620" height="500"><span>新增</span></a></li>
		</ul>
	</div>
	<table class="list" width="100%" layoutH="100">
		<thead>
			<tr>
				<th>ID<label style="float:left"><input type="checkbox" class="checkboxCtrl" group="inIdList" /></label></th>
				<th>应用id</th>
				<th>应用密钥</th>
				<th>应用名称</th>
				<th>应用回调域名</th>
				<th>创建时间</th>
				<th>更新时间</th>
				<th>签名key</th>
				<th>ip白名单</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
				<c:choose>
					<c:when test="${null==openAppInfoList||openAppInfoList.isEmpty()}">
						<tr class="tatr2">
							<td colspan="11" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="o" items="${openAppInfoList}">
							<tr target="id" rel="${o.id}">
								<td>
									<input type="checkbox" name="inIdList" id="inIdList" value="${o.id}"/>${o.id}
								</td>
								<td>${o.appId}</td>
								<td>${o.appSecret}</td>
								<td>${o.appName}</td>
								<td>${o.appCallbackUrl}</td>
								<td><fmt:formatDate value="${o.createTime }" pattern="yyyy-MM-dd HH:mm" /></td>
								<td><fmt:formatDate value="${o.updateTime }" pattern="yyyy-MM-dd HH:mm" /></td>
								<td>${o.signKey}</td>
								<td>${o.ips}</td>
								<td>
									<a title="${o.appId }接口权限" target="navTab" href="${path}/admin/open/openInterfaceConfigInfo?eqAppId=${o.appId}&rel=openInterfaceConfigInfoHome" rel="openInterfaceConfigInfoHome"><span>接口权限</span></a>&nbsp;|&nbsp;
									<a title="修改" target="dialog" href="${path}/admin/open/openAppInfo/edit?id=${o.id}&rel=${rel}&eqPartnerId=${eqPartnerId }" rel="${rel}"  width="610" height="550"><span>修改</span></a>&nbsp;
									<a title="确定要删除吗?" target="ajaxTodo" href="/admin/open/openAppInfo/delete?id=${o.id}&appId=${o.appId }&rel=deleteOpenAppInfo">删除</a>
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