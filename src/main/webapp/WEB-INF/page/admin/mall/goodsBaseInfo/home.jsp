<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="/admin/mall/goodsBaseInfo">
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pageTurn.page?1:pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${numPerPage }" />
	<input type="hidden" value="${eqId}" name="eqId" />
	<input type="hidden" value="${likeTitle}" name="likeTitle" />
	<input type="hidden" value="${eqIsPrescription}" name="eqIsPrescription">
	<input type="hidden" name="rel" value="${rel}"/>
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="/admin/mall/goodsBaseInfo" method="post">
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
			 <li><a class="add" href="/admin/mall/goodsBaseInfo/addFullGoods" target="dialog" rel="editTag" mask="true" width="620" height="500"><span>新增</span></a></li>
		     <li><a title="确定要删除吗" class="delete" href="/admin/mall/goodsBaseInfo/delete" target="selectedTodo" rel="inIdList" ><span>删除</span></a></li>
		</ul>
	</div>
	<table class="list" width="100%" layoutH="100">
		<thead>
			<tr>
				<th>ID<label style="float:left"><input type="checkbox" class="checkboxCtrl" group="inIdList" /></label></th>
				<th>标题</th>
				<th>类型</th>
				<th>封面图片</th>
				<th>批准文号</th>
				<th>厂商</th>
				<th>是否处方药</th>
				<th>剂型</th>
				<th>状态</th>
				<th>操作</th>
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
							<tr target="id" rel="${o.id}">
								<td><input name="inIdList" value="${o.id}" type="checkbox" />${o.id}</td>
								<td>
									标题：${o.title}
									<c:if test="${not empty o.subTitle }">
										<br/>副标题：${o.subTitle }
									</c:if>
									<c:if test="${not empty o.gennericName }">
										<br/>通用名：${o.gennericName }
									</c:if>
								</td>
								<td>${GOODS_TYPE_MAP[o.goodsType]}</td>
								<td><img src="${o.coverImgUrl}" width="60" height="60"/></td>
								<td>${o.approvalNumber }</td>
								<td>${o.manufacturer }</td>
								<td>${GOODS_PRESCRIPTION_TYPE_MAP[o.isPrescription] }</td>
								<td>${o.dosageForm }</td>
								<td>${AUDIT_STATUS_MAP[o.status]}</td>
								<td>
									<a title="药品：${o.title}" rel="goodsBaseInfoEdit" target="dialog" mask="true" href="/admin/mall/goodsBaseInfo/edit?id=${o.id}&parentRel=${rel==null ? parentRel : rel}" width="900" height="620">编辑</a>
									<a title="药品：${o.title}" rel="goodsCategoryRelation" target="navTab" mask="true" href="/admin/mall/goodsCategoryRelation/?eqGoodsId=${o.id}">分类</a>
									<a title="药品：${o.title}" rel="partnerGoodsInfoList" target="navTab" mask="true" href="/admin/mall/partnerGoodsInfo/?eqGoodsId=${o.id}">运营</a>
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