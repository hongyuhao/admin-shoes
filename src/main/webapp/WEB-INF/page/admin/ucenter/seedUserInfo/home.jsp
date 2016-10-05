<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>

<form id="pagerForm" method="post" action="${path }/admin/ucenter/seedUserInfo">
   <input type="hidden" name="pageNum" value="${pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${pageTurn.pageSize }" />
	<input type="hidden" value="${eqUserId}" name="eqUserId" />
	<input type="hidden" value="${eqWechatAccount}" name="eqWechatAccount" />
	<input type="hidden" value="${eqWechatNickName}" name="eqWechatNickName" />
	<input type="hidden" value="${eqIsPay}" name="eqIsPay" />
	<input type="hidden" value="${gtCreateTime}" name="gtCreateTime" />
	<input type="hidden" value="${ltCreateTime}" name="ltCreateTime" />
	<input type="hidden" value="${gtSeedTime}" name="gtSeedTime" />
	<input type="hidden" value="${ltSeedTime}" name="ltSeedTime" />
	<input type="hidden" value="${eqRealName}" name="eqRealName" />
	<input type="hidden" value="${eqPhone}" name="eqPhone" />
	<input type="hidden" name="rel" value="${rel }" />
</form>

<div class="pageHeader">
    <form onsubmit="return navTabSearch(this);" action="/admin/ucenter/seedUserInfo" method="post">
	<input type="hidden" value="${rel==null ? parentRel : rel}" name="parentRel">
	<div class="searchBar">
		<table class="searchContent">
		<tr>
				<td>
					用户ID: <input type="text" value="${eqUserId}" name="eqUserId"></input>
				</td>
				<td>
					微信昵称: <input type="text" value="${eqWechatNickName}" onBlur="$(this).val(jQuery.trim($(this).val()));" name="eqWechatNickName" ></input>
				</td>
				<td>
					真名: <input type="text" value="${eqRealName}" onBlur="$(this).val(jQuery.trim($(this).val()));" name="eqRealName" ></input>
				</td>
				<td>
					手机: <input type="text" value="${eqPhone}" onBlur="$(this).val(jQuery.trim($(this).val()));" name="eqPhone" ></input>
				</td>
				<td>
					<div style="float: left;">是否支付: </div><div style="float: left;"><select name="eqIsPay">
							<option value="">--请选择--</option>
								<option value="1" ${eqIsPay==1?'selected':'' }>已支付</option>
								<option value="0" ${eqIsPay==0?'selected':'' }>未支付</option>
						</select></div>
				</td>
			</tr>
			<tr>

				<td colspan="2">
					<table><tr>
					<td>创建时间:</td>
					<td>
						<input type="text" value="${gtCreateTime}" name="gtCreateTime" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true" style="float:left;"/>
						<!-- <a class="inputDateButton" href="javascript:;" style="float:left;">选择</a> -->
					</td>
					<td>~</td>
					<td>
						<input type="text" value="${ltCreateTime}" style="float:left;" name="ltCreateTime" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true"/>
						<!-- <a class="inputDateButton" href="javascript:;" style="float:left;">选择</a> -->
					</td></tr></table>
				</td>
				<td colspan="2">
					<table><tr>
					<td>成为种子用户时间:</td>
					<td>
						<input type="text" value="${gtSeedTime}" name="gtSeedTime" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true" style="float:left;"/>
						<!-- <a class="inputDateButton" href="javascript:;" style="float:left;">选择</a> -->
					</td>
					<td>~</td>
					<td>
						<input type="text" value="${ltSeedTime}" style="float:left;" name="ltSeedTime" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true"/>
						<!-- <a class="inputDateButton" href="javascript:;" style="float:left;">选择</a> -->
					</td></tr></table>
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
			<li class="line">line</li>
		</ul>
	</div>
	
	<table class="table" width="130%" layoutH="155">
		<thead>
			<tr>
				<th><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th>用户openID</th>
				<th>用户ID</th>
				<th>微信账号</th>
				<th>微信昵称</th>
				<th>真名</th>
				<th>手机号码</th>
				<th>详细地址</th>
				<th>支付金额</th>
				<th>专题ID</th>
				<th>是否看过</th>
				<th>是否支付</th>
				<th>创建时间</th>
				<th>成为种子用户时间</th>
				<th width="122px">操作</th>
			</tr>
		</thead>
		<tbody>
				<c:choose>
					<c:when test="${null==seedUserInfoList||seedUserInfoList.isEmpty()}">
						<tr class="tatr2">
							<td colspan="11" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="seed" items="${seedUserInfoList}">
							<tr target="sid_user" rel="${seed.id}">
								<td><input name="ids" value="${seed.id}" type="checkbox" /></td>
								<td>${seed.openId}</td>
								<td>${seed.userId}</td>
								<td>${seed.wechatAccount}</td>
								<td>${seed.wechatNickName}</td>
								<td>${seed.realName}</td>
								<td>${seed.phone}</td>
								<td>${seed.userAddress}</td>
								<td>${seed.payPrice}</td>
								<td>${seed.subjectId}</td>
								<td>${seed.isLook==1?'已看过':'未看过'}</td>
								<td>${seed.isPay==1?'已支付':'未支付'}</td>
								<td><fmt:formatDate value="${seed.createTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td><fmt:formatDate value="${seed.seedTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td>
									<a title="编辑" rel="${seed.id}" target="dialog" mask="true" href="/admin/ucenter/seedUserInfo/edit?id=${seed.id}&oper=edit&parentRel=${rel==null ? parentRel : rel}" class="btnEdit" width="750" height="320">编辑</a>
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