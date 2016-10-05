<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
function processBack(response){
	if (response.statusCode == DWZ.statusCode.ok){
		alertMsg.correct(response.message);
		 $.pdialog.closeCurrent();
		 navTab.reload("${path }/admin/datacenter/equipmentMacInfo", "");
	} else {
		alertMsg.error(response.message);
		return false;
	}
}
</script>
<div class="pageContent">
	<form method="post" action="${path }/admin/datacenter/equipmentMacInfo/gen"
		 class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input type="hidden" name="rel" value="${rel}"/>
		<div class="pageFormContent" layoutH="57" align="left">
			<p class="nowrap">
            	<label>设备：</label>
				<input class="required" type="text" readonly="readonly" value="${model.name}"/>
				<input name="equipmentId" type="hidden" suggestFields="equipmentId" 
					lookupGroup="" value="${model.id}"/>
			</p>
			<p class="nowrap">
            	<label>数据类型：</label>
				<input class="required" name="dataTypeName" type="text" readonly="readonly"
					suggestFields="dataTypeName" lookupGroup="" value="${model.dataTypeName}"/>
				<input name="dataTypeId" type="hidden" suggestFields="dataTypeId" 
					lookupGroup="" value="${model.dataTypeId}"> 
				<a class="btnLook" href="${path}/admin/datacenter/dataTypeInfo?isLookup=1" lookupGroup="">请选择</a>
			</p>
            <p class="nowrap">
				<label>设备类型：</label>
				<%--<input id="wechatDeviceType" name="wechatDeviceType" value="gh_ebeb399e0d64" /> --%>
				<input id="wechatDeviceType" name="wechatDeviceType" value="gh_2780d5f8d642" />
			</p>
			<p class="nowrap">
				<label>是否成成二维码：</label>
				<select name="genCode">
					<c:forEach items="${switchMap}" var="smap">
						<option value="${smap.key }">${smap.value }</option>
					</c:forEach>
				</select>
			</p>
			<p class="nowrap">
				<label>第三方标记串：</label>
				<input id="thirdData" name="thirdData" value="" />
			</p>
			<p class="nowrap">
				<label>生成数量(大于0)：</label>
				<input id="genNum" name="genNum" value="" />
			</p>
			<p class="nowrap">
				<label>平台ID：</label>
				<select id="openPlatformId" name="openPlatformId" class="required">
					<c:forEach var="o" items="${openPlatformMap}">
						<option value="${o.key }">${o.value }</option>
					</c:forEach>
				</select>
			</p>
			<p class="nowrap">
				<label>设备的产品编号：</label>
				<input id="productId" name="productId" value="" />
			</p>
		</div>
		<div class="formBar">
			<ul>
			<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">返回</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>