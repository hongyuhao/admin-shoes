<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp" %>
<script type="text/javascript">
function processBack(response){
	alertMsg.correct(response.message);
	 $.pdialog.closeCurrent();
	 navTab.reload("${path }/admin/ucenter/user/feedback", "");
}
</script>
<div class="pageContent">
	<form method="post" action='/admin/ucenter/user/feedback/update.json' class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<div class="pageFormContent" layoutH="56">
			<table>
				<input type="hidden" name="id" value="${model.id }"/>
				<tr class="nowrap">
					<td>
						<label>姓名:</label>
					</td>
					<td>
						${model.userName }
					</td>
				</tr>
				<tr class="nowrap">
					<td>
						<label>性别:</label>
					</td>
					<td>
						${sexMap[model.sex] }
					</td>
				</tr>
				<tr class="nowrap">
					<td>
						<label>投诉内容:</label>
					</td>
					<td>
						<textarea rows="15" cols="80" readonly="readonly">${model.content }</textarea>
					</td>
				</tr>
				<tr class="nowrap">
					<td>
						<label>创建时间:</label>
					</td>
					<td>
						<fmt:formatDate value="${model.createTime }" pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
				</tr>
				<tr class="nowrap">
					<td>
						<label>处理结果:</label>
					</td>
					<td>
						<textarea name="result" rows="5" cols="80" required="required">${model.result }</textarea>
					</td>
				</tr>
				<tr class="nowrap">
					<td>
						<label>处理状态:</label>
					</td>
					<td>
						<select id="status" name="status" required="required">
							<c:forEach var="feedbackStatus" items="${feedbackStatusMap}">
								<option value="${feedbackStatus.key }">${feedbackStatus.value }</option>
							</c:forEach>
						</select>
						<script type="text/javascript">
							$("#status").val("${model.status}");
						</script>
					</td>
				</tr>
			</table>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>

