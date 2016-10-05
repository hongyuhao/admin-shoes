<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
function processBack(response){
	if (response.statusCode == DWZ.statusCode.ok){
		alertMsg.correct(response.message);
		 $.pdialog.closeCurrent();
		 if ('${model.id}' == '') {
				$("#level").val("${level}");
				navTab.reload("${path }/admin/datacenter/dataWeightStandard", "");
		} else {
			navTab.reload("${path }/admin/datacenter/dataWeightStandard", "");
		}
	} else {
		alertMsg.error(response.message);
		return false;
	}
}
</script>
<div class="pageContent">
	<form method="post" action="${path }/admin/datacenter/dataWeightStandard/${not empty model.id ? "update" :"add"}"
		 class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input name="id" type="hidden" size="75" value="${model.id }"/>
		<input type="hidden" name="rel" value="${rel}"/>
		<div class="pageFormContent" layoutH="57" align="left">
			<p class="nowrap">
            	<label>步数最小值：</label>
				<input class="digits required" name="stepMin" id="stepMin" type="text"  value="${model.stepMin }"/>
			</p>
			<p class="nowrap">
            	<label>步数最大值：</label>
				<input class="digits required" name="stepMax" id="stepMax" type="text"  value="${model.stepMax }"/>
			</p>
			<p class="nowrap">
            	<label>级别：</label>
            	<input class="required" name="level" type="text" readonly="readonly"
					suggestFields="level" lookupGroup="" value="${model.level}"/>
				<input type="hidden" suggestFields="level" 
					lookupGroup="" value="${model.level}">
				<a class="btnLook" href="${path}/admin/datacenter/dataConclusionsInfo/list?eqDataTypeId=${WEIGHT }&isLookup=1" lookupGroup="">请选择</a>
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