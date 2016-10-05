<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
function selected(){
	ids = "";
	var chbxs = $("input[type='checkbox'][name='inIdList']");
	$.each(chbxs, function(i, chbx){
		if($(chbx).attr("checked")) {
			ids += "," + $(chbx).val();
		}	
	})
	if(ids) {
			ids = ids.substring(1, ids.length);
	$.pdialog.open("/admin/activity/activityCode/doExport?ids="+ ids, "export" ,"导出为excel",{width:350,height:175,max:false,mask:true,mixable:true,minable:true,resizable:true,drawable:true,fresh:true});
		}
}
</script>
<form id="pagerForm" method="post" action="/admin/activity/activityCode">
	<input type="hidden" value="${eqId}" name="eqId" />
	<input type="hidden" value="${gtId}" name="gtId" />
	<input type="hidden" value="${eqActivityId}" name="eqActivityId" />
	<input type="hidden" value="${eqStatus}" name="eqStatus" />
	<input type="hidden" name="pageNum" value="${pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${pageTurn.pageSize }" />
	<input type="hidden" name="rel" value="${rel }" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="/admin/activity/activityCode" method="post">
	<div class="searchBar">
		<table class="searchContent">
		<input type="hidden" value="${eqId}" name="eqId" />
			<tr>
				<td>
					ID: <input type="text" value="${eqId}" name="eqId"></input>
				</td>
				<td>
				活动类型 <select id="activityId" name="eqActivityId">
						<c:forEach items="${fightInfoMap}" var="o">
							<option value="${o.key }">
								${o.value }
							</option>
						</c:forEach>
					</select>
					<script type="text/javascript">
						$('#activityId').val('${eqActivityId}');
					</script>
				</td>
				<td>
					状态 <select id="activityStatus" name="eqStatus">
						<c:forEach items="${activitiesCodeStatusMap}" var="acsm">
							<option value="${acsm.key }">
								${acsm.value }
							</option>
						</c:forEach>
					</select>
					<script type="text/javascript">
						$('#activityStatus').val('${eqStatus}');
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
			<li><a class="add" href="/admin/activity/activityCode/batchGen?id=${eqId }" target="dialog" rel ="editTag" mask ="true" title ="批量生成" width="620" height="500"><span>批量生成</span></a></li>
<!-- 			<li><a class="add" href="/admin/activity/activityCode/export" target="dwzExport"   rel="inIdList" title ="导出为excel" width ="620" height ="500"><span>导出为excel</span></a> </li> -->
            <li><a class="add"  title="导出为excel"><span onclick="selected()">导出为excel</span></a></li>
            
		</ul>
	</div>
	<table class="list" width="200%" layoutH="100">
		<thead>
			<tr>
				<th>ID<label style="float:left"><input type="checkbox" class="checkboxCtrl" group="inIdList" /></label></th>
				<th>活动类型</th>
				<th>兑换码类型</th>
				<th>兑换数量</th>
				<th>兑换码</th>
				<th>用户ID</th>
				<th>openID</th>
				<th>创建时间</th>
				<th>更新时间</th>
				<th>手机号</th>
				<th>状态</th>
			</tr>
		</thead>
		<tbody>
				<c:choose>
					<c:when test="${null==activityCodeList||activityCodeList.isEmpty()}">
						<tr class="tatr2">
							<td colspan="11" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="o" items="${activityCodeList}">
							<tr target="id" rel="${o.id}">
								<td>
									<input type="checkbox" name="inIdList" id="inIdList"  value="${o.id}"/>${o.id}
								</td>
								<td>${fightInfoMap[o.activityId]}</td>
								<td>${o.codeType}</td>
								<td>${o.num}</td>
								<td>${o.code}</td>
								<td>${o.userId}</td>
								<td>${o.openId}</td>
								<td><fmt:formatDate value="${o.createTime }" pattern="yyyy-MM-dd HH:mm" /></td>
								<td><fmt:formatDate value="${o.updateTime }" pattern="yyyy-MM-dd HH:mm" /></td>
								<td>${o.phone}</td>
								<td>${activitiesCodeStatusMap[o.status]}</td>
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
    