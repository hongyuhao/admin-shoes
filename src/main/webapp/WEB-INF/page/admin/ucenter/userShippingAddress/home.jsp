<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<!-- <script type="text/javascript" src="/js/core/nav_tab_util.js"></script>  -->
<form id="pagerForm" method="post" action="/admin/ucenter/address">
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pageTurn.page?1:pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${numPerPage }" />
	<input type="hidden" value="${eqUserId}" name="eqUserId" />
	<input type="hidden" value="${eqAccountName}" name="eqAccountName" />
	<input type="hidden" value="${gtUpdateTime}" name="gtCreateTime" />
	<input type="hidden" value="${ltUpdateTime}" name="ltCreateTime" />
	<input type="hidden" value="${eqPhone}" name="eqPhone" />
	<input type="hidden" value="${eqEmail}" name="eqEmail" />
	<input type="hidden" value="${eqStatus}" name="eqStatus" />
	<input type="hidden" value="${eqSource}" name="eqSource" />
	<input type="hidden" value="${eqContacts}" name="eqContacts" />
	<input type="hidden" value="${eqContactNumber}" name="eqContactNumber" />
	<input type="hidden" value="${rel==null ? parentRel : rel}" name="parentRel">
</form>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="/admin/ucenter/address" method="post">
	<input type="hidden" value="${rel==null ? parentRel : rel}" name="parentRel">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					用户名: <input type="text" value="${eqAccountName}" onBlur="$(this).val(jQuery.trim($(this).val()));" name="eqAccountName" ></input>
				</td>
				<td>
					用户手机: <input type="text" value="${eqPhone}" onBlur="$(this).val(jQuery.trim($(this).val()));" name="eqPhone" ></input>
				</td>
				<td>
					用户邮箱: <input type="text" value="${eqEmail}" onBlur="$(this).val(jQuery.trim($(this).val()));" name="eqEmail" ></input>
				</td>
				<td>
					收货人: <input type="text" value="${eqContacts}" onBlur="$(this).val(jQuery.trim($(this).val()));" name="eqContacts" ></input>
				</td>
				<td>
					收货人手机: <input type="text" value="${eqContactNumber}" onBlur="$(this).val(jQuery.trim($(this).val()));" name="eqContactNumber" ></input>
				</td>
			</tr>
			<tr>
				
				<td>
					<div style="float: left;">地址状态: </div><div style="float: left;"><select name="eqStatus">
							<option value="">--请选择--</option>
								<option value="1" ${eqStatus==1?'selected':'' }>正常</option>
								<option value="0" ${eqStatus==0?'selected':'' }>已屏蔽</option>
						</select></div>
				</td>
				<%-- <td>
					<div style="float: left;">平台来源:</div><div style="float: left;"><select name="eqSource">
						<option value="">--请选择--</option>
						<c:forEach items="${orderSourceMap }" var="order">
							<option value="${order.key }" ${eqSource==order.key?'selected=selected':'' }>${order.value }</option>
						</c:forEach>
					</select></div>
				</td> --%>
				<td colspan="2">
					<table><tr>
					<td>最近操作时间:</td>
					<td>
						<input type="text" value="${gtUpdateTime}" name="gtUpdateTime" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true" style="float:left;"/>
						<!-- <a class="inputDateButton" href="javascript:;" style="float:left;">选择</a> -->
					</td>
					<td>~</td>
					<td>
						<input type="text" value="${ltUpdateTime}" style="float:left;" name="ltUpdateTime" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true"/>
						<!-- <a class="inputDateButton" href="javascript:;" style="float:left;">选择</a> -->
					</td></tr></table>
				</td>
				<td>
					<div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div>
				</td>
			</tr>
		</table>
	</div>
	</form>

</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
		    <!-- <permission:permission url="/admin/ucenter/tagBaseInfo/edit"> -->
			     <li><a class="edit" href="/admin/ucenter/address/restore?parentRel=${rel==null ? parentRel : rel}" target="selectedTodo" title="恢复地址"><span>恢复</span></a></li>
			<!-- </permission:permission> -->
			<!-- <permission:permission url="/admin/ucenter/tagBaseInfo/delete"> -->
			<li><a class="delete" href="/admin/ucenter/address/delete?parentRel=${rel==null ? parentRel : rel}" posttype="string" target="selectedTodo" ><span>屏蔽</span></a></li>
			<!-- </permission:permission> -->
		</ul>
	</div>
	<table class="table" width="130%" layoutH="155">
		<thead>
			<tr>
				<th><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th>用户名</th>
				<th>用户手机号码</th>
				<th>用户邮箱</th>
				<th>省</th>
				<th>市</th>
				<th>区</th>
				<th>详细 地址</th>
				<th>邮编</th>
				<th>收货人</th>
				<th>收货人手机</th>
				<th>收货人固话</th>
				<th>地址状态</th>
				<!-- <th>平台来源</th> -->
				<th>最近操作时间</th>
				<th width="122px">操作</th>
			</tr>
		</thead>
		<tbody>
				<c:choose>
					<c:when test="${null==userShippingAddressList||userShippingAddressList.isEmpty()}">
						<tr class="tatr2">
							<td colspan="11" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="address" items="${userShippingAddressList}">
							<tr target="sid_user" rel="${address.id}">
								<td><input name="ids" value="${address.id}" type="checkbox" /></td>
								<td>${address.accountName}</td>	
								<td>${address.isPhoneValid==1?address.phone:'无'}</td>
								<td>${address.isEmailValid==1?address.email:'无'}</td>
								<td>${address.province}</td>
								<td>${address.city}</td>
								<td>${address.district}</td>
								<td>${address.fullAddress}</td>
								<td>${address.postcode}</td>
								<td>${address.contacts}</td>
								<td>${address.contactNumber}</td>
								<td>${address.telNumber}</td>
								<td>${address.status==1?'正常':'已屏蔽'}</td>	
								<%-- <td>${orderSourceMap[address.source]}</td> --%>	
								<td>${address.updateTime}</td>
								<td>
									<%-- <a title="查看" rel="${family.id}" target="dialog" href="/admin/ucenter/tagBaseInfo/edit?id=${family.id}&isdel=0&oper=view" class="btnView" width="750" height="320">详情</a> --%>
									<a title="编辑" rel="${address.id}" target="dialog" mask="true" href="/admin/ucenter/address/edit?id=${address.id}&oper=edit&parentRel=${rel==null ? parentRel : rel}" class="btnEdit" width="750" height="320">编辑</a>
									<a title="恢复" rel="${address.id}" href="/admin/ucenter/address/restore?ids=${address.id}&parentRel=${rel==null ? parentRel : rel}" class="btnAdd" target="ajaxTodo">恢复</a>
									<a title="删除" target="ajaxTodo" href="/admin/ucenter/address/delete?ids=${address.id}&parentRel=${rel==null ? parentRel : rel}" class="btnDel">屏蔽</a>
								</td>							
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	<div style="clear:both"></div>
    <div class="panelBar">
        <%@ include file="/inc/admin_pagination.jsp" %>
    </div>