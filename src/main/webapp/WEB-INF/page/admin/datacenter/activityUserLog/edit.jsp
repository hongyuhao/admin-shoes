<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script src="/js/ajaxupload.3.5.js" type="text/javascript"></script>

<script type="text/javascript">
function processBack(response){
	alertMsg.correct(response.message);
	$.pdialog.closeCurrent();
	navTab.reload("${path }/admin/datacenter/activityUserLog", "");
}
</script>
<div class="pageContent">	
	<form method="post" action="/admin/datacenter/activityUserLog/reissue"
		class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input name="id" type="hidden" size="75" value="${model.id }"/>
		<input name="userId" type="hidden" size="75" value="${model.userId }"/>
		<input name="activityId" type="hidden" size="75" value="${model.activityId }"/>
		<input name="activityNodeSeq" type="hidden" size="75" value="${model.activityNodeSeq }"/>
		<input name="activityNodeTime" type="hidden" size="75" value="${model.activityNodeTime }"/>
		<input name="userOpenId" type="hidden" size="75" value="${model.userOpenId }"/>
		<input name="isNewUser" type="hidden" size="75" value="${model.isNewUser }"/>
		<input name="bindPhone" type="hidden" size="75" value="${model.bindPhone }"/>
		<input name="sendStatus" type="hidden" size="75" value="${model.sendStatus }"/>
		<input name="rechargeNum" type="hidden" size="75" value="${model.rechargeNum }"/>
		<div class="pageFormContent" layoutH="50" align="left">
			<p class="nowrap">
            	<label>用户ID：</label>
				<input name="userId" type="text"  value="${model.userId }" readonly="readonly"/>         
			</p>
			<p class="nowrap">
            	<label>充值手机：</label>
				<input name="bindPhone" type="text"  value="${model.bindPhone }" readonly="readonly"/>         
			</p>
			
			<p class="nowrap" id="weight">
            	<label>充值流量：</label>
				<input name="rechargeNum" type="text"  value="${model.rechargeNum }" readonly="readonly"/>         
			</p>
		</div>
		<div class="formBar">
			<ul>
				<li>
					<div class="buttonActive"><div class="buttonContent"><button type="submit">补发</button></div></div>
				</li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">返回</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>