<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
function processBack(response){
	DWZ.ajaxDone(response);
	if (response[DWZ.keys.statusCode] == DWZ.statusCode.ok){
		alertMsg.correct(response.message);
	 	$.pdialog.closeCurrent();
	 	navTab.reload("${path }/admin/open/openAppInfo", "");
	}
}
</script>
<div class="pageContent">
	<form method="post" action="${path }/admin/open/openAppInfo/${not empty model.id ? "update" :"add"}"
		 class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input name="id" type="hidden" size="75" value="${model.id }"/>
		<input name="partnerId" type="hidden" size="75" value="${eqPartnerId }"/>
		<input type="hidden" name="rel" value="${rel}"/>
		<div class="pageFormContent" layoutH="57" align="left">
			<p class="nowrap">
            	<label>应用id：</label>
				<input name="appId" type="text"  value="${model.appId }" class="required" />            
			</p>
			<p class="nowrap">
            	<label>应用密钥：</label>
				<input name="appSecret" type="text"  value="${model.appSecret }" class="required" />            
			</p>
			<p class="nowrap">
            	<label>应用名称：</label>
				<input name="appName" type="text"  value="${model.appName }" class="required" />            
			</p>
			<p class="nowrap">
            	<label>回调地址：</label>
				<input name="appCallbackUrl" type="text"  value="${model.appCallbackUrl }"  />            
			</p>
			<p class="nowrap">
            	<label>签名key：</label>
				<input name="signKey" type="text"  value="${model.signKey }"  />            
			</p>
			<p class="nowrap">
            	<label>ip白名单：</label>
				<input name="ips" type="text"  value="${model.ips }"  />            
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