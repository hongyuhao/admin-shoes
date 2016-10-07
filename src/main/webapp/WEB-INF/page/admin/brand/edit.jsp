<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">

function processBack(response){
	alertMsg.correct(response.message);
	 $.pdialog.closeCurrent();
	 navTab.reload("${path }/admin/brand", "");
}
//图片上传==============end==========
</script>
<div class="pageContent">
	<form method="post" action="/admin/brand/${not empty model.brandId ? "update" :"add"}"
		 class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input name="brandId" type="hidden" size="75" value="${model.brandId }"/>
		<input type="hidden" name="rel" value="${rel}"/>
		<div class="pageFormContent" layoutH="57" align="left">
			<p class="nowrap">
            	<label>品牌名称：</label>
				<input name="brandName" type="text"  value="${model.brandName }" class="required"/>
			</p>
			<p class="nowrap">
				<label>图标地址：</label>
				<input name="brandIcon" type="text"  value="${model.brandIcon }" class="required"/>
			</p>

			<%--<p>
				<label>上传图片：</label>
				<dd>
				<input id="testFileInput" type="file" name="image"
					uploaderOption="{
						swf:'${path }/js/dwz-ria-1.5.0/uploadify/scripts/uploadify.swf',
						uploader:'${path }/admin/images/upload.json',
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
				<div id="previewPic">
					<c:if test="not empty model.brandIcon">
						<img id="coverImagePerview" src="${model.brandIcon }" width="100" height="100"/>
					</c:if>

				</div>
				</dd>
				<input type="hidden" id="imgUrl" name="imgUrl" value="${model.brandIcon }" />
			</p>--%>
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
