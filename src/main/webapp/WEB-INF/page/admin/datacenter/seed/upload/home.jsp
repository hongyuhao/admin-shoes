<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
	function uploadifySuccess(file, data, response) {
		var responseJson = $.parseJSON(data);
		if (typeof (responseJson.code) == 1) {
			alert("上传成功O(∩_∩)O"); 
		} /* else {
			var pic = responseJson.result.imgPaths[0].original;
			pic = pic.replace(/#/, "g");
			
			$("#previewPic")
					.append(
							"<hr /><br/>"+"<h2 color=\"red\">"+pic+"</h2>"+
							"<a href='"+pic+"' target=\"_blank\"><img id=\"coverImagePerview\" src='" + pic + "' width=\"100\" height=\"100\"/></a><br/>"
							); 
			//alert("上传成功O(∩_∩)O"); 
		} */
	}
 
	function uploadifyQueueComplete() {

	}

	 function processBack(response) {
		alertMsg.correct(response.message);
		//$.pdialog.closeCurrent();
		//navTab.reload("${path }/admin/datacenter/taskInfo", "");
	} 
</script>

<div class="pageContent">
	<form method="post" action="${action }" class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		
		<div class="pageFormContent nowrap" layoutH="57" >
			
			<dl>
				<dt>
					<label>上传excel文件：</label>
				</dt>
				<dd>
					<input id="testFileInput" type="file" name="excelFile"
						uploaderOption="{
							swf:'${path }/js/dwz-ria-1.5.0/uploadify/scripts/uploadify.swf',
							uploader:'${path }/admin/datacenter/seedUserEquipmentCollectRecord/seed/upload.json',
							formData:{},
							buttonText:'请选择文件',
							auto:true,
							multi:false,
							onUploadSuccess:uploadifySuccess,
							onQueueComplete:uploadifyQueueComplete
						}" />
					<br/>
				</dd>
				
				
			</dl>
			
		</div>
		
	</form>
</div>
