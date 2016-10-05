<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ page import="com.frogs.framework.web.filter.SpringWebContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="java.util.*,java.io.*,java.text.*,java.net.*" %>
<%@ page import="com.frogs.framework.web.*,com.frogs.framework.util.* , com.frogs.framework.exception.*,com.frogs.framework.component.cache.*" %>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="com.frogs.system.util.*" %>
<%@ page import="com.frogs.business.datacenter.entity.*" %>
<%@ page import="com.frogs.business.datacenter.entity._enum.*" %>
<%@ page import="java.util.Calendar"%>
<%@ page import="com.frogs.admin.util.*"%>
<%@ page import="com.frogs.admin.entity._enum.*"%>
<%@ page import="com.wxxk.entity._enum.*"%>
<%@ page import="com.frogs.framework.logistics.entity._enum.*" %>
<%@ page import="com.alibaba.fastjson.JSONObject" %>
<%@ page import="com.frogs.system.util.FormSelectLoader" %>

<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="frogs" uri="http://w.frogshealth.com/el" %>
<%@ taglib prefix="admin" uri="http://mini.admin.frogshealth.com/el" %>

<c:set var="recordStatusMap" value="<%=com.frogs.business.datacenter.entity.FormSelectLoader.getRecordStatusMap()%>"/>
<c:set var="switchMap" value="<%=com.frogs.business.datacenter.entity.FormSelectLoader.getSwitchMap()%>"/>
<c:set var="closeStrategyMap" value="<%=com.frogs.business.datacenter.entity.FormSelectLoader.getCloseStrategyMap()%>"/>
<c:set var="connStrategyMap" value="<%=com.frogs.business.datacenter.entity.FormSelectLoader.getConnStrategyMap()%>"/>
<c:set var="cryptMethodMap" value="<%=com.frogs.business.datacenter.entity.FormSelectLoader.getCryptMethodMap()%>"/>
<c:set var="authVerMap" value="<%=com.frogs.business.datacenter.entity.FormSelectLoader.getAuthVerMap()%>"/>
<c:set var="manuMacPosMap" value="<%=com.frogs.business.datacenter.entity.FormSelectLoader.getManuMacPosMap()%>"/>
<c:set var="serMacPosMap" value="<%=com.frogs.business.datacenter.entity.FormSelectLoader.getSerMacPosMap()%>"/>
<c:set var="connectProtocolMap" value="<%=com.frogs.business.datacenter.entity.FormSelectLoader.getConnectProtocolMap()%>"/>
<c:set var="opTypeMap" value="<%=com.frogs.business.datacenter.entity.FormSelectLoader.getOpTypeMap()%>"/>
<c:set var="encodeTypeMap" value="<%=com.frogs.business.datacenter.entity.FormSelectLoader.getEncodeTypeMap()%>"/>
<c:set var="dataFormatTypeMap" value="<%=com.frogs.business.datacenter.entity.FormSelectLoader.getDataFormatTypeMap()%>"/>
<c:set var="sellTypeMap" value="<%=com.frogs.business.datacenter.entity.FormSelectLoader.getSellTypeMap()%>"/>
<c:set var="equipmentCommunicateTypeMap" value="<%=com.frogs.business.datacenter.entity.FormSelectLoader.getEquipmentCommunicateTypeMap()%>"/>
<c:set var="openPlatformMap" value="<%=com.frogs.business.datacenter.entity.FormSelectLoader.getOpenPlatformMap()%>"/>
<c:set var="cloudSataStatusMap" value="<%=com.frogs.business.datacenter.entity.FormSelectLoader.getCloudSataStatusMap()%>"/>
<c:set var="equipmentTypeMap" value="<%=com.frogs.business.datacenter.entity.FormSelectLoader.getEquipmentTypeMap()%>"/>
<c:set var="fightStatusMap" value="<%=com.frogs.business.activity.entity.FormSelectLoader.getFightStatusMap()%>"/>
<c:set var="fightInfoMap" value="<%=com.frogs.business.activity.entity.FormSelectLoader.getFightInfoMap()%>"/>
<c:set var="activitiesCodeStatusMap" value="<%=com.frogs.business.activity.entity.FormSelectLoader.getActivitiesCodeStatusMap()%>"/>
<c:set var="msgTypeMap" value="<%=com.frogs.system.util.MsgTypeEnum.listAllTypes()%>"/>
<c:set var="dataFormatMap" value="<%=com.frogs.system.util.DataFormatEnum.listAllTypes()%>"/>
<c:set var="statusMap" value="<%=com.frogs.system.util.RecordStatusEnum.listAllTypes()%>"/>
<c:set var="partnerIdMap" value="<%=com.frogs.business.mall.entity.YouzanGoodsInfo.getPartnerIdMap()%>"/>
<c:set var="serviceMap" value="<%=com.frogs.business.open.util.FormSelectLoader.getServiceMap()%>"/>
<c:set var="isLoginMap" value="<%=com.frogs.business.open.util.FormSelectLoader.getIsLoginMapMap()%>"/>
<c:set var="isSignMap" value="<%=com.frogs.business.open.util.FormSelectLoader.getIsSignMap()%>"/>
<c:set var="isVisitMap" value="<%=com.frogs.business.open.util.FormSelectLoader.getIsVisitMap()%>"/>
<c:set var="partnerTypeMap" value="<%=com.frogs.business.open.util.FormSelectLoader.getPartnerTypeMap()%>"/>
<c:set var="addressTypeMap" value="<%=com.frogs.business.open.util.FormSelectLoader.getAddressTypeMap()%>"/>
<c:set var="bussinessModeMap" value="<%=com.frogs.business.open.util.FormSelectLoader.getBussinessModeMap()%>"/>

<c:set var="userIntegralRecordTypeMap" value="<%=FormSelectLoader.getUserIntegralRecordTypeMap()%>"/>
<c:set var="honorStatusMap" value="<%=FormSelectLoader.getHonorStatusMap()%>"/>
<c:set var="honorTypeMap" value="<%=FormSelectLoader.getHonorTypeMap()%>"/>
<c:set var="userIntegralConsumeMap" value="<%=FormSelectLoader.getUserIntegralConsumeMap()%>"/>
<c:set var="applicablePlatformMap" value="<%=FormSelectLoader.getApplicablePlatformMap()%>"/>
<c:set var="openPlatformMap" value="<%=OpenPlatformEnum.listAllTypes()%>"/>
<c:set var="userTypeMap" value="<%=FormSelectLoader.getUserTypeMap()%>"/>
<c:set var="modifyWayMap" value="<%=FormSelectLoader.getModifyWayMap()%>"/>
<c:set var="sexMap" value="<%=FormSelectLoader.getSexMap()%>"/>
<c:set var="feedbackStatusMap" value="<%=FormSelectLoader.getUserFeedbackStatusMap()%>"/>
<c:set var="auditGoodsMap" value="<%=FormSelectLoader.getAuditGoodsMap()%>"/>
<c:set var="AUDITED_PASS" value="<%=GoodsEvaluateEnum.AUDITED_PASS.getId()%>"/>
<c:set var="AUDITED_NOTPASS" value="<%=GoodsEvaluateEnum.AUDITED_NOTPASS.getId()%>"/>
<c:set var="AUDITED_DELETED" value="<%=GoodsEvaluateEnum.DELETED.getId()%>"/>
<c:set var="taskActionStatusMap" value="<%=FormSelectLoader.getTaskStatusformMap()%>"/>
<c:set var="taskActionShowStatusMap" value="<%=TaskActionShowStatusEnum.listAllTypes()%>"/>
<c:set var="taskTypeMap" value="<%=FormSelectLoader.getTaskTypeformMap()%>"/>
<c:set var="taskCycleMap" value="<%=FormSelectLoader.getTaskCycleformMap()%>"/>
<c:set var="FLOWTASK" value="<%=TaskTypeEnum.FLOWTASK.getId()%>"/>
<c:set var="integralExchangeConditionTypeMap" value="<%=FormSelectLoader.getIntegralExchangeConditionTypeMap()%>"/>
<c:set var="MONEY" value="<%=IntegralExchangeConditionTypeEnum.MONEY.getId()%>"/>
<c:set var="integralExchangeTypeMap" value="<%=FormSelectLoader.getIntegralExchangeTypeMap()%>"/>
<c:set var="integralExchangeTargetMap" value="<%=FormSelectLoader.getIntegralExchangeTargetMap()%>"/>
<c:set var="GOODS" value="<%=IntegralExchangeTargetEnum.GOODS.getId() %>"/>
<c:set var="COUPON" value="<%=IntegralExchangeTargetEnum.COUPON.getId() %>"/>
<c:set var="TO_GOODS" value="<%=IntegralExchangeTypeEnum.TO_GOODS.getId() %>"/>
<c:set var="JOIN_MONEY_TO_GOODS" value="<%=IntegralExchangeTypeEnum.JOIN_MONEY_TO_GOODS.getId() %>"/>
<c:set var="CDKEY" value="<%=IntegralExchangeTargetEnum.CDKEY.getId() %>"/>
<c:set var="TO_COUPON" value="<%=IntegralExchangeTypeEnum.TO_COUPON.getId() %>"/>
<c:set var="TO_CDKEY" value="<%=IntegralExchangeTypeEnum.TO_CDKEY.getId() %>"/>
<c:set var="expandCodeEnumTypeMap" value="<%=FormSelectLoader.getExpandCodeEnumMap()%>"/>
<c:set var="userMessageReceiverTypeMap" value="<%=FormSelectLoader.getUserMessageReceiverMap()%>"/>
<c:set var="userMessageSendTypeMap" value="<%=FormSelectLoader.getUserMessageSendMap()%>"/>
<c:set var="userMessageContentTypeMap" value="<%=FormSelectLoader.getUserMessageContentMap()%>"/>
<c:set var="integralExchangeColumnMap" value="<%=FormSelectLoader.getIntegralExchangeColumnMap()%>"/>
<c:set var="userInfoCompleteStatusMap" value="<%=FormSelectLoader.getUserInfoCompleteStatusMap()%>"/>
<c:set var="userRechargeableCardStatusMap" value="<%=FormSelectLoader.getUserRechargeableCardStatusMap()%>"/>
<c:set var="insuranceTypeMap" value="<%=FormSelectLoader.getInsuranceTypeMap()%>"/>
<c:set var="insuranceCompanyMap" value="<%=FormSelectLoader.getInsuranceCompanyMap()%>"/>
<c:set var="insuranceValidDateUnitMap" value="<%=FormSelectLoader.getInsuranceValidDateUnitMap()%>"/>
<c:set var="SEND_MAIL" value="<%=UserInfoCompleteStatusEnum.SEND_MAIL.getId() %>"/>
<c:set var="taskGetStrategyMap" value="<%=TaskGetStrategyEnum.list()%>"/>
<c:set var="taskGetTypeMap" value="<%=TaskGetTypeEnum.list()%>"/>
<c:set var="operationMap" value="<%=com.frogs.admin.entity.FormSelectLoader.getOperationMap()%>"/>
<c:set var="wXCardStatusMap" value="<%=com.frogs.business.wxpay.util.FormSelectLoader.getWXCardStatusMap()%>"/>
<c:set var="cardStatusMap" value="<%=com.frogs.business.wxpay.util.FormSelectLoader.getCardStatusMap()%>"/>
<c:set var="orderStatusMap" value="<%=com.frogs.system.util.FormSelectLoader.getOrderStatusMap()%>"/>
<c:set var="orderShippingStatusMap" value="<%=com.frogs.system.util.FormSelectLoader.getOrderShippingStatusMap()%>"/>
<c:set var="orderPayTypeMap" value="<%=com.frogs.system.util.FormSelectLoader.getOrderPayTypeMap()%>"/>
<c:set var="payStatusformMap" value="<%=com.frogs.system.util.FormSelectLoader.getPayStatusformMap()%>"/>
<c:set var="operationMap" value="<%=com.frogs.admin.entity.FormSelectLoader.getOperationMap()%>"/>
<c:set var="adPosServiceTypeMap" value="<%=AdPositionEnum.listAllDescs()%>"/>

<c:set var="ORDER_ADDRESS_STATUS_MAP" value="<%=com.wxxk.entity._enum.OrderAddressEnum.list() %>"/>
<c:set var="ORDER_ADDRESS_STATUS_NORMAL" value="<%=com.wxxk.entity._enum.OrderAddressEnum.ORDER_ADDRESS_STATUS_NORMAL.getId() %>"/>

<c:set var="companyMap" value="<%=com.frogs.admin.entity.FormSelectLoader.getCompanyMap()%>"/>
<c:set var="departmentMap" value="<%=com.frogs.admin.entity.FormSelectLoader.getDepartmentMap()%>"/>
<c:set var="jobGradeMap" value="<%=com.frogs.admin.entity.FormSelectLoader.getJobGradeMap()%>"/>

<%@ page isELIgnored="false" %>
<%
	WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(application);
	String path = request.getContextPath();
	String serverDomain = request.getServerName();
	request.setAttribute("crowdTypeMap", CrowdTypeEnum.listAllTypes());
	request.setAttribute("testMomentMap", TestMomentEnum.listAllTypes());
	request.setAttribute("testStatusMap", com.frogs.system.util.TestStatusEnum.listAllTypes());
	request.setAttribute("weightStatusMap", WeightLevelEnum.listAllTypes());
	request.setAttribute("dataConclusionsTypeMap",DataConclusionsTypeEnum.listAllTypes());
	request.setAttribute("BLOOD_PRESSURE", DataTypeInfoEnum.BLOOD_PRESSURE.getId());
	request.setAttribute("BLOOD_GLUCOSE", DataTypeInfoEnum.BLOOD_GLUCOSE.getId());
	request.setAttribute("WEIGHT", DataTypeInfoEnum.WEIGHT.getId());
	request.setAttribute("StatisticsNameMap", JSONObject.toJSONString(com.frogs.business.stastic.entity._enum.StatisticsNameEnum.listAllTypes()));
	request.setAttribute("climbSceneCode", OperationActionTypeEnum.getClimbCodeMap());
	
	HttpRequestInfo requestInfo = new HttpRequestInfo(request);
	int userId = requestInfo.getCookieIntValue(CookieConfig.COOKIE_ADMIN_USER_ID, 0);
	String verify = requestInfo.getCookieValue(CookieConfig.COOKIE_ADMIN_VERIFY_CODE,"");
%>
<c:set var="path" value="<%=path %>"/>
<c:set var="CSS_PATH" value="${path }/css" scope="request" />
<c:set var="JS_PATH" value="${path }/js" scope="request" />
<c:set var="IMAGE_PATH" value="${path }/images" scope="request" />
<c:set var="CONTEXT_PATH" value="<%=request.getContextPath() %>"/>
<c:set var="RECORD_NORMAL" value="<%=RecordStatusEnum.NORMAL.getId() %>"/>
<c:set var="RECORD_DELETED" value="<%=RecordStatusEnum.DELETED.getId() %>"/>
<c:set var="GOODS_PRESCRIPTION_TYPE_MAP" value="<%=com.frogs.business.mall.entity.FormSelectLoader.getGoodsPrescriptionTypeMap() %>"/>
<c:set var="GOODS_TYPE_MAP" value="<%=com.frogs.business.mall.entity.FormSelectLoader.getGoodsTypeMap() %>"/>
<c:set var="GOODS_PARTNER_SALE_STATUS_MAP" value="<%=com.frogs.business.mall.entity.FormSelectLoader.getGoodsPartnerSaleStatusMap() %>"/>
<c:set var="GOODS_PARTNER_STOCK_STATUS_MAP" value="<%=com.frogs.business.mall.entity.FormSelectLoader.getGoodsPartnerStockStatusMap() %>"/>
<c:set var="DATA_TYPE_INFO_MAP" value="<%=com.frogs.business.mall.entity.FormSelectLoader.getDataTypeInfoMap() %>"/>
<c:set var="DATA_TYPE_LEVEL_MAP" value="<%=com.frogs.business.mall.entity.FormSelectLoader.getDataTypeLevelMap() %>"/>
<c:set var="PAGE_LOCATION_MAP" value="<%=com.frogs.business.mall.entity.FormSelectLoader.getPageLocationMap() %>"/>
<c:set var="PARTNER_ORDER_STATUS_MAP" value="<%=com.frogs.business.mall.entity.FormSelectLoader.getPartnerOrderStatusMap() %>"/>
<c:set var="PARTNER_INFO_MAP" value="<%=com.frogs.business.mall.entity.FormSelectLoader.getPartnerInfoMap() %>"/>
<c:set var="LOGISTICS_COMPANY_MAP" value="<%=LogisticsCompanyEnum.listAllTypes() %>"/>
<c:set var="YTO_ITEM_TYPE_MAP" value="<%=YTOItemTypeEnum.listAllTypes() %>" />
<c:set var="AUDIT_STATUS_MAP" value="<%=com.frogs.business.mall.entity.FormSelectLoader.getRecordStatusMap()%>"/>

<%-- 权限判断需要用的  --%>
<c:set var="USER_ID" value="<%=userId%>"/>
<c:set var="VERIFY" value="<%=verify%>"/>
<c:set var="ADD" value="<%=AdminOperationEnum.ADD.getCode()%>"/>
<c:set var="SELECT" value="<%=AdminOperationEnum.SELECT.getCode()%>"/>
<c:set var="AUDIT" value="<%=AdminOperationEnum.AUDIT.getCode()%>"/>
<c:set var="DELETE" value="<%=AdminOperationEnum.DELETE.getCode()%>"/>
<c:set var="UPDATE" value="<%=AdminOperationEnum.UPDATE.getCode()%>"/>
