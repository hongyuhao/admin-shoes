<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script src="/js/ajaxupload.3.5.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){

	
});
function processBack(response){
	alertMsg.correct(response.message);
	 $.pdialog.closeCurrent();
	 navTab.reload("${path }/admin/wxpay/red", "");
}
</script>
<c:choose>
	<c:when test="${model.id==0 ||empty model.id}">
		<c:set var="action" value="${path }/admin/wxpay/red/add.do"></c:set>
	</c:when>
	<c:otherwise>
		<c:set var="action" value="${path }/admin/wxpay/red/update.do"></c:set>
	</c:otherwise>
</c:choose>
<div class="pageContent">
	<form method="post" action="${action }" class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);" id="cardForm">
		<input name="id" type="hidden" size="75" value="${model.id }"/>
		<input type="hidden" name="rel" value="${rel}"/>
		<div class="pageFormContent" layoutH="80" align="left">
			 <p class="nowrap">
				<label>红包名称：</label>
				<input name="actName" type="text"  value="${model.actName }" class="required" />
			</p>
			 <p class="nowrap">
				<label>商户名称：</label>
				<input name="nickName" type="text"  value="${model.nickName }" class="required" />
			</p>
			 <p class="nowrap">
				<label>发送方名称：</label>
				<input name="sendName" type="text"  value="${model.sendName }" class="required" />
			</p>
			
			 <p class="nowrap">
				<label>红包金额：</label>
				<input name="totalAmount" type="text"  value="${model.totalAmount }" class="required" />
			</p>
			 <p class="nowrap">
				<label>最大金额：</label>
				<input name="maxValue" type="text"  value="${model.maxValue }" class="required" />
			</p>
			 <p class="nowrap">
				<label>最小金额：</label>
				<input name="minValue" type="text"  value="${model.minValue }" class="required" />
			</p>
			<p class="nowrap">
				<label>发放人数：</label>
				<input name="totalNum" type="text"  value="${model.totalNum }" class="required" />
			</p>
			<p class="nowrap dateScope">
					<label>使用时间：</label>
					<input id="startTime" type="text" name="startTime" style="width:100px;" datefmt="yyyy-MM-dd HH:mm:ss" class="required date textInput "  value="<fmt:formatDate value="${model.startTime}" pattern="yyyy-MM-dd HH:mm:ss" />" /> 
					<label style="width:auto;">至</label>
					<input id="endTime" type="text" name="endTime" style="width:100px;" datefmt="yyyy-MM-dd HH:mm:ss" class="required date textInput " value="<fmt:formatDate value="${model.endTime}" pattern="yyyy-MM-dd HH:mm:ss" />" />
			</p> 
			
			<p class="nowrap" >  
				<label>祝福语：</label>
				<textarea  name="wishing" cols="60" rows="5" >${model.wishing }</textarea>
			</p>
			<p class="nowrap">  
				<label>备注：</label>
				<textarea  name="remark" cols="60" rows="5" >${model.remark }</textarea>
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

