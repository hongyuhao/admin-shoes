<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<div class="page unitBox">
<div class="pageContent">
	<form method="post" action="/admin/activity/adPosition/customAnnounceAjax?ref=customAnnounce"
		 class="pageForm required-validate" onsubmit="return validateCallback(this);">
		<div class="pageFormContent" layoutH="57" align="left">
			<p class="nowrap">
            	<label>业务类型：</label>
				<select name="serviceType" id="serviceType">
                    <c:forEach items="${adPosServiceTypeMap}" var="entry">
                       <option value="${entry.key}">${entry.value}</option>
                    </c:forEach>
                </select>
			</p>
			<p class="nowrap">
            	<label>公告标题：</label>
				<textarea rows="2" cols="50" name="content" type="text"  value="" class="required"></textarea>        
			</p>
			<p class="nowrap">
            	<label>跳转链接：</label>
				<input name="url" type="text"  value="" class="required url"/>            
			</p>
		</div>
		
		<div class="formBar">
			<ul>
			<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
			</ul>
		</div>
	</form>
</div>
</div>