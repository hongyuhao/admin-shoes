<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
function processBack(response){
	if (response.statusCode == DWZ.statusCode.ok){
		alertMsg.correct(response.message);
		 $.pdialog.closeCurrent();
		 navTab.reload("${path }/admin/datacenter/wechatSubscribeMsg", "");
	} else {
		alertMsg.error(response.message);
		return false;
	}
	
}

</script>
<div class="pageContent">
	<form id="myForm" method="post" action="${path}/admin/datacenter/wechatSubscribeMsg/${not empty id ? "updateNewsMsg" :"saveNewsMsg"}"
	class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input type="hidden" name="id" value="${id }">
		<div class="pageFormContent" layoutH="57" align="left">
		<c:if test="${not empty id}">
		<c:forEach var="o" items="${model}" varStatus="i">
		<div id="addNewsP${i.index+1}">
		<p class="nowrap">
		<label><c:if test="${i.index == 0}">大图文：</c:if>
		<c:if test="${i.index != 0}">图文${i.index+1 }：</c:if>
		</label>
		</p>
			<p class="nowrap">
				<label>标题：</label>
				<input type="text" name="title" id="title" value="${o.title }">
			</p>
			<p class="nowrap">
				<label>描述：</label>
				<input type="text" name="description" id="description" value="${o.description}">
			</p>
			
			<p class="nowrap">
				<label>链接：</label>
				<input type="text" name="url" id="url" value="${o.url}">
			</p>
			<p class="nowrap" id="addNewsP1">
				<label>图片链接：</label>
				<input type="text" name="picurl" id="picurl" value="${o.picurl}">
			</p>
			</div>
			</c:forEach>
			</c:if>
			<c:if test="${empty id}">
			<p class="nowrap">
					<label>大图文：</label>
				</p>
				<p class="nowrap">
					<label>标题：</label>
					<input type="text" name="title" id="title">
				</p>
				<p class="nowrap">
					<label>描述：</label>
					<input type="text" name="description" id="description">
				</p>
			
				<p class="nowrap">
					<label>链接：</label>
					<input type="text" name="url" id="url">
				</p>
				<p class="nowrap" id="addNewsP1">
					<label>图片链接：</label>
					<input type="text" name="picurl" id="picurl">
				</p>
			</c:if>
			<p id="addNewsP" class="nowrap"><div class="button"><div class="buttonContent"><button type="button" onclick="addNews()">添加图文</button></div></div>
			<div class="button" style="margin-left: 10px"><div class="buttonContent"><button type="button" onclick="delNews()">删除图文</button></div></div>
			</p>
			</div>
			<div class="formBar">
			<ul>
				<li>
					<div class="buttonActive"><div class="buttonContent"><button type="submit" >保存</button></div></div>
				</li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">返回</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>
<script type="text/javascript"> 
var index = parseInt('${length}');
function addNews(){
	var subscript =1+ index;
	if(subscript < 9){
	$("#addNewsP"+index).after("<div id='addNewsP"+subscript+"'><p class='nowrap'><label>小图文：</label></p><p class='nowrap'>"+
					"<label>标题：</label><input type='text' name='title' id='title'></p><p class='nowrap'>"+
					"<label>描述：</label><input type='text' name='description' id='description'></p>"+
					"<p class='nowrap'><label>链接：</label><input type='text' name='url' id='url'></p>"+
					"<p class='nowrap' ><label>图片链接：</label><input type='text' name='picurl' id='picurl'></p></div>")
					index = subscript;
	}else{
		alert("最多只能添加8条图文");
	}
}
function delNews(){
	if(index == 1 ){
		alert("已经是第一条了");
	}else{
		$("#addNewsP"+index).remove();
		index--;
	}
}
</script>