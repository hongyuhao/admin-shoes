<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
function processBack(response){
	alertMsg.correct(response.message);
	 $.pdialog.closeCurrent();
	 navTab.reload("${path }/admin/mall/partnerGoodsInfo", "");
}
function uploadifySuccess(file, data, response) {
	var responseJson = $.parseJSON(data);
	if (typeof (responseJson.result) == "undefined") {
		alert("上传失败");
	} else {
		var pic = responseJson.result.imgPaths[0].original;
		pic = pic.replace(/#/, "g");
		$("#coverImgUrl").val(pic);
		$("#previewPic").html("<img id=\"coverImagePerview\" src='" + pic + "' width=\"100\" height=\"100\"/>");
	}
}

function uploadifyQueueComplete() {

}
</script>
<div class="pageContent">
	<form method="post" action='/admin/mall/partnerGoodsInfo/${null==model?"add":"update"}'
		class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input name="id" type="hidden" size="75" value="${model.id }"/>
		<input type="hidden" value="${goodsBaseInfo.coverImgUrl }" name="goodsImgUrl"/>
		<input type="hidden" value="${goodsBaseInfo.id }" name="goodsId"/>
		<input type="hidden" value="${goodsBaseInfo.id }" name="partnerGoodsId"/>
		
		<input type="hidden" name="rel" value="${rel}"/>
		<div class="pageFormContent" layoutH="57" align="left">
			<p class="nowrap">
            	<label>商品名称：</label>
				<input name="title" type="text"  value="${goodsBaseInfo.title }"/>         
			</p>
			<p class="nowrap">
            	<label>规格/型号：</label>
				<input name="skuName" type="text"  value="${model.skuName }"/>         
			</p>
			<p class="nowrap">
            	<label>市场价：</label>
            	<input name="marketPriceTemp" type="text"  value="${model.marketPrice/100 }" onblur="updatePrice(this,'marketPrice')" />元
				<input name="marketPrice" id="marketPrice" type="hidden"  value="${model.marketPrice }"/>          
			</p>
			
			<p class="nowrap">
            	<label>销售价：</label>
            	<input name="salePriceTemp" type="text"  value="${model.salePrice/100 }" onblur="updatePrice(this,'salePrice')" />元
				<input name="salePrice" id="salePrice" type="hidden"  value="${model.salePrice }"  />
			</p>
			<p class="nowrap">
            	<label>会员价（默认同销售价）：</label>
            	<input name="preferentialPriceTemp" type="text"  value="${model.preferentialPrice/100 }" onblur="updatePrice(this,'preferentialPrice')" />元
				<input name="preferentialPrice" id="preferentialPrice" type="hidden"  value="${model.preferentialPrice }"  />
			</p>
			<p class="nowrap">
            	<label>库存状态：</label>
				<select name="stock" id="stock">
					<option value="">请选择</option>
					<c:forEach var="o" items="${GOODS_PARTNER_STOCK_STATUS_MAP}">
						<option value="${o.key }">${o.value }</option>
					</c:forEach>
				</select>
			</p>
			<p class="nowrap">
            	<label>说明书：</label>
				<textarea name="specification" id="specification" rows="8" cols="80">${model.specification }</textarea>
			</p>
			<p class="nowrap">
            	<label>购买链接：</label>
            	<input name="linkUrl" type="text"  value="${model.linkUrl }" size="100"/>(为空表示在蛙鸣商城购买)
			</p>
			<p class="nowrap">
            	<label>设备类型：</label>
            	<input name="detail" type="text"  value="${model.detail }" size="100"/>
			</p>
			<p class="nowrap">
           	    <label>合作平台：</label>
          	    <select name="partnerId" id="partnerId">
					<option value="">请选择</option>
					<c:forEach var="o" items="${PARTNER_INFO_MAP}">
						<option value="${o.key }">${o.value }</option>
					</c:forEach>
				</select>
		    </p>
		    
		</div>
		<script type="text/javascript">
			$("#stock").val("${model.stock}");
			$("#partnerId").val("${model.partnerId}");
		</script>
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
<script type="text/javascript">  
    $(document).ready(function(){  
        //初始化xhEditor编辑器插件  
        $('#specification').xheditor({  
        	tools:'full',  
            skin:'default',  
            upMultiple:true,  
            upImgUrl: "/admin/mall/images/xh/upload.json",
            upImgExt: "jpg,jpeg,gif,bmp,png",  
            onUpload:insertUpload1,  
            html5Upload:false  
        });  
      	//xbhEditor编辑器图片上传回调函数  
        function insertUpload1(msg) {  
            var _msg = msg.toString();  
            $("#specification").append(_msg);  
        }
    });
	function updatePrice(object,id){
		var _this = $(object);
		$("#"+id).val(_this.val() * 100);
	}
</script>