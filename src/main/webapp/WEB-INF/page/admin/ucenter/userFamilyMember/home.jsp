<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<!-- <script type="text/javascript" src="/js/core/nav_tab_util.js"></script>  -->
<form id="pagerForm" method="post" action="/admin/ucenter/user/familymember">
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pageTurn.page?1:pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${numPerPage }" />
	<input type="hidden" value="${eqUserId}" name="eqUserId" />
	<input type="hidden" value="${eqAccountName}" name="eqAccountName" />
	<input type="hidden" value="${gtCreateTime}" name="gtCreateTime" />
	<input type="hidden" value="${ltCreateTime}" name="ltCreateTime" />
	<input type="hidden" value="${rel==null ? parentRel : rel}" name="parentRel">
</form>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="/admin/ucenter/user/familymember" method="post">
	<input type="hidden" value="${rel==null ? parentRel : rel}" name="parentRel">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					用户ID: <input type="text" value="${eqUserId}" name="eqUserId"></input>
				</td>
				<td>
					用户名: <input type="text" value="${eqAccountName}" onBlur="$(this).val(jQuery.trim($(this).val()));" name="eqAccountName" ></input>
				</td>
				<td>
					<table><tr>
					<td>添加日期:</td>
					<td>
						<input type="text" value="${gtCreateTime}" name="gtCreateTime" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true" style="float:left;"/>
						<a class="inputDateButton" href="javascript:;" style="float:left;">选择</a>
					</td>
					<td>~</td>
					<td>
						<input type="text" value="${ltCreateTime}" style="float:left;" name="gtCreateTime" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true"/>
						<a class="inputDateButton" href="javascript:;" style="float:left;">选择</a>
					</td></tr></table>
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
		    <!-- <permission:permission url="/admin/ucenter/tagBaseInfo/edit"> -->
			     <li><a class="add" href="/admin/ucenter/user/familymember/edit?parentRel=${rel==null ? parentRel : rel}" target="dialog" rel="editTag" mask="true" title="新增标签"><span>新增</span></a></li>
			<!-- </permission:permission> -->
			<!-- <permission:permission url="/admin/ucenter/tagBaseInfo/delete"> -->
			<li><a class="delete" href="/admin/ucenter/user/familymember/delete?parentRel=${rel==null ? parentRel : rel}" posttype="string" target="selectedTodo" ><span>批量删除</span></a></li>
			<!-- </permission:permission> -->
		</ul>
	</div>
	<table class="table" width="100%" layoutH="114">
		<thead>
			<tr>
				<th><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th>所属用户ID</th>
				<th>所属用户名</th>
				<th>称谓</th>
				<th>性别</th>
				<th>年龄</th>
				<th>添加时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
				<c:choose>
					<c:when test="${null==userFamilyMemberList||userFamilyMemberList.isEmpty()}">
						<tr class="tatr2">
							<td colspan="11" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="family" items="${userFamilyMemberList}">
							<tr target="sid_user" rel="${family.id}">
								<td><input name="ids" value="${family.id}" type="checkbox" /></td>
								<td>${family.userId}</td>
								<td>${family.accountName}</td>	
								<td>${family.relatives}</td>	
								<td>${sexMap.get(family.sex)}</td>	
								<td>${family.age}</td>	
								<td>${family.createTime}</td>
								<td>
									<%-- <a title="查看" rel="${family.id}" target="dialog" href="/admin/ucenter/tagBaseInfo/edit?id=${family.id}&isdel=0&oper=view" class="btnView" width="750" height="320">详情</a> --%>
									<a title="编辑" rel="${family.id}" target="dialog" mask="true" href="/admin/ucenter/user/familymember/edit?id=${family.id}&oper=edit&parentRel=${rel==null ? parentRel : rel}" class="btnEdit" width="750" height="320">编辑家庭成员信息</a>
									<a title="删除" target="ajaxTodo" href="/admin/ucenter/user/familymember/delete?ids=${family.id}&parentRel=${rel==null ? parentRel : rel}" class="btnDel">删除</a>
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