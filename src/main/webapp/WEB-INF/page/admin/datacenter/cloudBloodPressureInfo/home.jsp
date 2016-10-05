<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="#rel#">
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pageTurn.page?1:pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${numPerPage }" />
	<input type="hidden" value="${eqStatus}" name="eqStatus" />
	<input type="hidden" value="${eqEquipmentSn}" name="eqEquipmentSn" />
	<input type="hidden" value="${eqManufacturerId}" name="eqManufacturerId" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="/admin/datacenter/cloudBloodPressureInfo" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<c:if test="${eqManufacturerId != 9 }">
				<td>
					厂商id: <input type="text" value="${eqManufacturerId}" name="eqManufacturerId"></input>
				</td>
				</c:if>
				<td>
					序列号: <input type="text" value="${eqEquipmentSn}" name="eqEquipmentSn"></input>
				</td>
				<td>
					状态: 
					<select id="cloudDataStatus" name="eqStatus">
						<c:forEach items="${cloudSataStatusMap}" var="o">
							<option value="${o.key }">
								${o.value }
							</option>
						</c:forEach>
					</select>
					<script type="text/javascript">
						$('#cloudDataStatus').val('${eqStatus}');
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
		</ul>
	</div>
	<table class="list" width="100%" layoutH="100">
		<thead>
			<tr>
				<th>序列号</th>
				<th>收缩压值</th>
				<th>舒张压值</th>
				<th>心率值</th>
				<th>测量时间</th>
				<th>上传时间</th>
				<th>IMSI号码</th>
				<th>SIM号码</th>
				<th>厂商</th>
				<th>状态</th>
			</tr>
		</thead>
		<tbody>
				<c:choose>
					<c:when test="${null==cloudBloodPressureInfoList||cloudBloodPressureInfoList.isEmpty()}">
						<tr class="tatr2">
							<td colspan="11" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="o" items="${cloudBloodPressureInfoList}">
							<tr>
								<td>
									${o.equipmentSn}
								</td>
								<td>${o.upperBp}</td>
								<td>${o.lowerBp}</td>
								<td>${o.heartRate}</td>
								<td><fmt:formatDate value="${o.testTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td><fmt:formatDate value="${o.uploadTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td>${o.imsi }</td>
								<td>${o.sim }</td>
								<td>${o.manufacturerId }</td>
								<td>${cloudSataStatusMap[o.status] }</td>
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