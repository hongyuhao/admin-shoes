<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="/admin/ucenter/user/feedback">
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pageTurn.page?1:pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${numPerPage }" />
	<input type="hidden" value="${gtCreateTime}" name="gtCreateTime" />
	<input type="hidden" value="${itCreateTime}" name="itCreateTime" />
	<input type="hidden" value="${eqPhone}" name="eqPhone" />
</form>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="/admin/ucenter/user/feedback" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					手机号码: <input type="text" value="${eqPhone}" onBlur="$(this).val(jQuery.trim($(this).val()));" name="eqPhone" ></input>
				</td>
				<td colspan="4">
					<table><tr>
							<td>投诉时间:</td>
							<td>
								<input type="text" value="${gtCreateTime}" name="gtCreateTime" class="date" dateFmt="yyyy-MM-dd 00:00:00" readonly="true" style="float:left;"/>
								<a class="inputDateButton" href="javascript:;" style="float:left;">选择</a>
							</td>
							<td>~</td>
							<td>
								<input type="text" value="${itCreateTime}" name="itCreateTime" class="date" dateFmt="yyyy-MM-dd 23:59:59" readonly="true" style="float:left;"/>
								<a class="inputDateButton" href="javascript:;" style="float:left;">选择</a>
							</td>
					</tr></table>
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
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th>用户名</th>
				<th>手机号码</th>
				<th>邮箱</th>
				<th>投诉/留言</th>
				<th>记录时间</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
				<c:choose>
					<c:when test="${null==userFeedbackList||userFeedbackList.isEmpty()}">
						<tr class="tatr2">
							<td colspan="11" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="feedback" items="${userFeedbackList}">
							<tr>
								<td>【${sexMap[feedback.sex]}】 ${feedback.userName}</td>	
								<td>${feedback.phone}</td>
								<td>${feedback.email }</td>
								<td width="100px;">${feedback.content }</td>
								<td><fmt:formatDate value="${feedback.createTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td>${feedbackStatusMap[feedback.status] }</td>
								<td>
									<a rel="feedbackEdit" target="dialog" mask="true" href="/admin/ucenter/user/feedback/edit.html?id=${feedback.id}" width="750" height="500">处理</a>
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