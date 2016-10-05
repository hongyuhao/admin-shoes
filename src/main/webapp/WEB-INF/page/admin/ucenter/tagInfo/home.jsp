<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<!-- <script type="text/javascript" src="/js/core/nav_tab_util.js"></script>  -->
<form id="pagerForm" method="post" action="/admin/ucenter/tagBaseInfo">
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pager.page?1:pager.page }" />
	<input type="hidden" value="${eqId}" name="eqId" />
	<input type="hidden" value="${eqTagName}" name="eqTagName" />
	<input type="hidden" value="${gtUpdateTime}" name="gtUpdateTime" />
	<input type="hidden" value="${ltUpdateTime}" name="ltUpdateTime" />
	<input type="hidden" value="${rel==null ? parentRel : rel}" name="parentRel">
</form>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="/admin/ucenter/tagBaseInfo" method="post">
	<input type="hidden" value="${rel==null ? parentRel : rel}" name="parentRel">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					标签号: <input type="text" value="${eqId}" name="eqId"></input>
				</td>
				<td>
					标签名称: <input type="text" value="${eqTagName}" onBlur="$(this).val(jQuery.trim($(this).val()));" name="eqTagName" ></input>
				</td>
				<td>
					<table><tr>
					<td>更新日期:</td>
					<td>
						<input type="text" value="${gtUpdateTime}" name="gtUpdateTime" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true" style="float:left;"/>
						<a class="inputDateButton" href="javascript:;" style="float:left;">选择</a>
					</td>
					<td>~</td>
					<td>
						<input type="text" value="${ltUpdateTime}" style="float:left;" name="ltUpdateTime" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true"/>
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
			     <li><a class="add" href="/admin/ucenter/tagBaseInfo/edit" target="dialog" rel="editTag" mask="true" title="新增标签"><span>新增</span></a></li>
			<!-- </permission:permission> -->
			<!-- <permission:permission url="/admin/ucenter/tagBaseInfo/delete"> -->
			<li><a class="delete" href="/admin/ucenter/tagBaseInfo/batDel" posttype="string" target="selectedTodo" ><span>批量删除</span></a></li>
			<!-- </permission:permission> -->
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th ><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th>标签号</th>
				<th>标签名称</th>
				<th>标签类型</th>
				<th>标签权值</th>
				<th>标签描述</th>
				<th>从属标签</th>
				<th>最近更新日期</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
				<c:choose>
					<c:when test="${null==tagInfoBeanList||tagInfoBeanList.isEmpty()}">
						<tr class="tatr2">
							<td colspan="11" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="tag" items="${tagInfoBeanList}">
							<tr target="sid_user" rel="${tag.id}">
								<td><input name="ids" value="${tag.id}" type="checkbox" /></td>
								<td>${tag.id}</td>
								<td>${tag.tagName}</td>	
								<td>${tag.tagType}</td>
								<td>${tag.weight}</td>
								<td>${tag.descript}</td>
								<td>${tag.parentTagId}</td>
								<td>${tag.updateTime}</td>
								<td>
									<a title="${tag.tagName}" rel="${tag.id}" target="dialog" href="/admin/ucenter/tagBaseInfo/edit?id=${tag.id}&isdel=0&oper=view&parentRel=${rel != null ? rel : parentRel}" class="btnView" width="750" height="320">详情</a>
									<a title="${tag.tagName}" rel="${tag.id}" target="dialog" mask="true" href="/admin/ucenter/tagBaseInfo/edit?id=${tag.id}&oper=edit&parentRel=${rel != null ? rel : parentRel}" class="btnEdit" width="750" height="320">编辑标签信息</a>
									<a target="ajaxTodo" href="/admin/ucenter/tagBaseInfo/delete?id=${tag.id}" class="btnDel">删除</a>
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
	<%-- <div class="panelBar">
	<div class="pages"><span>共${pager.rowCount}条, 共${pager.pageCount }页</span></div>		
    <div class="pagination" targetType="navTab" totalCount="${pager.rowCount }" numPerPage="${pager.pageSize }" pageNumShown="10" currentPage="${pager.page }"></div>
</div> --%>