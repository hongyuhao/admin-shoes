<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script src="/js/ajaxupload.3.5.js" type="text/javascript"></script>
<script type="text/javascript">
function processBack(response){
	alertMsg.correct(response.message);
	$.pdialog.closeCurrent(); 
	navTab.reload("${path }/admin/wxpay/red/user/list", "");
}
</script>
<div class="pageContent">
	<form method="post" action="/admin/wxpay/red/reissue" class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);" id="cardForm">
		<input type="hidden" name="rel" value="${rel}"/>
		<input type="hidden" name="nickName" value="${nickName}"/>
		<input type="hidden" name="userId" value="${userId}"/>
		<input type="hidden" name="openId" value="${openId}"/>
		<div class="pageFormContent" layoutH="50" align="left">
			 <p class="nowrap">
				<label>用户昵称：</label>
				<input name="nickName" type="text"  value="${nickName }" disabled="disabled" class="required" />
			</p>
			 <p class="nowrap">
				<label>关注状态：</label>
				<c:choose>
					<c:when test="${subScribe == 1 }">关注中</c:when>
					<c:when test="${subScribe == -1 }">取消关注</c:when>
				</c:choose>
			</p>
			<p class="nowrap">  
				<label>红包金额：</label>
				<select name="redPackInfo" id="redPackInfo" >
                    <c:forEach items="${redPackList}" var="redPack">
                        <option value="${redPack.id},${redPack.totalAmount}">
                        	${redPack.actName}(<fmt:formatNumber type="number" value="${redPack.totalAmount/100}" 
                        	maxFractionDigits="0"/> 元)
                        </option>
                    </c:forEach>
                </select>
			</p>
		</div>
		<div class="formBar">
			<ul>
			<li><div class="buttonActive"><div class="buttonContent"><button type="submit" id="saveCard">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">返回</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>

