<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>

<form id="pagerForm" method="post" action="${path }/admin/ucenter/userHonorType">
	<input type="hidden" name="eqTypeName" value="${eqTypeName }"/>
	<input type="hidden" name="eqTypeStatus" value="${eqTypeStatus }" />
	<input type="hidden" name="pageNum" value="${pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${pageTurn.pageSize }" />
	<input type="hidden" name="rel" value="${rel }" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${path }/admin/ucenter/userHonorType" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					名称：
				</td>
				<td>
					<input type="text" size="15" name="eqTypeName" value="${eqTypeName }"/>
				</td>
				
                <td>                                                                               
					状态：
				</td>
				<td>
					<select  name="eqTypeStatus" id="eqTypeStatus" >
						<option value="">请选择</option>
						<c:forEach items="${honorStatusMap}" var="entry">
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
			jQuery('#eqTypeStatus').val("${eqTypeStatus }");
		</script>
	</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			 <li><a class="add" href="${path }/admin/ucenter/userHonorType/edit.do?rel=${rel}" rel="${rel}" target="dialog" width="650" height="550"><span>添加</span></a></li>
			 <li><a class="delete" href="${path }/admin/ucenter/userHonorType/delete.do?rel=${rel}" target="selectedTodo" rel="ids" title="确定删除?"><span>删除</span></a></li>
			<li class="line">line</li>
		</ul>
	</div>

	 <div layoutH="92">
        <table class="list" width="100%" id="userHonorTypeList">
            <thead>
			<tr>
				<th><label style="float:left"><input type="checkbox" class="checkboxCtrl" group="ids" /></label>ID</th>
				<th>名称</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
		  <tbody> 
		  			<c:choose>
						<c:when test="${null==userHonorTypeList||userHonorTypeList.isEmpty()}">
							<tr class="tatr2">
								<td colspan="12" align="center">暂无数据</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${userHonorTypeList}" var="type">
								<tr target="id" rel="${type.id}">
								<td>
									<input type="checkbox" name="ids" id="ids" value="${type.id}"/>${type.id}
								</td>
								<td>${type.typeName}</td>
								<td>${honorStatusMap[type.typeStatus]}</td>
								<td><a title="修改" target="dialog"  width="650" height="550" href="${path}/admin/ucenter/userHonorType/edit?id=${type.id}&rel=${rel}" rel="${rel}" ><span>修改</span></a>&nbsp;
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

