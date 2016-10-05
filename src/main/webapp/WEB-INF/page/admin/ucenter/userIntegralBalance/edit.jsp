<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
function processBack(response){
	alertMsg.correct(response.message);
	$.pdialog.closeCurrent();
	navTab.reload("${path }/admin/ucenter/userIntegralRecord?eqUserId=${id}", "");
}
</script>

<div class="pageContent">
	<form method="post" action="${path }/admin/ucenter/userIntegralBalance/update" class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input name="id" type="hidden" size="75" value="${userAccountInfo.id }"/>
		<input name="oldBalance" type="hidden" size="75" value="${model.integralUsable }"/>
		<div class="pageFormContent" layoutH="57" align="left">
			<p class="nowrap">
				<label>账号：</label>${userAccountInfo.accountName }
			</p>
			<p class="nowrap">
				<label>积分：</label>
				<input name="integralUsable" type="text"  value="${model.integralUsable }" class="required" />
			</p>
			<p class="nowrap">
				<label>调整理由：</label>
				<input name="updateReason" type="text"  value="" class="required" />
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
