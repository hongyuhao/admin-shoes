<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="/admin/mall/youzanGoodsInfo">
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pageTurn.page?1:pageTurn.page}" />
	<input type="hidden" name="numPerPage" value="${numPerPage}" />
	<input type="hidden" name="rel" value="${rel}"/>
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="/admin/mall/youzanGoodsInfo" method="post">
	<input type="hidden" name="rel" value="${rel}"/>
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					商品名: <input type="text" value="${lkGoodsName}" name="lkGoodsName"></input>
				</td>
				<td>
					<label>合作方:</label>
                    <select name="eqPartnerId" id="partnerId">
                        <option value="">不限</option>
                        <c:forEach items="${partnerIdMap}" var="entry">
                            <option value="${entry.key}">${entry.value}</option>
                        </c:forEach>
                    </select>
                    <script type="text/javascript">
                    	jQuery('#partnerId').val("${eqPartnerId}");
					</script>
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
	      <li><a class="add" href="/admin/mall/youzanGoodsInfo/edit" target="dialog" rel="editTag" mask="true" title="新增" width="620" height="500"><span>新增</span></a></li>
			<li><a class="delete" href="/admin/mall/youzanGoodsInfo/delete?rel=${rel}" target="selectedTodo" rel="inIdList" title="确定删除?"><span>删除</span></a></li>
	   </ul>
	</div>
	<table class="list" width="100%" layoutH="85">
		<thead>
			<tr>
				<th>id<label style="float:left"><input type="checkbox" class="checkboxCtrl" group="inIdList" /></label></th>	
				<th>商品id</th>
				<th>商品名</th>
				<th>价格</th>
				<th>有赞链接</th>
				<th>合作方</th>
				<th>合作方链接</th>
				<th>商品封面图片</th>
				<th>创建时间</th>
				<th>商品外链</th>
<!-- 				<th>操作</th> -->
			</tr>
		</thead>
		<tbody>
				<c:choose>
					<c:when test="${null==youzanGoodsInfoList||youzanGoodsInfoList.isEmpty()}">
						<tr class="tatr2">
							<td colspan="11" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="o" items="${youzanGoodsInfoList}">
							<tr target="id" rel="${o.id}">
								<td>
									<input type="checkbox" name="inIdList" id="inIdList" value="${o.id}"/>${o.id}
								</td>
								<td>${o.goodsId}</td>
								<td>${o.goodsName}</td>
								<td>${o.salePrice}</td>
								<td>${o.youzanUrl}</td>
								<td>${partnerIdMap.get(o.partnerId)}</td>
								<td>${o.partnerUrl}</td>
								<td><img src="${o.coverImgUrl}" width="60" height="60"/></td>
								<td><fmt:formatDate value="${o.createTime }" pattern="yyyy-MM-dd HH:mm" /></td>
								<td>${o.redirectUrl}</td>
<%-- 								<td><a title="修改" target="dialog" href="${path}/admin/mall/youzanGoodsInfo/edit?id=${o.id}&rel=${rel}" rel="${rel}"  width="610" height="550"><span>修改</span></a>&nbsp;</td> --%>
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