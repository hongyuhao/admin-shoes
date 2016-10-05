<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
function processBack(response){
	alertMsg.correct(response.message);
	$.pdialog.closeCurrent();
	navTab.reload("${path }/admin/ucenter/integralConsumeRelation", "");
}
</script>

<c:choose>
	<c:when test="${model.id==0 || empty model.id}">
		<c:set var="action" value="${path }/admin/ucenter/integralConsumeRelation/add"></c:set>
	</c:when>
	<c:otherwise>
		<c:set var="action" value="${path }/admin/ucenter/integralConsumeRelation/update"></c:set>
	</c:otherwise>
</c:choose>

<div class="pageContent">
	<form method="post" action="${action }" class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input name="id" type="hidden" size="75" value="${model.id}"/>
		<div class="pageFormContent" layoutH="57" align="left">	
			<p class="nowrap">
            	<label>类型：</label>
				<select id="type" name="type" class="combox">
	                    <c:forEach var="item" items="${integralExchangeConditionTypeMap}">   
							<option value="${item.key }" ${model.type == item.key ? 'selected=selected' : ''}>${item.value}</option>
						</c:forEach> 
                </select>
            </p>
            <p class="nowrap">
				<label>会员等级：</label>
				<select id="levelId" name="levelId" class="combox">
					<c:forEach var="item" items="${userTypeMap}">   
						<option value="${item.key }" ${model.levelId == item.key ? 'selected=selected' : ''}>${item.value}</option>
					</c:forEach> 
				</select>
			</p>
			<p class="nowrap">
				<label>每天兑换积分最大值：</label>
				<input name="integralNum" type="text" onchange="i_check(this)" value="${model.integralNum }"  />
			</p>
			<p class="nowrap">
				<label>开始时间：</label>
				<input type="text" name="startTime" value="<fmt:formatDate value='${model.startTime}' pattern='yyyy-MM-dd HH:mm:ss' />" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true">
				<a class="inputDateButton" href="javascript:;">选择</a>
			</p>
			<p class="nowrap">
				<label>结束时间：</label>
				<input type="text" name="endTime" value="<fmt:formatDate value='${model.endTime}' pattern='yyyy-MM-dd HH:mm:ss' />" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true">
				<a class="inputDateButton" href="javascript:;">选择</a>
			</p>
			<p class="nowrap">
				<label>比例值：</label>
				<input name="ratio" type="text"  onchange="f_check(this)"  value="${model.ratio }"  />
			</p>		
			<p class="nowrap">
				<label>折扣：</label>
				<input name="rebate" type="text"  onchange="f_check(this)"  value="${model.rebate }"  />
			</p>
			<p class="nowrap">
				<label>描述：</label>
				<textarea name="remark" class="required" cols="60" rows="2">${model.remark }</textarea>
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
		
		function type(obj) {
			if($(obj).val() == '${MONEY}') {	
				//$("input[name='money']").attr("value",'');
				$("input[name='ratio']").attr("value", '');
				$("input[name='rebate']").attr("value", '');
				$("input[name='integralNum']").removeAttr("disabled");
				$("input[name='ratio']").attr("disabled", "disabled");
				$("input[name='rebate']").attr("disabled", "disabled");
				
			} else {
				$("input[name='integralNum']").attr("value",'');
				if(null =='${model.id}' || ''=='${model.id}'){
					$("input[name='ratio']").attr("value", "1.00");
					$("input[name='rebate']").attr("value", '1.00');
				}
				$("input[name='ratio']").removeAttr("disabled");
				$("input[name='rebate']").removeAttr("disabled");
				$("input[name='integralNum']").attr("disabled", "disabled");
			}	
		}
		
		function i_check(obj) {
           if(!checkInterger(obj)) {
               obj.value="0";
               obj.focus();
               return;
           }
		}
		
		function f_check(obj) {
	           if(!checkFloat(obj)) {
	               obj.value="1.00";
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
		
	</script>
</div>
