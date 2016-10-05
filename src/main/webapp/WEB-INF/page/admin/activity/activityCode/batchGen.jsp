<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
function processBack(response){
	if (response.statusCode == DWZ.statusCode.ok){
		alertMsg.correct(response.message);
		 $.pdialog.closeCurrent();
		 navTab.reload("${path }/admin/activity/activityCode", "");
	} else {
		alertMsg.error(response.message);
		return false;
	}
}
</script>
<div class="pageContent">
	<form method="post" action="${path }/admin/activity/activityCode/gen"
		 class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input type="hidden" name="rel" value="${rel}"/>
		<div class="pageFormContent" layoutH="57" align="left">
			<p class="nowrap">
				<label>活动类型：</label>
				<select name="genCode">
					<c:forEach items="${fightInfoMap}" var="fmap">
						<option value="${fmap.key }">${fmap.value }</option>
					</c:forEach>
				</select>
			</p>
			<p class="nowrap">
				<label>生成数量(大于0)：</label>
				<input id="genNum" name="genNum" value="" />
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