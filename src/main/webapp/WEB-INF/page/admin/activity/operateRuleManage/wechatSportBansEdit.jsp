<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
function processBack(response){
	if (response.statusCode == DWZ.statusCode.ok){
		alertMsg.correct(response.message);
		 $.pdialog.closeCurrent();
		navTab.reload("${path }/admin/activity/operateRuleManage/wechatSportBans", "");
	} else {
		alertMsg.error(response.message);
		return false;
	}
}
</script>
<div class="pageContent">
	<form method="post" action="${path }/admin/activity/operateRuleManage/wechatSportBans/${not empty model.createTime ? "update" :"add"}"
		 class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input name="createTime" type="hidden" size="75" value="${model.createTime }"/>
		<input name="eqUserId" type="hidden" size="75" value="${model.userId }"/>
		<input type="hidden" name="rel" value="${rel}"/>
		<div class="pageFormContent" layoutH="57" align="left">
			<p class="nowrap">
            	<label>用户id：</label>
            	<c:choose>
            		<c:when test="${null == model.createTime }">
						<input name="userId" type="text"  value="${model.userId }" />            
					</c:when>
					<c:otherwise>
						<input name="userId" type="text"  value="${model.userId }" readonly="true"/>
					</c:otherwise>
				</c:choose>
			</p>
			<p class="nowrap">
            	<label>封号说明：</label>
				<textarea rows="3" cols="50" name="remark" type="text" value="${model.remark }">${model.remark }</textarea>
			</p>
			<p class="nowrap">
				<label>违规时间：</label>
				<input type="text" name="illegalTime" value="${illegalTime }" class="required date" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true"/>
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
<script type="text/javascript">
$('#min').blur(function(){
	$('#max').attr('min', $('#min').val());
});
</script>