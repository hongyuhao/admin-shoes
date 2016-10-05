<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
function processBack(response){
	if (response.statusCode == DWZ.statusCode.ok){
		alertMsg.correct(response.message);
		 $.pdialog.closeCurrent();
		 navTab.reload("${path }/admin/datacenter/ticketSubReplyRelation", "");
	} else {
		alertMsg.error(response.message);
		return false;
	}
}
</script>
<div class="pageContent">
	<form method="post" action="${path }/admin/datacenter/ticketSubReplyRelation/${not empty model.id ? "update" :"add"}"
		 class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input name="id" type="hidden" size="75" value="${model.id }"/>
		<input type="hidden" name="rel" value="${rel}"/>
		<div class="pageFormContent" layoutH="57" align="left">
			<p class="nowrap">
            	<label>渠道：</label>
				<input name="ticket" type="text"  value="${model.ticket }"  />            
			</p>
			<p class="nowrap">
            	<label>推文id：</label>
				<input class="required" name="subReplyId" type="text" readonly="readonly"
					suggestFields="subReplyId" lookupGroup="" value="${model.subReplyId }"/>
				<a class="btnLook" href="${path}/admin/datacenter/wechatSubscribeMsg?isLookup=1" lookupGroup="">请选择</a>          
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
