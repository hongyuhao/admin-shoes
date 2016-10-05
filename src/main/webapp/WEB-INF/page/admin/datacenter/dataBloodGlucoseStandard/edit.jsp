<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
function processBack(response){
	if (response.statusCode == DWZ.statusCode.ok){
		alertMsg.correct(response.message);
		 $.pdialog.closeCurrent();
		if ('${model.id}' == '') {
				$("#level").val("${level}");
				navTab.reload("${path }/admin/datacenter/dataBloodGlucoseStandard", "");
		} else {
			navTab.reload("${path }/admin/datacenter/dataBloodGlucoseStandard", "");
		}
	} else {
		alertMsg.error(response.message);
		return false;
	}
}
</script>
<div class="pageContent">
	<form method="post" action="${path }/admin/datacenter/dataBloodGlucoseStandard/${not empty model.id ? "update" :"add"}"
		 class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input name="id" type="hidden" size="75" value="${model.id }"/>
		<input type="hidden" name="rel" value="${rel}"/>
		<div class="pageFormContent" layoutH="57" align="left">
			<p class="nowrap">
            	<label>最小值：</label>
				<input class="digits required" name="min" id="min" type="text"  value="${model.min }"  min="11" max="333"/>
				<span class="info">最小值为11，最大值为333，该值除10为正常值</span>            
			</p>
			<p class="nowrap">
            	<label>最大值：</label>
				<input class="digits required" name="max" id="max" type="text"  value="${model.max }" max="333"/>
				<span class="info">最小值为11，最大值为333，该值除10为正常值</span>          
			</p>
			<p class="nowrap">
            	<label>测量时机：</label>
            	<select id="testMoment" name="testMoment" class="required">
					<c:forEach var="o" items="${testMomentMap}">
						<option value="${o.key }">${o.value }</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
					$("#testMoment").val("${model.testMoment}");
				</script>
			</p>
			<p class="nowrap">
            	<label>测量人群：</label>
            	<select id="crowdType" name="crowdType" class="required">
					<c:forEach var="o" items="${crowdTypeMap}">
						<option value="${o.key }">${o.value }</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
					$("#crowdType").val("${model.crowdType}");
				</script>
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
				<a class="btnLook" href="${path}/admin/datacenter/dataConclusionsInfo/list?eqDataTypeId=${BLOOD_GLUCOSE }&isLookup=1" lookupGroup="">请选择</a>
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