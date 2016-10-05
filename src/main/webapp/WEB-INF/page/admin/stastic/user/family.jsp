<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
function processBack(response){
	alertMsg.correct(response.message);
	 $.pdialog.closeCurrent();
	 navTab.reload("${path }/user/stastic/user/attention/family", "");
}
</script>

<div class="pageContent">
	<div class="panelBar">
		<!-- <ul class="toolBar">
			<li><a class="add" href="/admin/stastic/userObtainInfo/edit" target="dialog" rel="editTag" mask="true" title="新增" width="620" height="500"><span>新增</span></a></li>
			<li><a class="delete" href="/admin/stastic/userObtainInfo/delete" target="selectedTodo" rel="inIdList" title="确定删除?"><span>删除</span></a></li>
		</ul> -->
	</div>
	<table width="100%" layoutH="100" >
		<thead>
			<tr>
				<td >家主 </td>
				<td align="center"><a href="${path}/user/stastic/user/attention/family?userId=${userId}&imgUrl=${imgUrl }&name=${name}"><img src ="${imgUrl}" width="100" height="100"></img></a></td>
				<td colspan="10">${name }</td> 
			</tr>
			<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
		</thead>
		<tbody>
				<c:choose>
					<c:when test="${null==userAttentionList||userAttentionList.isEmpty()}">
						<tr class="tatr2">
							<td colspan="11" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="userAttention" items="${userAttentionList}" varStatus="status">
							<c:if test="${(status.index+1) ==1 }">
								<td>成员 </td>
								<td align="center">
									<a target="dialog" href="${path}/user/stastic/user/attention/family?userId=${userAttention.followedUserId}&imgUrl=${userAttention.headImgUrl }&name=${userAttention.nickName}">
										<img src = "${userAttention.headImgUrl }" width="100" height="100"></img>
									</a>
								</td>
								<td>${userAttention.nickName}</td>
							</c:if>
							<c:if test="${(status.index+1) !=1 }">
								<td></td>
								<td align="center">
									<a target="dialog" href="${path}/user/stastic/user/attention/family?userId=${userAttention.followedUserId}&imgUrl=${userAttention.headImgUrl }&name=${userAttention.nickName}">
										<img src = "${userAttention.headImgUrl }" width="100" height="100"></img>
									</a>
								</td>
								<td>${userAttention.nickName}</td>
							</c:if>
								
							<c:if test="${(status.index+1)%4 ==0 }">
							<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
							</c:if>
						</c:forEach>
					</c:otherwise>
				</c:choose>
		</tbody>
		</table>
		<div class="formBar">
			<ul>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">返回</button></div></div>
				</li>
			</ul>
		</div>
</div>
