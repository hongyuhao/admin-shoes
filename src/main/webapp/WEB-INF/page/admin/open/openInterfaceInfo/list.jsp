<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="/admin/open/openInterfaceInfo?isLookup=1">
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pageTurn.page?1:pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${numPerPage }" />
	<input type="hidden" value="${eqId}" name="eqId" />
	<input type="hidden" value="${likeInterfaceName}" name="likeInterfaceName" />
	<input type="hidden" value="${likeOpenUrl}" name="likeOpenUrl" />
	<input type="hidden" value="${eqServiceId}" name="eqServiceId" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return dwzSearch(this, 'dialog');" action="/admin/open/openInterfaceInfo?isLookup=1" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					ID: <input type="text" value="${eqId}" name="eqId"></input>
				</td>
				<td>
					接口名称: <input type="text" value="${likeInterfaceName}" name="likeInterfaceName" ></input>
				</td>
				<td>
					开放平台url: <input type="text" value="${likeOpenUrl}" name="likeOpenUrl"></input>
				</td>
				<tr>
					<td>
                    <label>服务: </label>
                    <select name="eqServiceId" id="eqServiceId">
                        <option value="">不限</option>
                        <c:forEach items="${serviceMap}" var="entry">
                            <option value="${entry.key}">${entry.value}</option>
                        </c:forEach>
                    </select>
                    <script type="text/javascript">
                		jQuery('#eqServiceId').val("${eqServiceId}");
                    </script>
                	</td>
                	<td>
						<div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div>
					</td>
				</tr>
			</tr>
		</table>
	</div>
	</form>

</div>
<div class="pageContent">
    <div layoutH="100">
		<table class="list" width="100%"  targetType="dialog">
			<thead>
				<tr>
					<th>ID</th>
					<th>接口名称</th>
					<th>开放平台url</th>
					<th>服务url</th>
					<th>服务</th>
					<th width="10">查找带回</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${null==openInterfaceInfoList||openInterfaceInfoList.isEmpty()}">
						<tr class="tatr2">
							<td colspan="11" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="o" items="${openInterfaceInfoList}">
							<tr target="id" rel="${o.id}">
								<td>${o.id }</td>
								<td>${o.interfaceName}</td>
								<td>${o.openUrl}</td>
								<td>${o.serviceUrl}</td>
								<td>${serviceMap[o.serviceId]}</td>
								<td><a class="btnSelect" href="javascript:$.bringBack({openInterfaceId:'${o.id}',interfaceName:'${o.interfaceName}',openUrl:'${o.openUrl}',serviceUrl:'${o.serviceUrl}',serviceId:'${o.serviceId }',serviceName:'${serviceMap[o.serviceId] }'})" title="查找带回">选择</a></td>
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