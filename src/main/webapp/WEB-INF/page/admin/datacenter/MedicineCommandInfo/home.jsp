<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="#rel#">
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pageTurn.page?1:pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${numPerPage }" />
	<input type="hidden" value="${eqEquipmentSn}" name="eqEquipmentSn" />
	<input type="hidden" value="${eqIccid}" name="eqIccid" />
	<input type="hidden" value="${eqImsi}" name="eqImsi" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="/admin/datacenter/MedicineCommandInfo" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				
				<td>
					序列号: <input type="text" value="${eqEquipmentSn}" name="eqEquipmentSn"></input>
				</td>
				<td>
					iccid: <input type="text" value="${eqIccid}" name="eqIccid"></input>
				</td>
				<td>
					imsi: <input type="text" value="${eqImsi}" name="eqImsi"></input>
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
				<th>iccid</th>
				<th>imsi</th>
				<th>内容</th>
				<th>上传时间</th>
			</tr>
		</thead>
		<tbody>
				<c:choose>
					<c:when test="${null==dataMedicineCommandLogList||dataMedicineCommandLogList.isEmpty()}">
						<tr class="tatr2">
							<td colspan="11" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="o" items="${dataMedicineCommandLogList}">
							<tr>
								<td>
									${o.equipmentSn}
								</td>
								<td>
									${o.iccid}
								</td>
								<td>
									${o.imsi}
								</td>
								<td>${o.content}</td>
								<td><fmt:formatDate value="${o.createTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
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