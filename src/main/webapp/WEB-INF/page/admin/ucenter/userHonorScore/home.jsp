<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>

<form id="pagerForm" method="post" action="${path }/admin/ucenter/userHonorScore">
	<input type="hidden" name="eqUserId" value="${eqUserId }"/>
	<input type="hidden" name="pageNum" value="${pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${pageTurn.pageSize }" />
	<input type="hidden" name="rel" value="${rel }" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${path }/admin/ucenter/userHonorScore" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					用户ID：
				</td>
				<td>
					<input type="text" size="15" name="eqUserId" value="${eqUserId }"/>
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
		<%-- <ul class="toolBar">
			 <li><a class="add" href="${path }/admin/ucenter/userHonorScore/edit.do?rel=${rel}" rel="${rel}" target="dialog" width="650" height="550"><span>添加</span></a></li>
			 <li><a class="delete" href="${path }/admin/ucenter/userHonorScore/delete.do?rel=${rel}" target="selectedTodo" rel="ids" title="确定删除?"><span>删除</span></a></li>
			<li class="line">line</li>
		</ul> --%>
	</div>

	 <div layoutH="92">
        <table class="list" width="100%" id="userHonorScoreList">
            <thead>
			<tr>
				<th><label style="float:left"><input type="checkbox" class="checkboxCtrl" group="ids" /></label>ID</th>
				<th>用户ID</th>
				<th>荣誉类型</th>
				<th>分值</th>
			</tr>
		</thead>
		  <tbody> 
		  			<c:choose>
						<c:when test="${null==userHonorScoreList||userHonorScoreList.isEmpty()}">
							<tr class="tatr2">
								<td colspan="12" align="center">暂无数据</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${userHonorScoreList}" var="userHonorScore">
								<tr target="id" rel="${userHonorScore.id}">
								<td>
									<input type="checkbox" name="ids" id="ids" value="${userHonorScore.id}"/>${userHonorScore.id}
								</td>
								<td>${userHonorScore.userId}</td>
								<td>${userHonorScore.honorType}</td>
								<td>${userHonorScore.honorScore}</td>
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

