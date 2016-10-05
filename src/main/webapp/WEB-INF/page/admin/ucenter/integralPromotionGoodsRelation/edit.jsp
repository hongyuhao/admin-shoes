<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
function processBack(response){
	alertMsg.correct(response.message);
	$.pdialog.closeCurrent();
	navTab.reload("${path }/admin/ucenter/integralPromotionGoodsRelation", "");
}
</script>

<c:choose>
	<c:when test="${model.id==0 || empty model.id}">
		<c:set var="action" value="${path }/admin/ucenter/integralPromotionGoodsRelation/add"></c:set>
	</c:when>
	<c:otherwise>
		<c:set var="action" value="${path }/admin/ucenter/integralPromotionGoodsRelation/update"></c:set>
	</c:otherwise>
</c:choose>

<div class="pageContent">
	<form method="post" action="${action }" class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input name="id" type="hidden" size="75" value="${model.id}"/>
		<div class="pageFormContent" layoutH="57" align="left">	
			<p class="nowrap">
            	<label>栏目：</label>
                <select id="columnId" name="columnId" class="required">
                		<option value="">请选择</option>
	                    <c:forEach var="item" items="${integralExchangeColumnMap}">   
							<option value="${item.key }" ${model.columnId == item.key ? 'selected=selected' : ''}>${item.value}</option>
						</c:forEach> 
                </select>（设置优惠券显示在某些栏目下）
            </p>
			<p class="nowrap">
            	<label>类型：</label>
                <select id="type" name="type" class="required">
                		<option value="">请选择</option>
	                    <c:forEach var="item" items="${integralExchangeTypeMap}">   
							<option value="${item.key }" ${model.type == item.key ? 'selected=selected' : ''}>${item.value}</option>
						</c:forEach> 
                </select>（注意：目前只能兑换优惠券,激活码，兑换商品无效）
            </p>
            <input type="hidden" id="relationType" name="relationType" value="${model.relationType }">
            <%-- <p class="nowrap">
            	<label>对照类型：</label>		
				<select id="relationType" name="relationType" class="required" readonly>
					<option value="">请选择</option>
	            	<c:forEach var="item" items="${integralExchangeTargetMap}">  
						<option value="${item.key }" ${model.relationType == item.key ? 'selected=selected' : ''}>${item.value}</option>
					</c:forEach> 
                </select>
            </p> --%>
            <p class="nowrap">
            	<label>对照ID：</label>
				<input type="text" name="relationId" value="${model.relationId}" suggestFields="relationId"  lookupGroup="" readonly="true" class="required digits textInput valid"/>
				<a id="relation" class="btnLook" href="${path }/admin/ucenter/integralPromotionGoodsRelation/promotionList?sendCardType=3&showType=2" lookupGroup="">查找带回</a>
			</p>
			<p class="nowrap">
				<label>积分值：</label>
				<input name="integralNum" type="text" onchange="i_check(this)" value="${model.integralNum }"  min="1" class="required digits textInput valid"/>
			</p>
			<p class="nowrap">
				<label>金额：</label>
				<input name="money" type="text" onchange="f_check(this)" value="${model.money }"  />
			</p>
			<p class="nowrap">
				<label>等级：</label>
				<select id="levelId" name="levelId" >
					<c:forEach var="item" items="${userTypeMap}">   
						<option value="${item.key }" ${model.levelId == item.key ? 'selected=selected' : ''}>${item.value}</option>
					</c:forEach> 
				</select>
			</p>
			<p class="nowrap">
				<label>描述：</label>
				<textarea name="remark" cols="60" rows="2">${model.remark }</textarea>
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
	
	<script type="text/javascript">
	
		$(function() {
			var obj = $('#type');
			type(obj);
		});
		
		$("#type").change(function() {
			type(this);
		});
	
		function i_check(obj) {
           if(!checkInterger(obj)) {
               obj.value="0";
               obj.focus();
               return;
           }
		}
		
		function f_check(obj) {
	           if(!checkFloat(obj)) {
	               obj.value="0.00";
	               obj.focus();
	               return;
	           }
			}
		
		function checkInterger(obj) {
			if(obj == null || obj.value == "")
				return true;
			var tar = obj.value;
			var re0 = /^[0-9]*[1-9][0-9]*$/;
			if(tar.match(re0) == null) {
				alert("只能输入整数！");
				return false;
			}
			return true;
		}
		
		function checkFloat(obj) {
			if(obj == null || obj.value == "")
				return true;
			var tar = obj.value;
			var re0 = /^\d+(\.\d{2})?$/;
			if(tar.match(re0) == null) {
				alert("只能输入数字，且只能保留两位小数！");
				return false;
			}
			return true;
		}
		
		function type(obj) {
			if($(obj).val() == "${TO_COUPON}" || $(obj).val() == "${TO_CDKEY}") {		
				$("input[name='money']").attr("value",'');
				$("input[name='money']").attr("disabled", "true");
				$("input[name='money']").addClass("disabled");
				if( $(obj).val() == "${TO_CDKEY}"){
					$('#relationType').val("${CDKEY}");
					$('#relation').attr("href", "${path }/admin/ucenter/integralPromotionGoodsRelation/insuranceList");
				}
				else if( $(obj).val() == "${TO_COUPON}"){
					$('#relationType').val("${COUPON}");
					$('#relation').attr("href", "${path }/admin/ucenter/integralPromotionGoodsRelation/promotionList?sendCardType=3&showType=2");
				}
			} else {
				if($(obj).val() != '') {
					alert("该功能暂未实现！");
					$(obj).val("");
				}
				$('#relationType').val("");
				$('#relation').attr("href","");
				$("input[name='money']").removeClass("disabled");
				$("input[name='money']").removeAttr("disabled");
			}
		}
	</script>
</div>
