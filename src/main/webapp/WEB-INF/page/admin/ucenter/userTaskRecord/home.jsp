<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
	
</script>

<form id="pagerForm" method="post" action="${path }/admin/ucenter/userTaskRecord">
	<input type="hidden" name="eqId" value="${eqId }"/>
	<input type="hidden" name="eqTaskRecord" value="${eqTaskRecord }"/>
	<input type="hidden" name="pageNum" value="${pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${pageTurn.pageSize }" />
	<input type="hidden" name="rel" value="${rel }" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${path }/admin/ucenter/userTaskRecord" method="post">
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						用户ID: <input type="text" value="${eqId}" name="eqId"></input>
					</td>
					<td>
	                    <label>状态：</label>
						<select  name="eqTaskRecord" id="eqTaskRecord" class="combox">
							<option value="">请选择</option>
							<c:forEach items="${userInfoCompleteStatusMap}" var="entry">
								<option value="${entry.key}">${entry.value}</option>
							</c:forEach>
						</select>
						<script type="text/javascript">
							jQuery('#eqTaskRecord').val("${eqTaskRecord }");
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
			<li><a class="delete" href="${path }/admin/ucenter/userTaskRecord/delete.do?rel=${rel}" target="selectedTodo" rel="${ids}" title="确定删除?"><span>删除</span></a></li>
			<li class="line">line</li>
		</ul>
	</div>

	<table class="table" width="100%" layoutH="115">
 		<thead>
			<tr>
				<th>用户ID<label style="float:left"><input type="checkbox" class="checkboxCtrl" group="ids" /></label></th>
				<th>状态</th>
				<th>创建时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody> 
  			<c:choose>
				<c:when test="${null == userTaskRecordList || userTaskRecordList.isEmpty()}">
					<tr class="tatr2">
						<td colspan="8" align="center">暂无数据</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${userTaskRecordList}" var="object">
					<tr>
						<td><input type="checkbox" name="ids" id="ids" value="${object.id}"/>${object.id}</td>
						<td>${userInfoCompleteStatusMap[object.taskRecord]}</td>
						<td><fmt:formatDate value="${object.createTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td>
							<c:if test="${object.taskRecord == SEND_MAIL}">
								<a  href="javascript:void(0)" onclick="resendMail(${object.id})" >补发</a>
							</c:if>			
						</td>
					</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<script type="text/javascript">
		function resendMail(id) {
			if (id != '') {
				//Ajax向后台提交数据  
				$.ajax({
					type : 'POST',
					url : '${path }/admin/ucenter/userTaskRecord/resend',
					data : 'id=' + id,
					dataType : "json",
					cache : false,
					success : function(data) {
						if(data.statusCode == '200') {
							alertMsg.correct('补发成功！');
							navTabSearch('#pagerForm');
						} else {
							alertMsg.error("补发失败！" + data.message);
						}
					}
				});
			}
		}
	</script>
	
    <div style="clear:both"></div>
    <div class="panelBar">
        <%@ include file="/inc/admin_pagination.jsp" %>
    </div>
</div>

