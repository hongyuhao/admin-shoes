<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script src="/js/ajaxupload.3.5.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){

	
});
function processBack(response){
	alertMsg.correct(response.message);
	 $.pdialog.closeCurrent();
	 navTab.reload("${path }/admin/ucenter/userHonorType", "");
}
</script>

<div class="pageContent">
	<form method="post" action="${path }/admin/ucenter/userHonorType/${not empty model.id ? "update" :"add"}"
		 class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input name="id" type="hidden" size="75" value="${model.id }"/>
		<input type="hidden" name="rel" value="${rel}"/>
		<div class="pageFormContent" layoutH="80" align="left">
			 <p class="nowrap">
				<label>名称：</label>
				<input name="typeName" type="text"  value="${model.typeName }" class="required" />
			</p>
			
			 <p class="nowrap">
            	<label>状态：</label>
            	<select id="typeStatus" name="typeStatus" class="required">
					<c:forEach var="o" items="${honorStatusMap}">
						<option value="${o.key }">${o.value }</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
					$("#honorStatusMap").val("${model.typeStatus}");
				</script>
			</p>
			
			
		
			
		</div>
		<div class="formBar">
			<ul>
			<li><div class="buttonActive"><div class="buttonContent"><button type="submit" id="saveCard">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">返回</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>

