<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>

<script type="text/javascript">
function processBack(response){
	alertMsg.correct(response.message);
	 $.pdialog.closeCurrent();
	 navTab.reload("${path }/admin/wxpay/WXUnifiedorder", "");
}
</script>
<div class="pageContent">
   	<form method="post" action="${path }/admin/wxpay/WXUnifiedorder/close.do" class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<div class="pageFormContent" layoutH="80" align="left">
			<p class="nowrap">  
				<label>订单号ID：</label>
				<input name="orderId" type="text" value="${orderId }" readonly="readonly"/>
			</p>
			
		</div>
		<div class="formBar">
			<ul>
			<li><div class="buttonActive"><div class="buttonContent"><button type="submit">关闭</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">返回</button></div></div>
				</li>
			</ul>
		</div>
	</form>



	
</div>
