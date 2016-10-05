<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
$(function(){

	
});
function processBack(response){
	alertMsg.correct(response.message);
	 $.pdialog.closeCurrent();
	 navTab.reload("${path }/admin/wxpay/redPackResult", "");
}
</script>
<div class="pageContent">
	<form method="post" action="${path}/admin/wxpay/redPackResult/supplyAgain?billNo=${billNo}&openId=${userInfo.openId}&redpackId=${redpackId}" class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input type="hidden" name="rel" value="${rel}"/>
		<div class="pageFormContent" layoutH="80" align="left">
			 <p class="nowrap">
				<label>领取用户：</label>
				<label>${userInfo.nickName }</label>
			 </p>
			 <p class="nowrap">
				<label>用户ID：</label>
				<label>${userInfo.userId }</label>
			 </p>
			 <p class="nowrap">
				<label>领取用户openId：</label>
				<label>${userInfo.openId }</label>
			 </p>
			 <p class="nowrap">
				<label>领取结果：</label>
				<label>
				   <%-- 临时这么判断，后面再修改枚举 --%>
					<c:if test="${result == -1 }">
						查询失败，稍后重新查询
					</c:if>
					<c:if test="${result == 0 }">
						微信后台无记录
					</c:if>
					<c:if test="${result == 1 }">
						红包发放中
					</c:if>
					<c:if test="${result == 2 }">
						已发放待领取
					</c:if>
					<c:if test="${result == 3 }">
						发放失败
					</c:if>
					<c:if test="${result == 4 }">
						已领取
					</c:if>
					<c:if test="${result == 5 }">
						过期未领退款
					</c:if>
				</label>
			 </p>
			 <p class="nowrap">
				<label>备注：</label>
				<label>微信后台无记录与发放失败都属于失败</label>
			 </p>
			 <%-- <p class="nowrap">
				<label>商户名称：</label>
				<input name="nickName" type="text"  value="${model.nickName }" class="required" />
			</p>
			 <p class="nowrap">
				<label>发送方名称：</label>
				<input name="sendName" type="text"  value="${model.sendName }" class="required" />
			</p> --%>
			
		</div>
		<c:choose>
			<c:when test="${result == 1 }">
				<div class="formBar">
					<ul>
					<li><div class="buttonActive"><%-- <a href="${path}/admin/wxpay/redPackResult/supplyAgain?billNo=${billNo}&openId=${userInfo.openId}&redpackId=${redpackId}" rel="${rel}" > --%><button type="submit"><span>补发红包</span></button></div></li>
					</ul>	
				</div>
			</c:when>
		</c:choose>
	</form>
</div>

