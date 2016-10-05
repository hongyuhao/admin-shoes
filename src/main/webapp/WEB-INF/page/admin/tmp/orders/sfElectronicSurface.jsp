<%@ page contentType="text/html;charset=utf-8"%>

<%@ include file="/inc/taglibs.jsp"%>
<html lang="zh-cn">
 <head>
  <meta charset="utf-8"/>
	<meta name="renderer" content="webkit"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<title>顺丰运单</title>
	<link href="/css/common.css" rel="stylesheet" />
	</head>
 <body>
 <!--startprint-->
	<div class="print-wrap" style="z-index:-1;">
        <img class="bg" src="/images/logistics/sf/bg.png" />
        <div class="top">
            <div class="logo-tip">
                <!--
                <img src="~/Img/logo.png" />
                -->
            </div>
            <div class="code">
                <img class="codeImg" src="/images/logistics/sf/barcode/${userElectronicSurface.orderSn }.jpg">
                <p class="mailNo">${sfOrderEntity.mailNo }</p>
            </div>
	          <div class="receive-code">${sfOrderEntity.destCode }</div>
            <div class="receive-addr">
                <p class="area">${preOrderEntity.daoProvince },${preOrderEntity.daoCity },${preOrderEntity.daoCounty }</p>
                <p class="detail">${preOrderEntity.daoAdress }</p>
                <p><span class="receiveName">${preOrderEntity.daoContact}</span><span style="margin-left:3.5mm;" class="receiverMobile">${preOrderEntity.daoTel } </span></p>
            </div>
            <div class="tran-money"></div>
            <div class="total-money"></div>
            <div class="account">${preOrderEntity.custId }</div>
           
            <div class="price">
            	<c:forEach items="${preOrderEntity.addedServiceList }" var="addedService">
            		<c:if test="${addedService.name == 'INSURE'}">
            			${addedService.value }
            		</c:if>
            	</c:forEach>
            </div>
            <div class="premium-fee">
            	
			</div>
            <div class="package-fee"></div>
            <div class="real-weight">
            	<c:if test="${preOrderEntity.cargoTotalWeight > 0}">
            		${preOrderEntity.cargoTotalWeight}
            	</c:if>
            </div>
            <div class="charging-weight"></div>
            
            <div class="send-addr">
                <p>${preOrderEntity.jiProvince },${preOrderEntity.jiCity },${preOrderEntity.jiCounty }</p>
                <p>${preOrderEntity.jiAddress }</p>
                <p><span>${preOrderEntity.jiContact}</span><span style="margin-left:3.5mm;">${preOrderEntity.jiTel}</span></p>
            </div>
            <div class="send-code">${sfOrderEntity.originCode }</div>
        </div>
        <div class="btm">
            <div class="code">
                <img class="codeImg" src="/images/logistics/sf/barcode/${userElectronicSurface.orderSn }.jpg">
                <p class="mailNo">${sfOrderEntity.mailNo }</p>
            </div>
            <div class="send-addr">
                <p>${preOrderEntity.jiProvince },${preOrderEntity.jiCity },${preOrderEntity.jiCounty }</p>
                <p>${preOrderEntity.jiAddress }</p>
                <p><span>${preOrderEntity.jiContact}</span><span style="margin-left:3.5mm;">${preOrderEntity.jiTel}</span></p>
            </div>
            <div class="receive-addr">
                <p>${preOrderEntity.daoProvince },${preOrderEntity.daoCity },${preOrderEntity.daoCounty },${preOrderEntity.daoAdress }</p>
                <p><span class="receiveName">${preOrderEntity.daoContact}</span><span style="margin-left:3.5mm;" class="receiverMobile">${preOrderEntity.daoTel }</span></p>
            </div>
            <div class="send-date">${date}</div>
            <div class="order-no">${preOrderEntity.orderId }</div>
            <div class="depositum">
            	<c:forEach items="${preOrderEntity.cargoList }" var="cargo">
            		${cargo.name }  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${cargo.count }${cargo.unit }
            	</c:forEach>
            
            </div>
            <div class="mark">${preOrderEntity.remark }</div>
            <div class="total-money"></div>
        </div>
    </div>
    <!--endprint-->
    <!-- <input id="btnPrint" value="打印" type="button" onclick="preview()"/>  -->
 </body>
</html>
<script>
	function preview()    
	{    
	   bdhtml=window.document.body.innerHTML;    
	   sprnstr="<!--startprint-->";    
	   eprnstr="<!--endprint-->";    
	   prnhtml=bdhtml.substring(bdhtml.indexOf(sprnstr)+17);    
	   prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr));    
	   window.document.body.innerHTML=prnhtml;    
	   window.print();    
	}  
</script>