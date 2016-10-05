<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
function processBack(response){
	alertMsg.correct(response.message);
	 $.pdialog.closeCurrent();
	 navTab.reload("${path }/admin/mall/goodsBaseInfo", "");
}
function uploadifySuccess(file, data, response) {
	var responseJson = $.parseJSON(data);
	if (typeof (responseJson.result) == "undefined") {
		alert("上传失败");
	} else {
		var pic = responseJson.result.imgPaths[0].original;
		pic = pic.replace(/#/, "g");
		$("#coverImgUrl").val(pic);
		$("#previewPic").html("<img id=\"coverImagePerview\" src='" + pic + "' width=\"100\" height=\"100\"/>");
	}
}

function uploadifyQueueComplete() {

}
</script>
<div class="pageContent">
	<form method="post" action='/admin/mall/goodsBaseInfo/${null==model?"add":"update"}'
		class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		
		<input name="id" type="hidden" size="75" value="${model.id }"/>
		<input type="hidden" name="rel" value="${rel}"/>
		<div class="pageFormContent" layoutH="57" align="left">
			<p class="nowrap">
            	<label>标题：</label>
				<input class="required" name="title" type="text"  value="${model.title }"/>         
			</p>
			<p class="nowrap">
            	<label>副标题：</label>
				<input class="required" name="subTitle" type="text"  value="${model.subTitle }"/>        
			</p>
		    <p class="nowrap">
            	<label>通用名：</label>
				<input class="required" name="gennericName" type="text"  value="${model.gennericName }"  />            
			</p>
			<p class="nowrap">
            	<label>类型：</label>
				<select name="goodsType" id="goodsType">
					<option value="">请选择</option>
					<c:forEach var="o" items="${GOODS_TYPE_MAP}">
						<option value="${o.key }">${o.value }</option>
					</c:forEach>
				</select>  
				<script type="text/javascript">$("#goodsType").val("${model.goodsType}");</script>
			</p>
			<p class="nowrap">
            	<dt>
					<label>图标url：</label>
				</dt>
				<dd>
					<input id="testFileInput" type="file" name="image"
						uploaderOption="{
							swf:'${path }/js/dwz-ria-1.5.0/uploadify/scripts/uploadify.swf',
							uploader:'${path }/admin/mall/images/upload.json',
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
					<input type="hidden" readonly="readonly" name="coverImgUrl" id="coverImgUrl" value="${model.coverImgUrl }" />
					<div id="previewPic">
						<c:if test="${not empty model.coverImgUrl }">
							<img id="coverImagePerview" src="${model.coverImgUrl}" width="100" height="100" />
						</c:if>
					</div>
				</dd>
			</p>
			
			<p class="nowrap">
            	<label>是否为处方药：</label>
				<select name="isPrescription" id="isPrescription">
					<option value="">请选择</option>
					<c:forEach var="o" items="${GOODS_PRESCRIPTION_TYPE_MAP}">
						<option value="${o.key }">${o.value }</option>
					</c:forEach>
				</select>  
				<script type="text/javascript">$("#isPrescription").val("${model.isPrescription}");</script>           
			</p>
			<p class="nowrap">
            	<label>批准文号：</label>
				<input class="required" name="approvalNumber" type="text"  value="${model.approvalNumber }"  />            
			</p>
			<p class="nowrap">
            	<label>厂商：</label>
				<input class="required" name="manufacturer" type="text"  value="${model.manufacturer }"  />            
			</p>
			<p class="nowrap">
            	<label>剂型：</label>
				<input class="required" name="dosageForm" type="text"  value="${model.dosageForm }"  />            
			</p>
			<p class="nowrap">
            	<label>禁忌：</label>
				<textarea name="contraindication" id="contraindication" rows="8" cols="80">${model.contraindication }</textarea>
			</p>
			<p class="nowrap">
            	<label>适合症状：</label>
				<textarea name="symptom" id="symptom" rows="8" cols="80">${model.symptom }</textarea>
			</p>
			<p class="nowrap">
            	<label>治疗疾病：</label>
				<input name="diseaseTag" type="text"  value="${model.diseaseTag }"  />            
			</p>
			<c:if test="${null==model}">
				<p class="nowrap">
            	    <label>规格：</label>
				    <input name="skuName" type="text"  value=""  />            
			    </p>
			</c:if>
			<p class="nowrap">
            	<label>审核状态：</label>
				<select name="status" id="status">
					<option value="">请选择</option>
					<c:forEach var="o" items="${AUDIT_STATUS_MAP}">
						<option value="${o.key }">${o.value }</option>
					</c:forEach>
				</select>  
				<script type="text/javascript">$("#status").val("${model.status}");</script>           
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
        $('#contraindication').xheditor({tools:'Cut,Copy,Paste,Pastetext,|,Source,Fullscreen,About'});
        $('#symptom').xheditor({tools:'Cut,Copy,Paste,Pastetext,|,Source,Fullscreen,About'});
    });
</script>