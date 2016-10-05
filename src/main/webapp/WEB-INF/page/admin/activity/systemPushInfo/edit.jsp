<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
$(function (){
	var imgUrl = $("#imgUrl").val();
	if (imgUrl != null && imgUrl != "" && imgUrl != "undefinded"){
		appendPicDiv(imgUrl);
	}
});

function processBack(response){
	alertMsg.correct(response.message);
	 $.pdialog.closeCurrent();
	 navTab.reload("${path }/admin/activity/systemPushInfo", "");
}

// 图片上传==============start==========
function uploadifySuccess(file, data, response) {
	var responseJson = $.parseJSON(data);
	if (typeof (responseJson.result) == "undefined") {
		alert("上传失败o(╯□╰)o"); 
	} else {
		var pic = responseJson.result.imgPaths[0].original;
		pic = pic.replace(/#/, "g");
		
		appendPicDiv(pic);
		$("#imgUrl").val(pic);
		//alert("上传成功O(∩_∩)O"); 
	}
}

function appendPicDiv(pic) {
	$("#previewPic").html();
	$("#previewPic")
		.append("<hr /><br/>" +
//				"<h2 color=\"red\">"+pic+"</h2>"+
			"<a href='"+pic+"' target=\"_blank\"><img id=\"coverImagePerview\" src='" + pic + "' width=\"100\" height=\"100\"/></a><br/>"
			); 
}

function uploadifyQueueComplete() {

}

function sysPushInfoValidate(thisVar, fun){
	var imgUrl = $("#imgUrl").val();
	if (imgUrl != null && imgUrl != "" && imgUrl != "undefinded"){
		return validateCallback(thisVar, fun);
	} else {
		alert("图片不能为空");
		return false;
	}
}

function processBack(response) {
	alertMsg.correct(response.message);
	$.pdialog.closeCurrent();
	navTab.reload("${path }/admin/activity/systemPushInfo", "");
}
//图片上传==============end==========
</script>
<div class="pageContent">
	<form method="post" action="/admin/activity/systemPushInfo/${not empty model.id ? "update" :"add"}"
		 class="pageForm required-validate" onsubmit="return sysPushInfoValidate(this, processBack);">
		<input name="id" type="hidden" size="75" value="${model.id }"/>
		<input type="hidden" name="rel" value="${rel}"/>
		<div class="pageFormContent" layoutH="57" align="left">
			<p class="nowrap">
            	<label>消息类型：</label>
				<select name="msgType" id="msgType" disabled="disabled">
                        <c:forEach items="${msgTypeMap}" var="entry">
                            <option value="${entry.key}" ${model.msgType == entry.key?'selected':''}>${entry.value}</option>
                        </c:forEach>
                    </select>
                    <script type="text/javascript">
                    	jQuery('#msgType').val("${model.msgType }");
					</script>
			</p>
			<p class="nowrap">
            	<label>消息内容：</label>
				<textarea rows="8" cols="50" name="content" type="text"  value="${model.content }" class="required">${model.content }</textarea>        
			</p>
			<p class="nowrap">
            	<label>跳转链接：</label>
				<input name="url" type="text"  value="${model.url }" class="required url"/>            
			</p>
			<p>
				<label>上传图片：</label>
				<dd>
				<input id="testFileInput" type="file" name="image"
					uploaderOption="{
						swf:'${path }/js/dwz-ria-1.5.0/uploadify/scripts/uploadify.swf',
						uploader:'${path }/admin/activity/images/upload.json',
						formData:{},
						buttonText:'请选择文件',
						fileSizeLimit:'200KB',
						fileTypeDesc:'*.jpg;*.jpeg;*.gif;*.png;',
						fileTypeExts:'*.jpg;*.jpeg;*.gif;*.png;',
						auto:true,
						multi:true,
						onUploadSuccess:uploadifySuccess,
						onQueueComplete:uploadifyQueueComplete
					}" />
				<br/>
				<div id="previewPic"></div>
				</dd>
				<input type="hidden" id="imgUrl" name="imgUrl" value="${model.imgUrl }" />
			</p>
			<p class="nowrap">
            	<label>数据格式：</label>
				<select name="dataFormat" id="dataFormat" disabled="disabled">
                        <c:forEach items="${dataFormatMap}" var="entry">
                            <option value="${entry.key}" ${model.dataFormat == entry.key?'selected':''}>${entry.value}</option>
                        </c:forEach>
                    </select>
                    <script type="text/javascript">
                    	jQuery('#dataFormat').val("${model.dataFormat }");
                    </script>          
			</p>
<!-- 			<p class="nowrap"> -->
<!--             	<label>目标用户群：</label> -->
<%-- 				<input name="targetUserGroup" type="text"  value="${model.targetUserGroup }"  />             --%>
<!-- 			</p> -->
			<p class="nowrap">
            	<label>开始时间：</label>
            	<input type="text" value="${startTime}" name="startTime" class="required date" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true" style="float:left;"/>        
			</p>
			<p class="nowrap">
            	<label>结束时间：</label>
            	<input type="text" value="${endTime}" name="endTime" class="required date" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true" style="float:left;"/>      
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
