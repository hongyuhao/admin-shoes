<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="/admin/datacenter/equipmentMacInfo">
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pageTurn.page?1:pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${numPerPage }" />
	<input type="hidden" value="${eqId}" name="eqId" />
	<input type="hidden" value="${gtId}" name="gtId" />
	<input type="hidden" value="${likeName}" name="likeName" />
	<input type="hidden" value="${eqEquipmentId}" name="eqEquipmentId" />
	
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="/admin/datacenter/equipmentMacInfo" method="post">
	<div class="searchBar">
		<table class="searchContent">
		<input type="hidden" value="${eqEquipmentId}" name="eqEquipmentId" />
			<tr>
				<td>
					ID: <input type="text" value="${eqId}" name="eqId"></input>
				</td>
				<td>
					ID > <input type="text" value="${gtId}" name="gtId"></input>
				</td>
				<td>
					mac <input type="text" value="${eqEquipmentMac}" name="eqEquipmentMac"></input>
				</td>
				<td>
					sn <input type="text" value="${eqEquipmentSn}" name="eqEquipmentSn"></input>
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
			<li><a class="add" href="/admin/datacenter/equipmentMacInfo/edit?equipmentId=${eqEquipmentId }" target="dialog" rel="editTag" mask="true" title="新增" width="620" height="500"><span>新增</span></a></li>
			<li><a class="add" href="/admin/datacenter/equipmentMacInfo/batchGen?equipmentId=${eqEquipmentId }" target="dialog" rel="editTag" mask="true" title="批量生成" width="620" height="500"><span>批量生成</span></a></li>
			<li><a class="add" id="batchAuthBtn" href="javascript:void(0);" title="批量授权"><span>批量授权</span></a></li>
			<li><a class="add" href="${path}/admin/datacenter/equipmentMacInfo/qrcode/create" target="selectedTodo" rel="inIdList" title="批量生成二维码" ><span>批量生成二维码</span></a></li>
			<li><a class="add" href="/admin/datacenter/equipmentMacInfo/toUpload?equipmentId=${eqEquipmentId }" target="dialog" rel="editTag" mask="true" title="导入excel设备数据" width="620" height="500"><span>导入excel设备数据</span></a> </li>
			<li><a class="add" href="/admin/datacenter/equipmentMacInfo/export?eqId=${eqId }&gtId=${gtId}&eqEquipmentMac=${eqEquipmentMac}&eqEquipmentSn=${eqEquipmentSn}&likeName=${likeName}" title="导出excel设备数据" width="620" height="500"><span>导出excel设备数据</span></a> </li>
			<li><a class="add" href="/admin/datacenter/equipmentMacInfo/qrcode/down?eqId=${eqId }&gtId=${gtId}&eqEquipmentMac=${eqEquipmentMac}&eqEquipmentSn=${eqEquipmentSn}&likeName=${likeName}" title="导出excel设备数据" width="620" height="500"><span>下载设备二维码</span></a> </li>
		</ul>
	</div>
	<table class="list" width="200%" layoutH="100">
		<thead>
			<tr>
				<th>ID<label style="float:left"><input type="checkbox" class="checkboxCtrl" group="inIdList" /></label></th>
				<th>设备名称</th>
				<th>微信设备ID</th>
				<th>设备类型</th>
				<th>MAC地址</th>
				<th>SN码</th>
				<th>第三方标志</th>
				<th>微信设备的产品编号</th>
				<th>二维码串</th>
				<th>授权状态</th>
				<th>添加时间</th>
				<th>授权时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
				<c:choose>
					<c:when test="${null==equipmentMacInfoList||equipmentMacInfoList.isEmpty()}">
						<tr class="tatr2">
							<td colspan="11" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="o" items="${equipmentMacInfoList}">
							<tr target="id" rel="${o.id}">
								<td>
									<input type="checkbox" name="inIdList" value="${o.id}"/>${o.id}
								</td>
								<td>${o.equipmentId}</td>
								<td>${o.wechatDeviceId}</td>
								<td>${o.wechatDeviceType}</td>
								<td>${o.equipmentMac}</td>
								<td>${o.equipmentSn}</td>
								<td>${o.thirdData}</td>
								<td>${o.productId}</td>
								<td>${o.qrticket}</td>
								<td>${recordStatusMap[o.authorizeStatus]}</td>
								<td><fmt:formatDate value="${o.createTime }" pattern="yyyy-MM-dd HH:mm" /></td>
								<td><fmt:formatDate value="${o.authorizeTime }" pattern="yyyy-MM-dd HH:mm" /></td>
								<td>
								<a title="授权" target="dialog" href="${path}/admin/datacenter/equipmentMacInfo/authEdit?id=${o.id}" rel="${rel}"  width="650" height="550"><span>授权</span></a>&nbsp;
								<a title="查看二维码" target="dialog" href="/admin/datacenter/equipmentMacInfo/qrcode/show?wechatDeviceId=${o.wechatDeviceId}" rel="${rel}"  width="650" height="550"><span>查看二维码</span></a>&nbsp;
								<a title="生成二维码" target="ajaxToDo" href="${path}/admin/datacenter/equipmentMacInfo/qrcode/create?inIdList=${o.id}"  width="650" height="550"><span>生成二维码</span></a>&nbsp;
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
    <script>
    $('#batchAuthBtn').on('click', function(){
    	var inIdList = "";
    	
    	var chbxs = $("input[type='checkbox'][name='inIdList']");
    	$.each(chbxs, function(i, chbx){
    		if($(chbx).attr("checked")) {
    			inIdList += "," + $(chbx).val();
    		}
    	});
    	if(inIdList) {
    		inIdList = inIdList.substring(1, inIdList.length);
    		$.pdialog.open("/admin/datacenter/equipmentMacInfo/batchAuthEdit?equipmentId=${eqEquipmentId }&inIdList=" + inIdList, "设备授权${rel}", "设备批量授权", {width:600,height:500,max:false,mask:true,mixable:true,minable:true,resizable:true,drawable:true,fresh:true});
    	} else {
    		alert("请选择要授权的设备");
    		return false;
    	}
    });
    </script>