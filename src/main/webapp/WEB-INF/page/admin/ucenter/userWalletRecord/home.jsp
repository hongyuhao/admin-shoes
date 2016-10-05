<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
	
</script>

<form id="pagerForm" method="post" action="${path }/admin/ucenter/userWalletRecord">
	<input type="hidden" name="eqUserId" value="${eqUserId }"/>
	<input type="hidden" name="openId" value="${openId }"/>
	<input type="hidden" name="eqOperationType" value="${eqOperationType }"/>
	<input type="hidden" name="pageNum" value="${pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${pageTurn.pageSize }" />
	<input type="hidden" name="rel" value="${rel }" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${path }/admin/ucenter/userWalletRecord" method="post">
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						用户ID: <input type="text" value="${eqUserId}" name="eqUserId"></input>
					</td>
					<td>
						openID: <input type="text" value="${openId}" name="openId"></input>
					</td>
					<td>
	                    <label>操作类型：</label>
						<select  name="eqOperationType" id="eqOperationType" class="combox">
							<option value="">请选择</option>
								<option value="1">获取</option>
								<option value="2">提现</option>
						</select>
						<script type="text/javascript">
							jQuery('#eqOperationType').val("${eqOperationType }");
						</script>
	                </td>
					<td>
						<div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div>
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

	<table class="table" width="100%" layoutH="115">
 		<thead>
			<tr>
				<th>用户ID</th>
				<th>活动ID</th>
				<th>备注</th>
				<th>操作类型</th>
				<th>金额（分）</th>
				<th>操作前金额（分）</th>
				<th>操作时间</th>
			</tr>
		</thead>
		<tbody> 
  			<c:choose>
				<c:when test="${null == userWalletRecordList || userWalletRecordList.isEmpty()}">
					<tr class="tatr2">
						<td colspan="8" align="center">暂无数据</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${userWalletRecordList}" var="object">
					<tr>
						<td>${object.userId }</td>
						<td>${object.activityId }</td>
						<td>${object.remark }</td>
						<td>${object.operationType == 1 ? '获得金额':'提现' }</td>
						<td>${object.money }</td>
						<td>${object.currentMoney }</td>
						<td><fmt:formatDate value="${object.createTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
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
</div>

