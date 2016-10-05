<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
function processBack(response){
	alertMsg.correct(response.message);
	 $.pdialog.closeCurrent();
	 navTab.reload("${path }/admin/mall/customerBindedInfo", "");
}
</script>
<div class="pageContent">
	<form method="post" action="${path }/admin/mall/customerBindedInfo/add"
		 class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input name="id" type="hidden" size="75" value="${model.id }"/>
		<input type="hidden" name="rel" value="${rel}"/>
		<div class="pageFormContent" layoutH="57" align="left">
			<p class="nowrap">
            	<label>设备：</label>
				<input class="required" name="equipmentName" type="text" readonly="readonly"
					suggestFields="equipmentName" lookupGroup="" value="${model.equipmentName}"/>
				<input name="equipmentId" type="hidden" suggestFields="equipmentId" 
					lookupGroup="" value="${model.equipmentId}">
				<a class="btnLook" href="${path}/admin/mall/equipmentInfo?isLookup=1" lookupGroup="">请选择</a>
			</p>
			<p class="nowrap">
            	<label>设备sn：</label>
				<input class="required" name="equipmentSn" type="text"  value=""/>        
			</p>
		    <p class="nowrap">
            	<label>手机号码：</label>
				<input class="required isPhone" name="bindPhone" type="text"  value=""  />            
			</p>
			<input name="status" type="hidden" value="0"/>
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
	$.validator.addMethod("isPhone", function(value, element) { 
        var chcheck = new RegExp("^(13|15|18|14|17)[0-9]{9}$|^0[\d-]{9,12}$");
        return this.optional(element) || chcheck.test(value); 
    }, "请输入正确的手机号码");
</script>