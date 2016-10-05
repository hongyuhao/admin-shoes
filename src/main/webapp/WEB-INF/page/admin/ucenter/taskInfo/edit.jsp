<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
	function uploadifySuccess(file, data, response) {
		var responseJson = $.parseJSON(data);
		if (typeof (responseJson.result) == "undefined") {
			alert("上传失败");
		} else {
			var pic = responseJson.result.imgPaths[0].original;
			pic = pic.replace(/#/, "g");
			$("#url").val(pic);
			$("#previewPic")
					.html(
							"<img id=\"coverImagePerview\" src='" + pic + "' width=\"100\" height=\"100\"/>");
		}
	}

	function uploadifyQueueComplete() {

	}

	function processBack(response) {
		alertMsg.correct(response.message);
		$.pdialog.closeCurrent();
		navTab.reload("${path }/admin/ucenter/taskInfo", "");
	}
</script>
<c:choose>
	<c:when test="${model.id==0 ||empty model.id}">
		<c:set var="action" value="${path }/admin/ucenter/taskInfo/add.do"></c:set>
	</c:when>
	<c:otherwise>
		<c:set var="action" value="${path }/admin/ucenter/taskInfo/update.do"></c:set>
	</c:otherwise>
</c:choose>
<div class="pageContent">
	<form method="post" action="${action }" class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input name="id" type="hidden" size="75" value="${model.id }" /> 
		<input type="hidden" name="rel" value="${rel}" />
		<div class="pageFormContent nowrap" layoutH="57" >
			<dl>
				<dt>
					<label>任务类型：</label>
				</dt>
				<dd>
					<select id="taskType" name="taskType">
						<c:forEach var="taskTypeMap" items="${taskTypeMap}">
							<option value="${taskTypeMap.key }">${taskTypeMap.value }</option>
						</c:forEach>
					</select>
					<script type="text/javascript">
						$("#taskType").val("${model.taskType}");
					</script>
				</dd>
			</dl>
			<dl>
				<dt>
					<label>任务状态：</label>
				</dt>
				<dd>
					<select id="status" name="status">
						<c:forEach var="taskActionStatusMap" items="${taskActionStatusMap}">
							<option value="${taskActionStatusMap.key }">${taskActionStatusMap.value }</option>
						</c:forEach>
					</select>
					<script type="text/javascript">
						$("#status").val("${model.status}");
					</script>
				</dd>
			</dl>
			<dl>
				<dt>
					<label>任务是否显示：</label>
				</dt>
				<dd>
					<select id="showStatus" name="showStatus">
						<c:forEach var="taskActionShowStatusMap" items="${taskActionShowStatusMap}">
							<option value="${taskActionShowStatusMap.key }">${taskActionShowStatusMap.value }</option>
						</c:forEach>
					</select>
					<script type="text/javascript">
						$("#showStatus").val("${model.showStatus}");
					</script>
				</dd>
			</dl>
			<dl>
				<dt>
					<label>动作：</label>
				</dt>
				<!-- 只显示已启用的动作或者是之前已选择的动作 -->
				<dd>
					<select id="actionType" name="actionType">
						<c:forEach var="actionList" items="${actionList}">
							<c:if test="${actionList.status == 2 || actionList.actionType == model.actionType}">
								<option value="${actionList.actionType }">${actionList.actionName }</option>
							</c:if>
						</c:forEach>
					</select>
					<script type="text/javascript">
						$("#actionType").val("${model.actionType}");
					</script>
				</dd>
			</dl>
			<dl>
				<dt>
					<label>完成次数：</label>
				</dt>
				<dd>
					<input name="completeNum" id="completeNum" type="text" value="${model.completeNum }" min="1" class="required digits textInput valid"/>
				</dd>
			</dl>
			<dl>
				<dt>
					<label>完成金额：</label>
				</dt>
				<dd>
					<input name="completeMoney" type="text"
						value="${model.completeMoney }" class="required"/>
				</dd>
			</dl>
			<dl>
				<dt>
					<label>周期：</label>
				</dt>
				<dd>
					<select id="cycle" name="cycle" disabled="true" class="disabled required" >
						<c:forEach var="taskCycleMap" items="${taskCycleMap}">
							<option value="${taskCycleMap.key }">${taskCycleMap.value }</option>
						</c:forEach>
					</select>
					<script type="text/javascript">
						$("#cycle").val("${model.cycle}");
					</script>
				</dd>
			</dl>
			<dl>
				<dt>
					<label>周期内最多次数：</label>
				</dt>
				<dd>
					<input disabled="true" id="numberUpperLimit" name="numberUpperLimit" type="text"
						value="${model.numberUpperLimit }" class="disabled digits textInput valid required" min="1"/>
				</dd>
			</dl>
			<dl>
				<dt>
					<label>连续天数：</label>
				</dt>
				<dd>
					<input id="days" name="days" type="text"
						value="${model.days }" class="digits textInput valid required" min="1"/>
				</dd>
			</dl>
			<dl>
				<dt>
					<label>任务url：</label>
				</dt>
				<dd>
					<input name="taskUrl" type="text" value="${model.taskUrl }" />
				</dd>
			</dl>
			<dl>
				<dt>
					<label>图标url：</label>
				</dt>
				<dd>
					<%-- 				<input name="url" type="text"  value="${model.url }"  /> --%>
					<%
						/*用法 参考：http://j-ui.com/w_uploadify.html*/
					%>
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
						}" />
					<input type="hidden" readonly="readonly" name="url" id="url"
						value="${model.url }" />
					<div id="previewPic">
						<c:if test="${not empty model.url }">
							<img id="coverImagePerview" src="${model.url}" width="100"
								height="100" />
						</c:if>
					</div>
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
					<input class="digits " name="giveCardId" id="giveCardId" type="hidden" suggestFields="giveCardId"
						value="${model.giveCardId }" lookupGroup="" />
					<input class="digits " name="cardType" id="cardType" type="hidden" suggestFields="cardType"
						value="${model.cardType }" lookupGroup="" />
					<input class="text" name="wxCardId" id="wxCardId" type="hidden" suggestFields="wxCardId"
						value="${model.wxCardId }" lookupGroup="" />
						<input name="giveCardName" id="giveCardName" type="text"
						suggestFields="giveCardName" value="${model.giveCardName }"
						lookupGroup="" readonly="true"/> <a class="btnLook"
						href="/admin/ucenter/taskInfo/promotionList?sendCardType=2&showType=2"
						lookupgroup="">查找带回</a>
				</dd>
			</dl>
			<dl>
				<dt>
					<label>赠送微信红包：</label>
				</dt>
				<dd>
					<input class="digits " name="giveRedPacketId" id="giveRedPacketId" type="hidden" suggestFields="giveRedPacketId"
						value="${model.giveRedPacketId }" lookupGroup="" />
					<input name="giveRedPacketName" id="giveRedPacketName" type="text"
						suggestFields="giveRedPacketName" value="${model.giveRedPacketName }"
						lookupGroup="" readonly="true"/> <a class="btnLook"
						href="/admin/ucenter/taskInfo/redPackList"
						lookupgroup="">查找带回</a>
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
					<label>适用开发平台：</label>
				</dt>
				<dd>	
					<select id="openPlatformId" name="openPlatformId">
						<c:forEach var="object" items="${openPlatformMap}">
							<option value="${object.key }">${object.value }</option>
						</c:forEach>
					</select>
					<script type="text/javascript">
						$("#openPlatformId").val("${model.openPlatformId}");
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
					<label>领取类型：</label>
				</dt>
				<dd>	
					<select id="getType" name="getType">
						<c:forEach var="object" items="${taskGetTypeMap}">
							<option value="${object.key }">${object.value }</option>
						</c:forEach>
					</select>
					<script type="text/javascript">
						$("#getType").val("${model.getType}");
					</script>
				</dd>
			</dl>
			<dl>
				<dt>
					<label>领取策略：</label>
				</dt>
				<dd>	
					<select id="getStrategy" name="getStrategy">
						<c:forEach var="object" items="${taskGetStrategyMap}">
							<option value="${object.key }">${object.value }</option>
						</c:forEach>
					</select>
					<script type="text/javascript">
						$("#getStrategy").val("${model.getStrategy}");
					</script>
				</dd>
			</dl>
			<dl>
				<dt>
					<label>领取总量：</label>
				</dt>
				<dd>
					<input name="getSum" type="text" value="${model.getSum }" />
				</dd>
			</dl>
			<dl>
				<dt>
					<label>可领取量：</label>
				</dt>
				<dd>
					<input name="getNum" type="text" value="${model.getNum }" />
				</dd>
			</dl>
			<dl>
				<dt>
					<label>标题：</label>
				</dt>
				<dd>
					<input name="title" type="text" value="${model.title }" class="required"/>
				</dd>
			</dl>
			<dl>
				<dt>
					<label>备注：</label>
				</dt>
				<dd>
					<input name="remark" type="text" value="${model.remark }" class="required"/>
				</dd>
			</dl>
			<dl>
				<dt>
					<label>消息模板：</label>
				</dt>
				<dd>
					<input name="messageTemplate" type="text" value="${model.messageTemplate }" class="required"/>
				</dd>
			</dl>
			<dl>
				<dt>
					<label>权重：</label>
				</dt>
				<dd>
					<input name="weight" type="text" value="${model.weight }" />
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
							<button type="button" class="close">返回</button>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</form>
</div>
<script type="text/javascript">
	$("#taskType").change(function(){
		cycle(this);
	});
	
	function cycle(obj) {
		if($(obj).val() == '${FLOWTASK}'){
			$("#numberUpperLimit").attr("disabled",true);
			$("#numberUpperLimit").addClass("disabled");
			$("#cycle").attr("disabled",true);
			$("#cycle").addClass("disabled");
		}else{
			$("#numberUpperLimit").attr("disabled",false);
			$("#numberUpperLimit").removeClass("disabled");
			$("#cycle").attr("disabled",false);
			$("#cycle").removeClass("disabled");
		}	
	}
	
	$(function(){
		var obj = $('#taskType');
		cycle(obj);
	});

</script>
