<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
function processBack(response){
	if (response.statusCode == DWZ.statusCode.ok){
		alertMsg.correct(response.message);
		 $.pdialog.closeCurrent();
		 navTab.reload("${path }/admin/datacenter/equipmentInfo", "");
	} else {
		alertMsg.error(response.message);
		return false;
	}
}
</script>
<div class="pageContent">
<c:if test="${empty model }">
	<form method="post" action="${path }/admin/datacenter/dataTemplate/add"
		 class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
</c:if>
<c:if test="${not empty model }">
	<form method="post" action="${path }/admin/datacenter/dataTemplate/update"
		 class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		 <input type="hidden" name="id" value="${model.id }"/>
</c:if>
		<input type="hidden" name="rel" value="${rel}"/>
		<div class="pageFormContent" layoutH="57" align="left">
            <p class="nowrap">
            	<label>设备：</label>
				<input class="required" type="text" readonly="readonly" value="${equipmentInfo.name}"/>
				<input name="equipmentId" type="hidden" value="${equipmentInfo.id}"/>
			</p>
			<p class="nowrap">
            	<label>数据格式：</label>
				<select name="dataFormatType" id="dataFormatType">
					<c:forEach items="${dataFormatTypeMap }" var="tmap">
					<option value="${tmap.key }">${tmap.value }</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
				$('#dataFormatType').val('${model.dataFormatType}');
				</script>
			</p>
			<p class="nowrap">
            	<label>编码方式：</label>
					<select name="encodeType" id="encodeType">
					<c:forEach items="${encodeTypeMap }" var="tmap">
					<option value="${tmap.key }">${tmap.value }</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
				$('#encodeType').val('${model.encodeType}');
				</script>
			</p>
            <p class="nowrap">
				<label>模板内容：</label>
				<textarea id="template" name="template" cols="60" rows="5">${model.template }</textarea>
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