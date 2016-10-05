<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<form id="pagerForm" method="post" action="/admin/mall/customerBindedInfo">
	<input type="hidden" id="pageNum" name="pageNum" value="${null == pageTurn.page?1:pageTurn.page }" />
	<input type="hidden" name="numPerPage" value="${numPerPage }" />
	<input type="hidden" value="${eqId}" name="eqId" />
	<input type="hidden" value="${likeBindPhone}" name="likeBindPhone" />
	<input type="hidden" name="rel" value="${rel}"/>
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="/admin/mall/customerBindedInfo" method="post">
	<input type="hidden" name="rel" value="${rel}"/>
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					ID: <input type="text" value="${eqId}" name="eqId"></input>
				</td>
				<td>
					手机号码: <input type="text" value="${likeBindPhone}" name="likeBindPhone" ></input>
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
			<li><a class="add" href="/admin/mall/customerBindedInfo/edit" target="dialog" rel="editTag" mask="true" title="新增" width="620" height="500"><span>新增</span></a></li>
		</ul>
	</div>
	<table class="list" width="100%" layoutH="100">
		<thead>
			<tr>
				<th>ID<label style="float:left"><input type="checkbox" class="checkboxCtrl" group="inIdList" /></label></th>
				<th>设备</th>
				<th>设备sn</th>
				<th>手机号码</th>
				<th>可联系用户的时间</th>
				<th>操作</th>
				<th>状态</th>
			</tr>
		</thead>
		<tbody>
				<c:choose>
					<c:when test="${null==customerBindedInfoList||customerBindedInfoList.isEmpty()}">
						<tr class="tatr2">
							<td colspan="11" align="center">暂无数据</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="o" items="${customerBindedInfoList}">
							<tr target="id" rel="${o.id}">
								<td>
									<input type="checkbox" name="inIdList" id="inIdList" value="${o.id}"/>${o.id}
								</td>
								<td class="equipmentId" value="${o.equipmentId}">${o.equipmentName}</td>
								<td class="equipmentSn">${o.equipmentSn}</td>
								<td class="bindPhone">${o.bindPhone}</td>
								<td>${o.callTime }</td>
								<td>
								<a class="binding" title="绑定" href="javascript:" rel="${rel}"  width="650" height="550"><span>${o.status == 0 ?"绑定":""}</span></a>
								</td>
								<td>${o.status == 0 ?"未处理":"已处理"}</td>
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

 <script type="text/javascript">
    $('.binding').click(function(){
    	td = $(this).parent();
    	equipmentId = td.siblings().filter('.equipmentId').attr("value");
    	equipmentSn = td.siblings().filter('.equipmentSn').text();
    	bindPhone = td.siblings().filter('.bindPhone').text();
    	params = {
    			id : td.parent().attr('rel'),
    			equipmentId : equipmentId,
    			equipmentSn : equipmentSn,
    			phone : bindPhone,
    			rel : '${rel}'
    	};
    	_this = $(this);
    	$.ajax({ 
    		url: "/admin/mall/customerBindedInfo/binding.jsonp",
    		type:"post",
    		dataType: 'json',
    		data: params, 
    		success: function(json){
    			processBack(json);
            }
    	});
    });
    
    function processBack(json){
    	if(json.message=="success"){
    		alertMsg.correct(json.message);
    	}else{
    		alertMsg.error(json.message);
    	}
    	navTab.reload("${path }/admin/mall/customerBindedInfo?rel=${rel}", "");
    }
 </script>