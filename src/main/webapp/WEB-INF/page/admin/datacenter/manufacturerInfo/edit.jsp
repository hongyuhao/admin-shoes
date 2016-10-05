<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
function processBack(response){
	if (response.statusCode == DWZ.statusCode.ok){
		alertMsg.correct(response.message);
		 $.pdialog.closeCurrent();
		 navTab.reload("${path }/admin/datacenter/manufacturerInfo", "");
	} else {
		alertMsg.error(response.message);
		return false;
	}
}
</script>
<div class="pageContent">
	<form method="post" action="${path }/admin/datacenter/manufacturerInfo/${not empty model.id ? "update" :"add"}"
		 class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input name="id" type="hidden" size="75" value="${model.id }"/>
		<input type="hidden" name="rel" value="${rel}"/>
		<div class="pageFormContent" layoutH="57" align="left">
			<p class="nowrap">
            	<label>名称：</label>
				<input name="name" type="text"  value="${model.name }"  />            
			</p>
			<p class="nowrap">
            	<label>云服务器的账号：</label>
				<input name="appid" type="text"  value="${model.appid }"  />            
			</p>
			<p class="nowrap">
            	<label>云服务器的秘钥：</label>
				<input name="secretKey" type="text"  value="${model.secretKey }"  />            
			</p>
            <p class="nowrap">
				<label>厂家描述：</label>
				<textarea id="description" name="description" rows="12" cols="60">${model.description }</textarea>
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
        /*
        $('#content').xheditor({  
        	tools:'mini',  
            skin:'default',  
            upMultiple:true,  
            upImgUrl: "/admin/datacenter/images/xh/upload.json",
            upImgExt: "jpg,jpeg,gif,bmp,png",  
            html5Upload:false  
        });  
        */
        $('#description').xheditor({tools:'Cut,Copy,Paste,Pastetext,|,Source,Fullscreen,About'});
    });  
</script>