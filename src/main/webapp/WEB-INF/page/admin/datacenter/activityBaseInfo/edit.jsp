<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
function processBack(response){
	if (response.statusCode == DWZ.statusCode.ok){
		alertMsg.correct(response.message);
		 $.pdialog.closeCurrent();
		 navTab.reload("${path }/admin/datacenter/activityBaseInfo", "");
	} else {
		alertMsg.error(response.message);
		return false;
	}
}
</script>
<div class="pageContent">${model.activityStatus}
	<form method="post" action="/admin/datacenter/activityBaseInfo/${not empty model.id ? "update" :"add"}"
		 class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input name="id" type="hidden" size="75" value="${model.id }"/>
		<input type="hidden" name="rel" value="${rel}"/>
		<div class="pageFormContent" layoutH="57" align="left">
			<p class="nowrap">
            	<label>名称：</label>
				<input name="activityName" type="text"  value="${model.activityName }"  />            
			</p>
			<p class="nowrap">
            	<label>合作方ID：</label>
				<input name="partnerId" type="text"  value="${model.partnerId }"  />            
			</p>
			<p class="nowrap">
            	<label>描述：</label>
				<textarea rows="15" cols="60" name="activityDesc" type="text"  value="${model.activityDesc }">${model.activityDesc }</textarea>        
			</p>
			<p class="nowrap">
            	<label>开始时间：</label>
            	<input type="text" value="${startTime}" name="startTime" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true" style="float:left;"/>        
			</p>
			<p class="nowrap">
            	<label>结束时间：</label>
            	<input type="text" value="${endTime}" name="endTime" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true" style="float:left;"/>      
			</p>
			<p class="nowrap">
            	<label>状态：</label>
				<select name="activityStatus" id="activityStatus">
                        <c:forEach items="${activityStatusMap}" var="entry">
                            <option value="${entry.key}" ${model.activityStatus == entry.key?'selected':''}>${entry.value}</option>
                        </c:forEach>
                    </select>
                    <script type="text/javascript">
                    	jQuery('#activityStatus').val("${model.activityStatus }");
                    </script>          
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
</div>