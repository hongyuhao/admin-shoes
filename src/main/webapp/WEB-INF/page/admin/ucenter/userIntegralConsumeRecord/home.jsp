<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
	
</script>

<form id="pagerForm" method="post" action="${path }/admin/ucenter/userIntegralConsumeRecord">
	<input type="hidden" name="eqUserId" value="${eqUserId }"/>
	<input type="hidden" name="expandCode" value="${expandCode }"/>
	<input type="hidden" name="eqApplicablePlatformId" value="${eqApplicablePlatformId }"/>
	<input type="hidden" name="eqType" value="${eqType }"/>
	<input type="hidden" name="gtConsumeTime" value="${gtConsumeTime }"/>
	<input type="hidden" name="itConsumeTime" value="${itConsumeTime }" />
	<input type="hidden" name="pageNum" value="${pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${pageTurn.pageSize }" />
	<input type="hidden" name="rel" value="${rel }" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${path }/admin/ucenter/userIntegralConsumeRecord" method="post">
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						用户ID: <input type="text" value="${eqUserId}" name="eqUserId"></input>
					</td>
					<td>
	                    <label>消费类型：</label>
						<select  name="eqType" id="eqType" class="combox">
							<option value="">请选择</option>
							<c:forEach items="${userIntegralConsumeMap}" var="entry">
								<option value="${entry.key}">${entry.value}</option>
							</c:forEach>
						</select>
						<script type="text/javascript">
							jQuery('#eqType').val("${eqType }");
						</script>
	                </td>
					<td>
	                    <label>平台：</label>
						<select  name="eqApplicablePlatformId" id="eqApplicablePlatformId" class="combox">
							<option value="">请选择</option>
							<c:forEach items="${applicablePlatformMap}" var="entry">
								<option value="${entry.key}">${entry.value}</option>
							</c:forEach>
						</select>
						<script type="text/javascript">
							jQuery('#eqApplicablePlatformId').val("${eqApplicablePlatformId }");
						</script>
	                </td>
					<td>
	                    <label>渠道：</label>
						<select  name="eqExpandCode" id="eqExpandCode" class="combox">
							<option value="">请选择</option>
							<c:forEach items="${expandCodeEnumTypeMap}" var="entry">
								<option value="${entry.key}">${entry.value}</option>
							</c:forEach>
						</select>
						<script type="text/javascript">
							jQuery('#eqExpandCode').val("${eqExpandCode }");
						</script>
	                </td>
					<td>
						时间查询：
					</td>
					<td>
						<input type="text" value="${gtConsumeTime}" name="gtConsumeTime" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true" style="float:left;"/>
						<a class="inputDateButton" href="javascript:;" style="float:left;">选择</a>
					</td>
					<td>
						<input type="text" value="${itConsumeTime}" name="itConsumeTime" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true" style="float:left;"/>
						<a class="inputDateButton" href="javascript:;" style="float:left;">选择</a>
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
	</div>

	<table class="table" width="100%" layoutH="115">
 		<thead>
			<tr>
				<th>用户</th>
				<th>消费积分</th>
				<th>消费类型</th>
				<th>消费时间</th>
				<th>平台</th>
				<th>渠道</th>
				<th>说明</th>
			</tr>
		</thead>
		<tbody> 
  			<c:choose>
				<c:when test="${null == userIntegralConsumeRecordList || userIntegralConsumeRecordList.isEmpty()}">
					<tr class="tatr2">
						<td colspan="8" align="center">暂无数据</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${userIntegralConsumeRecordList}" var="object">
					<tr>
						<td>${object.userId}(${object.userId})</td>
						<td>${object.integralNum}</td>
						<td>${userIntegralConsumeMap[object.type]}</td>
						<td><fmt:formatDate value="${object.consumeTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td>${applicablePlatformMap[object.applicablePlatformId]}</td>
						<td>${expandCodeEnumTypeMap[object.expandCode]}</td>
						<td>${object.remark}</td>
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

