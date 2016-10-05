<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
function processBack(response){
	alertMsg.correct(response.message);
	$.pdialog.closeCurrent();
	navTab.reload("${path }/admin/mall/goodsCategoryRelation", "");
}
</script>
<div class="pageContent">	
	<form method="post" action="${path }/admin/mall/goodsCategoryRelation/add"
		 class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<div class="pageFormContent" layoutH="57" align="left">
			<input name="goodsId" type="hidden" value="${goodsBaseInfo.id}"/>
			<p class="nowrap">
	           	<label>药品名称：</label>${goodsBaseInfo.title }[${goodsBaseInfo.id }]       
			</p>
			<p class="nowrap">
	           	<label>治疗疾病：</label>${goodsBaseInfo.diseaseTag }       
			</p>
			<p class="nowrap">
	           	<label>分类名：</label>
				<input class="required" name="categoryName" type="text" suggestFields="categoryName" value=""/>    
				<input type="hidden" name="categoryId" value="" suggestFields="categoryId"  lookupGroup="" readonly="true" class="required digits textInput valid"/>
				<a class="btnLook" href="${path }/admin/mall/categoryBaseInfo/?type=lookup" lookupGroup="">查找带回</a>
			</p>
		</div>
		<div class="formBar">
			<ul>
			<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">返回</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>