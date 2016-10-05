<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
function processBack(response){
	alertMsg.correct(response.message);
	$.pdialog.closeCurrent();
	navTab.reload("${path }/admin/ucenter/integralExchange", "");
}
</script>

<c:choose>
	<c:when test="${index<0 || empty index}">
		<c:set var="action" value="${path }/admin/ucenter/integralExchange/add"></c:set>
	</c:when>
	<c:otherwise>
		<c:set var="action" value="${path }/admin/ucenter/integralExchange/update"></c:set>
	</c:otherwise>
</c:choose>

<div class="pageContent">
	<form method="post" action="${action }" class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input name="index" type="hidden" size="75" value="${index}"/>
		<div class="pageFormContent" layoutH="57" align="left">	
			<p class="nowrap">
				<label>图片链接：</label>
				<input name="img_url" type="text"  value="${jsonobject.img_url }"  />
			</p>
						<p class="nowrap">
				<label>商品名称：</label>
				<input name="title" type="text"  value="${jsonobject.title }"  />
			</p>
						<p class="nowrap">
				<label>所需积分：</label>
				<input name="num" type="text"  value="${jsonobject.num }"  />
			</p>
						<p class="nowrap">
				<label>链接：</label>
				<input name="url" type="text"  value="${jsonobject.url }"  />
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
