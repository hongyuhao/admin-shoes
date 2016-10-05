<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
function processBack(response){
	if (response.statusCode == DWZ.statusCode.ok){
		alertMsg.correct(response.message);
		 $.pdialog.closeCurrent();
		 if ('${model.id}' == '') {
				$("#level").val("${level}");
				navTab.reload("${path }/admin/datacenter/dataBloodPressureStandard", "");
		} else {
			navTab.reload("${path }/admin/datacenter/dataBloodPressureStandard", "");
		}
	} else {
		alertMsg.error(response.message);
		return false;
	}
}
</script>
<div class="pageContent">
	<form method="post" action="${path }/admin/datacenter/dataBloodPressureStandard/${not empty model.id ? "update" :"add"}"
		 class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input name="id" type="hidden" size="75" value="${model.id }"/>
		<input type="hidden" name="rel" value="${rel}"/>
		<div class="pageFormContent" layoutH="57" align="left">
			<p class="nowrap">
            	<label>舒张压最低值：</label>
				<input class="digits required" name="lowerBpMin" id="lowerBpMin" type="text"  value="${model.lowerBpMin }" min="10" max="200"/>
				<span class="info">最小值为10，最大值为200</span>            
			</p>
			<p class="nowrap">
            	<label>舒张压最高值：</label>
				<input class="digits required" name="lowerBpMax" id="lowerBpMax" type="text"  value="${model.lowerBpMax }" min="10" max="200"/>
				<span class="info">最小值为10，最大值为200</span>          
			</p>
			<p class="nowrap">
            	<label>收缩压最低值：</label>
            	<input class="digits required" name="upperBpMin" id="upperBpMin" type="text"  value="${model.upperBpMin }" min="30" max="300"/>
				<span class="info">最小值为30，最大值为300</span>
			</p>
			<p class="nowrap">
            	<label>收缩压最高值：</label>
            	<input class="digits required" name="upperBpMax" id="upperBpMax" type="text"  value="${model.upperBpMax }" min="30" max="300"/>
				<span class="info">最小值为30，最大值为300</span>
			</p>
			<p class="nowrap">
            	<label>状态：</label>
            	<select id="status" name="status" class="required">
					<c:forEach var="o" items="${testStatusMap}">
						<option value="${o.key }">${o.value }</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
					$("#status").val("${model.status}");
				</script>
			</p>
			<p class="nowrap">
            	<label>级别：</label>
            	<input class="required" name="level" type="text" readonly="readonly"
					suggestFields="level" lookupGroup="" value="${model.level}"/>
				<input type="hidden" suggestFields="level" 
					lookupGroup="" value="${model.level}">
				<a class="btnLook" href="${path}/admin/datacenter/dataConclusionsInfo/list?eqDataTypeId=${BLOOD_PRESSURE }&isLookup=1" lookupGroup="">请选择</a>
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