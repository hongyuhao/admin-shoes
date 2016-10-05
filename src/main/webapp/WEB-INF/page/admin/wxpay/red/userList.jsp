<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="/admin/wxpay/red/user/list">
	<input type="hidden" name="nickName" value="${nickName }" />
	<input type="hidden" name="openId" value="${openId }" />
	<input type="hidden" name="sex" value="${sex }" />
	<input type="hidden" name="city" value="${city }" />
	<input type="hidden" name="country" value="${country }" />
	<input type="hidden" name="province" value="${province }" />
	<input type="hidden" name="rel" value="${rel}"/>
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="/admin/wxpay/red/user/list" method="post">
	<input type="hidden" name="rel" value="${rel}"/>
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					<label>用户昵称：</label>
                    <input name="nickName" id="nickName" value="${nickName}">
				</td>
				<td>
					<label>用户openId：</label>
                    <input name="openId" id="openId" value="${openId}">
				</td>
				<td>
					<label>性别：</label>
					<select name="sex">
						<option value="-1" ${sex == -1 ? 'selected':''}>不限</option>
						<option value="0" ${sex == 0 ? 'selected':''}>未知</option>
						<option value="1" ${sex == 1 ? 'selected':''}>男</option>
						<option value="2" ${sex == 2 ? 'selected':''}>女</option>
					</select>
				</td>
				<td>
					<label>城市：</label>
                    <input name="city" id="city" value="${city}">
				</td>
			</tr>
			<tr>
				
				<td>
					<label>国家：</label>
                    <input name="country" id="country" value="${country}">
				</td>
				<td>
					<label>省份：</label>
                    <input name="province" id="province" value="${province}">
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
	   </ul>
	</div>
	<table class="list" width="100%" layoutH="85">
		<thead>
			<tr>
				<th>头像</th>
				<th>昵称</th>
				<th>openId</th>
				<th>关注状态</th>
				<th>性别</th>
				<th>城市</th>
				<th>国家</th>
				<th>省份</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
				<c:choose>
					<c:when test="${null==userList||userList.isEmpty()}">
						<tr class="tatr2">
							<td colspan="11" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="user" items="${userList}">
							<tr target="id">
							
								<td>
									<img src = "${user.headImgUrl }" width="50" height="50"></img>
								</td>
								<td>${user.nickName}</td>
								<td>${user.openId}</td>
								<td>
									<c:choose>
										<c:when test="${user.subScribe == 1 }">关注中</c:when>
										<c:when test="${user.subScribe == -1 }">取消关注</c:when>
										<c:otherwise>尚未关注</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${user.sex == 1 }">男</c:when>
										<c:when test="${user.sex == 2 }">女</c:when>
										<c:otherwise>未知</c:otherwise>
									</c:choose>
								</td>
								<td>${user.city}</td>
								<td>${user.country}</td>
								<td>${user.province}</td>
								<td>
								<c:if test="${admin:permission(USER_ID,VERIFY,'paycenter_redpack',ADD) }">
									<c:choose>
										<c:when test="${user.subScribe == 1 }">
											<a title="红包补发" target="dialog" href="${path}/admin/wxpay/red/reissue/detail?nickName=${user.nickName}&subScribe=${user.subScribe}&userId=${user.userId}&openId=${user.openId}" rel="${rel}"  width="480" height="350"><span>补发红包</span></a>&nbsp;
										</c:when>
									</c:choose>
								</c:if>
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	<div style="clear:both"></div>
