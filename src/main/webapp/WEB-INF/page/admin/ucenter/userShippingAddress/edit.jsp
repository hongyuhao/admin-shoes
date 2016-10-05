<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp" %>

<script type="text/javascript">
$(function(){
	
	var areaAll = areaAllJson;
	var provinceId = '${address.provinceId}';
	var cityId = '${address.cityId}';
	var districtId = '${address.districtId}';
	var provinceHtml = "";
	var cityHtml = "";
	var districtHtml = "";
	for(var i = 0; i<areaAll.length; i++) {
		var json = areaAll[i];
		//省份
		if(json.parentId=="0") {
			if(json.areaCode == provinceId) {
				provinceHtml += '<option value="' + json.areaCode + '" selected>' + json.areaName +'</option>'; 
			} else {
				provinceHtml += '<option value="' + json.areaCode + '">' + json.areaName +'</option>'; 
			}
		}
		$('#provinceSelector').html(provinceHtml);
		//市
		if(json.parentId==provinceId) {
			if(json.areaCode == cityId) {
				cityHtml += '<option value="' + json.areaCode + '" selected>' + json.areaName +'</option>'; 
			} else {
				cityHtml += '<option value="' + json.areaCode + '">' + json.areaName +'</option>'; 
			}
		}
		$('#citySelector').html(cityHtml);
		//区
		if(json.parentId==cityId) {
			if(json.areaCode == districtId) {
				districtHtml += '<option value="' + json.areaCode + '" selected>' + json.areaName +'</option>'; 
			} else {
				districtHtml += '<option value="' + json.areaCode + '">' + json.areaName +'</option>'; 
			}
		}
		$('#districtSelector').html(districtHtml);
	}
	
	$('#provinceSelector').on('change',function(){
		var province = $('#provinceSelector option:selected').text();
		var selectCode = $('#provinceSelector option:selected').attr('value');
		var cityHtml = '<option value="">--请选择--</option>';
		$('#province').val(province);
		for(var i = 0; i<areaAll.length; i++) {
			var area = areaAll[i];
			if(area.parentId == selectCode) {
				cityHtml += '<option value="' + area.areaCode + '">' + area.areaName +'</option>';
			}
		}
		$('#citySelector').html('');
		$('#citySelector').html(cityHtml);
		$('#districtSelector').html('');
	});
	
	$('#citySelector').on('change',function(){
		var city = $('#citySelector option:selected').text();
		var selectCode = $('#citySelector option:selected').attr('value');
		var districtHtml = '<option value="">--请选择--</option>';
		$('#city').val(city);
		for(var i = 0; i<areaAll.length; i++) {
			var area = areaAll[i];
			if(area.parentId == selectCode) {
				districtHtml += '<option value="' + area.areaCode + '">' + area.areaName +'</option>';
			}
		}
		$('#districtSelector').html('');
		$('#districtSelector').html(districtHtml);
	});
	
	$('#districtSelector').on('change',function(){
		var city = $('#citySelector option:selected').text();
		$('#city').val(city);
	});
	
});
</script>
<div class="pageContent">
	<form method="post" action='/admin/ucenter/address/${null==address?"add":"update"}' class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		<div class="pageFormContent" layoutH="56">
			<input type="hidden" name="parentRel" value="${parentRel }"/>
			<input type="hidden" name="id" value="${address.id }">
			<input type="hidden" name="source" value="${null == address?'ehy':address.source }">
			<c:choose>
				<c:when test="${null!=address }">
					<input type="hidden" id="userId" name="userId" class="required" ${null!=address?'readonly=readonly':'' } value="${address.userId}">
				</c:when>
				<c:otherwise>
					<input type="hidden" name="userId" id="userId" class="required"/>
				</c:otherwise>
			</c:choose>
			<p class="nowrap">
				<label>所属用户:</label>
				<c:if test="${null != address }">
					<input type="text" id="accountName" name="accountName" class="required" ${null!=address?'readonly=readonly':'' } value="${address.accountName}">
				</c:if>
				<c:if test="${null == address }">
					<input class="required" name="user.accountName" type="text" postField="keyword" lookupGroup="user"/>
					<input type="hidden" class="required" name="user.id" type="text" postField="keyword" lookupGroup="user"/>
					<a class="btnLook" href="/admin/ucenter/user/accountInfo?oper=lookup" lookupGroup="user">查找带回</a>
				</c:if>
			</p>
			<p class="nowrap">
				<label>标注:</label>
				<input type="text" id="name" name="name" class="required" ${oper=='view'?'readonly=readonly':'' } value="${address.name}">
			</p>
			<p class="nowrap">
				<label>收货人:</label>
				<input type="text" id="contacts" name="contacts" class="required" ${oper=='view'?'readonly=readonly':'' } value="${address.contacts}">
			</p>
			<p class="nowrap">
				<label>收货人手机:</label>
				<input type="text" id="contactNumber" name="contactNumber" class="required" ${oper=='view'?'readonly=readonly':'' } value="${address.contactNumber}">
			</p>
			
			<p class="nowrap">
				<label>省:</label>
				<c:choose>
					<c:when test="${oper=='view'}">
						<input type="text" id="province" name="province" class="required" value="${address.province}">
					</c:when>
					<c:otherwise>
						<input type="hidden" id="province" name="province" value="${address.province}"/>
						<select  name="provinceId" id="provinceSelector">
						<option value="">--请选择--</option>
					</select>
					</c:otherwise>
				</c:choose>
			</p>
			<p class="nowrap">
				<label>市:</label>
				<c:choose>
					<c:when test="${oper=='view'}">
						<input type="text" id="city" name="city" class="required" value="${address.city}">
					</c:when>
					<c:otherwise>
						<input type="hidden" id="city" name="city" class="required" value="${address.city}">
						<select  name="cityId" id="citySelector">
						<option value="">--请选择--</option>
					</select>
					</c:otherwise>
				</c:choose>
			</p>
			<p class="nowrap">
				<label>区:</label>
				<c:choose>
					<c:when test="${oper=='view'}">
						<input type="text" id="district" name="district" class="required" value="${address.district}">
					</c:when>
					<c:otherwise>
						<input type="hidden" id="district" name="district" class="required" value="${address.district}">
						<select  name="areaId" id="districtSelector">
						<option value="">--请选择--</option>
					</select>
					</c:otherwise>
				</c:choose>
			</p>
			<p class="nowrap">
				<label>详细地址:</label>
				<input type="text" name="street" ${oper=='view'?'readonly=readonly':'' } class="required" value="${address.street}">
			</p>
			
			<p class="nowrap">
				<label>邮编:</label>
				<input type="text" name="postcode" ${oper=='view'?'readonly=readonly':'' } value="${address.postcode}">
			</p>
		</div>
		<div class="formBar">
			<c:if test="${oper != 'view' }">
				<ul>
					<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
					<li>
						<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
					</li>
				</ul>
			</c:if>
		</div>
	</form>
</div>

