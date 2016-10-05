<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp" %>
<div class="pageContent">
	<form method="post" action='/admin/ucenter/tagBaseInfo/${null==tagBean?"add":"update"}' class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		<div class="pageFormContent" layoutH="56">
			<input type="hidden" name="parentRel" value="${parentRel }"/>
			<c:if test="${null!=tagBean }">
				<p class="nowrap">
					<label>标签号:</label>
					<input type="text" name="id" readonly="readonly" value="${tagBean.id}">
				</p>
			</c:if>
			<p class="nowrap">
				<label>标签名称:</label>
				<input type="text" id="tagName" name="tagName" class="required" ${oper=='view'?'readonly=readonly':'' } value="${tagBean.tagName}">
			</p>
			<p class="nowrap">
				<label>标签类型:</label>
				<input type="text" id="tagType" name="tagType" class="required" ${oper=='view'?'readonly=readonly':'' } min="0" value="${tagBean.tagType}">
			</p>
			<p class="nowrap">
				<label>标签地址:</label>
				<input type="text" id="tagUrl" name="tagUrl" value="${tagBean.tagUrl}" ${oper=='view'?'readonly=readonly':'' }>
			</p>
			<p class="nowrap">
				<label>标签描述:</label>
				<textarea rows="3" cols="19" name="descript" ${oper=='view'?'readonly=readonly':'' }>${tagBean.descript }</textarea>
			</p>
			<c:if test="${null!=tagBean }">
				<p class="nowrap">
					<label>标签权值:</label>
					<input type="text" id="weight" name="weight" readonly="readonly" value="${tagBean.weight}">
				</p>
			</c:if>
		</div>
		<div class="formBar">
			<c:if test="${oper != 'view' }">
				<ul>
					<!--<li><a class="buttonActive" href="javascript:;"><span>保存</span></a></li>-->
					<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
					<li>
						<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
					</li>
				</ul>
			</c:if>
		</div>
	</form>
</div>

