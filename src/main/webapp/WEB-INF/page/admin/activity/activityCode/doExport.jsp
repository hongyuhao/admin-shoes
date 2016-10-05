<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
</script>
<div class="pageContent">
	<form method="post" action="/admin/activity/activityCode/export">
	<input type="hidden" name="ids" value="${ids} "/>
		<div class="pageFormContent" layoutH="57" align="left">
		<div class="formBar">
		<p class="nowrap">
				<label>编码前缀：</label>
				<input name="prifix" value="" />
			</p>
			<ul>
			<li><div class="buttonActive"><div class="buttonContent"><button type="submit">生成为Excel</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">返回</button></div></div>
				</li>
			</ul>
		</div>
		</div>				
	</form>
</div>
