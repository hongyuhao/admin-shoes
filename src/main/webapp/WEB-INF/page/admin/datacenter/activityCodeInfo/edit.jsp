<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
function processBack(response){
	if (response.statusCode == DWZ.statusCode.ok){
		alertMsg.correct(response.message);
		 $.pdialog.closeCurrent();
		 navTab.reload("${path }/admin/datacenter/activityCodeInfo", "");
	} else {
		alertMsg.error(response.message);
		return false;
	}
}
</script>
<div class="pageContent">
	<form method="post" action="${path }/admin/datacenter/activityCodeInfo/${not empty model.id ? "update" :"add"}"
		 class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input name="id" type="hidden" size="75" value="${model.id }"/>
		<input type="hidden" name="rel" value="${rel}"/>
		<div class="pageFormContent" layoutH="57" align="left">
			<p class="nowrap">
            	<label>状态：</label>
				<select name="codeStatus" id="codeStatus">
                    <c:forEach items="${statusMap}" var="entry">
                       <option value="${entry.key}" ${model.codeStatus==entry.key?'selected':'' }>${entry.value}</option>
                    </c:forEach>
                </select>
                    <script type="text/javascript">
                    	jQuery('#codeStatus').val("${model.codeStatus }");
                    </script>          
			</p>
			<p class="nowrap">
            	<label>用户ID：</label>
				<input name="bindUserId" type="text"  value="${model.bindUserId }"  />            
			</p>
			<p class="nowrap">
            	<label>用户openID：</label>
				<input name="bindUserOpenId" type="text"  value="${model.bindUserOpenId }"  />            
			</p>
			<p class="nowrap">
				<input name="createTime" type="hidden"  value="${model.createTime }"  />            
			</p>
			<p class="nowrap">
            	<label>绑定时间：</label>
            	<input type="text" value="${bindTime}" name="bindTime" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true" style="float:left;" />         
			</p>
			<%-- <p class="nowrap">
            	<label>扩展字段1：</label>
				<input name="expand1" type="text"  value="${model.expand1 }"  />            
			</p>
			<p class="nowrap">
            	<label>扩展字段2：</label>
				<input name="expand2" type="text"  value="${model.expand2 }"  />            
			</p>
			<p class="nowrap">
            	<label>扩展字段3：</label>
				<input name="expand3" type="text"  value="${model.expand3 }"  />            
			</p>
			<p class="nowrap">
            	<label>扩展字段4：</label>
				<input name="expand4" type="text"  value="${model.expand4 }"  />            
			</p>
			<p class="nowrap">
            	<label>扩展字段5：</label>
				<input name="expand5" type="text"  value="${model.expand5 }"  />            
			</p> --%>
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
</div>