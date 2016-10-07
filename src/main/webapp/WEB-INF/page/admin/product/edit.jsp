<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">

function processBack(response){
	alertMsg.correct(response.message);
	 $.pdialog.closeCurrent();
	 navTab.reload("${path }/admin/product", "");
}
//图片上传==============end==========
</script>
<div class="pageContent">
	<form method="post" action="/admin/product/${not empty model.id ? "update" :"add"}"
		 class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input name="id" type="hidden" size="75" value="${model.id }"/>
		<input type="hidden" name="rel" value="${rel}"/>
		<div class="pageFormContent" layoutH="57" align="left">
			<p class="nowrap">
            	<label>商品标题：</label>
				<input name="title" type="text"  value="${model.title }" class="required"/>
			</p>
			<p class="nowrap">
				<label>商品描述：</label>
				<textarea name="summary" type="text"  value="${model.summary }"/>
			</p>
			<p class="nowrap">
				<label>品牌ID：</label>
				<input name="brandId" type="text"  value="${model.brandId }"/>
			</p>
			<p class="nowrap">
				<label>商品类型：</label>
				<select name="typeId">
					<option value="1" ${model.typeId == 1?'selected':''}>女鞋</option>
					<option value="2" ${model.typeId == 2?'selected':''}>男鞋</option>
					<option value="3" ${model.typeId == 3?'selected':''}>童鞋</option>
				</select>
			</p>
			<p class="nowrap">
				<label>标记为热门商品：</label>
				<select name="hot">
					<option value="1" ${model.hot == 1?'selected':''}>普通</option>
					<option value="2" ${model.hot == 2?'selected':''}>热卖</option>
				</select>
			</p>
			<p class="nowrap">
				<label>商品海报图：</label>
				<input name="mainImg" type="text"  value="${model.mainImg }"/>
			</p>
			<p class="nowrap">
				<label>商品图1：</label>
				<input name="firstImg" type="text"  value="${model.firstImg }"/>
			</p>
			<p class="nowrap">
				<label>商品图2：</label>
				<input name="secondImg" type="text"  value="${model.secondImg }"/>
			</p>
			<p class="nowrap">
				<label>商品图3：</label>
				<input name="thirdImg" type="text"  value="${model.thirdImg }"/>
			</p>
			<p class="nowrap">
				<label>原价：</label>
				<input name="lastPrice" type="text"  value="${model.lastPrice }"/>
			</p>
			<p class="nowrap">
				<label>现价：</label>
				<input name="nowPrice" type="text"  value="${model.nowPrice }"/>
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
