<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="/admin/datacenter/wechatSubscribeMsg">
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pageTurn.page?1:pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${numPerPage }" />
	<input type="hidden" value="${eqId}" name="eqId" />
	<input type="hidden" value="${eqType}" name="eqType" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="/admin/datacenter/wechatSubscribeMsg" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					ID: <input type="text" value="${eqId}" name="eqId"></input>
				</td>
				<%-- <td>
					类型: <select name="eqType">
					<option value="text" <c:if test ="${eqType == 'text' }">selected="selected" </c:if>>文字</option>
					<option value="news" <c:if test ="${eqType == 'news' }">selected="selected" </c:if>>图文</option>
					</select>
				</td> --%>
				<td>
					<div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div>
				</td>
			</tr>
		</table>
	</div>
	</form>

</div>
<div class="pageContent">
	<table class="list" width="1200" layoutH="100">
		<thead>
			<tr>
				<th>ID<label style="float:left"><input type="checkbox" class="checkboxCtrl" group="inIdList" /></label></th>
				<th>类型</th>
				<th>内容</th>
				<th>状态</th>
				<th width="10">查找带回</th>
			</tr>
		</thead>
		<tbody>
				<c:choose>
					<c:when test="${null==replyInfos||replyInfos.isEmpty()}">
						<tr class="tatr2">
							<td colspan="11" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="o" items="${replyInfos}">
							<tr target="id" rel="${o.id}">
							<td>${o.id}</td>
								<td><c:if test="${o.type == 'text' }">文字</c:if><c:if test="${o.type == 'news' }">图文</c:if></td>
								<td>${o.content}</td>
								<td><c:if test="${o.status == 1 }">使用中</c:if><c:if test="${o.status == 0 }">停用</c:if></td>
								<td><a class="btnSelect" href="javascript:$.bringBack({subReplyId:'${o.id}'})" title="查找带回">选择</a></td>
								
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	<div style="clear:both"></div>
    <div class="panelBar">
        <%@ include file="/inc/admin_pagination.jsp" %>
    </div>


<%-- <div class="pageContent">
<div class="pageFormContent" layoutH="57" align="left">
<p class="nowrap"><h3><label>首次关注回复</label></h3></p>
<p class="nowrap"><label>回复类型:</label> <select class="required" id="type">
	<option value="text">文字</option>
	<option value="news">图文</option>
	</select></p>
<p class="nowrap"><div class="buttonActive"> <div class="buttonContent"><button type="button" onclick="addContect()">添加内容</button></div></div></p>
<p style="display: none;"><a id="contectA" class="btnLook" href="${path}/admin/datacenter/wechatSubscribeMsg/textMsg" lookupGroup=""></a></p>
<p  class="nowrap"><c:if test="${ replyInfo != null}">
<p><label>当前回复内容</label></p><p></p>
<p><label>类型：</label><label><input readonly="readonly" value="<c:if test="${replyInfo.type=='text' }">文字</c:if><c:if test="${replyInfo.type=='news' }">图文</c:if>">
</label></p><p></p>
<p><label>内容：</label><label><textarea readonly="readonly" id="content" name="content" rows="8" cols="60">${replyInfo.content }</textarea></label></p></c:if></p>
<p  class="nowrap"><c:if test="${ replyInfo == null}"><label>暂无回复内容</label></c:if></p>

<p class="nowrap" style="margin-top: 100px"><label>发送预览</label></p>
<p class="nowrap"><label>openId:</label><input type="text" name="openId" id="openId" > </p>
<p class="nowrap"><div class="buttonActive"> <div class="buttonContent"><button type="button" onclick="send()">发送</button></div></div></p>

</div>

</div>
<script type="text/javascript"> 

function addContect(){
	var type=$("#type").val();
	if(type == 'text'){
		$("#contectA").attr('href','${path}/admin/datacenter/wechatSubscribeMsg/textMsg');
		$("#contectA").click();
	}else if(type == 'image'){
		$("#contectA").attr('href','${path}/admin/datacenter/wechatSubscribeMsg/imageMsg'); 
		$("#contectA").click();
	}else if(type == 'news'){
		$("#contectA").attr('href','${path}/admin/datacenter/wechatSubscribeMsg/newsMsg'); 
		$("#contectA").click();
	}
	
}

function send(){
	var openId = $("#openId").val();
	$.ajax({
		type:'post',
		dataType:'json',
		url:'',
		data:{'openId':openId},
		success:function(data){
			
		},
		error:function(data){
			
		}
	});
}
</script> --%>