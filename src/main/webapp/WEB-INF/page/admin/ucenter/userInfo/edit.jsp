<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp" %>
<div class="pageContent">
	<form method="post" action='/admin/ucenter/user/accountInfo/${null==account?"add":"update"}' class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		<div class="pageFormContent" layoutH="56">
			<table>
				<input type="hidden" name="parentRel" value="${parentRel }"/>
				<c:if test="${null != account || null != userInfo }">
					<tr class="nowrap">
						<td>
							<label>用户ID:</label>
							<input type="text" name="id" readonly="readonly" value="${account.id}">
						</td>
					<tr>
				</c:if>
				<tr class="nowrap">
					<td>
						<label>用户名:</label>
						<input type="text" id="accountName" name="accountName" ${null==account?'':'readonly=readonly' } value="${account.accountName}">
					</td>
				</tr>
				<tr class="nowrap">
					<td>
						<label>用户昵称:</label>
						<input type="text" id="nickName" name="nickName" ${oper=='view'?'readonly=readonly':'' } value="${userInfo.nickName}">
					</td>
				</tr>
				<tr class="nowrap">
					<td>
						<label>用户身份:</label>
						<input value="${null == levelInfo.levelId?'普通用户':userTypeMap.get(levelInfo.levelId) }" readonly="readonly"/>
						<input type="hidden" id="userType" name="userType" ${oper=='view'?'readonly=readonly':'' } value="${levelInfo.levelId}">
					</td>
				</tr>
				<tr class="nowrap">
					<td>
					<label>性别:</label>
					<c:choose>
						<c:when test="${oper=='view'}">
							<input type="text" name="sex" readonly="readonly" value="${userInfo.sex == 2 ? '女' : '男' }" />
						</c:when>
						<c:otherwise>
							<span><input type="radio" name="sex" value="1" ${userInfo.sex == 1 ? 'checked=checked' : '' }/>男</span>
							<span><input type="radio" name="sex" value="2" ${userInfo.sex == 2 ? 'checked=checked' : '' }/>女</span>  
						</c:otherwise>
					</c:choose>
					</td>
				</tr>
				<tr class="nowrap">
					<td>
					<label>年龄:</label>
					<input type="text" id="age" name="age" value="${userInfo.age}" ${oper=='view'?'readonly=readonly':'' }>
					</td>
				</tr>
				<tr class="nowrap">
					<td>
						<label>绑定手机:</label>
						<input type="text" id="phone" name="phone" value="${account.phone}" ${oper=='view'?'readonly=readonly':'' } />
						<c:if test="${oper!='view' }">
							<input type="checkbox" value="1" name="isPhoneValid" ${account.isPhoneValid==1?'checked=checked':'' }/>手机生效
						</c:if>
					</td>
				</tr>
				
				<tr class="nowrap">
					<td>
						<label>绑定邮箱:</label>
						<input type="text" id="phone" name="email" value="${account.email}" ${oper=='view'?'readonly=readonly':'' } />
						<c:if test="${oper!='view' }">
							<input type="checkbox" value="1" name="isEmailValid" ${account.isEmailValid==1?'checked=checked':'' }/>邮箱生效
						</c:if>
					</td>
				</tr>
				
				<tr class="nowrap">
				<td>
					<label>证件类型:</label>
					<input type="text" id="identityType" name="identityType" value="${userInfo.identityType}" ${oper=='view'?'readonly=readonly':'' }>
					</td>
				</tr>
				<tr class="nowrap">
				<td>
					<label>证件号码:</label>
					<input type="text" id="identityCard" name="identityCard" value="${userInfo.identityCard}" ${oper=='view'?'readonly=readonly':'' }>
					</td>
				</tr>
				<tr class="nowrap">
				<td>
					<label>紧急联系人:</label>
					<input type="text" id="emergencyContactName" name="emergencyContactName" value="${userInfo.emergencyContactName}" ${oper=='view'?'readonly=readonly':'' }>
					</td>
				</tr>
				<tr class="nowrap">
				<td>
					<label>紧急电话:</label>
					<input type="text" id="emergencyPhone" name="emergencyPhone" value="${userInfo.emergencyPhone}" ${oper=='view'?'readonly=readonly':'' }>
					</td>
				</tr>
				<tr class="nowrap">
				<td>
					<label>医保信息:</label>
					<input type="text" id="medicalInsuranceInfo" name="medicalInsuranceInfo" value="${userInfo.medicalInsuranceInfo}" ${oper=='view'?'readonly=readonly':'' }>
					</td>
				</tr>
			</table>
		</div>
		<div class="formBar">
			<c:if test="${oper != 'view' }">
				<ul>
					<!--<li><a class="buttonActive" href="javascript:;"><span>保存</span></a></li>-->
					<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
					<li>
						<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
					</li>
				</ul>
			</c:if>
		</div>
	</form>
</div>

