<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
function processBack(response){
	alertMsg.correct(response.message);
	 $.pdialog.closeCurrent();
	 navTab.reload("${path }/admin/open/partnerInfo", "");
}
</script>
<div class="pageContent">
	<form method="post" action="${path }/admin/open/partnerInfo/${not empty model.id ? "update" :"add"}"
		 class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input name="id" type="hidden" size="75" value="${model.id }"/>
		<input type="hidden" name="rel" value="${rel}"/>
		<div class="pageFormContent" layoutH="57" align="left">
			<p class="nowrap">
            	<label>名称：</label>
				<input name="name" type="text"  value="${model.name }"  />            
			</p>
			<p class="nowrap">
            	<label>合作类型：</label>
				<select id="type" name="type" >
 					<c:forEach var="partnerType" items="${partnerTypeMap}">
						<option value="${partnerType.key }">${partnerType.value }</option>
					</c:forEach>
	            </select>
           		<script type="text/javascript">
					$("#type").val("${model.type}");
				</script>     
			</p>
			<p class="nowrap">
				<label>服务热线：</label>
				<input name="serviceTel" type="text"  value="${model.serviceTel }"  /> 
			</p>
			<p class="nowrap">
				<label>官网地址：</label>
				<input name="homeUrl" type="text"  value="${model.homeUrl }"  /> 
			</p>
			<p class="nowrap">
				<label>包邮信息：</label>
				<input name="postInfo" type="text"  value="${model.postInfo }"  /> 
			</p>
			<p class="nowrap">
				<label>附加信息：</label>
				<input name="overhead" type="text"  value="${model.overhead }"  /> 
			</p>
			<p class="nowrap">
				<label>商品链接规则：</label>
				<input name="goodsUrl" type="text"  value="${model.goodsUrl }"  /> 
			</p>
			<p class="nowrap">
				<label>订单链接规则：</label>
				<input name="orderUrl" type="text"  value="${model.orderUrl }"  /> 
			</p>
			<p class="nowrap">
				<label>路径配置：</label>
				<textarea id="pathConfig" name="pathConfig" rows="12" cols="60">${model.pathConfig }</textarea>
			</p>
			<p class="nowrap">
				<label>描述：</label>
				<textarea id="description" name="description" rows="12" cols="60">${model.description }</textarea>
			</p>
			<p class="nowrap">
				<label>二维码ticket：</label> 
				<textarea id="qrcodeTicket" name="qrcodeTicket" rows="2" cols="70">${model.qrcodeTicket }</textarea>
			</p>
			<p class="nowrap">
				<label>二维码url：</label>
				<textarea id="qrcodeUrl" name="qrcodeUrl" rows="2" cols="70">${model.qrcodeUrl }</textarea>
			</p>
			<c:if test="${empty model.qrcodeUrl}">
				<a id="generateQrcode" class="button" href="javascript:;" onclick="fn()"><span>生成二维码信息</span></a>
			</c:if>
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
    });  
    
    function fn(){
    	$.ajax({
    	     type: 'POST',
    	     dataType:'json',
    	     data:{
    	    	id: '${model.id }'
    	     },
    	     url: "${path }/admin/open/partnerInfo/generate/qrcode.json" ,
    	    success: function(json){
    	    	$("#qrcodeTicket").val(json.ticket);
    	    	$("#qrcodeUrl").val(json.url);
    	    	$("#generateQrcode").hide();
    	    } 
    	});
    }
    
</script>