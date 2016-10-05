<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<!-- <script type="text/javascript" src="/js/core/nav_tab_util.js"></script>  -->
<form id="pagerForm" method="post" action="/admin/ucenter/roleOperCode">
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pageTurn.page?1:pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${numPerPage }" />
	<input type="hidden" value="${eqId}" name="eqId" />
	<input type="hidden" value="${eqMenuText}" name="eqMenuText" />
	<input type="hidden" value="${rel==null ? parentRel : rel}" name="parentRel">
</form>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="/admin/ucenter/roleOperCode" method="post">
		<input type="hidden" value="${rel==null ? parentRel : rel}" name="parentRel">
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						菜单ID: <input type="text" value="${eqId}" name="eqId"></input>
					</td>
					<td>
						菜单名: <input type="text" value="${eqMenuText}" onBlur="$(this).val(jQuery.trim($(this).val()));" name="eqMenuText" ></input>
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
			<li><a class="add" href="/admin/ucenter/roleOperCode/edit?parentRel=${rel==null ? parentRel : rel}" target="dialog" rel="editTag" mask="true" title="新增标签"><span>新增</span></a></li>
			<li><a class="delete" href="/admin/ucenter/roleOperCode/delete?parentRel=${rel==null ? parentRel : rel}" posttype="string" target="selectedTodo" ><span>批量删除</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="114">
		<thead>
			<tr>
				<th><input type="checkbox" group="ids" class="checkboxCtrl">ID</th>
				<th>操作名</th>
				<th>操作码</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
				<c:choose>
					<c:when test="${null==roleOperCodeList||roleOperCodeList.isEmpty()}">
						<tr class="tatr2">
							<td colspan="11" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="oper" items="${roleOperCodeList}">
							<tr target="sid_user" rel="${oper.id}">
								<td><input name="ids" value="${oper.id}" type="checkbox" />${oper.id}</td>
								<td>${oper.operText}</td>	
								<td>${oper.operCode}</td>
								<td>
									<a title="编辑" rel="${oper.id}" target="dialog" mask="true" href="/admin/ucenter/roleOperCode/edit?id=${oper.id}&oper=edit&parentRel=${rel==null ? parentRel : rel}" class="btnEdit" width="750" height="320">编辑菜单</a>
									<a title="删除" target="ajaxTodo" href="/admin/ucenter/roleOperCode/delete?id=${oper.id}&parentRel=${rel==null ? parentRel : rel}" class="btnDel">删除</a>
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