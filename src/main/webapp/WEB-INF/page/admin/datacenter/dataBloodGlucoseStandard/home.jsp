<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="/admin/datacenter/dataBloodGlucoseStandard">
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pageTurn.page?1:pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${numPerPage }" />
	<input type="hidden" name="rel" value="${rel}"/>
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="/admin/datacenter/dataBloodGlucoseStandard" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<%-- <td>
					报告: <input type="text" value="${eqLevel}" name="eqLevel"></input>
				</td> --%>
				<td>
					<label>测量人群:</label>
                    <select name="eqCrowdType" id="eqCrowdType">
                        <option value="">不限</option>
                        <c:forEach items="${crowdTypeMap}" var="entry">
                            <option value="${entry.key}">${entry.value}</option>
                        </c:forEach>
                    </select>
                    <script type="text/javascript">
                    	jQuery('#eqCrowdType').val("${eqCrowdType}");
                    </script>
				</td>
				<td>
					<label>状态:</label>
                    <select name="eqStatus" id="eqStatus">
                        <option value="">不限</option>
                        <c:forEach items="${testStatusMap}" var="entry">
                            <option value="${entry.key}">${entry.value}</option>
                        </c:forEach>
                    </select>
                    <script type="text/javascript">
                    	jQuery('#eqStatus').val("${eqStatus }");
                    </script>
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
			<li><a class="add" href="/admin/datacenter/dataBloodGlucoseStandard/edit" target="dialog" rel="editTag" mask="true" title="新增" width="620" height="500"><span>新增</span></a></li>
			<li><a class="delete" href="/admin/datacenter/dataBloodGlucoseStandard/delete" target="selectedTodo" rel="inIdList" title="确定删除?"><span>删除</span></a></li>
		</ul>
	</div>
	<table class="list" width="100%" layoutH="100">
		<thead>
			<tr>
				<th>ID<label style="float:left"><input type="checkbox" class="checkboxCtrl" group="inIdList" /></label></th>
				<th>最小值</th>
				<th>最大值</th>
				<th>测量时机</th>
				<th>测量人群</th>
				<th>状态</th>
				<th>级别</th>
				<!-- <th>结果</th> -->
				<th>更新时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
				<c:choose>
					<c:when test="${null==dataBloodGlucoseStandardList||dataBloodGlucoseStandardList.isEmpty()}">
						<tr class="tatr2">
							<td colspan="11" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="o" items="${dataBloodGlucoseStandardList}">
							<tr target="id" rel="${o.id}">
								<td>
									<input type="checkbox" name="inIdList" id="inIdList" value="${o.id}"/>${o.id}
								</td>
								<td>${o.min}</td>
								<td>${o.max}</td>
								<td>${testMomentMap[o.testMoment] }</td>
								<td>${crowdTypeMap[o.crowdType] }</td>
								<td>${testStatusMap[o.status]}</td>
								<td>${o.level }</td>
								<td><fmt:formatDate value="${o.createTime }" pattern="yyyy-MM-dd HH:mm" /></td>
<%-- 								<td><a target="navTab" href="/admin/datacenter/dataConclusions?eqId=${o.dataConclusionsId }" rel="${rel }">查看报告</a></td>
 --%>								<td><a title="修改" target="dialog" href="${path}/admin/datacenter/dataBloodGlucoseStandard/edit?id=${o.id}&rel=${rel}" rel="${rel}"  width="610" height="550"><span>修改</span></a>&nbsp;</td>
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