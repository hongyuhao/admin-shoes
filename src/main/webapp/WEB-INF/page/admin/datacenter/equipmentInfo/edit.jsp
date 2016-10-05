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

var intervalName;    
var value=0;

	$(function() {
		var jsUserName = "";
		if ($.browser.msie) // IE浏览器
		{
			$("#dataTypeId").get(0).onpropertychange = handle;
		} else // 其他浏览器
		{
			// 定时器句柄
			$("#dataTypeId").get(0).addEventListener("input", setJsUserName,
					false);
			//启动定时器
			intervalName = setInterval(handle, 1000);
		}
		// 设置jsUserName input的值
		function setJsUserName() {
			$("#dataTypeId").val($(this).val());
		}
		// jsUserName input的值改变时执行的函数
		function handle() {
			// IE浏览器此处判断没什么意义，但为了统一，且提取公共代码而这样处理。
			if ($("#dataTypeId").val() != jsUserName) {
				if (value != $('#dataTypeId').val()) {
					selectDeviceType();
				}

			}
		}
	});
</script>
<div class="pageContent">
	<form method="post" action="${path }/admin/datacenter/equipmentInfo/${not empty model.id ? "update" :"add"}"
		 class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input name="id" type="hidden" size="75" value="${model.id }"/>
		<input type="hidden" name="rel" value="${rel}"/>
		<div class="pageFormContent" layoutH="57" align="left">
			<p class="nowrap">
            	<label>名称：</label>
				<input name="name" type="text" id="name" value="${model.name }" oninput="myFunction()" />            
			</p>
			<p class="nowrap">
            	<label>厂商：</label>
				<input class="required" name="manufacturerName" type="text" readonly="readonly"
					suggestFields="manufacturerName" lookupGroup="" value="${model.manufacturerName}"/>
				<input name="manufacturerId" type="hidden" suggestFields="manufacturerId" 
					lookupGroup="" value="${model.manufacturerId}">
				<a class="btnLook" href="${path}/admin/datacenter/manufacturerInfo?isLookup=1" lookupGroup="">请选择</a>
			</p>
			<p class="nowrap" id="dataType">
            	<label>数据类型：</label>
				<input class="required" name="dataTypeName" type="text" readonly="readonly"
					suggestFields="dataTypeName" lookupGroup="" value="${model.dataTypeName}"/>
				<input name="dataTypeId" type="hidden" suggestFields="dataTypeId" 
					lookupGroup="" value="${model.dataTypeId}" id="dataTypeId">
				<a class="btnLook" href="${path}/admin/datacenter/dataTypeInfo?isLookup=1" lookupGroup="" onclick="start()">请选择</a>
			</p>
			<p class="nowrap" id="equipmentDataTypeP">
            	<label>设备类型：</label>
            	<select id="equipmentDataType" name="equipmentDataType" class="required">
					<c:forEach var="o" items="${equipmentTypeMap}">
						<option value="${o.key }">${o.value }</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
					$("#equipmentDataType").val("${model.equipmentDataType}");
				</script>
			</p>
			<p class
			<p class="nowrap">
            	<label>通讯类型：</label>
            	<select id="communicateType" name="communicateType" class="required">
					<c:forEach var="o" items="${equipmentCommunicateTypeMap}">
						<option value="${o.key }">${o.value }</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
					$("#communicateType").val("${model.communicateType}");
				</script>
			</p>
			<p class="nowrap">
            	<label>商品id：</label>
				<input name="goodsId" type="number"  value="${model.goodsId }"  />            
			</p>
			<p class="nowrap">
            	<label>品牌：</label>
				<input name="brandName" type="text"  value="${model.brandName }"  />            
			</p>
			<p class="nowrap">
            	<label>标题：</label>
				<input name="title" type="text"  value="${model.title }"  />            
			</p>
			<p class="nowrap">
            	<label>图片url：</label>
				<input name="imageUrl" type="text"  value="${model.imageUrl }"  />            
			</p>
			<p class="nowrap">
            	<label>型号：</label>
				<input name="model" type="text"  value="${model.model }"  />            
			</p>
			<p class="nowrap">
            	<label>设备类型(文字描述)：</label>
				<input name="equipmentTypeText" type="text"  value="${model.equipmentTypeText }"  />            
			</p>
			<p class="nowrap">
            	<label>设备详情页图片url：</label>
				<input name="imageDetailUrl" type="text"  value="${model.imageDetailUrl }"  />            
			</p>
            <p class="nowrap">
				<label>产品说明书：</label>
				<input id="userGuideUrl" type="text" name="userGuideUrl" value="${model.userGuideUrl }" />
			</p>
            <p class="nowrap">
				<label>产品描述：</label>
				<textarea id="description" name="description" rows="12" cols="60">${model.description }</textarea>
			</p>
			<p class="nowrap">
				<label>数值标准：</label> 
				<textarea id="dataStandard" name="dataStandard" rows="12" cols="60">${model.dataStandard }</textarea>
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
        $('#description').xheditor({tools:'Cut,Copy,Paste,Pastetext,|,Source,Fullscreen,About'});
        var dataTypeId="${model.dataTypeId}";
        if(dataTypeId == 3){
        	$('#equipmentDataTypeP').show();
        }else{
        	$('#equipmentDataTypeP').hide();
        }
    });  
    
      function selectDeviceType(){
    		if($('#dataTypeId').val() == 3){
    			$('#equipmentDataTypeP').show();
    		}else{
    			$('#equipmentDataTypeP').hide();
    			$('#equipmentDataType').val(0);
    		}
      }
    	/* $(function(){  
    	$('#dataTypeId').bind('input oninput', function() {  
    		if($('#dataTypeId').val() == 3){
    			$('#equipmentDataTypeP').show();
    		}else{
    			$('#equipmentDataTypeP').hide();
    			$('#equipmentDataType').val(0);
    		}
    	});  
    	  
    	})     */
</script>