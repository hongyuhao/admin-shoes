<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<%@ include file="/inc/drawChartLine.jsp"%>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="/admin/stastic/messageInDay?rel=${rel }" method="post">
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						开始时间: <input  type="text" name="start" class="date" dateFmt="yyyy-MM-dd" value="${start}" style="width:180px"/>
 
					</td>
					<td>
						结束时间: <input  type="text" name="end" class="date" dateFmt="yyyy-MM-dd" value="${end}" style="width:180px"/>
					</td>
					<td>
						<div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div>
					</td>
				</tr>
			</table>
		</div>
	</form>
</div>

<div class="pageContent" >
	<div id="chart_msg" style="min-width: 300px; height: 300px;"></div>
	<div class="tabs">
		<div class="tabsHeader">
			<div class="tabsHeaderContent">
				<ul>
					<li><a href="/admin/stastic/messageInDay/subList?rel=all${rel }&start=${start}&end=${end}&targetTab=jbsxBox" target="ajax" rel="jbsxBox"><span>全部</span></a></li>
					<li><a href="/admin/stastic/messageAlertSportInDay/subList?rel=sport${rel }&start=${start}&end=${end}&targetTab=authMsgBox" target="ajax" rel="authMsgBox"><span>运动授权</span></a></li>
					<li><a href="/admin/stastic/messagePromptInDay/subList?rel=prompt${rel }&start=${start}&end=${end}&targetTab=promptMsgBox" target="ajax" rel="promptMsgBox"><span>催</span></a></li>
					<li><a href="/admin/stastic/messagePraiseInDay/subList?rel=praise${rel }&start=${start}&end=${end}&targetTab=praiseMsgBox" target="ajax" rel="praiseMsgBox"><span>赞</span></a></li>
					<li><a href="/admin/stastic/messageAskInDay/subList?rel=ask${rel }&start=${start}&end=${end}&targetTab=askMsgBox" target="ajax" rel="askMsgBox"><span>询问</span></a></li>
					<li><a href="/admin/stastic/messageAbnormalAlertInDay/subList?rel=abnormal${rel}&start=${start}&end=${end}&targetTab=abnormalMsgBox" target="ajax" rel="abnormalMsgBox"><span>系统异常提醒</span></a></li>
					<li><a href="/admin/stastic/messageUntestAlertInDay/subList?rel=untest${rel}&start=${start}&end=${end}&targetTab=untestMsgBox" target="ajax" rel="untestMsgBox"><span>系统未测量</span></a></li>
				</ul>
			</div>
		</div>
		<div class="tabsContent" style="height:250px;">
			<div>
				<div id="jbsxBox" class="unitBox">
				</div>
			</div>
			
			<div>
				<div id="authMsgBox" class="unitBox">
				</div>
			</div>
			
			<div>
				<div id="promptMsgBox" class="unitBox">
				</div>
			</div>
			<div><div id="praiseMsgBox" class="unitBox">
				</div></div>
			<div><div id="askMsgBox" class="unitBox">
				</div></div>
			<div><div id="abnormalMsgBox" class="unitBox">
				</div></div>
			<div><div id="untestMsgBox" class="unitBox">
				</div></div>
		</div>
		<div class="tabsFooter">
			<div class="tabsFooterContent"></div>
		</div>
	</div>
</div>

<script>
	$("#jbsxBox").loadUrl('/admin/stastic/messageInDay/subList?rel=all${rel }&start=${start}&end=${end}&targetTab=jbsxBox',{}, function(){});
</script>