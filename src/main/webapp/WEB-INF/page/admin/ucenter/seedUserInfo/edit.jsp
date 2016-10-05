<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp" %>
<script src="/js/ajaxupload.3.5.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){

	
});
function processBack(response){
	alertMsg.correct(response.message);
	 $.pdialog.closeCurrent();
	 navTab.reload("${path }/admin/ucenter/seedUserInfo", "");
}
</script>
<div class="pageContent">
	<form method="post" action="${path }/admin/ucenter/seedUserInfo/${not empty model.id ? "update" :"add"}"
		 class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input name="id" type="hidden" size="75" value="${model.id }"/>
		<input type="hidden" name="rel" value="${rel}"/>
		<div class="pageFormContent" layoutH="80" align="left">
			 <p class="nowrap">
				<label>用户ID: </label>
				<input name="userId" type="text"  value="${model.userId }"  />
			</p>
			 <p class="nowrap">
			 <label>用户openID: </label>
				<input name="openId" type="text"  value="${model.openId }"  />
			</p>
			 <p class="nowrap">
				<label>微信账号: </label>
				<input name="wechatAccount" type="text"  value="${model.wechatAccount }"  />
			</p>
			
			 <p class="nowrap">
				<label>微信昵称: </label>
				<input name="wechatNickName" type="text"  value="${model.wechatNickName }"  />
			</p>
			<p class="nowrap">
				<label>真名: </label>
				<input name="realName" type="text"  value="${model.realName }"  />
			</p>
			<p class="nowrap">
				<label>手机: </label>
				<input name="phone" type="text"  value="${model.phone }"  />
			</p>
			<p class="nowrap">
				<label>详细地址： </label>
				<input name="userAddress" type="text"  value="${model.userAddress }"  />
			</p>
			<p class="nowrap">
				<label>支付金额： </label>
				<input name="payPrice" type="text"  value="${model.payPrice }"  />
			</p>
			<p class="nowrap">
				<label>专题ID： </label>
				<input name="subjectId" type="text"  value="${model.subjectId }"  />
			</p>
			<p class="nowrap">
				<label>是否看过： </label>
				<input name="isLook" type="text"  value="${model.isLook }"  />
			</p>
			<p class="nowrap">
				<label>是否支付： </label>
				<input name="isPay" type="text"  value="${model.isPay }"  />
			</p>
			<p class="nowrap">
				<label>创建时间： </label>
				<input name="createTime" type="text"  value="${model.createTime }"  />
			</p>
			<p class="nowrap">
				<label>成为种子用户时间： </label>
				<input name="seedTime" type="text"  value="${model.seedTime }"  />
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