<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
	
</script>

<form id="pagerForm" method="post" action="${path }/admin/activity/operateRuleManage/wechatSportBans">
	<input type="hidden" name="eqUserId" value="${eqUserId }"/>
	<input type="hidden" name="pageNum" value="${null == pageTurn.page?1:pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${numPerPage }" />
	<input type="hidden" name="rel" value="${rel }" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${path }/admin/activity/operateRuleManage/wechatSportBans" method="post">
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						用户ID: <input type="text" value="${eqUserId}" name="eqUserId"></input>
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
			<li><a class="add" href="/admin/activity/operateRuleManage/wechatSportBans/edit" target="dialog" rel="editTag" mask="true" title="新增" width="620" height="500"><span>新增</span></a></li>
			<li><a class="delete" href="/admin/activity/operateRuleManage/wechatSportBans/delete" target="selectedTodo" rel="inUserIdList" title="确定删除?"><span>删除</span></a></li>
		</ul>
	</div>

	<table class="list" width="100%" layoutH="115">
 		<thead>
			<tr>
				<th>用户ID<label style="float:left"><input type="checkbox" class="checkboxCtrl" group="inUserIdList" /></label></th>
				<th>违规说明</th>
				<th>创建时间</th>
				<th>用户违规时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody> 
  			<c:choose>
				<c:when test="${null == wechatSportBansList || wechatSportBansList.isEmpty()}">
					<tr class="tatr2">
						<td colspan="8" align="center">暂无数据</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${wechatSportBansList}" var="object">
					<tr>
						<td>
							<input type="checkbox" name="inUserIdList" id="inUserIdList" value="${object.userId}"/>${object.userId}
						</td>
						<td>${object.remark }</td>
						<td><fmt:formatDate value="${object.createTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td><fmt:formatDate value="${object.illegalTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td>
							<a title="修改" target="dialog" href="${path}/admin/activity/operateRuleManage/wechatSportBans/edit?userId=${object.userId}&rel=${rel}" rel="${rel}"  width="610" height="550"><span>修改</span></a>&nbsp;
						</td>
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

