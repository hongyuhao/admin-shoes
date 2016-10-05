<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="/admin/activity/systemPushInfo">
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pageTurn.page?1:pageTurn.page}" />
	<input type="hidden" name="numPerPage" value="${numPerPage}" />
	<input type="hidden" name="rel" value="${rel}"/>
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="/admin/activity/systemPushInfo" method="post">
	<input type="hidden" name="rel" value="${rel}"/>
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					消息内容: <input type="text" value="${lkContent}" name="lkContent"></input>
				</td>
				<td>
					<label>状态:</label>
                    <select name="eqStatus" id="status">
                        <option value="">不限</option>
                        <c:forEach items="${statusMap}" var="entry">
                            <option value="${entry.key}">${entry.value}</option>
                        </c:forEach>
                    </select>
                    <script type="text/javascript">
                    	jQuery('#status').val("${eqStatus }");
					</script>
				</td>
				<td>
<!-- 					<label>数据格式:</label> -->
<!--                     <select name="eqDataFormat" id="dataFormat"> -->
<!--                         <option value="">不限</option> -->
<%--                         <c:forEach items="${dataFormatMap}" var="entry"> --%>
<%--                             <option value="${entry.key}">${entry.value}</option> --%>
<%--                         </c:forEach> --%>
<!--                     </select> -->
<!--                     <script type="text/javascript"> -->
<%-- //                     	jQuery('#dataFormat').val("${eqDataFormat }"); --%>
<!--                     </script> -->
<!-- 				</td> -->
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
	      <li><a class="add" href="/admin/activity/systemPushInfo/edit" target="dialog" rel="editTag" mask="true" title="新增" width="620" height="500"><span>新增</span></a></li>
			<li><a class="delete" href="/admin/activity/systemPushInfo/softDel?rel=${rel}" target="selectedTodo" rel="inIdList" title="确定删除?"><span>删除</span></a></li>
	   </ul>
	</div>
	<table class="list" width="100%" layoutH="85">
		<thead>
			<tr>
				<th>id<label style="float:left"><input type="checkbox" class="checkboxCtrl" group="inIdList" /></label></th>	
<!-- 				<th>消息类型</th> -->
				<th>消息内容</th>
				<th>状态</th>
				<th>跳转链接</th>
				<th>图片</th>
<!-- 				<th>数据格式</th> -->
<!-- 				<th>目标用户群</th> -->
				<th>创建时间</th>
				<th>开始时间</th>
				<th>结束时间</th>
<!-- 				<th>操作</th> -->
			</tr>
		</thead>
		<tbody>
				<c:choose>
					<c:when test="${null==systemPushInfoList||systemPushInfoList.isEmpty()}">
						<tr class="tatr2">
							<td colspan="11" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="o" items="${systemPushInfoList}">
							<tr target="id" rel="${o.id}">
								<td>
									<input type="checkbox" name="inIdList" id="inIdList" value="${o.id}"/>${o.id}
								</td>
<%-- 								<td>${msgTypeMap.get(o.msgType)}</td> --%>
								<td>${o.content}</td>
								<td>${statusMap.get(o.status)}</td>
								<td>${o.url}</td>
								<td><img src="${o.imgUrl}" width="250" height="100"/></td>
<%-- 								<td>${dataFormatMap.get(o.dataFormat)}</td> --%>
<%-- 								<td>${o.targetUserGroup}</td> --%>
								<td><fmt:formatDate value="${o.createTime }" pattern="yyyy-MM-dd HH:mm" /></td>
								<td><fmt:formatDate value="${o.startTime }" pattern="yyyy-MM-dd HH:mm" /></td>
								<td><fmt:formatDate value="${o.endTime }" pattern="yyyy-MM-dd HH:mm" /></td>
<%-- 								<td><a title="修改" target="dialog" href="${path}/admin/activity/systemPushInfo/edit?id=${o.id}&rel=${rel}" rel="${rel}"  width="610" height="550"><span>修改</span></a>&nbsp;</td> --%>
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