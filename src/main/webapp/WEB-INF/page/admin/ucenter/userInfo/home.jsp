<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="/admin/ucenter/user/accountInfo">
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pageTurn.page?1:pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${numPerPage }" />
	<input type="hidden" value="${eqId}" name="eqId" />
	<input type="hidden" value="${eqAccountName}" name="eqAccountName" />
	<input type="hidden" value="${likeNickName}" name="likeNickName" />
	<input type="hidden" value="${eqPhone}" name="eqPhone" />
	<input type="hidden" value="${eqEmail}" name="eqEmail" />
	<input type="hidden" value="${gtCreateDate}" name="gtCreateDate" />
	<input type="hidden" value="${ltCreateDate}" name="ltCreateDate" />
	<input type="hidden" value="${rel==null ? parentRel : rel}" name="parentRel">
</form>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="/admin/ucenter/user/accountInfo" method="post">
	<input type="hidden" value="${rel==null ? parentRel : rel}" name="parentRel">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					用户ID: <input type="text" value="${eqId}" name="eqId"></input>
				</td>
				<td>
					用户名: <input type="text" value="${eqAccountName}" onBlur="$(this).val(jQuery.trim($(this).val()));" name="eqAccountName" ></input>
				</td>
				<td>
					昵称: <input type="text" value="${likeNickName}" onBlur="$(this).val(jQuery.trim($(this).val()));" name="likeNickName" ></input>
				</td>
				<td>
					手机号码: <input type="text" value="${eqPhone}" onBlur="$(this).val(jQuery.trim($(this).val()));" name="eqPhone" ></input>
				</td>
				<td>
					邮     箱: <input type="text" value="${eqEmail}" onBlur="$(this).val(jQuery.trim($(this).val()));" name="eqEmail" ></input>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<table><tr>
							<td>注册时间:</td>
							<td>
								<input type="text" value="${gtCreateDate}" name="gtCreateDate" class="date" dateFmt="yyyy-MM-dd" readonly="true" style="float:left;"/>
								<a class="inputDateButton" href="javascript:;" style="float:left;">选择</a>
							</td>
							<td>~</td>
							<td>
								<input type="text" value="${ltCreateDate}" name="ltCreateDate" class="date" dateFmt="yyyy-MM-dd" readonly="true" style="float:left;"/>
								<a class="inputDateButton" href="javascript:;" style="float:left;">选择</a>
							</td>
					</tr></table>
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
		    <!-- <permission:permission url="/admin/ucenter/user/accountInfo/edit">
			     <li><a class="add" href="/admin/ucenter/user/accountInfo/edit" target="dialog" rel="editTag" mask="true" title="新增标签"><span>新增</span></a></li>
			</permission:permission>
			<permission:permission url="/admin/ucenter/user/accountInfo/delete">
				<li><a class="delete" href="/admin/ucenter/user/accountInfo/batDel" posttype="string" target="selectedTodo" ><span>批量删除</span></a></li>
			</permission:permission> -->
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th>用户ID</th>
				<th>用户名</th>
				<th>用户昵称</th>
				<th>用户身份</th>
				<th>性别</th>
				<th>邮箱</th>
				<th>邮箱有效性</th>
				<th>手机</th>
				<th>手机有效性</th>
				<th>注册时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
				<c:choose>
					<c:when test="${null==userBaseAccountInfoList||userBaseAccountInfoList.isEmpty()}">
						<tr class="tatr2">
							<td colspan="11" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="user" items="${userBaseAccountInfoList}">
							<tr target="sid_user" rel="${user.id}">
								<td><input name="ids" value="${user.id}" type="checkbox" /></td>
								<td>${user.id}</td>
								<td>${user.accountName}</td>	
								<td>${user.nickName}</td>
								<td>${null == user.userType ? '普通用户':userTypeMap.get(user.userType)}</td>
								<td>${user.sex == 2 ? '女':'男'}</td>
								<td>${user.email}</td>
								<td>${user.isEmailValid == 1 ? '已验证':'未验证'}</td>
								<td>${user.phone}</td>
								<td>${user.isPhoneValid == 1 ? '已验证':'未验证'}</td>
								<td>${ucenter:dateFormat(user.createTime,"yyyy-MM-dd") }
								<td>
									<a title="${user.accountName}" rel="accountInfoView" target="dialog" href="/admin/ucenter/user/accountInfo/edit?id=${user.id}&isdel=0&oper=view&parentRel=${rel==null ? parentRel : rel}" width="750" height="320">详情</a>
									<a title="${user.accountName}" rel="accountInfoEdit" target="dialog" mask="true" href="/admin/ucenter/user/accountInfo/edit?id=${user.id}&oper=edit&parentRel=${rel==null ? parentRel : rel}" width="750" height="320">编辑</a>
									<a title="${user.accountName}" rel="userIntegralRecord" target="navTab" mask="true" href="/admin/ucenter/userIntegralRecord/list?eqUserId=${user.id}">积分</a>
									<a title="${user.accountName}" rel="userRechargeRecord" target="navTab" mask="true" href="/admin/ucenter/userRechargeBalance?eqId=${user.id}">余额</a>
									<%-- <a target="ajaxTodo" href="/admin/ucenter/tagBaseInfo/delete?id=${tag.id}" class="btnDel">删除</a> --%>
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