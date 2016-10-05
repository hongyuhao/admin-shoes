<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="/admin/datacenter/activityCodeInfo">
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pageTurn.page?1:pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${numPerPage }" />
	<input type="hidden" value="${eqBindUserId}" name="eqBindUserId" />
	<input type="hidden" value="${eqCodeInfo}" name="eqCodeInfo" />
<%-- 	<input type="hidden" value="${eqIsNewUser}" name="eqIsNewUser" /> --%>
	<input type="hidden" name="rel" value="${rel}"/>
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="/admin/datacenter/activityCodeInfo" method="post">
	<input type="hidden" name="rel" value="${rel}"/>
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					用户Id: <input type="text" value="${eqBindUserId}" name="eqBindUserId"></input>
				</td>
				<td>
					编码: <input type="text" value="${eqCodeInfo}" name="eqCodeInfo"></input>
				</td>
				<%-- <td>
					<label>是否新用户:</label>
                    <select name="eqIsNewUser" id="isNewUser">
                        <option value="">不限</option>
                        <c:forEach items="${isNewUserMap}" var="entry">
                            <option value="${entry.key}">${entry.value}</option>
                        </c:forEach>
                    </select>
                    <script type="text/javascript">
                    	jQuery('#isNewUser').val("${eqIsNewUser }");
                    </script>
				</td> --%>
				<td>
					<label>是否绑定:</label>
                    <select name="eqCodeStatus" id="codeStatus">
                        <option value="">不限</option>
                        <c:forEach items="${statusMap}" var="entry">
                            <option value="${entry.key}">${entry.value}</option>
                        </c:forEach>
                    </select>
                    <script type="text/javascript">
                    	jQuery('#codeStatus').val("${eqCodeStatus }");
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
	</div>
	<table class="list" width="100%" layoutH="100">
		<thead>
			<tr>
				<th>ID<label style="float:left"><input type="checkbox" class="checkboxCtrl" group="inIdList" /></label></th>	
				<th>编码</th>
				<th>创建时间</th>
				<th>状态</th>
				<th>用户ID</th>
				<th>用户openID</th>
				<th>绑定时间</th>
				<!-- <th>扩展字段1</th>
				<th>扩展字段2</th>
				<th>扩展字段3</th>
				<th>扩展字段4</th>
				<th>扩展字段5</th> -->
				<th>操作</th>
				<!-- <th>是否新用户</th> -->
			</tr>
		</thead>
		<tbody>
				<c:choose>
					<c:when test="${null==activityCodeInfoList||activityCodeInfoList.isEmpty()}">
						<tr class="tatr2">
							<td colspan="11" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="o" items="${activityCodeInfoList}">
							<tr target="id" rel="${o.id}">
								<td>
									<input type="checkbox" name="inIdList" id="inIdList" value="${o.id}"/>${o.id}
								</td>
								<td>${o.codeInfo}</td>
								<td><fmt:formatDate value="${o.createTime }" pattern="yyyy-MM-dd HH:mm" /></td>
								<td>${null ==o.codeStatus?"":statusMap.get(o.codeStatus)}</td>
								<td>${o.bindUserId}</td>
								<td>${o.bindUserOpenId}</td>
								<td><fmt:formatDate value="${o.bindTime }" pattern="yyyy-MM-dd HH:mm" /></td>
								<%-- <td>${-1 == o.isNewUser?"":isNewUserMap.get(o.isNewUser)}</td> --%>
								<%-- <td>${o.expand1}</td>
								<td>${o.expand2}</td>
								<td>${o.expand3}</td>
								<td>${o.expand4}</td>
								<td>${o.expand5}</td> --%>
								<td><a title="修改" target="dialog" href="${path}/admin/datacenter/activityCodeInfo/edit?id=${o.id}&rel=${rel}" rel="${rel}"  width="610" height="550"><span>修改</span></a>&nbsp;</td>
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