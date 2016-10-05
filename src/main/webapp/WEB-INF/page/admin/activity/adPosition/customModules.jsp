<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
function addDiv() {
	var moduleNum = parseInt($("#moduleNum").val());
	var newModuleNum = moduleNum + 1;
	
	$("#addDiv")
	.append("<p class=\"nowrap\"><label>【活动" + newModuleNum + "】</label></p>"
			+ "<p class=\"nowrap\"><label>图片地址" + newModuleNum + "：</label><input name=\"imgPath" + newModuleNum + "\" type=\"text\" value=\"\" class=\"required url\"/></p>"
			+ "<p class=\"nowrap\"><label>跳转链接" + newModuleNum + "：</label><input name=\"url" + newModuleNum + "\" type=\"text\" value=\"\" class=\"required url\"/></p>"
			+ "<p class=\"nowrap\"><label>标题" + newModuleNum + "：</label><input name=\"title" + newModuleNum + "\" type=\"text\" value=\"\" class=\"required\"/></p>"
			+ "<p class=\"nowrap\"><label>活动开始时间：</label><input type=\"text\" name=\"startTime" + newModuleNum + "\" class=\"required date textInput valid\" dateFmt=\"yyyy-MM-dd HH:mm:ss\" style=\"float:left;\"/></p>"
			+ "<p class=\"nowrap\"><label>活动结束时间：</label><input type=\"text\" name=\"endTime" + newModuleNum + "\" class=\"required date textInput valid\" dateFmt=\"yyyy-MM-dd HH:mm:ss\" style=\"float:left;\"/></p>");
	$("#moduleNum").val(newModuleNum);
}
</script>
<div class="page unitBox">
<div class="pageContent">
	<form method="post" action="/admin/activity/adPosition/customModulesAjax?ref=customModules"
		 class="pageForm required-validate" onsubmit="return validateCallback(this);">
		 <span>注意：图片大小尽量一样</p></span>
		<div class="pageFormContent" layoutH="57" align="left">
			<input type="hidden" id="moduleNum" name="moduleNum" value="1"/>
			<p class="nowrap">
            	<label>业务类型：</label>
				<select name="serviceType" id="serviceType">
                    <c:forEach items="${adPosServiceTypeMap}" var="entry">
                       <option value="${entry.key}">${entry.value}</option>
                    </c:forEach>
                </select>
                
			</p>
			
			<div>
				<p class="nowrap">
					<label>【活动1】</label>
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
					<label>标题1：</label>
					<input name="title1" type="text" value="" class="required"/>
				</p>
				<p class="nowrap">
	            	<label>活动开始时间：</label>
					<input type="text" name="startTime1" class="required date" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true" style="float:left;"/>
				</p>
				<p class="nowrap">
	            	<label>活动结束时间：</label>
					<input type="text" name="endTime1" class="required date" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true" style="float:left;"/>            
				</p>
			</div>
			
			<div id="addDiv"></div>
		</div>
		
		<div class="formBar">
			<ul>
			<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div></li>
			<li><div class="buttonActive"><div class="buttonContent"><button type="button" onclick="addDiv()">添加模块</button></div></div></li>
			</ul>
		</div>
	</form>
</div>
</div>
