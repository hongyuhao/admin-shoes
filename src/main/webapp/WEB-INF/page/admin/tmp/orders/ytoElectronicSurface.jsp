<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">

<title>圆通</title>
<style type="text/css">
* {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	border-width: 0
}
html,body {
	padding: 0;
	margin: 0;
	border: 0;
}
h2,p{
	margin: 0
}
.top-block{
	height: 103mm;
	width: 100mm;
	border:1px solid #9E9FA0;
}
.bottom-block{
	width: 100mm;
	height: 75mm;
	border:1px solid #9E9FA0;
}
.f-6{
	font-size: 6pt
}
.f-8{
	font-size: 8pt
}
.f-9{
	font-size: 9pt
}
.f-10{
	font-size: 10pt
}
.f-11{
	font-size: 11pt
}
.f-14{
	font-size: 14pt
}
.f-36{
	font-size: 36pt
}
.f-b{
	font-weight: bold;
}
.line-1{
	height: 1mm;
}
.line-2{
	height: 2mm;
	width: 100mm;
}
.bg-a{
	background: #48086B;
}
.bg-b{
	background: #ED7524;
}
.padding-left{
	padding-left: 6pt
}
.text-center{
	text-align: center;
}
.border-bottom{
	border-bottom-width:1px;
	border-bottom-color: #9E9FA0;

}
.top-tit{
	height: 16mm;
	padding-left: 6pt;
	padding-top: 8pt
}
.top-tit p{
	margin-top: 3pt
}
.top-sub-tit{
	border-bottom: 1px #9E9FA0 dashed;
	height: 21mm;
	text-align: center;
	line-height: 21mm;
}
.top-coreAndNum{
	height: 16mm;
	border-bottom: 1px #9E9FA0 dashed;
	text-align: center;
	padding-top: 3pt
}
.top-coreAndNum .img{
	height: 9mm;
	display:inline-block;

}
.top-coreAndNum .img img{
	height: 100%;
	min-width: 80mm;
}
.top-cont,.bottom-cont{
	position: relative;
}
.top-cont .left{
	width: 93mm;
	height: 49mm;
	border-right: 1px #9E9FA0 dashed;
}
.top-cont .right{
	width: 7mm;
	height: 49mm;
	position: absolute;
	top: 0;
	right: 0;
	padding-top: 17mm;
	padding-left: 2mm
}
.top-cont .left .delivery .ads {
    text-indent: -35pt;
}
.top-cont .left .delivery .num,.top-cont .left .delivery .ads {
    padding-left: 35pt;
}
.top-cont .left .consignee,.top-cont .left .delivery{
	border-bottom: 1px #9E9FA0 dashed;
	height: 17mm;
	padding-left: 6pt;
	padding-top: 2pt;
	line-height: 1.3;
	margin-top: -1px
}
.top-cont .left .consignee .ads,.top-cont .left .delivery .num{
	padding-left: 35pt
}
.top-cont .left .delivery-sure{
	overflow: hidden;
}
.top-cont .left .writeName,.top-cont .left .deliveryDate{
	float: left;
	height: 15mm;
	padding-top: 6pt;
	padding-left: 6pt
}
.top-cont .left .writeName{
	border-right: 1px #9E9FA0 dashed;
	width: 40mm;
}
.top-cont .left .deliveryDate{
	width: 53mm;
	margin-left: -1px
}
.top-cont .left .deliveryDate .date{
	margin-top: 6pt;
	text-align: center;
}
.top-cont .left .deliveryDate .date span{
	margin-left: 21pt;
}
.bottom-top{
	height: 14mm;
	overflow: hidden;
}
.bottom-top .logo{
	height: 9mm;
	margin: 2mm;
	float: left;
}
.bottom-top .logo img{
	height: 100%;
}
.bottom-top .core-info{
	float: left;
	margin-top: 1mm;
	margin-left: 4mm;
	text-align: center;
}
.bottom-top .core-info .core-img{
	height: 9mm;
}
.bottom-top .core-info .core-img img{
	height: 100%;
	min-width: 53mm;
}
.bottom-cont .left{
	height: 28mm;
	width: 93mm;
	border-right: 1px #9E9FA0 dashed;
	border-bottom:1px #9E9FA0 dashed;
}
.bottom-cont .left .consignee,.bottom-cont .left .delivery{
	height: 14mm;
	padding-left: 6pt;
	padding-top: 2pt;
	line-height: 1.2;
	margin-top: -1px
}
.bottom-cont .left .delivery{
	border-bottom: 1px #9E9FA0 dashed;
}
.bottom-cont .left .consignee .ads,.bottom-cont .left .delivery .ads,.bottom-cont .left .delivery .num{
	padding-left: 35pt
}
.bottom-cont .left .delivery .ads{
	text-indent:-35pt
}
.bottom-cont .right{
	width: 7mm;
	height: 28mm;
	position: absolute;
	top: 0;
	right: 0;
	padding-top: 7mm;
	padding-left: 2mm;
	border-bottom: 1px #9E9FA0 dashed;
}
.bottom-detail{
	height: 26mm;
	border-bottom:1px #9E9FA0 dashed;
	overflow: hidden;
}
.bottom-detail .info{
	float: left;
	width: 73mm;
	border-right:1px #9E9FA0 dashed;
	height: 26mm;
	padding-left: 44pt;
	padding-top: 6pt
}
.bottom-detail .info .title{
	margin-left: -38pt
}
.bottom-detail .core{
	float: left;
	width: 26mm;
	margin-left: -1px;
	height: 26mm;
	text-align: center;
	padding-top: 3mm
}
.bottom-detail .core .img{
	width: 17mm;
	margin-left: 3pt;
	display: inline-block;
}
.bottom-detail .core .img img{
	width: 100%
}
.bottom-detail .core p{
	text-align: center;
	text-indent: 6pt
}
.bottom-money{
	height: 6mm;
	line-height: 6mm;
	padding-left: 6pt
}



</style>
</head>
<body>
<div class="top-block">
	<div class="top-tit">
		<h2 class="f-14"><!-- 代收货款 --></h2>
		<p class="f-9"><!-- 金额：￥2700元 --></p>
	</div>
	<div class="line-1 bg-a" width="100%"></div>
	<div class="f-b f-36 top-sub-tit">
		${orderEntity.shortAddress }
	</div>
	<div class="top-coreAndNum">
		<div class="img"><img src="/images/logistics/yto/barcode/${preOrderEntity.orderSn }.jpg" height="9mm"></div>
		<p class="f-10">${orderEntity.mailNo }</p>
	</div>
	<div class="top-cont">
		<div class="left">
			<div class="consignee f-11 f-b">
				<p class="name">收件人:${preOrderEntity.receiverName }&nbsp;${preOrderEntity.receiverMobile }</p>
				<p class="ads">${preOrderEntity.receiverProv } ${preOrderEntity.receiverCity } ${preOrderEntity.receiverAddress } </p>
			</div>
			<div class="delivery f-10">
				<p class="ads">寄件人:${preOrderEntity.senderName }&nbsp;${preOrderEntity.senderProv } ${preOrderEntity.senderCity } ${preOrderEntity.senderAddress }</p>
				<p class="num">${preOrderEntity.senderPhone }</p>
			</div>
			<div class="delivery-sure f-10">
				<div class="writeName">
					收件人/代收人:
				</div>
				<div class="deliveryDate f-10">
					<p>签收时间:</p>
					<p class="date"><span>年</span><span>月</span><span>日</span></p>
				</div>
			</div>
			
		</div>
		<div class="right">
			签收联
		</div>
	</div>
</div>
<div class="line-2 bg-a"></div>
<div class="bottom-block">
	<div class="bottom-top">
		<div class="logo">
			<img src="/images/logistics/yto/YTO-LOGO.jpg" height="">
		</div>
		<div class="core-info">
			<div class="core-img"><img src="/images/logistics/yto/barcode/${preOrderEntity.orderSn }.jpg" height="9mm"></div>
			<p class="f-10">${orderEntity.mailNo }</p>
		</div>
	</div>
	<div class="line-1 bg-b"></div>
	<div class="bottom-cont">
		<div class="left">
			<div class="delivery f-10">
				<p class="ads">寄件人:${preOrderEntity.senderName }&nbsp;${preOrderEntity.senderProv } ${preOrderEntity.senderCity } ${preOrderEntity.senderAddress }</p>
				<p class="num">${preOrderEntity.senderPhone }</p>
			</div>
			<div class="consignee f-10">
				<p class="name">收件人:${preOrderEntity.receiverName }&nbsp;${preOrderEntity.receiverMobile }</p>
				<p class="ads">${preOrderEntity.receiverProv } ${preOrderEntity.receiverCity } ${preOrderEntity.receiverAddress } </p>
			</div>
		</div>
		<div class="right">
			收件联
		</div>
	</div>
	<div class="bottom-detail">
		<div class="info f-6">
			<span class="title f-8">订单详情:</span>
			<c:forEach items="${preOrderEntity.ytoItemEntityList }" var="item">
				<p>${item.itemName }&nbsp;数量:${item.number }</p>
			</c:forEach>
		</div>
		<div class="core">
<!-- 			<div class="img"><img src="img/core2.jpg"></div>
			<p class="f-6">扫码有“礼”</p>此处为自定义，可以放蛙鸣健康的二维码 -->
		</div>
	</div>
	<div class="f-b f-9 bottom-money">
		<!-- 代收货款    金额:￥2700元（贰仟柒佰元整） -->
	</div>
</div>
</body>
</html>