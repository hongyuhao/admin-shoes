<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
	function uploadifySuccess(file, data, response) {
		var responseJson = $.parseJSON(data);
		if(typeof(responseJson.result) == "undefined"){
			alert("上传失败");
		}
		else{
			var pic = responseJson.result.imgPaths[0].original;
			pic=pic.replace(/#/, "g");
			$("#url").val(pic);
			$("#previewPic").html("<img id=\"coverImagePerview\" src='" + pic + "' width=\"100\" height=\"100\"/>");
		}
	}
	
	function uploadifyQueueComplete(){
		
	}
	
	function resHandler(response) {
		alertMsg.correct(response.message);
		navTab.reload("${path}/admin/ucenter/subFlowInfo", "");
		$.pdialog.closeCurrent();
	}
</script>
<div class="pageContent">
	<form method="post" action="${path }/admin/ucenter/subFlowInfo/${not empty model.id ? "update.json" :"add.json"}"
		class="pageForm required-validate" enctype="multipart/form-data"
		onsubmit="return iframeCallback(this, resHandler);">
		<input name="id" type="hidden" value="${model.id }" />
		<div class="pageFormContent nowrap" layoutH="57">
			<dl>
				<dt>
					<label>子线名称：</label>
				</dt>
				<dd>
					<input name="subFlowName" type="text" size="20" value="${model.subFlowName }"
						class="required" />
				</dd>
			</dl>
			<dl>
				<dt>
					<label>开始时间：</label>
				</dt>
				<dd>
					<input type="text" name="startTime" id="startTime" 
					class="date required" 
					value='<fmt:formatDate value="${model.startTime }" pattern="yyyy-MM-dd HH:mm:ss" />' 
					dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true" style="float:left;"/>
					<a class="inputDateButton" href="javascript:;" style="float:left;">选择</a>
				</dd>
			</dl>
			<dl>
				<dt>
					<label>结束时间：</label>
				</dt>
				<dd>
					<input type="text" name="endTime" id="endTime" 
					class="date required" 
					value='<fmt:formatDate value="${model.endTime }" pattern="yyyy-MM-dd HH:mm:ss" />' 
					dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true" style="float:left;"/>
					<a class="inputDateButton" href="javascript:;" style="float:left;">选择</a>
				</dd>
			</dl>
			<dl>
				<dt>
					<label>图标：</label>
				</dt>
				<dd>
					<%/*用法 参考：http://j-ui.com/w_uploadify.html*/ %>
					<input id="testFileInput" type="file" name="image" 
						uploaderOption="{
							swf:'${path }/js/dwz-ria-1.5.0/uploadify/scripts/uploadify.swf',
							uploader:'${path }/admin/ucenter/images/upload.json',
							formData:{},
							buttonText:'请选择文件',
							fileSizeLimit:'200KB',
							fileTypeDesc:'*.jpg;*.jpeg;*.gif;*.png;',
							fileTypeExts:'*.jpg;*.jpeg;*.gif;*.png;',
							auto:true,
							multi:true,
							onUploadSuccess:uploadifySuccess,
							onQueueComplete:uploadifyQueueComplete
						}"
					/>
					<input type="hidden" readonly="readonly" name="url" id="url"
						value="${model.url }" />
					<div id="previewPic">
						<c:if test="${not empty model.url }">
							<img id="coverImagePerview" src="${model.url}" width="100" height="100" />
						</c:if>
					</div>
				</dd>
			</dl>
			<dl>
				<dt>
					<label>备注：</label>
				</dt>
				<dd>
					<div class="unit">
					<textarea name="remark" rows="12" cols="60" tools="Source,About">${model.remark }</textarea>
					</div>
				</dd>
			</dl>
			<dl>
				<dt>
					<label>适用用户等级：</label>
				</dt>
				<dd>	
					<select id="levelId" name="levelId">
						<c:forEach var="object" items="${userTypeMap}">
							<option value="${object.key }">${object.value }</option>
						</c:forEach>
					</select>
					<script type="text/javascript">
						$("#levelId").val("${model.levelId}");
					</script>
				</dd>
			</dl>
			<dl>
				<dt>
					<label>适用平台：</label>
				</dt>
				<dd>	
					<select id="applicablePlatformId" name="applicablePlatformId">
						<c:forEach var="object" items="${applicablePlatformMap}">
							<option value="${object.key }">${object.value }</option>
						</c:forEach>
					</select>
					<script type="text/javascript">
						$("#applicablePlatformId").val("${model.applicablePlatformId}");
					</script>
				</dd>
			</dl>
			
			<dl>
				<dt>
					<label>适用渠道：</label>
				</dt>
				<dd>	
					<select id="expandCode" name="expandCode">
						<c:forEach var="object" items="${expandCodeEnumTypeMap}">
							<option value="${object.key }">${object.value }</option>
						</c:forEach>
					</select>
					<script type="text/javascript">
						$("#expandCode").val("${model.expandCode}");
					</script>
				</dd>
			</dl>
			<dl>
				<dt>
					<label>赠送积分：</label>
				</dt>
				<dd>
					<input name="givePoint" type="text" value="${model.givePoint }" />
				</dd>
			</dl>
			<dl>
				<dt>
					<label>赠送金额：</label>
				</dt>
				<dd>
					<input name="giveMoney" type="text" value="${model.giveMoney }" />
				</dd>
			</dl>
			<dl>
				<dt>
					<label>赠送优惠券：</label>
				</dt>
				<dd>
					<input class="digits " name="giveCardId" id="giveCardId"
						type="hidden" suggestFields="giveCardId"
						value="${model.giveCardId }" lookupGroup="" /> 
						<input name="giveCardName" id="giveCardName" type="text"
						suggestFields="giveCardName" value="${model.giveCardName }"
						lookupGroup="" readonly="true"/> <a class="btnLook"
						href="/admin/ucenter/taskInfo/promotionList?sendCardType=2&showType=2"
						lookupgroup="">查找带回</a>
				</dd>
			</dl>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="submit">保存</button>
						</div>
					</div></li>
				<li>
					<div class="button">
						<div class="buttonContent">
							<button type="button" class="close">取消</button>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</form>
</div>
