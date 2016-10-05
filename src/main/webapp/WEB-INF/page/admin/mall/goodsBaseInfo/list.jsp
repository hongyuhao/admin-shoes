<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="/admin/mall/goodsBaseInfo">
	<input type="hidden" name="type" value="lookup"/>
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pageTurn.page?1:pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${numPerPage }" />
	<input type="hidden" value="${eqId}" name="eqId" />
	<input type="hidden" value="${likeTitle}" name="likeTitle" />
	<input type="hidden" value="${eqIsPrescription}" name="eqIsPrescription">
	<input type="hidden" name="rel" value="${rel}"/>
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return dialogSearch(this);" action="/admin/mall/goodsBaseInfo" method="post">
		<input type="hidden" name="type" value="lookup"/>
		<input type="hidden" name="rel" value="${rel}"/>
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						ID: <input type="text" value="${eqId}" name="eqId"/>
					</td>
					<td>
						标题: <input type="text" value="${likeTitle}" name="likeTitle" />
					</td>
					<td>
						是否为处方药: 	<select name="eqIsPrescription" id="eqIsPrescription">
										<option value="">请选择</option>
										<c:forEach var="o" items="${GOODS_PRESCRIPTION_TYPE_MAP}">
											<option value="${o.key }">${o.value }</option>
										</c:forEach>
									</select>
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
			<!-- <li><a class="add" href="/admin/mall/goodsBaseInfo/edit" target="dialog" rel="editTag" mask="true" title="新增" width="620" height="500"><span>新增</span></a></li> -->
		</ul>
	</div>
	<table class="list" width="100%" layoutH="100">
		<thead>
			<tr>
				<th>标题</th>
				<th>类型</th>
				<th>封面图片</th>
				<th>批准文号</th>
				<th>厂商</th>
				<th>是否处方药</th>
				<th>剂型</th>
				<th>状态</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
				<c:choose>
					<c:when test="${null==goodsBaseInfoList||goodsBaseInfoList.isEmpty()}">
						<tr class="tatr2">
							<td colspan="11" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="o" items="${goodsBaseInfoList}">
							<tr>
								<td>
									标题：${o.title}<br/>
									副标题：${o.subTitle }<br/>
									通用名：${o.gennericName }
								</td>
								<td>${GOODS_TYPE_MAP[o.goodsType]}</td>
								<td><img src="${o.coverImgUrl}" width="60" height="60"/></td>
								<td>${o.approvalNumber }</td>
								<td>${o.manufacturer }</td>
								<td>${GOODS_PRESCRIPTION_TYPE_MAP[o.isPrescription] }</td>
								<td>${o.dosageForm }</td>
								<td>${AUDIT_STATUS_MAP[o.status]}</td>
								<td>
									<a class="btnSelect" href="javascript:$.bringBack({goodsId:${o.id }, goodsTitle:'${o.title }'});" title="查找带回">选择</a>
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