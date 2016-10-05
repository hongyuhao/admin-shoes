<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<c:set var="DATA_TYPT_BLOODPRESSURE_LEVEL_MAP" value="<%=FormSelectLoader.getDataTypeBloodPressureLevelMap() %>"/>
<c:set var="DATA_TYPT_BLOODGLUCOSE_LEVEL_MAP" value="<%=FormSelectLoader.getDataTypeBloodGlucoseLevelMap() %>"/>

<c:set var="BLOOD_PRESSURE" value="<%=DataTypeInfoEnum.BLOOD_PRESSURE.getId() %>"/>
<c:set var="BLOOD_GLUCOSE" value="<%=DataTypeInfoEnum.BLOOD_GLUCOSE.getId() %>"/>
<c:set var="MEDICINE_BOX" value="<%=DataTypeInfoEnum.MEDICINE_BOX.getId() %>"/>
<c:set var="STEPS" value="<%=DataTypeInfoEnum.STEPS.getId() %>"/>
<c:set var="WEIGHT" value="<%=DataTypeInfoEnum.WEIGHT.getId() %>"/>

<script type="text/javascript">
function processBack(response){
	alertMsg.correct(response.message);
	$.pdialog.closeCurrent();
	navTab.reload("${path }/admin/mall/goodsRecommend", "");
}
</script>
<div class="pageContent">	
	<form method="post" action='/admin/mall/goodsRecommend/${null==model?"add":"update"}'
		class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input name="id" type="hidden" size="75" value="${model.id }"/>
		<div class="pageFormContent" layoutH="57" align="left">
			<p class="nowrap">
	           	<label>推荐位置：</label>
	           	<select name="forumId" id="forumId">
					<option value="">请选择</option>
					<c:forEach var="o" items="${PAGE_LOCATION_MAP}">
						<option value="${o.key }">${o.value }</option>
					</c:forEach>
				</select>  
				<script type="text/javascript">$("#forumId").val("${model.forumId}");</script>
			</p>
			<p class="nowrap">
	           	<label>数据类型：</label>
	           	<select name="dataTypeId" id="dataTypeId">
					<option value="">请选择</option>
					<c:forEach var="o" items="${DATA_TYPE_INFO_MAP}">
						<option value="${o.key }">${o.value }</option>
					</c:forEach>
				</select>  
				<script type="text/javascript">$("#dataTypeId").val("${model.dataTypeId}");</script>
			</p>
			<p class="nowrap">
	           	<label>测量等级：</label>
	           	<select name="dataLevel" id="dataLevel">
					
				</select>
				<script type="text/javascript">
					var bloodPressure = "";
					var bloodGlucose = "";
					var dataLevelArray = new Array();
					
					<c:forEach var="o" items="${DATA_TYPT_BLOODPRESSURE_LEVEL_MAP}">
						bloodPressure += "<option value=\"${o.key }\">${o.value }</option>";
					</c:forEach>
					<c:forEach var="o" items="${DATA_TYPT_BLOODGLUCOSE_LEVEL_MAP}">
						bloodGlucose += "<option value=\"${o.key }\">${o.value }</option>";
					</c:forEach>
					
					dataLevelArray['${BLOOD_PRESSURE}'] = bloodPressure;
					dataLevelArray['${BLOOD_GLUCOSE}'] = bloodGlucose;
					
					$('#dataTypeId').change(function(){ 
						var index = $(this).children('option:selected').val(); 
							$('#dataLevel').html("");
							$('#dataLevel').append(dataLevelArray[index]);
						});
				</script>
			</p>
			<p class="nowrap">
	           	<label>推荐药品：</label>
				<input name="goodsTitle" id="goodsTitle" type="text" value="" disabled="disabled"/>    
				<input type="hidden" name="goodsId" value="${model.goodsId }" lookupGroup="" />
				<a class="btnLook" href="${path }/admin/mall/goodsBaseInfo/?type=lookup&rel=111" lookupGroup="">查找带回</a>
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