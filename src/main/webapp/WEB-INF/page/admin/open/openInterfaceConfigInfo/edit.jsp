<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
function processBack(response){
	DWZ.ajaxDone(response);
	if (response[DWZ.keys.statusCode] == DWZ.statusCode.ok){
		alertMsg.correct(response.message);
	 	$.pdialog.closeCurrent();
	 	navTab.reload("${path }/admin/open/openInterfaceConfigInfo", "");
	}
}
</script>
<div class="pageContent">
	<form method="post" action="${path }/admin/open/openInterfaceConfigInfo/${not empty model.id ? "update" :"add"}"
		 class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input name="id" type="hidden" size="75" value="${model.id }"/>
		<input name="appId" type="hidden" size="75" value="${appId }"/>
		<input type="hidden" name="rel" value="${rel}"/>
		<div class="pageFormContent" layoutH="57" align="left">
			<p class="nowrap">
            	<label>接口名称：</label>
            	<input class="required" name="interfaceName" type="text" readonly="readonly"
					suggestFields="interfaceName" lookupGroup="" value="${model.interfaceName}"/>
				<input name="openInterfaceId" type="hidden" suggestFields="openInterfaceId" 
					lookupGroup="" value="${model.openInterfaceId}">
				<a class="btnLook" href="${path}/admin/open/openInterfaceInfo?isLookup=1" lookupGroup="">请选择</a>
			</p>
			<p class="nowrap">
            	<label>开放平台url：</label>
            	<input class="required" name="openUrl" type="text" readonly="readonly"
					suggestFields="openUrl" lookupGroup="" value="${model.openUrl}"/>
			</p>
			<p class="nowrap">
            	<label>服务url：</label>
            	<input name="serviceUrl" type="text" readonly="readonly"
					suggestFields="serviceUrl" lookupGroup="" value="${model.serviceUrl}"/>
			</p>
			<p class="nowrap">
            	<label>服务：</label>
            	<input class="required" name="serviceId" type="hidden" readonly="readonly"
					suggestFields="serviceId" lookupGroup="" value="${model.serviceId}"/>
            	<input class="required" name="serviceName" type="text" readonly="readonly"
					suggestFields="serviceName" lookupGroup="" value="${serviceMap[model.serviceId]}"/>
			</p>
			<p class="nowrap">
            	<label>是否需要签名：</label>
            	<select id="isSign" name="isSign" class="required">
					<c:forEach var="o" items="${isSignMap}">
						<option value="${o.key }">${o.value }</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
					$("#isSign").val("${model.isSign}");
				</script>
			</p>
			<p class="nowrap">
            	<label>是否有访问权限：</label>
            	<select id="isVisit" name="isVisit" class="required">
					<c:forEach var="o" items="${isVisitMap}">
						<option value="${o.key }">${o.value }</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
					$("#isVisit").val("${model.isVisit}");
				</script>
			</p>
			<p class="nowrap">
            	<label>是否需要登录：</label>
            	<select id="isLogin" name="isLogin" class="required">
					<c:forEach var="o" items="${isLoginMap}">
						<option value="${o.key }">${o.value }</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
					$("#isLogin").val("${model.isLogin}");
				</script>
			</p>
			<p class="nowrap">
            	<label>应用授权权限：</label>
				<input name="name" type="text"  value="${model.scope }"  />            
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
