<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script src="/js/ajaxupload.3.5.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){

	
});
function processBack(response){
	alertMsg.correct(response.message);
	 $.pdialog.closeCurrent();
	 navTab.reload("${path }/admin/ucenter/userHonorLevel", "");
}
</script>

<div class="pageContent">
	<form method="post" action="${path }/admin/ucenter/userHonorLevel/${not empty model.id ? "update" :"add"}"
		 class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input name="id" type="hidden" size="75" value="${model.id }"/>
		<input type="hidden" name="rel" value="${rel}"/>
		<div class="pageFormContent" layoutH="80" align="left">
			 <p class="nowrap">
				<label>名称：</label>
				<input name="levelName" type="text"  value="${model.levelName }" class="required" />
			</p>
			 <p class="nowrap">
				<label>等级：</label>
				<input name="honorLevel" type="text"  value="${model.honorLevel }" class="required" />
			</p>
			
			 <p class="nowrap">
				<label>分值：</label>
				<input name="levelScore" type="text"  value="${model.levelScore }" class="required" />
			</p>
			<p class="nowrap">
				<label>类型：</label>
				<select id="honorType" name="honorType" class="required">
					<c:forEach var="o" items="${honorTypeMap}">
						<option value="${o.key }">${o.value }</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
					$("#honorType").val("${model.honorType}");
				</script>
			</p>
			<p class="nowrap">  
				<label>前台描述：</label>
				<textarea  name="detail" cols="60" rows="5" >${model.detail }</textarea>
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

