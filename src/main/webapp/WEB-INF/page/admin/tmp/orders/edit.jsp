<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script src="/js/ajaxupload.3.5.js" type="text/javascript"></script>

<script type="text/javascript">
function processBack(response){
	alertMsg.correct(response.message);
	$.pdialog.closeCurrent();
	navTab.reload("${path }/admin/tmp/orders", "");
}
</script>
<div class="pageContent">	
	<form method="post" action="/admin/tmp/orders/update"
		class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input name="id" type="hidden" value="${model.id }"/>
		<input name="orderNum" type="hidden" value="${model.orderNum }"/>
		<input name="uid" type="hidden" value="${model.uid }"/>
		<input name="sessionId" type="hidden" value="${model.sessionId }"/>
		<input name="addressId" type="hidden" value="${model.addressId }"/>
		<input name="total" type="hidden" value="${model.total }"/>
		<input name="status" type="hidden" value="${model.status }"/>
		<input name="expressNum" type="hidden" value="${model.expressNum }"/>
		<input name="createdAt" type="hidden" value="${model.createdAt }"/>
		<input name="buyNum" type="hidden" value="${buyNum }"/>
		<div class="pageFormContent" layoutH="80" align="left">
			<p class="nowrap">
            	<label>订单号：</label>
            	${model.orderNum }
            </p>
            <p class="nowrap">
            	<label>收货人：</label>
            	${addresses.consignee }
            </p>
            <p class="nowrap">
            	<label>手机号码：</label>
            	${addresses.phone }
            </p>
            <p class="nowrap">
            	<label>发货地址：</label>
            	${addresses.province }${addresses.city }${addresses.district }${addresses.detail }
            </p>
            <p class="nowrap">
            	<label>发货数量：</label>
            	${buyNum }
            </p>
            <div class="divider"></div>
            <p class="nowrap">
            	<label>订单商品：</label>
	            	<c:forEach var="o" items="${orderProductsList}">
	            		商品id:[${o.productId }] -- 
	            		商品名称:[${o.productName }] -- 
	            		数量:[${o.quantity }] -- 
	            		价格:[${o.price}]
	            	</c:forEach>
            	</table>
            </p>
            <div class="divider"></div>
            <!-- <p class="nowrap">
            	<label>完善省份信息：</label>
            	<input type="text" name="province" value="" placeholder="请填写收货省份" id="province"  class="required"/>
            	<span class="info" style="color:red;">(发货前请认真核对此选项，否则可能会出现收货地址错误，请慎重)</span>
            </p>
            <p class="nowrap">
            	<label>完善城市信息：</label>
            	<input type="text" name="city" value="" placeholder="请填写收货城市" id="city" class="required"/>
            	<span class="info" style="color:red;">(发货前请认真核对此选项，否则可能会出现收货地址错误，请慎重)</span>
            </p>
            <p class="nowrap">
            	<label>完善地区信息：</label>
            	<input type="text" name="region" value="" placeholder="请填写收货地区" id="region" class="required"/>
            	<span class="info" style="color:red;">(发货前请认真核对此选项，否则可能会出现收货地址错误，请慎重)</span>
            </p> -->
			<p class="nowrap">
            	<label>快递公司：</label>
            	<select name="expressType" id="expressType">
					<c:forEach items="${LOGISTICS_COMPANY_MAP }" var="map">
						<option value="${map.key }">${map.value }</option>
					</c:forEach>
				</select>   
			</p>
		</div>
		<div class="formBar">
			<ul>
			<li><div class="buttonActive"><div class="buttonContent"><button type="submit">确认发货</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>