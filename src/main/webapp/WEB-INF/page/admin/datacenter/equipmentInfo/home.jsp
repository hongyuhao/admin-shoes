<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="/admin/datacenter/equipmentInfo">
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pageTurn.page?1:pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${numPerPage }" />
	<input type="hidden" value="${eqId}" name="eqId" />
	<input type="hidden" value="${likeName}" name="likeName" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="/admin/datacenter/equipmentInfo" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					ID: <input type="text" value="${eqId}" name="eqId"></input>
				</td>
				<td>
					名称: <input type="text" value="${likeName}" name="likeName" ></input>
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
			<li><a class="add" href="/admin/datacenter/equipmentInfo/edit" target="dialog" rel="editTag" mask="true" title="新增" width="620" height="500"><span>新增</span></a></li>
			<li><a class="delete" href="/admin/datacenter/equipmentInfo/delete" target="selectedTodo" rel="inIdList" title="确定删除?"><span>删除</span></a></li>
			<li><a class="icon" href="/admin/datacenter/equipmentInfo/audit?status=${RECORD_NORMAL }&rel=${rel}" target="selectedTodo" rel="inIdList" title="确定恢复正常状态?"><span>恢复</span></a></li>
		</ul>
	</div>
	<table class="list" width="1200" layoutH="100">
		<thead>
			<tr>
				<th>ID<label style="float:left"><input type="checkbox" class="checkboxCtrl" group="inIdList" /></label></th>
				<th>设备名称</th>
				<th>厂商</th>
				<th>类型</th>
				<th>商品id</th>
				<th>品牌</th>
				<th>标题</th>
				<th>图片url</th>
				<th>型号：</th>
				<th>设备类型(文字描述)：</th>
				<th>设备详情页图片url：</th>
				<th>创建时间</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
				<c:choose>
					<c:when test="${null==equipmentInfoList||equipmentInfoList.isEmpty()}">
						<tr class="tatr2">
							<td colspan="11" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="o" items="${equipmentInfoList}">
							<tr target="id" rel="${o.id}">
								<td>
									<input type="checkbox" name="inIdList" id="inIdList" value="${o.id}"/>${o.id}
								</td>
								<td>${o.name}</td>
								<td>${o.manufacturerName}</td>
								<td>${o.dataTypeName}</td>
								<td>${o.goodsId}</td>
								<td>${o.brandName}</td>
								<td>${o.title}</td>
								<td>${o.imageUrl}</td>
								<td>${o.model}</td>
								<td>${o.equipmentTypeText}</td>
								<td>${o.imageDetailUrl}</td>
								<td><fmt:formatDate value="${o.createTime }" pattern="yyyy-MM-dd HH:mm" /></td>
								<td>${recordStatusMap[o.status]}</td>
								<td><a title="修改" target="dialog" href="${path}/admin/datacenter/equipmentInfo/edit?id=${o.id}&rel=${rel}" rel="${rel}"  width="650" height="550"><span>修改</span></a>&nbsp;
								<a title="设备编码管理" target="navTab" href="${path}/admin/datacenter/equipmentMacInfo?eqEquipmentId=${o.id}&rel=equipmentMacInfoHome" rel="equipmentMacInfoHome"  width="650" height="550"><span>设备编码管理</span></a>&nbsp;
								<a title="数据模板配置" target="dialog" href="${path}/admin/datacenter/dataTemplate/edit?eqEquipmentId=${o.id}&rel=${rel}" rel="${rel}"  width="650" height="550"><span>数据模板配置</span></a>&nbsp;</td>
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