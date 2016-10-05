<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
	
</script>

<form id="pagerForm" method="post" action="${path }/admin/ucenter/integralPromotionGoodsRelation">
	<input type="hidden" name="eqType" value="${eqType }" />
	<input type="hidden" name="eqLevelId" value="${eqLevelId }" />
	<input type="hidden" name="eqRelationType" value="${eqRelationType }" />
	<input type="hidden" name="pageNum" value="${pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${pageTurn.pageSize }" />
	<input type="hidden" name="rel" value="${rel }" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${path }/admin/ucenter/integralPromotionGoodsRelation" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
                    <label>类型：</label>
                    <select name="eqType" class="combox">
                    	<option value="">请选择</option>
	                    <c:forEach var="item" items="${integralExchangeTypeMap}">   
							<option value="${item.key }" ${eqType == item.key ? 'selected=selected' : ''}>${item.value}</option>
						</c:forEach> 
                    </select>
                </td>
                <td>
                    <label>对照类型：</label>
                    <select id="eqRelationType" name="eqRelationType" class="combox">
                    	<option value="">请选择</option>
	                    <c:forEach var="item" items="${integralExchangeTargetMap}">   
							<option value="${item.key }" ${eqRelationType == item.key ? 'selected=selected' : ''}>${item.value}</option>
						</c:forEach> 
                    </select>
                </td>
                <td>
                	<label>会员等级：</label>
                    <select id="eqLevelId" name="eqLevelId" class="combox">
                    	<option value="">请选择</option>
						<c:forEach var="item" items="${userTypeMap}">   
							<option value="${item.key }" ${eqLevelId == item.key ? 'selected=selected' : ''}>${item.value}</option>
						</c:forEach> 
					</select>
				</td>
				<td>
					<div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div>
				</td>
			</tr>
		</table>
	</div>
	</form>
</div>

<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="${path }/admin/ucenter/integralPromotionGoodsRelation/edit.do?rel=${rel}" rel="${rel}" target="dialog" width="610" height="500"><span>添加</span></a></li>
			<li><a class="delete" href="${path }/admin/ucenter/integralPromotionGoodsRelation/delete.do?rel=${rel}" target="selectedTodo" rel="${ids}" title="确定删除?"><span>删除</span></a></li>
		</ul>
	</div>
	<div layoutH="90">
        <table class="table" width="100%">
            <thead>
			<tr>
				<th>ID<label style="float:left"><input type="checkbox" class="checkboxCtrl" group="ids" /></label></th>
				<th>类型</th>
				<th>对照id</th>
				<th>积分值</th>
				<th>金额</th>
				<th>描述</th>
				<th>对照类型</th>
				<th>等级</th>
				<th>所属栏目</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody> 
  			<c:choose>
				<c:when test="${null == integralPromotionGoodsRelationList || integralPromotionGoodsRelationList.isEmpty()}">
					<tr class="tatr2">
						<td colspan="9" align="center">暂无数据</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${integralPromotionGoodsRelationList}" var="object">
						<tr><td>
							<input type="checkbox" name="ids" id="ids" value="${object.id}"/>${object.id}
						</td>
						<td>
							${integralExchangeTypeMap.get(object.type)}
						</td>
						<td>
							${object.relationId}
						</td>
						<td>
							${object.integralNum }
						</td>
						<td>
							${object.money }
						</td>
						<td>
							${object.remark }
						</td>
						<td>
							${integralExchangeTargetMap.get(object.relationType)}
						</td>
						<td>
							${null == object.levelId ? '' : userTypeMap.get(object.levelId)}
						</td>
						<td>
							${integralExchangeColumnMap[object.columnId]}
						</td>
						<td>
							<a class="btnEdit" href="${path }/admin/ucenter/integralPromotionGoodsRelation/edit.do?id=${object.id }&rel=${rel}" target="dialog" rel="${rel}" width="610" height="500"><span>修改</span></a>
						</td></tr>
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
</div>

