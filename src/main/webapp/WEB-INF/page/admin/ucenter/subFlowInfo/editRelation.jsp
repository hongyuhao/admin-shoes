<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
	function resHandler(response) {
		alertMsg.correct(response.message);
		navTab.reload("${path}/admin/ucenter/subFlowInfo/listRelation.do?eqTotalFlowId=${model.id}&rel=${rel}", "");
		$.pdialog.closeCurrent();
	}
</script>
<div class="pageContent">
	<form method="post" action="${path }/admin/ucenter/subFlowInfo/addRelation.json"
		class="pageForm required-validate"
		onsubmit="return iframeCallback(this, resHandler);">
		<input name="totalFlowId" type="hidden" value="${model.id }" />
		<input type="hidden" name="rel" value="${rel}" />
		<div class="pageFormContent nowrap" layoutH="57">
			<dl>
				<dt>
					<label>子线名称：</label>
				</dt>
				<dd>
					<input name="subFlowId" type="hidden">
					<input name="subFlowName" type="text"/>
					<a class="btnLook" 
					href="/admin/ucenter/subFlowInfo?isLookup=1&rel=${rel }&itStartTime=<fmt:formatDate value="${model.startTime }" pattern="yyyy-MM-dd" />&gtEndTime=<fmt:formatDate value="${model.endTime }" pattern="yyyy-MM-dd" />&eqExpandCode=${model.expandCode }&eqApplicablePlatformId=${model.applicablePlatformId }&eqLevelId=${model.levelId }" lookupGroup="">查找带回</a>
				</dd>
			</dl>
			<dl>
				<dt>
					<label>序号：</label>
				</dt>
				<dd>
					<input name="sequence" value="" type="text" class="required">
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
