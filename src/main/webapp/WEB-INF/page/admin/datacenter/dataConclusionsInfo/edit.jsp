<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
function processBack(response){
	if (response.statusCode == DWZ.statusCode.ok){
		alertMsg.correct(response.message);
		 $.pdialog.closeCurrent();
		 navTab.reload("${path }/admin/datacenter/dataConclusionsInfo", "");
	} else {
		alertMsg.error(response.message);
		return false;
	}
}
</script>
<div class="pageContent">
	<form method="post" action="${path }/admin/datacenter/dataConclusionsInfo/${not empty model.id ? "update" :"add"}"
		 class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input name="id" type="hidden" size="75" value="${model.id }"/>
		<input type="hidden" name="rel" value="${rel}"/>
		<div class="pageFormContent" layoutH="57" align="left">
			<p class="nowrap">
            	<label>数据类型：</label>
				<input class="required" name="dataTypeName" type="text" readonly="readonly"
					suggestFields="dataTypeName" lookupGroup="" value="${model.dataTypeName}"/>
				<input name="dataTypeId" type="hidden" suggestFields="dataTypeId" 
					lookupGroup="" value="${model.dataTypeId}">
				<a class="btnLook" href="${path}/admin/datacenter/dataTypeInfo?isLookup=1" lookupGroup="">请选择</a>
			</p>
			<p class="nowrap">
				<label>类型</label>
				<select id="type" name="type" class="required">
					<c:forEach var="o" items="${dataConclusionsTypeMap}">
						<option value="${o.key }">${o.value }</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
					$("#type").val("${model.type}");
				</script>
			</p>
		    <p class="nowrap">
            	<label>级别：</label>
				<input class="required" name="level" type="text"  value="${model.level }"  />            
			</p>
			<p class="nowrap">
            	<label>级别名称：</label>
				<input class="required" name="levelName" type="text"  value="${model.levelName }"  />            
			</p>
            <p class="nowrap">
				<label>内容：</label>
				<textarea id="content" name="content" rows="25" cols="80">${model.content }</textarea>
			</p>
			<p class="nowrap">
				<label>效果说明：</label>
				<img alt="" src="/image/demo.png">
			</p>
			<p class="nowrap">
				<label>代码说明：</label>
				<img alt="" width="500" height="200" src="/image/code.png">
			</p>
			<p class="nowrap">
				<label>&nbsp;&nbsp;&nbsp;&nbsp;</label>
				为了兼容前台页面的样式，务必按照以下代码样式，特别注意：class="m-tit"和class="m-con"<br/>
				如果你想看html代码，可以点击这里编辑器上的<img alt="" src="/image/code2.jpg"><br/>
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
<script type="text/javascript">  
    $(document).ready(function(){  
        //初始化xhEditor编辑器插件  
        $('#content').xheditor({tools:'Cut,Copy,Paste,Pastetext,|,Source,Fullscreen,About'});
    });  
</script>