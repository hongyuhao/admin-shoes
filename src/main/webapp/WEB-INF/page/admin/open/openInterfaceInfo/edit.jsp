<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
function processBack(response){
	DWZ.ajaxDone(response);
	if (response[DWZ.keys.statusCode] == DWZ.statusCode.ok){
		alertMsg.correct(response.message);
	 	$.pdialog.closeCurrent();
	 	navTab.reload("${path }/admin/open/openInterfaceInfo", "");
	}
}
</script>
<div class="pageContent">
	<form method="post" action="${path }/admin/open/openInterfaceInfo/${not empty model.id ? "update" :"add"}"
		 class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input name="id" type="hidden" size="75" value="${model.id }"/>
		<input type="hidden" name="rel" value="${rel}"/>
		<div class="pageFormContent" layoutH="57" align="left">
			<p class="nowrap">
            	<label>接口名称：</label>
				<input name="interfaceName" type="text"  value="${model.interfaceName }" class="required" />            
			</p>
			<p class="nowrap">
            	<label>开放平台url：</label>
				<input name="openUrl" type="text"  value="${model.openUrl }" class="required" />            
			</p>
			<p class="nowrap">
            	<label>服务url：</label>
				<input name="serviceUrl" type="text"  value="${model.serviceUrl }"  />            
			</p>
			<p class="nowrap">
            	<label>服务：</label>
            	<select id="serviceId" name="serviceId" class="required">
					<c:forEach var="o" items="${serviceMap}">
						<option value="${o.key }">${o.value }</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
					$("#serviceId").val("${model.serviceId}");
				</script>
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