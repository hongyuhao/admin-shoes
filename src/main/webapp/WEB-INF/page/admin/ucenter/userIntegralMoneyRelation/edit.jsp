<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
function processBack(response){
	alertMsg.correct(response.message);
	$.pdialog.closeCurrent();
	navTab.reload("${path }/admin/ucenter/userIntegralMoneyRelation", "");
}
</script>

<c:choose>
	<c:when test="${model.id==0 || empty model.id}">
		<c:set var="action" value="${path }/admin/ucenter/userIntegralMoneyRelation/add"></c:set>
	</c:when>
	<c:otherwise>
		<c:set var="action" value="${path }/admin/ucenter/userIntegralMoneyRelation/update"></c:set>
	</c:otherwise>
</c:choose>

<div class="pageContent">
	<form method="post" action="${action }" class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input name="id" type="hidden" size="75" value="${model.id}"/>
		<div class="pageFormContent" layoutH="57" align="left">
			<p class="nowrap">
				<label>积分值：</label>
				<input name="integralNum" type="text" onchange="f_check(this)" value="${model.integralNum }" class="required" />
			</p>
			<p class="nowrap">
				<label>金额(单位：分)：</label>
				<input name="exchangeMoney" type="text" onchange="f_check(this)" value="${model.exchangeMoney }" class="required" />
			</p>
			<p class="nowrap">
				<label>会员等级：</label>
				<select id="levelId" name="levelId" class="required">
					<option value="">请选择</option>
					<c:forEach var="item" items="${userTypeMap}">   
						<option value="${item.key }" ${model.levelId == item.key ? 'selected=selected' : ''}>${item.value}</option>
					</c:forEach> 
				</select>
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
		function f_check(obj){
           if(!checkAmountM(obj)) {
               obj.value="0";
               obj.focus();
               return;
           }
		}
		
		function checkAmountM(obj) {
			if(obj == null || obj.value == "")
				return true;
			var tar = obj.value;
			var re0 = /^[0-9]*[1-9][0-9]*$/;
			var r = tar.match(re0);
			if(r == null) {
				alert("只能输入整数！");
				return false;
			}
			return true;
		}
		
		$('#levelId').change(function() {
			var levelId = $(this).val();
			if (levelId != '${model.levelId}' && levelId != '') {
				//Ajax向后台提交数据  
				$.ajax({
					type : 'POST',
					url : '${path }/admin/ucenter/userIntegralMoneyRelation/query',
					data : 'levelId=' + levelId,
					dataType : "json",
					cache : false,
					success : function(data) {
						if(data.isExit == 1) {
							alert("已存在该会员等级的记录！");
							$('#levelId').val('${model.levelId}');
						}
					},
					error : DWZ.ajaxError
				});
			}
		});
	</script>
</div>
