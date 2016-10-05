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
	<form method="post" action="${path }/admin/datacenter/equipmentMacInfo/batchAuth"
		 class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input type="hidden" name="rel" value="${rel}"/>
		<c:set var="idStr" value=""></c:set>
		<c:forEach items="${inIdList }" var="obj">
			<c:set var="idStr" value="${idStr },${obj }"></c:set>
		</c:forEach>
		<input type="hidden" name="inIdList" value="${idStr }"/>
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
				<label>统一MAC地址：</label>
				<input name="equipmentMac" value="000000000000" />
			</p>
			<p class="nowrap">
				<label>退出公众号的动作：</label>
				<select name="closeStrategy">
					<c:forEach items="${closeStrategyMap }" var="o">
						<option value="${o.key}">${o.value}</option>
					</c:forEach>
				</select>
			</p>
			<p class="nowrap">
				<label>设备连接策略：</label>
				<select name="connStrategy">
					<c:forEach items="${connStrategyMap }" var="o">
						<option value="${o.key}">${o.value}</option>
					</c:forEach>
				</select>
			</p>
			<p class="nowrap">
				<label>加密串：</label>
				<input type="text" name="authKey" value=""/>
			</p>
			<p class="nowrap">
				<label>加密方式：</label>
				<select name="cryptMethod">
					<c:forEach items="${cryptMethodMap }" var="o">
						<option value="${o.key}">${o.value}</option>
					</c:forEach>
				</select>
			</p>
			<p class="nowrap">
				<label>加密版本：</label>
				<select name="authVer">
					<c:forEach items="${authVerMap }" var="o">
						<option value="${o.key}">${o.value}</option>
					</c:forEach>
				</select>
			</p>
			<p class="nowrap">
				<label>厂商广播mac偏移：</label>
				<select name="manuMacPos">
					<c:forEach items="${manuMacPosMap }" var="o">
						<option value="${o.key}">${o.value}</option>
					</c:forEach>
				</select>
			</p>
			<p class="nowrap">
				<label>厂商序列号mac偏移：</label>
				<select name="serMacPos">
					<c:forEach items="${serMacPosMap }" var="o">
						<option value="${o.key}">${o.value}</option>
					</c:forEach>
				</select>
			</p>
			<p class="nowrap">
				<label>协议类型：</label>
				<select name="connectProtocol">
					<c:forEach items="${connectProtocolMap }" var="o">
						<option value="${o.key}">${o.value}</option>
					</c:forEach>
				</select>
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
				<label>操作类型：</label>
				<select name="opType">
					<c:forEach items="${opTypeMap }" var="o">
						<option value="${o.key}">${o.value}</option>
					</c:forEach>
				</select>
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