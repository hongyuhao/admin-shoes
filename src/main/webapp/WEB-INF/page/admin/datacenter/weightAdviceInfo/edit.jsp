<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
function processBack(response){
	if (response.statusCode == DWZ.statusCode.ok){
		alertMsg.correct(response.message);
		 $.pdialog.closeCurrent();
		 navTab.reload("${path }/admin/datacenter/weightAdviceInfo", "");
	} else {
		alertMsg.error(response.message);
		return false;
	}
}
</script>
<div class="pageContent">
	<form method="post" action="${path }/admin/datacenter/weightAdviceInfo/${not empty model.id ? "update" :"add"}"
		 class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input name="id" type="hidden" size="75" value="${model.id }"/>
		<input type="hidden" name="rel" value="${rel}"/>
		<div class="pageFormContent" layoutH="57" align="left">
			<p class="nowrap">
            	<label>体重状态：</label>
				<select id="weightStatus" name="weightStatus" class="required">
					<c:forEach var="o" items="${weightStatusMap}">
						<option value="${o.key }">${o.value }</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
					$("#weightStatus").val("${model.weightStatus}");
				</script>
			</p>
			<p class="nowrap">
            	<label>最小步数：</label>
				<input name="stepMin" type="text"  value="${model.stepMin }"  />            
			</p>
			<p class="nowrap">
            	<label>最大步数：</label>
				<input name="stepMax" type="text"  value="${model.stepMax }"  />            
			</p>
			<p class="nowrap">
            	<label>体重建议：</label>
				<textarea id="adviceContent" name="adviceContent" rows="20" cols="80">${model.adviceContent }</textarea>            
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