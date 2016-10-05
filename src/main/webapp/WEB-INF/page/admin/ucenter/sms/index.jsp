<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="/inc/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7"/>
    <title>短信发送</title>
</head>
<body>
<div class="pageContent">
	<form method="post" action='${path}/admin/ucenter/sms/send' class="pageForm required-validate" onsubmit="return validateCallback(this);" novalidate="novalidate">
		<div class="pageFormContent nowrap" layoutH="56">
			<dl><font color="red">短信可能会有延迟，请耐心等候！</font></dl>
			<dl>
				<dt>手机号码:</dt>
				<dd>
				<input type="text" name="phone" id="phone" value="" class="required" tabindex="1"/>
				</dd>
			</dl>
			<dl>
				<dt>短信内容:</dt>
				<dd>
				<textarea name="messageContent" id="messageContent" cols="100" rows="4" class="required" tabindex="2"></textarea>
				</dd>
			</dl>
			<div>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">发送</button></div></div></li>
			</div>
		</div>
	</form>
</div>
</body>
</html>
