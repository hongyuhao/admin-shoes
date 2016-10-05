<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
function clearUserBalance(url, data){
	url = '/admin/ucenter/userWalletBalanceClearRecord/clearUserWallet.jsonp';
	data = {"clearPointTime": $("#clearPointTime").val()};
	console.log(data);
	alertMsg.confirm("是否要清除选定时间点前取关用户的钱包余额？", {
		okCall: function(){
			$.post(url, data, DWZ.ajaxDone, "json");
		}
	});
}
</script>

<form id="pagerForm" method="post" action="${path }/admin/ucenter/userWalletBalanceClearRecord">
	<input type="hidden" name="eqUserId" value="${eqUserId }"/>
	<input type="hidden" name="eqOpenId" value="${openId }"/>
	<input type="hidden" name="pageNum" value="${pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${pageTurn.pageSize }" />
	<input type="hidden" name="rel" value="${rel }" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${path }/admin/ucenter/userWalletBalanceClearRecord" method="post">
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						用户ID: <input type="text" value="${eqUserId}" name="eqUserId"></input>
					</td>
					<td>
						openID: <input type="text" value="${eqOpenId}" name="eqOpenId"></input>
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
	<div class="formBar">
		<table class="searchContent">
			<tr>
				<td>
					选择取关时间点:
					<input type="text" id="clearPointTime" name="clearPointTime" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true"/> 
				</td>
				<td>
					<a class="button" href="javascript:;" onclick="clearUserBalance('demo/common/ajaxDone.html')"><span>清除余额</span></a>
				</td>
			</tr>
		</table>
	</div>

	<table class="table" width="100%" layoutH="115">
 		<thead>
			<tr>
				<th>用户ID</th>
				<th>用户OPEN_ID</th>
				<th>清除的金额（分）</th>
				<th>清除金额时间</th>
				<th>选定的清除取关时间点</th>
				<th>用户取消关注的时间</th>
			</tr>
		</thead>
		<tbody> 
  			<c:choose>
				<c:when test="${null == userWalletBalanceClearRecordList || userWalletBalanceClearRecordList.isEmpty()}">
					<tr class="tatr2">
						<td colspan="8" align="center">暂无数据</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${userWalletBalanceClearRecordList}" var="object">
					<tr>
						<td>${object.userId }</td>
						<td>${object.openId }</td>
						<td>${object.clearWalletBalance }</td>
						<td><fmt:formatDate value="${object.createTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td><fmt:formatDate value="${object.clearPointTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td><fmt:formatDate value="${object.userUnsubcribeTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
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