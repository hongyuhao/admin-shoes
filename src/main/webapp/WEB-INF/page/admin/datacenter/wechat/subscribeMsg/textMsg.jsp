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
	<form id="myForm" method="post" action="${path}/admin/datacenter/wechatSubscribeMsg/${not empty model.id ? "updateTextMsg" :"saveTextMsg"}"
	class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input type="hidden" value="${model.id }" name="id">
		<div class="pageFormContent" layoutH="57" align="left">
			<p class="nowrap">
				<label>回复内容：</label>
				<textarea id="content" name="content" rows="3" cols="60">${model.content }</textarea>
			</p>
			</div>
			<div class="formBar">
			<ul>
				<li>
					<div class="buttonActive"><div class="buttonContent"><button type="submit" >保存</button></div></div>
				</li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">返回</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>
<script type="text/javascript"> 

function sub(){
	$("#myForm").submit();
}


</script>