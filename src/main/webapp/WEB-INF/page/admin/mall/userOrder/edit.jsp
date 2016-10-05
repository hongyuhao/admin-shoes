<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script src="/js/ajaxupload.3.5.js" type="text/javascript"></script>

<script type="text/javascript">
function processBack(response){
	alertMsg.correct(response.message);
	$.pdialog.closeCurrent();
	navTab.reload("${path }/admin/mall/userOrder", "");
}
</script>
<div class="pageContent">	
	<form method="post" action="/admin/mall/userOrder/update"
		class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input name="id" type="hidden" size="75" value="${model.id }"/>
		<input name="userId" type="hidden" size="75" value="${model.userId }"/>
		<input name="orderSn" type="hidden" size="75" value="${model.orderSn }"/>
		<input name="orderUrl" type="hidden" size="75" value="${model.orderUrl }"/>
		<input name="partnerId" type="hidden" size="75" value="${model.partnerId }"/>
		<input name="partnerName" type="hidden" size="75" value="${model.partnerName }"/>
		<input name="openPlatformId" type="hidden" size="75" value="${model.openPlatformId }"/>
		<input name="createTime" type="hidden" size="75" value="${model.createTime }"/>
		<input name="totalPrice" type="hidden" size="75" value="${model.totalPrice }"/>
		<input name="province" type="hidden" size="75" value="${model.province }"/>
		<input name="city" type="hidden" size="75" value="${model.city }"/>
		<input name="region" type="hidden" size="75" value="${model.region }"/>
		<input name="street" type="hidden" size="75" value="${model.street }"/>
		<input name="consignee" type="hidden" size="75" value="${model.consignee }"/>
		<input name="phone" type="hidden" size="75" value="${model.phone }"/>
		
		<input name="status" type="hidden" size="75" value="8"/>
		<div class="pageFormContent" layoutH="50" align="left">
			<p class="nowrap">
            	<label>快递公司：</label>
            	<select name="logisticsId" id="logisticsId">
					<c:forEach items="${LOGISTICS_COMPANY_MAP }" var="map">
						<option value="${map.key }">${map.value }</option>
					</c:forEach>
				</select>   
			</p>
			<p class="nowrap">
            	<label>出货人：</label>
				<input name="outGoingMan" type="text"  value="${model.outGoingMan }"/>         
			</p>
			<p class="nowrap">
            	<label>验收人：</label>
				<input name="checkMan" type="text"  value="${model.checkMan }"/>         
			</p>
			
			<p class="nowrap" id="weight">
            	<label>货物总重量：</label>
				<input name="weight" type="text"  value=""/>         
			</p>
			<p class="nowrap" id="addValue">
            	<label>是否保价：</label>
            	<input id ="addValue" name="addValueFlag"  type="checkbox" value="1" onclick="show()"/>
			</p>
			<div id ="value" style="display:none;"> 
				<p class="nowrap">
	            	<label>商品声明价值：</label>
	            	<input name="addValue"  type="text"/>
				</p>
			</div>  
			<p class="nowrap">
	            <label>备注：</label>
	            <textarea rows="" cols="22" name="remark"></textarea>
			</p>
			<p class="nowrap" id="itemTypeDiv">
				<label>货物类型：</label>
				<select name="itemType" id="itemType">
					<c:forEach items="${YTO_ITEM_TYPE_MAP }" var="map">
						<c:choose>
						    <c:when test="${map.key == 1}">
						    	<option value="${map.key }" selected="selected">${map.value }</option>
						    </c:when>
						    <c:otherwise>
								<option value="${map.key }">${map.value }</option>
						    </c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
			</p>
			<p class="nowrap" id="ytoSendTimeDiv">
				<label>圆通物流取货时间：</label>
				<input type="text" name="ytoSendTime" value="<fmt:formatDate value='<%=new Date() %>' pattern='yyyy-MM-dd HH:mm:ss' />" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true">
				<a class="inputDateButton" href="javascript:;">选择</a>
			</p>
			<p class="nowrap" id="flag">
            	<label>是否通知收货人：</label>
            	<input name="flag"  type="checkbox" value="1"/>
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
$('#logisticsId').val(1);
$('#logisticsId').on('change', function(){
	var logisticId = $('#logisticsId').val();
	if(logisticId == 0) {
		//自提
		$('#flag').hide();
		$('#ytoSendTimeDiv').hide();
		$('#itemTypeDiv').hide();
		$('#addValue').hide();
		$('#weight').hide();
	} else {
		$('#flag').show();
		$('#ytoSendTimeDiv').show();
		$('#itemTypeDiv').show();
		$('#addValue').show();
		$('#weight').show();
	}
});

function show(){
	$("#value").toggle();
}
</script>