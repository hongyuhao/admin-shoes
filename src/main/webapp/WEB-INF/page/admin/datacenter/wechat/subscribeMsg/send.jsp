<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
function processBack(response){
	if (response.statusCode == DWZ.statusCode.ok){
		alertMsg.correct(response.message);
		 $.pdialog.closeCurrent();
		 navTab.reload("${path }/admin/datacenter/wechatSubscribeMsg", "");
	} else {
		alertMsg.error(response.message);
		return false;
	}
	
}
</script>
<div class="pageContent">
	<form id="myForm" method="post" action="${path}/admin/datacenter/wechatSubscribeMsg/send"
	class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input type="hidden" name="eqId" value="${id }">
		<div class="pageFormContent" layoutH="57" align="left">
			<p class="nowrap">
				<label>openId：</label>
				<input id="openId" name="openId"  type="text"/>
			</p>
			</div>
			<div class="formBar">
			<ul>
				<li>
					<div class="buttonActive"><div class="buttonContent"><button type="submit" >发送</button></div></div>
				</li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">返回</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>