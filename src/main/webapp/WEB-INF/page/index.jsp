<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="/inc/taglibs.jsp" %>
<%
	String hostName = "UnknownHost";
	if (System.getenv("COMPUTERNAME") != null) {  
	       hostName = System.getenv("COMPUTERNAME");  
	   } else {
	   	try {  
	           hostName = (InetAddress.getLocalHost()).getHostName();  
	       } catch (UnknownHostException uhe) {  
	           String host = uhe.getMessage(); // host = "hostname: hostname"  
	           if (host != null) {  
	               int colon = host.indexOf(':');  
	               if (colon > 0) {  
	                   hostName = host.substring(0, colon);  
	               }  
	           }  
	       }  
	   }
	
	HashMap<String, String> hostMap = new HashMap<String, String>();
	hostMap.put("iZ94xv1s23mZ", "公网正式机");
	hostMap.put("HYS-SERVER-02", "内网测试机");
	hostMap.put("BJ-test-web-2", "公网测试机");

	request.setAttribute("hostName", hostName);
	request.setAttribute("hostMap", hostMap);
	String currentHost = hostMap.containsKey(hostName) ? hostMap.get(hostName) : "未知环境";
	request.setAttribute("currentHost", currentHost+"["+(InetAddress.getLocalHost()).getHostAddress()+"]");
	
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=7"/>
    <title>首页</title>

    <link href="/js/dwz-ria-1.5.0/themes/default/style.css" rel="stylesheet" type="text/css" media="screen"/>
    <link href="/js/dwz-ria-1.5.0/themes/css/core.css" rel="stylesheet" type="text/css" media="screen"/>
    <link href="/js/dwz-ria-1.5.0/themes/css/print.css" rel="stylesheet" type="text/css" media="print"/>
    <link href="/js/dwz-ria-1.5.0/uploadify/css/uploadify.css" rel="stylesheet" type="text/css" media="screen"/>
    <!--[if IE]>
    <link href="/js/dwz-ria-1.5.0/themes/css/ieHack.css" rel="stylesheet" type="text/css" media="screen"/>
    <![endif]-->
    <!-- <link href="/js/select2/select2.css" rel="stylesheet"/> -->

    <script src="/js/dwz-ria-1.5.0/js/speedup.js" type="text/javascript"></script>
    <%--<script src="/js/dwz-ria-1.5.0/js/jquery-1.7.2.js" type="text/javascript"></script>--%>
	<script type="text/javascript" src="http://cdn.hcharts.cn/jquery/jquery-1.8.3.min.js"></script>
    <script src="/js/dwz-ria-1.5.0/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="/js/dwz-ria-1.5.0/js/jquery.validate.js" type="text/javascript"></script>
    <script src="/js/dwz-ria-1.5.0/js/jquery.bgiframe.js" type="text/javascript"></script>
    <script src="/js/dwz-ria-1.5.0/xheditor/xheditor-1.2.1.min.js" type="text/javascript"></script>
    <script src="/js/dwz-ria-1.5.0/uploadify/scripts/jquery.uploadify.js" type="text/javascript"></script>

    <script src="/js/dwz-ria-1.5.0/js/dwz.core.js" type="text/javascript"></script>
    <script src="/js/dwz-ria-1.5.0/js/dwz.util.date.js" type="text/javascript"></script>
    <script src="/js/dwz-ria-1.5.0/js/dwz.validate.method.js" type="text/javascript"></script>
    <script src="/js/dwz-ria-1.5.0/js/dwz.regional.zh.js" type="text/javascript"></script>
    <script src="/js/dwz-ria-1.5.0/js/dwz.barDrag.js" type="text/javascript"></script>
    <script src="/js/dwz-ria-1.5.0/js/dwz.drag.js" type="text/javascript"></script>
    <script src="/js/dwz-ria-1.5.0/js/dwz.tree.js" type="text/javascript"></script>
    <script src="/js/dwz-ria-1.5.0/js/dwz.accordion.js" type="text/javascript"></script>
    <script src="/js/dwz-ria-1.5.0/js/dwz.ui.js" type="text/javascript"></script>
    <script src="/js/dwz-ria-1.5.0/js/dwz.theme.js" type="text/javascript"></script>
    <script src="/js/dwz-ria-1.5.0/js/dwz.switchEnv.js" type="text/javascript"></script>
    <script src="/js/dwz-ria-1.5.0/js/dwz.alertMsg.js" type="text/javascript"></script>
    <script src="/js/dwz-ria-1.5.0/js/dwz.contextmenu.js" type="text/javascript"></script>
    <script src="/js/dwz-ria-1.5.0/js/dwz.navTab.js" type="text/javascript"></script>
    <script src="/js/dwz-ria-1.5.0/js/dwz.tab.js" type="text/javascript"></script>
    <script src="/js/dwz-ria-1.5.0/js/dwz.resize.js" type="text/javascript"></script>
    <script src="/js/dwz-ria-1.5.0/js/dwz.dialog.js" type="text/javascript"></script>
    <script src="/js/dwz-ria-1.5.0/js/dwz.dialogDrag.js" type="text/javascript"></script>
    <script src="/js/dwz-ria-1.5.0/js/dwz.sortDrag.js" type="text/javascript"></script>
    <script src="/js/dwz-ria-1.5.0/js/dwz.cssTable.js" type="text/javascript"></script>
    <script src="/js/dwz-ria-1.5.0/js/dwz.stable.js" type="text/javascript"></script>
    <script src="/js/dwz-ria-1.5.0/js/dwz.taskBar.js" type="text/javascript"></script>
    <script src="/js/dwz-ria-1.5.0/js/dwz.ajax.js" type="text/javascript"></script>
    <script src="/js/dwz-ria-1.5.0/js/dwz.pagination.js" type="text/javascript"></script>
    <script src="/js/dwz-ria-1.5.0/js/dwz.database.js" type="text/javascript"></script>
    <script src="/js/dwz-ria-1.5.0/js/dwz.datepicker.js" type="text/javascript"></script>
    <script src="/js/dwz-ria-1.5.0/js/dwz.effects.js" type="text/javascript"></script>
    <script src="/js/dwz-ria-1.5.0/js/dwz.panel.js" type="text/javascript"></script>
    <script src="/js/dwz-ria-1.5.0/js/dwz.checkbox.js" type="text/javascript"></script>
    <script src="/js/dwz-ria-1.5.0/js/dwz.history.js" type="text/javascript"></script>
    <script src="/js/dwz-ria-1.5.0/js/dwz.combox.js" type="text/javascript"></script>
    <script src="/js/dwz-ria-1.5.0/js/dwz.print.js" type="text/javascript"></script>
    <!--
    <script src="/js/dwz-ria-1.5.0/bin/dwz.min.js" type="text/javascript"></script>
    -->
    <script src="/js/dwz-ria-1.5.0/js/dwz.regional.zh.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/commonArea.js"></script>

	<%--<script src="/js/highcharts/highcharts.js"></script>    --%>
    <%--<script src="/js/highcharts/exporting.js"></script>--%>
	<script src="/js/highcharts_new/highcharts.js"></script>
	<script src="/js/highcharts_new/modules/exporting.js"></script>
    <!-- <script src="/js/select2/select2.js" type="text/javascript"></script> -->
    

    <script type="text/javascript">
        $(function () {
            DWZ.init("/js/dwz-ria-1.5.0/dwz.frag.xml", {
                loginUrl:"login_dialog.html", loginTitle:"登录", // 弹出登录对话框
//		loginUrl:"login.html",	// 跳到登录页面
                statusCode:{ok:200, error:300, timeout:301}, //【可选】
                pageInfo:{pageNum:"pageNum", numPerPage:"numPerPage", orderField:"orderField", orderDirection:"orderDirection"}, //【可选】
                debug:false, // 调试模式 【true|false】
                callback:function () {
                    initEnv();
                    $("#themeList").theme({themeBase:"/js/dwz-ria-1.5.0/themes"}); // themeBase 相对于index页面的主题base路径
                }
            });
        });
     </script>
     
</head>

<body scroll="no">
<div id="layout">
<div id="header">
    <div class="headerNav">
        <ul class="nav">
        	<li><a href="javascript:void(0)">当前环境：${currentHost }</a></li>
            <li><a href="javascript:void(0)">${admin.fullName }</a></li>
			<li><a href="http://www.frogshealth.com" target="_blank">蛙鸣首页</a></li>
			<li><a href="/admin/logout">退出</a></li>
        </ul>
    </div>

    <!-- navMenu -->

</div>

<div id="leftside">
    <div id="sidebar_s">
        <div class="collapse">
            <div class="toggleCollapse">
                <div></div>
            </div>
        </div>
    </div>
    <div id="sidebar">
        <div class="toggleCollapse"><h2>业务系统</h2>
            <div>收缩</div>
        </div>
        <div class="accordion" fillSpace="sidebar">
        <c:if test="${admin:permission(USER_ID,VERIFY,'permission_config',SELECT) }">
			<div class="accordionHeader">
				<h2 class="collapsable"><span>Folder</span>权限中心</h2>
			</div>
			<div class="accordionContent">
				<ul class="tree treeFolder collapse">
					<li>
						<a>权限管理</a>
						<ul>
							<li>
								<a href="/admin/permission/systemResource/?rel=systemResourcefoHome"
								   target="navTab" rel="systemResourcefoHome"
								   title="资源管理">资源管理</a>
							</li>
							<li>
	                			<a href="/admin/permission/role/?rel=roleHome" 
	                					target="navTab" rel="roleHome" 
	                					title="角色管理">角色管理</a>
	                		</li>
	                		<li>
	                			<a href="/admin/permission/user/?rel=userHome" 
	                					target="navTab" rel="userHome" 
	                					title="用户管理">用户管理</a>
	                		</li>
						</ul>
					</li>
				</ul>
			</div>
			</c:if>
			<c:if test="${admin:permission(USER_ID,VERIFY,'permission_config',SELECT) || admin:permission(USER_ID,VERIFY,'dc_config',SELECT) }">
            <div class="accordionHeader">
                <h2 class="collapsable"><span>Folder</span>数据中心</h2>
            </div>
			<div class="accordionContent">
				<ul class="tree treeFolder collapse">
					<c:choose>
						<c:when test="${admin.fullName == '硬件厂家-爱奥乐' }">
							<li>
								<a>设备数据管理</a>
								<ul>
									<li>
										<a href="/admin/datacenter/cloudBloodGlucoseInfo?ref=cloudBloodGlucoseInfo&eqManufacturerId=9"
										   target="navTab" rel="cloudBloodGlucoseInfo"
										   title="血糖数据">血糖数据</a>
									</li>
									<li>
										<a href="/admin/datacenter/cloudBloodPressureInfo?ref=cloudBloodPressureInfo&eqManufacturerId=9"
										   target="navTab" rel="cloudBloodPressureInfo"
										   title="血压数据">血压数据</a>
									</li>
								</ul>
							</li>
						</c:when>
						<c:when test="${user.account == 'tester' }">
							<li>
								<a>小药盒日志数据</a>
								<ul>
									<li>
										<a href="/admin/datacenter/MedicineCommandInfo?ref=medicineCommandInfo"
										   target="navTab" rel="medicineCommandInfo"
										   title="小药盒数据">小药盒数据</a>
									</li>
								</ul>
							</li>
						</c:when>
						<c:otherwise>
							<li>
								<a>配置管理</a>
								<ul>
									<c:if test="${admin:permission(USER_ID,VERIFY,'dc_config',SELECT) }">
										<li>
											<a href="/admin/datacenter/serviceInfo/?rel=serviceInfoHome"
											   target="navTab" rel="serviceInfoHome"
											   title="服务管理">服务管理</a>
										</li>
									</c:if>
									<c:if test="${admin:permission(USER_ID,VERIFY,'dc_config',SELECT) }">
										<li>
											<a href="/admin/datacenter/dataTypeInfo/?rel=dataTypeInfoHome"
											   target="navTab" rel="dataTypeInfoHome"
											   title="数据分类管理">数据分类管理</a>
										</li>
									</c:if>
									<li>
										<a href="/admin/datacenter/dataConclusions/?rel=dataConclusionsHome"
										   target="navTab" rel="dataConclusionsHome"
										   title="数据结论管理">数据结论管理</a>
									</li>
									<li>
										<a href="/admin/datacenter/weightAdviceInfo/?rel=weightAdviceInfoHome"
										   target="navTab" rel="weightAdviceInfoHome"
										   title="体重建议管理">体重建议管理</a>
									</li>
									<li>
										<a href="/admin/datacenter/dataConclusionsInfo/?rel=dataConclusionsInfoHome"
										   target="navTab" rel="dataConclusionsInfoHome"
										   title="数据结论管理V2.0">数据结论管理V2.0</a>
									</li>
									<li>
										<a href="/admin/datacenter/dataBloodGlucoseStandard/?rel=dataBloodGlucoseStandardHome"
										   target="navTab" rel="dataBloodGlucoseStandardHome"
										   title="血糖标准管理">血糖标准管理</a>
									</li>
									<li>
										<a href="/admin/datacenter/dataBloodPressureStandard/?rel=dataBloodPressureStandardHome"
										   target="navTab" rel="dataBloodPressureStandardHome"
										   title="血压标准管理">血压标准管理</a>
									</li>
									<li>
										<a href="/admin/datacenter/dataWeightStandard/?rel=dataWeightStandardHome"
										   target="navTab" rel="dataBloodWeightStandardHome"
										   title="体质标准管理">体质标准管理</a>
									</li>
									<!-- <li>
                                        <a href="/admin/dataBloodGlucoseStandard/?rel=dataBloodGlucoseStandardHome"
                                            target="navTab" rel="dataBloodGlucoseStandardHome"
                                            title="血糖测量标准">血糖测量标准</a>
                                    </li> -->
								</ul>

							</li>
							<li>
								<a>硬件管理</a>
								<ul>
									<li>
										<a href="/admin/datacenter/manufacturerInfo/?rel=manufacturerInfoHome"
										   target="navTab" rel="manufacturerInfoHome"
										   title="厂商管理">厂商管理</a>
									</li>
									<li>
										<a href="/admin/datacenter/equipmentInfo/?rel=equipmentInfoHome"
										   target="navTab" rel="equipmentInfoHome"
										   title="设备管理">设备管理</a>
									</li>
								</ul>
							</li>
							<li>
								<a>设备数据管理</a>
								<ul>
									<li>
										<a href="/admin/datacenter/cloudBloodGlucoseInfo?ref=cloudBloodGlucoseInfo"
										   target="navTab" rel="cloudBloodGlucoseInfo"
										   title="血糖数据">血糖数据</a>
									</li>
									<li>
										<a href="/admin/datacenter/cloudBloodPressureInfo?ref=cloudBloodPressureInfo"
										   target="navTab" rel="cloudBloodPressureInfo"
										   title="血压数据">血压数据</a>
									</li>
									<li>
										<a href="/admin/datacenter/MedicineCommandInfo?ref=medicineCommandInfo"
										   target="navTab" rel="cloudBloodPressureInfo"
										   title="小药盒数据">小药盒数据</a>
									</li>
								</ul>
							</li>
							<!-- 图片上传-->
							<li>
								<a>图片上传</a>
								<ul>
									<li>
										<a href="/admin/image"
										   target="navTab" rel="imageHome"
										   title="图片上传">图片上传</a>
									</li>
								</ul>

							</li>

							<!-- 有关种子用户  -->
							<li>
								<a>种子用户</a>
								<ul>
									<li>
										<a href="/admin/datacenter/seedUserEquipmentCollectRecord" target="navTab" rel="" title="红包领取">设备领取</a>
									</li>
									<li>
										<a href="/admin/datacenter/seedUserRedpackRecord" target="navTab" rel="" title="红包发放">红包发放</a>
									</li>
									<li>
										<a href="/admin/datacenter/seedUserDeviceDataLog" target="navTab" rel="" title="项目测量">项目测量</a>
									</li>
									<li>
										<a href="/admin/datacenter/seedUserEquipmentCollectRecord/upload" target="navTab" rel="" title="上传excel">上传excel</a>
									</li>
								</ul>
							</li>

							<li>
								<a>康爱多设备</a>
								<ul>
									<li>
										<a href="/admin/datacenter/redpackDeviceRelation" target="navTab" rel="kadDeviceList" title="订单列表">订单列表</a>
									</li>
									<li>
										<a href="/admin/datacenter/redpackDeviceRelation/upload" target="navTab" rel="importKadDevice" title="订单导入">订单导入</a>
									</li>
								</ul>
							</li>

							<li>
								<a>活动基本信息</a>
								<ul>
									<li>
										<a href="/admin/datacenter/activityBaseInfo" target="navTab" rel="" title="活动基本信息">活动基本信息</a>
									</li>
									<li>
										<a href="/admin/datacenter/activityNodeInfo" target="navTab" rel="" title="活动节点">活动节点</a>
									</li>
									<li>
										<a href="/admin/datacenter/activityUserLog" target="navTab" rel="" title="用户活动日志">用户活动日志</a>
									</li>
								</ul>
							</li>

							<!-- 有关微车票活动  -->
							<li>
								<a>微车票12月活动</a>
								<ul>
									<li>
										<a href="/admin/datacenter/activityCodeInfo" target="navTab" rel="" title="活动编码序列">活动编码序列</a>
									</li>
									<li>
										<a href="/admin/datacenter/activityCodeInfo/upload" target="navTab" rel="" title="上传excel">上传excel</a>
									</li>
								</ul>
							</li>
						<li>
                    	<a>微信回复信息</a>
                    		<ul>
                    		 <li>
		                             <a href="/admin/datacenter/wechatSubscribeMsg" target="navTab" rel="" title="首次关注回复">首次关注回复</a>
		                             </li><li>
		                             <a href="/admin/datacenter/ticketSubReplyRelation" target="navTab" rel="" title="渠道关联首次关注推文">渠道关联首次关注推文</a>
		                         </li>
                    		</ul>
                    	</li>
                    	<li>
						<a>sim卡充值</a>
								<ul>
									<li>
										<a href="/admin/datacenter/simRecharge/upload" target="navTab" rel="" title="上传excel">上传excel</a>
									</li>
								</ul>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			</c:if>
			<c:if test="${admin:permission(USER_ID,VERIFY,'permission_config',SELECT) || admin:permission(USER_ID,VERIFY,'ac_config',SELECT) }">
            <div class="accordionHeader">
				<h2 class="collapsable"><span>Folder</span>活动中心</h2>

            </div>
			<div class="accordionContent">
				<ul class="tree treeFolder collapse">
					<li>
						<a>战果管理</a>
						<ul>
							<li>
								<a href="/admin/activity/activityFightAcceptInfo?ref=activityFightAcceptInfo"
								   target="navTab" rel="activityFightAcceptInfo"
								   title="战果信息">战果信息</a>
							</li>
						</ul>
					</li>
					<li>
						<a>分享记录管理</a>
						<ul>
							<li>
								<a href="/admin/activity/shareRecordLog?ref=shareRecordLog"
								   target="navTab" rel="shareRecordLog"
								   title="分享记录">分享记录</a>
							</li>
						</ul>
					</li>
					<li>
						<a>红包池管理</a>
						<ul>
							<li>
								<a href="/admin/activity/activityShareRed?ref=activityShareRed"
								   target="navTab" rel="activityShareRed"
								   title="红包池">红包池</a>
							</li>
						</ul>
					</li>
					<li>
						<a>兑换码管理</a>
						<ul>
							<li>
								<a href="/admin/activity/activityCode?ref=activityCode"
								   target="navTab" rel="activityCode"
								   title="兑换码">兑换码</a>
							</li>
						</ul>
					</li>
					<li>
						<a>广告位管理</a>
						<ul>
							<li>
								<a href="/admin/activity/adPosition/customAnnounce?ref=customAnnounce"
								   target="navTab" rel="customAnnounce"
								   title="自定义公告">自定义公告</a>
							</li>
							<li>
								<a href="/admin/activity/adPosition/customRollPics?ref=customRollPics"
								   target="navTab" rel="customRollPics"
								   title="自定义轮播">自定义轮播</a>
							</li>
							<li>
								<a href="/admin/activity/adPosition/customModules?ref=customModules"
								   target="navTab" rel="customModules"
								   title="自定义模块">自定义模块</a>
							</li>
							<li>	
								<a href="/admin/ucenter/integralExchange?rel=1323"
									target="navTab" rel="1323" title="积分兑换广告位">积分兑换广告位</a></li>
                            </li>
						</ul>
					</li>
					<li>
						<a>运营规则管理</a>
						<ul>
							<li>
								<a href="/admin/activity/operateRuleManage/wechatSportBans?ref=wechatSportBans"
								   target="navTab" rel="wechatSportBans"
								   title="微信运动封号记录">微信运动封号记录</a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
			</c:if>
			<c:if test="${admin:permission(USER_ID,VERIFY,'permission_config',SELECT) || admin:permission(USER_ID,VERIFY,'ai_config',SELECT) }">
			<div class="accordionHeader">
				<h2 class="collapsable"><span>Folder</span>信息流中心</h2>
			</div>
			<div class="accordionContent">
				<ul class="tree treeFolder collapse">
					<li>
						<a>消息管理</a>
						<ul>
							<li>
								<a href="/admin/ai/systemPushInfo?ref=systemPushInfo"
								   target="navTab" rel="systemPushInfo"
								   title="系统信息流推送">系统信息流推送</a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
			</c:if>
			<c:if test="${admin:permission(USER_ID,VERIFY,'permission_config',SELECT) || admin:permission(USER_ID,VERIFY,'mall_config',SELECT) }">
			<div class="accordionHeader">
				<h2 class="collapsable"><span>Folder</span>商城中心</h2>
			</div>
			<div class="accordionContent">
				<ul class="tree treeFolder collapse">
					<li>
						<a>商品</a>
						<ul>
							<li>
								<a href="/admin/mall/goodsBaseInfo/?rel=goodsBaseInfoHome"
								   target="navTab" rel="goodsBaseInfoHome"
								   title="基础信息">基础信息</a>
							</li>
							<li>
								<a href="/admin/mall/goodsRecommend/?rel=goodsRecommendHome"
								   target="navTab" rel="goodsBaseInfoHome"
								   title="页面推荐">页面推荐</a>
							</li>
							<li>
								<a href="/admin/mall/userOrder"
								   target="navTab" rel="userOrderHome"
								   title="订单管理">订单管理</a>
							</li>
							<li>
								<a href="/admin/mall/youzanGoodsInfo?rel=youzanGoodsInfoHome"
								   target="navTab" rel="youzanGoodsInfo"
								   title="有赞商品配置">有赞商品配置</a>
							</li>
						</ul>

					</li>
				</ul>
			</div>
			</c:if>
			<c:if test="${admin:permission(USER_ID,VERIFY,'permission_config',SELECT) || admin:permission(USER_ID,VERIFY,'open_config',SELECT) }">
			<div class="accordionHeader">
				<h2 class="collapsable"><span>Folder</span>开放平台中心</h2>
			</div>
			<div class="accordionContent">
				<ul class="tree treeFolder collapse">
					<li>
						<a>开放平台管理</a>
						<ul>
							<li>
								<a href="/admin/open/openAppInfo/?rel=openAppInfoHome"
								   target="navTab" rel="openAppInfoHome"
								   title="应用管理">应用管理</a>
							</li>
							<li>
								<a href="/admin/open/openInterfaceInfo/?rel=openInterfaceInfoHome"
								   target="navTab" rel="openInterfaceInfoHome"
								   title="接口管理">接口管理</a>
							</li>
							<li>
								<a href="/admin/open/partnerInfo/?rel=partnerInfoHome"
								   target="navTab" rel="partnerInfoHome"
								   title="合作方管理">合作方管理</a>
							</li>
						</ul>

					</li>
				</ul>
			</div>
			</c:if>
			<c:if test="${admin:permission(USER_ID,VERIFY,'permission_config',SELECT) || admin:permission(USER_ID,VERIFY,'stastic_config',SELECT) }">
			<div class="accordionHeader">
				<h2 class="collapsable"><span>Folder</span>用户行为中心</h2>
			</div>
			<div class="accordionContent">
				<ul class="tree treeFolder collapse">
					<li>
						<a>用户统计</a>
						<ul>
							<li>
								<a href="/admin/stastic/usersInDay/stastic?rel=user"
								   target="navTab" rel="user"
								   title="概况">概况</a>
							</li>
							<li>
								<a href="/admin/stastic/user/new/add/list?rel=add&type=added_users"
								   target="navTab" rel="add"
								   title="每日新增">每日新增</a>
							</li>
							<li>
								<a href="/admin/stastic/user/activation/list?rel=activation&type=activation_users"
								   target="navTab" rel="activation"
								   title="激活用户">激活用户</a>
							</li>
							<li>
								<a href="/admin/stastic/user/active/list?rel=active&type=active_users"
								   target="navTab" rel="active"
								   title="活跃用户">活跃用户</a>
							</li>
							<li>
								<a href="/admin/stastic/user/unfollow/list?rel=unfollow&type=unfollow_users"
								   target="navTab" rel="unfollow"
								   title="每日取消关注">每日取消关注</a>
							</li>
							<li>
								<a href="/admin/stastic/user/silent/list"
								   target="navTab" rel=""
								   title="沉默用户">沉默用户</a>
							</li>
							<li>
								<a href="/admin/stastic/user/bleeding/list"
								   target="navTab" rel=""
								   title="流失用户">流失用户</a>
							</li>
							<li>
								<a href="/admin/stastic/user/familyInfo"
								   target="navTab" rel="family"
								   title="家庭统计">家庭统计</a>
							</li>
						</ul>

					</li>
					<li>
						<a>测量统计</a>
						<ul>
							<li>
								<a href="/admin/stastic/measure?rel=measure"
								   target="navTab" rel="measure"
								   title="总体数据">总体数据</a>
								<a href="/admin/stastic/measure?dataTypeId=1&rel=measureBp"
								   target="navTab" rel="measureBp"
								   title="血压数据">血压测量</a>
								<a href="/admin/stastic/measure?dataTypeId=2&rel=measureBg"
								   target="navTab" rel="measureBg"
								   title="血糖测量">血糖测量</a>
								<a href="/admin/stastic/measure?dataTypeId=3&rel=measureWeight"
								   target="navTab" rel="measureWeight"
								   title="体重测量">体重测量</a>
							</li>
						</ul>
					</li>
					<li>
						<a>红包统计</a>
						<ul>
							<li>
								<a href="/admin/stastic/redpackBgInDay/home?dataTypeId=2&rel=redpackBg&flag=1"
								   target="navTab" rel="redpackBg"
								   title="血糖红包">血糖红包</a>

								<a href="/admin/stastic/redpackBpInDay/home?dataTypeId=1&rel=redpackBp&flag=1"
								   target="navTab" rel="redpackBp"
								   title="血压红包">血压红包</a>

								<a href="/admin/stastic/redpackWeightInDay/home?dataTypeId=3&rel=redpackWeight&flag=1"
								   target="navTab" rel="redpackWeight"
								   title="体重红包">体重红包</a>
							</li>
						</ul>
					</li>
					<li>
						<a>活动统计</a>
						<ul>
							<li>
								<a href="/admin/stastic/activityStastic?rel=activity" target="navTab" rel="activity"
								   title="登山活动">登山活动</a>
							</li>
						</ul>
					</li>
					<li>
						<a href="/admin/stastic/messageInDay?rel=message" target="navTab" rel="message"
						   title="消息统计">消息统计</a>
					</li>

					<li>
						<a href="/admin/stastic/userEquipmentRelation/home?rel=equipment" target="navTab" rel="equipment"
						   title="设备统计">设备统计</a>
					</li>

				</ul>
			</div>
			</c:if>
			<c:if test="${admin:permission(USER_ID,VERIFY,'permission_config',SELECT) || admin:permission(USER_ID,VERIFY,'uc_config',SELECT) }">
			<div class="accordionHeader">
				<h2 class="collapsable"><span>Folder</span>用户中心</h2>
			</div>
			<div class="accordionContent">
				<ul class="tree treeFolder collapse">
					<li><a href="" title="用户管理">用户管理</a>
						<ul>
							<li><a
									href="/admin/ucenter/user/familymember?rel=1123"
									target="navTab" rel="1123" title="家庭成员管理">家庭成员管理</a></li>
							<li><a
									href="/admin/ucenter/seedUserInfo"
									target="navTab" rel="/admin/seedUserInfo" title="">种子用户信息</a></li>
						</ul></li>

					<li><a href="" title="评价管理">评价管理</a>
						<ul>
							<li><a
									href="/admin/ucenter/user/feedback?rel=1281"
									target="navTab" rel="1281" title="投诉/意见">投诉/意见</a></li>
						</ul></li>

					<li><a href="" title="任务管理">任务管理</a>
						<ul>
							<li><a
									href="/admin/ucenter/actionInfo?rel=1321"
									target="navTab" rel="1321" title="动作配置">动作配置</a></li>

							<li><a
									href="/admin/ucenter/taskInfo?rel=1322"
									target="navTab" rel="1322" title="任务管理">任务管理</a></li>

							<li><a
									href="/admin/ucenter/subFlowInfo?rel=1323"
									target="navTab" rel="1323" title="子线管理">子线管理</a></li>

							<li><a
									href="/admin/ucenter/totalFlowInfo?rel=1324"
									target="navTab" rel="1324" title="主线管理">主线管理</a></li>
						</ul></li>

					<li><a href="" title="积分商城">积分商城</a>
						<ul>
							<li><a
									href="/admin/ucenter/integralPromotionGoodsRelation?rel=1342"
									target="navTab" rel="1342" title="积分兑换物品">积分兑换物品</a></li>

							<li><a
									href="/admin/ucenter/userIntegralMoneyRelation?rel=1343"
									target="navTab" rel="1343" title="兑换比例配置">兑换比例配置</a></li>

							<li><a
									href="/admin/ucenter/integralConsumeRelation?rel=1344"
									target="navTab" rel="1344" title="消费比例配置">消费比例配置</a></li>

							<li><a
									href="/admin/ucenter/userIntegralRecord?rel=1345"
									target="navTab" rel="1345" title="积分获得列表">积分获得列表</a></li>

							<li><a
									href="/admin/ucenter/userIntegralConsumeRecord?rel=1346"
									target="navTab" rel="1346" title="积分消费列表">积分消费列表</a></li>
                        </ul></li>
					<li><a href="" title="用户荣誉">用户荣誉</a>
						<ul>
							<li><a
									href="/admin/ucenter/userHonorLevel?rel=1481"
									target="navTab" rel="1481" title="等级管理">等级管理</a></li>

							<li><a
									href="/admin/ucenter/userHonorLog?rel=1482"
									target="navTab" rel="1482" title="用户等级">用户等级</a></li>

							<li><a
									href="/admin/ucenter/userHonorScore?rel=1483"
									target="navTab" rel="1483" title="用户分值">用户分值</a></li>

							<li><a
									href="/admin/ucenter/userHonorScoreLog?rel=1484"
									target="navTab" rel="1484" title="分值日志">分值日志</a></li>
						</ul></li>
					<li><a title="通讯管理">通讯管理</a>
						<ul>
							<li><a
									href="/admin/ucenter/sms/index.html?rel=1202"
									target="navTab" rel="1202" title="短信下发">短信下发</a></li>
						</ul></li>
					<li><a href="" title="钱包管理">钱包管理</a>
						<ul>
							<li><a
									href="/admin/ucenter/userWalletRecord?rel=wall"
									target="navTab" rel="wall" title="钱包记录">钱包记录</a></li>
							<li><a
									href="/admin/ucenter/userWalletBalanceClearRecord?rel=wallClear"
									target="navTab" rel="wallClear" title="钱包清理记录">钱包清理记录</a></li>
						</ul>
					</li>
				</ul>
			</div>
			</c:if>
			<c:if test="${admin:permission(USER_ID,VERIFY,'permission_config',SELECT) || admin:permission(USER_ID,VERIFY,'wxpay_config',SELECT) }">
			<div class="accordionHeader">
				<h2 class="collapsable"><span>Folder</span>支付中心</h2>
			</div>
			<div class="accordionContent">
				<ul class="tree treeFolder collapse">
					<li>
						<a href="" title="微信支付">微信支付</a>
						<ul>
							<li>
								<a href="/admin/wxpay/WXUnifiedorder?rel=1444" target="navTab" rel="1444" title="统一下单">统一下单</a>
							</li>

							<li>
								<a href="/admin/wxpay/WXCloseorder?rel=1445" target="navTab" rel="1445" title="关闭记录">关闭记录</a>
							</li>

							<li>
								<a href="/admin/wxpay/WXRefund?rel=1446" target="navTab" rel="1446" title="退款记录">退款记录</a>
							</li>

							<li>
								<a href="/admin/wxpay/WXNotifyOrder?rel=1447" target="navTab" rel="1447" title="付款通知">付款通知</a>
							</li>
						</ul>
					</li>
					<li>
						<a href="" title="微信红包">微信红包</a>
						<ul>
							<li>
								<a href="/admin/wxpay/red?rel=1441" target="navTab" rel="1441" title="红包管理">红包管理</a>
							</li>

							<li>
								<a href="/admin/wxpay/redPackResult?rel=1442" target="navTab" rel="1442" title="领取结果">领取结果</a>
							</li>
							<li>
								<a href="/admin/wxpay/red/user/list" target="navTab" rel="998" title="用户信息">用户信息</a>
							</li>
							<c:if test="${admin:permission(USER_ID,VERIFY,'paycenter_redpack',ADD) }">
								<li>
									<a href="/admin/wxpay/red/user/list" target="navTab" rel="999" title="红包补发">红包补发</a>
								</li>
							</c:if>
						</ul>
					</li>
					<li>
						<a href="" title="订单管理">订单管理</a>
						<ul>
							<li>
								<a href="/admin/wxpay/userOrder?rel=1461" target="navTab" rel="1461" title="订单列表">订单列表</a>
							</li>

							<!-- <li>
                                <a href="/admin/orderLog?rel=1462" target="navTab" rel="1462" title="订单日志">订单日志</a>
                            </li> -->
						</ul>
					</li>
					
				</ul>
			</div>
			</c:if>
			<c:if test="${admin:permission(USER_ID,VERIFY,'permission_config',SELECT) || admin:permission(USER_ID,VERIFY,'wxxk_config',SELECT) }"> 
			<div class="accordionHeader">
				<h2 class="collapsable"><span>Folder</span>相框中心</h2>
			</div>
			<div class="accordionContent">
				<ul class="tree treeFolder collapse">
					<li>
						<a>订单管理</a>
						<ul>
                			<li>
                				<a href="/admin/tmp/orders/?rel=orderHome" 
                					target="navTab" rel="orderHome" 
                					title="订单管理">订单管理</a>
                			</li>
						</ul>
						</li>
			</div>
			</c:if>
        </div>
    </div>
</div>
<div id="container">
    <div id="navTab" class="tabsPage">
        <div class="tabsPageHeader">
            <div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
                <ul class="navTab-tab">
                    <li tabid="main" class="main"><a href="javascript:;"><span><span
                            class="home_icon">首页</span></span></a></li>
                </ul>
            </div>
            <div class="tabsLeft">left</div>
            <!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
            <div class="tabsRight">right</div>
            <!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
            <div class="tabsMore">more</div>
        </div>
        <!--<ul class="tabsMoreList">
            <li><a href="javascript:;">我的主页</a></li>
        </ul>
        -->
        <div class="navTab-panel tabsPageContent layoutBox">
            <div class="page unitBox">
                <div class="pageFormContent" layoutH="80" style="margin-right:230px">
                </div>
            </div>

        </div>
    </div>
</div>

</div>

<div id="footer">Copyright &copy; 2010 <a href="demo_page2.html" target="dialog">JAVA项目组</a></div>

<script type="text/javascript">
<!--
$(function() {
	//alert('当前操作的是【${currentHost }】！' );
});
//-->
</script>
</body>

</html>