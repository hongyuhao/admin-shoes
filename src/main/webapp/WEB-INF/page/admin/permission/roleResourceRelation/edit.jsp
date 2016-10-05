<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript">
function processBack(response){
	alertMsg.correct(response.message);
	 $.pdialog.closeCurrent();
	 navTab.reload("${path }/admin/permission/roleResourceRelation/", "");
}

</script>
<div class="pageContent">
	<form method="post" action='/admin/permission/roleResourceRelation/${null==model?"add":"update"}' class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<div class="pageFormContent" layoutH="56">
			<input type="hidden" name="rel" value="${rel }"/>
			<input type="hidden" name="id" value="${model.id }"/>
			<input type="hidden" name="createTime" value="${model.createTime }"/>
			<input type="hidden" name="roleId" value="${role.id }"/>
			<p class="nowrap">
				<label>角色名称:</label>
				<input type="text" name="roleName" readonly="readonly" value="${role.name}">
			</p>
			<p class="nowrap">
				<label>资源名称:</label>
				<input class="digits " name="resourceId" id="resourceId" type="hidden" 
						suggestFields="resourceId" value="${model.resourceId }" lookupGroup="" />
				<input name="resourceName" id="resourceName" type="text"
						suggestFields="resourceName" value="${model.resourceName }"
						lookupGroup="" readonly="true"/> 
				<a class="btnLook" href="/admin/permission/systemResource/?isLookup=1&rel=searchResource" lookupgroup="">查找带回</a>
			</p>	
			<p class="nowrap">
	            <label>动作：</label>
				<c:forEach var="operationMap" items="${operationMap}">
					<INPUT type="checkbox" name="operationArray" value="${operationMap.key }" checked>${operationMap.value }					
				</c:forEach>
				<!-- <script type="text/javascript">
				    var receiverList = '${receiverList}';
					var strs= new Array(); //定义一数组 
					strs=receiverList.split(","); //字符分割 
			        $("input[name='receiver']").each(
			        		function(){  
			        			var _this = this;
			        			var val1 = $(_this).val();
			        		  $.each(strs, function(i,val){ 
			        			  if(val1 == val){
			        				  $(_this).attr("checked","checked") ;
			        			  }
			        		  });  
			        		}  
			        )   ;
			    </script> -->
            </p>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>

