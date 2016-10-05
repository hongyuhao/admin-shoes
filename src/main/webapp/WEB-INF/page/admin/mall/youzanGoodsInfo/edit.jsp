<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
function processBack(response){
	alertMsg.correct(response.message);
	 $.pdialog.closeCurrent();
	 navTab.reload("${path }/admin/mall/youzanGoodsInfo", "");
}
</script>
<div class="pageContent">
	<form method="post" action="/admin/mall/youzanGoodsInfo/${not empty model.id ? "update" :"add"}"
		 class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input name="id" type="hidden" size="75" value="${model.id }"/>
		<input type="hidden" name="rel" value="${rel}"/>
		<div class="pageFormContent" layoutH="57" align="left">
			<p class="nowrap">
            	<label>商品：</label>
				<input class="required" name="goodsName" type="text" readonly="readonly"
					suggestFields="goodsName" lookupGroup="" value="${model.goodsName}"/>
				<input name="goodsId" type="hidden" suggestFields="goodsId" 
					lookupGroup="" value="${model.goodsId}">
				<input name="partnerId" type="hidden" value="${model.partnerId }" />  
				<input name="partnerUrl" type="hidden" value="${model.partnerUrl }" />  
				<input name="salePrice" type="hidden" value="${model.salePrice }" />  
				<input name="partnerGoodsId" type="hidden" value="${model.partnerGoodsId }" />  
				<a class="btnLook" href="${path}/admin/mall/partnerGoodsInfo/list?isLookup=1&rel=partnerGoodsInfoList" lookupGroup="">请选择</a>
			</p>
			<p class="nowrap">
            	<label>有赞链接：</label>
				<input name="youzanUrl" type="text" value="${model.youzanUrl }" />            
			</p>
			<p class="nowrap">
            	<label>是否生成商品外链：</label>
            	<input type="checkbox" name="isGeneralUrl" value="1" checked="checked" />
<%-- 				<input name="redirectUrl" type="text" value="${model.redirectUrl }"/>     --%>
			</p>
<!-- 			<p class="nowrap"> -->
<!-- 				<label>商品封面图片：</label> -->
<%-- 				<img src="${model.coverImgUrl} width="60" height="60"> --%>
				<input name="coverImgUrl" type="hidden" value="${model.coverImgUrl }"/>
<!-- 			</p> -->
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
