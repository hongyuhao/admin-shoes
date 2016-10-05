<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<div class="page unitBox">
<div class="pageContent">
	<form method="post" action="/admin/activity/adPosition/customRollPicsAjax?ref=customRollPics"
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
				<label>【轮播1】</label>
			</p>
			<p class="nowrap">
				<label>图片地址1：</label>
				<input name="imgPath1" type="text" value="" class="required url"/>
			</p>
			<p class="nowrap">
            	<label>跳转链接1：</label>
				<input name="url1" type="text" value="" class="required url"/>            
			</p>
			<p class="nowrap">
				<label>【轮播2】</label>
			</p>
			<p class="nowrap">
				<label>图片地址2：</label>
				<input name="imgPath2" type="text" value="" class="url"/>        
			</p>
			<p class="nowrap">
            	<label>跳转链接2：</label>
				<input name="url2" type="text" value="" class="url"/>            
			</p>
			<p class="nowrap">
				<label>【轮播3】</label>
			</p>
			<p class="nowrap">
				<label>图片地址3：</label>
				<input name="imgPath3" type="text" value="" class="url"/>        
			</p>
			<p class="nowrap">
            	<label>跳转链接3：</label>
				<input name="url3" type="text" value="" class="url"/>            
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
