<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="/admin/datacenter/activityUserLog">
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pageTurn.page?1:pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${numPerPage }" />
	<input type="hidden" value="${eqUserId}" name="eqUserId" />
	<input type="hidden" value="${eqUserOpenId}" name="eqUserOpenId" />
	<input type="hidden" value="${eqActivityId}" name="eqActivityId" />
	<input type="hidden" value="${eqActivityNodeSeq}" name="eqActivityNodeSeq" />
	<input type="hidden" value="${eqActivityNodeSeq}" name="eqActivityNodeSeq" />
	<input type="hidden" value="${eqBindPhone}" name="eqBindPhone" />
	<input type="hidden" value="${eqIsNewUser}" name="eqIsNewUser" />
	<input type="hidden" name="rel" value="${rel}"/>
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="/admin/datacenter/activityUserLog" method="post">
	<input type="hidden" name="rel" value="${rel}"/>
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					用户ID: <input type="text" value="${eqUserId}"  size="8" name="eqUserId"></input>
				</td>
				<td>
					用户openID: <input type="text" value="${eqUserOpenId}" name="eqUserOpenId"></input>
				</td>
				<td>
					活动ID: <input type="text" value="${eqActivityId}" size="4" name="eqActivityId"></input>
				</td>
				<td>
					节点: <input type="text" value="${eqActivityNodeSeq}" size="4" name="eqActivityNodeSeq"></input>
				</td>
				<td>
					手机号: <input type="text" value="${eqBindPhone}" size="10" name="eqBindPhone"></input>
				</td>
				<td>
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
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<table><tr>
					<td>节点时间:</td>
					<td>
						<input type="text" value="${gtActivityNodeTime}" name="gtActivityNodeTime" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true" style="float:left;"/>
					</td>
					<td>~</td>
					<td>
						<input type="text" value="${ltActivityNodeTime}" style="float:left;" name="ltActivityNodeTime" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true"/>
					</td>
					<td>
					    <div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div>
				    </td>
					</tr></table>
				</td>
			</tr>
		</table>
	</div>
	</form>

</div>
<div class="pageContent">
	<div class="panelBar">
	    <ul class="toolBar">
			 <li>
				<a class="icon" href="/admin/datacenter/activityUserLog/export?rel=${rel}" rel="inIdList" target="dwzExport" title="实要导出这些记录吗？"><span>导出Excel</span></a>
			</li>
		</ul>
	</div>
	<table class="list" width="100%" layoutH="115">
		<thead>
			<tr>
				<th>ID<label style="float:left">
				<input type="checkbox" class="checkboxCtrl" group="inIdList" /></label></th>	
				<th>活动名称</th>
				<th>节点</th>
				<th>节点时间</th>
				<th>用户ID</th>
				<th>用户openID</th>
				<th>是否新用户</th>
				<th>手机号码</th>
				<th>奖励牛币</th>
				<th>发送状态</th>
				<th>操作</th>
				<!-- <th>扩展字段4</th>
				<th>扩展字段5</th> -->
			</tr>
		</thead>
		<tbody>
				<c:choose>
					<c:when test="${null==activityUserLogList||activityUserLogList.isEmpty()}">
						<tr class="tatr2">
							<td colspan="11" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="o" items="${activityUserLogList}">
							<tr target="id" rel="${o.id}">
								<td>
									<input type="checkbox" name="inIdList" id="inIdList" value="${o.id}"/>${o.id}
								</td>
								<c:choose>
								   <c:when test="${o.activityId == 1}"><td>微车票活动</td></c:when>
								   <c:when test="${o.activityId == 2 }"><td>流量宝活动</td></c:when>
								   <c:when test="${o.activityId == 3 }"><td>怡成活动</td></c:when>
								   <c:otherwise><td>${o.activityId}</td></c:otherwise>
								</c:choose>
								<td>${o.activityNodeSeq}</td>
								<td><fmt:formatDate value="${o.activityNodeTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td>${o.userId}</td>
								<td>${o.userOpenId}</td>
								<td>${isNewUserMap.get(o.isNewUser)}</td>
								<td>${o.bindPhone}</td>
								<td>${o.rechargeNum}</td>
								<c:choose>
								   <c:when test="${o.sendStatus == 1}"><td>发送成功</td></c:when>
								   <c:when test="${o.sendStatus == -1 }"><td><font color="red">发送失败</font></td></c:when>
								   <c:otherwise><td>状态未知</td></c:otherwise>
								</c:choose>
								<c:choose>
								 <c:when test="${o.sendStatus == -1 && o.activityId == 2 }">
								 	<td>
										<a title="流量补发" rel="${o.userId }" target="dialog" mask="true" href="/admin/datacenter/activityUserLog/edit?id=${o.id}&oper=edit&parentRel=${rel==null ? parentRel : rel}" >流量补发</a>
									</td>
								 </c:when>
								 <c:otherwise><td></td></c:otherwise>
								</c:choose>
								<%-- <td>${o.expand3}</td>
								<td>${o.expand4}</td>
								<td>${o.expand5}</td> --%>
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