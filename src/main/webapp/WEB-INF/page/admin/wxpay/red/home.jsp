<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>

<form id="pagerForm" method="post" action="${path }/admin/wxpay/red">
	<input type="hidden" name="eqRedStatus" value="${eqRedStatus }"/>
	<input type="hidden" name="likeTitle" value="${likeActName }" />
	<input type="hidden" name="pageNum" value="${pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${pageTurn.pageSize }" />
	<input type="hidden" name="rel" value="${rel }" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${path }/admin/wxpay/red" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					红包名称：
				</td>
				<td>
					<input type="text" size="15" name="likeActName" value="${likeActName }"/>
				</td>
				
                <td>                                                                               
					状态：
				</td>
				<td>
					<select  name="eqRedStatus" id="eqRedStatus" >
						<option value="">请选择</option>
						<c:forEach items="${cardStatusMap}" var="entry">
							<option value="${entry.key}">${entry.value}</option>
						</c:forEach>
					</select>
				</td>
				
				<td>
					<div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div>
				</td>
			</tr>
		</table>
		<script type="text/javascript">
			jQuery('#eqCardStatus').val("${eqStatus }");
		</script>
	</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			 <li><a class="add" href="${path }/admin/wxpay/red/edit.do?rel=${rel}" rel="${rel}" target="dialog" width="650" height="550"><span>添加</span></a></li>
			 <li><a class="delete" href="${path }/admin/wxpay/red/delete.do?rel=${rel}" target="selectedTodo" rel="ids" title="确定删除?"><span>删除</span></a></li>
			<li class="line">line</li>
		</ul>
	</div>

	 <div layoutH="92">
        <table class="list" width="100%" id="redPackList">
            <thead>
			<tr>
				<th><label style="float:left"><input type="checkbox" class="checkboxCtrl" group="ids" /></label>ID</th>
				<th>名称</th>
				<th>商户名称</th>
				<th>提供方名称</th>
				<th>金额</th>
				<th>最大金额</th>
				<th>最小金额</th>
				<th>发放人数</th>
				<th>状态</th>
				<th>开始时间</th>
				<th>结束时间</th>
				<th>创建人ID</th>
				<th>创建时间</th>
				<th>操作</th>
			</tr>
		</thead>
		  <tbody> 
		  			<c:choose>
						<c:when test="${null==redPackList||redPackList.isEmpty()}">
							<tr class="tatr2">
								<td colspan="12" align="center">暂无数据</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${redPackList}" var="red">
								<tr target="id" rel="${red.id}">
								<td>
									<input type="checkbox" name="ids" id="ids" value="${red.id}"/>${red.id}
								</td>
								<td>${red.actName}</td>
								<td>${red.nickName}</td>
								<td>${red.sendName}</td>
								<td>${red.totalAmount }</td>
								<td>${red.maxValue }</td>
								<td>${red.minValue }</td>
								<td>${red.totalNum }</td>
								<td>${cardStatusMap[red.redStatus]}</td>
								<td><fmt:formatDate value="${red.startTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td><fmt:formatDate value="${red.endTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td>${red.createUserId }</td>
								<td><fmt:formatDate value="${red.createTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								
								<td><a title="修改" target="dialog"  width="650" height="550" href="${path}/admin/wxpay/red/edit?id=${red.id}&rel=${rel}" rel="${rel}" ><span>修改</span></a>&nbsp;
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
</div>

