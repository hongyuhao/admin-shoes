<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="/admin/datacenter/ticketSubReplyRelation">
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pageTurn.page?1:pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${numPerPage }" />
	<input type="hidden" value="${eqId}" name="eqId" />
	<input type="hidden" value="${likeTicket}" name="likeTicket" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="/admin/datacenter/ticketSubReplyRelation" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					ID: <input type="text" value="${eqId}" name="eqId"></input>
				</td>
				<td>
				渠道: <input type="text" value="${likeTicket}" name="likeTicket"></input>
				</td>
				<%-- <td>
					类型: <select name="eqType">
					<option value="text" <c:if test ="${eqType == 'text' }">selected="selected" </c:if>>文字</option>
					<option value="news" <c:if test ="${eqType == 'news' }">selected="selected" </c:if>>图文</option>
					</select>
				</td> --%>
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
			<li><a class="add" href="/admin/datacenter/ticketSubReplyRelation/edit" target="dialog" rel="editTag" mask="true" title="新增" width="620" height="500"><span>添加</span></a></li>
			<%-- <li><a class="delete" href="/admin/datacenter/equipmentInfo/delete" target="selectedTodo" rel="inIdList" title="确定删除?"><span>删除</span></a></li>
			<li><a class="icon" href="/admin/datacenter/equipmentInfo/audit?status=${RECORD_NORMAL }&rel=${rel}" target="selectedTodo" rel="inIdList" title="确定恢复正常状态?"><span>恢复</span></a></li> --%>
		</ul>
	</div>
	<table class="list" width="1200" layoutH="100">
		<thead>
			<tr>
				<th>ID<label style="float:left"><input type="checkbox" class="checkboxCtrl" group="inIdList" /></label></th>
				
				<th>渠道</th>
				<th>对应的推文id</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
				<c:choose>
					<c:when test="${null==replyInfos||replyInfos.isEmpty()}">
						<tr class="tatr2">
							<td colspan="11" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="o" items="${replyInfos}">
							<tr target="id" rel="${o.id}">
								<td>${o.id}</td>
								<td>${o.ticket }</td>
								<td>${o.subReplyId }</td>
								<td><a title="修改"  href="${path}/admin/datacenter/ticketSubReplyRelation/edit?id=${o.id}&rel=${rel}" rel="editTag"  width="650" height="550" target="dialog"><span>修改</a>&nbsp;
								<a title="删除" target="ajaxTodo" href="${path}/admin/datacenter/ticketSubReplyRelation/delete?id=${o.id}" rel="equipmentMacInfoHome"  width="650" height="550"><span>删除</span></a>&nbsp;
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