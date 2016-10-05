<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
	
</script>

<form id="pagerForm" method="post" action="${path }/admin/ucenter/userIntegralMoneyRelation">
	<input type="hidden" name="eqLevelId" value="${eqLevelId }"/>
	<input type="hidden" name="pageNum" value="${pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${pageTurn.pageSize }" />
	<input type="hidden" name="rel" value="${rel }" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${path }/admin/ucenter/userIntegralMoneyRelation" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
                    <label>会员等级：</label>
                    <select id="eqLevelId" name="eqLevelId" class="combox">
                    	<option value="">请选择</option>
						<c:forEach var="item" items="${userTypeMap}">   
							<option value="${item.key }" ${eqLevelId == item.key ? 'selected=selected' : ''}>${item.value}</option>
						</c:forEach> 
					</select>
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
			<li><a class="add" href="${path }/admin/ucenter/userIntegralMoneyRelation/edit.do?rel=${rel}" rel="${rel}" target="dialog" width="610" height="500"><span>添加</span></a></li>
			<li><a class="delete" href="${path }/admin/ucenter/userIntegralMoneyRelation/delete.do?rel=${rel}" target="selectedTodo" rel="${ids}" title="确定删除?"><span>删除</span></a></li>
		</ul>
	</div>
	<div layoutH="90">
        <table class="table" width="100%">
            <thead>
			<tr>
				<th>ID<label style="float:left"><input type="checkbox" class="checkboxCtrl" group="ids" /></label></th>
				<th>积分值</th>
				<th>金额(单位：分)</th>
				<th>会员等级</th>
				<th>描述</th>
				<th width="80">操作</th>
			</tr>
		</thead>
		<tbody> 
  			<c:choose>
				<c:when test="${null==userIntegralMoneyRelationList||userIntegralMoneyRelationList.isEmpty()}">
					<tr class="tatr2">
						<td colspan="5" align="center">暂无数据</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${userIntegralMoneyRelationList}" var="object">
						<tr><td>
							<input type="checkbox" name="ids" id="ids" value="${object.id}"/>${object.id}
						</td>
						<td>${object.integralNum}</td>
						<td>${object.exchangeMoney}</td>
						<td>${null == object.levelId ? '' : userTypeMap.get(object.levelId)}</td>
						<td>${object.remark}</td>
						<td><a class="btnEdit" title="修改" target="dialog" href="${path}/admin/ucenter/userIntegralMoneyRelation/edit?id=${object.id}&rel=${rel}" rel="${rel}"  width="610" height="550"><span>修改</span></a>&nbsp;
						</td></tr>
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

