<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
	function uploadifySuccess(file, data, response) {
		var json = eval('(' + data + ')');
		if (json.code == 1) {
			alertMsg.correct("上传成功"); 
		} else {
			alert(json.msg);
		}
	}
 
	function uploadifyQueueComplete() {

	}

	 function processBack(response) {
		alertMsg.correct(response.message);
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
					<input id="redpackDeviceUploader" type="file" name="excelFile"
						uploaderOption="{
							swf:'${path }/js/dwz-ria-1.5.0/uploadify/scripts/uploadify.swf',
							uploader:'${path }/admin/datacenter/activityCodeInfo/uploadExcel.json',
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
