<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.jsp"%>
<script type="text/javascript" src="http://static.frogshealth.com/static/w/js/commonArea.js"></script>
<script type="text/javascript">
function processBack(response){
	alertMsg.correct(response.message);
	 $.pdialog.closeCurrent();
}
</script>
<div class="pageContent">
	<form method="post" action="${path }/admin/open/partnerAddressInfo/merge"
		 class="pageForm required-validate" onsubmit="return validateCallback(this, processBack);">
		<input name="partnerId" type="hidden" size="75" value="${partnerInfo.id }"/>
		<input type="hidden" name="rel" value="${rel}"/>
		<input type="hidden" name="areaList" id="areaList" value=""/>
		<div class="pageFormContent" layoutH="57" align="left">
			<p class="nowrap">
            	<label>合作方：</label>
				<input name="name" type="text"  value="${partnerInfo.name }"  disabled="disabled"/>            
			</p>
			<p class="nowrap">
            	<label>合作类型：</label>
            	<input name="type" type="text"  value="${partnerTypeMap[partnerInfo.type] }"  disabled="disabled"/>
			</p>
			<p class="nowrap">
            	<label>业务模式：</label>
            	<input name="bussinessMode" type="text"  value="${bussinessModeMap[partnerInfo.bussinessMode] }"  disabled="disabled"/>
			</p>
			<p class="nowrap">
            	<label>地址类型：</label>
            	<select name="addressType" id="addressTypeSelect" >
            		<c:forEach items="${addressTypeMap }" var="map">
            			<option value="${map.key }">${map.value }</option>
            		</c:forEach>
            	</select>
            	<script type="text/javascript">
            		$('#addressTypeSelect').val('${addressType}');
            	</script>
			</p>
			<p class="nowrap">
            	<label>覆盖区域：</label>
            	<div id="areaCodeDiv" style="float:left; display:none; margin:10px; overflow:auto; width:400px; height:300px; border:solid 1px #CCC; line-height:21px; background:#FFF;">
					<ul class="tree  treeCheck expand" oncheck="test">
						<li><a tname="areaId" tvalue="-1" checked="false" >全国</a>
							<ul class="treeCheck " id="provinceUl" >
								<%--<li><a tname="name" tvalue="440000" >广东省</a>
									<ul >
										<li><a tname="name" tvalue="440100" checked="false">广州市</a></li>
										<li><a tname="name" tvalue="441500" checked="false">汕尾市</a></li>
									</ul>
								</li>--%>
							</ul>
						</li>
					</ul>
					<script type="text/javascript">
						$.each(areaAllJson, function(i, obj){
							if(obj.parentId == 0) {
								$('#provinceUl').append('<li><a tname="areaId" tvalue="'+obj.areaCode+'" checked="false">'+obj.areaName+'</a>'+
										'<ul class="treeCheck " id="province_'+obj.areaCode+'" onckeck="test"> </ul>'
										+'</li>');
							}
						});
						$.each(areaAllJson, function(i, obj){
							if(obj.parentId.length == 2) {
								$('#province_'+obj.parentId).append('<li><a tname="areaId" tvalue="'+obj.areaCode+'" checked="false">'+obj.areaName+'</a></li>');
							}
						});
						$.fn.initUI();
					</script>
					
				</div>
				<div id="aixDiv" style="float:left; display:none; margin:10px; overflow:auto; width:480px; height:300px; border:solid 1px #CCC; line-height:21px; background:#FFF;">
					<table id="aixTable" class="list" width="100%">
						<thead>
							<tr>
								<th>经度</th>
								<th>纬度</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${addressList }" var="address">
							<tr><td>${address.longitude}</td><td>${address.latitude}</td><td><a href="javascript:void(0);" data="${address.longitude}_${address.latitude}" onclick="removeData(this);">删除</a></td></tr>
							</c:forEach>
							<tr id="newInput"><td><input id="longitudeInput" /></td><td><input id="latitudeInput" /></td><td><a onclick="mergeData();" href="javascript:void(0);">新增</a></td></tr>
						</tbody>
					</table>
					
				</div>
				<script type="text/javascript">
				if('${addressType}'==1) {
					$('#areaCodeDiv').show();
					$('#aixDiv').hide();
				}
				if('${addressType}' == 2) {
					$('#areaCodeDiv').hide();
					$('#aixDiv').show();
				}
				</script>
			</p>
		</div>
		<div class="formBar">
			<ul>
			<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">返回</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>

<script type="text/javascript">
function test(){
	
	var json = arguments[0], result="";
//	alert(json.checked);

	$(json.items).each(function(i){
		console.log(this.value);
		//sresult += "<p>name:"+this.name + " value:"+this.value+" text: "+this.text+"</p>";
	});
	
}

$('#addressTypeSelect').change(function(){
	var addressType = $(this).val();
	if(addressType==1) {
		$('#areaCodeDiv').show();
		$('#aixDiv').hide();
	}
	if(addressType == 2) {
		$('#areaCodeDiv').hide();
		$('#aixDiv').show();
	}
});

function mergeData(){
	var longitude = $('#longitudeInput').val();
	var latitude = $('#latitudeInput').val();
	if(!longitude) {
		alert('longitude cannot be null');
		return false;
	}
	if(!latitude) {
		alert('latitude cannot be null');
		return false;
	}
	var jsonVal = $('#areaList').val();
	var json;
	if(!jsonVal) {
		json = new Array();
	} else {
		json = eval(jsonVal);
	}
	
	var data = {
			'longitude' : longitude,
			'latitude' : latitude
		};
	json.push(data);
	$('#areaList').val(JSON.stringify(json));
	$('#longitudeInput').val('')
	$('#latitudeInput').val('');
	
	$('#newInput').before('<tr><td>'+longitude+'</td><td>'+latitude+'</td><td><a href="javascript:void(0);" data="'+longitude+'_'+latitude+'" onclick="removeData(this);">删除</a></td></tr>');
	$.fn.initUI();
}

function removeData(obj){
	$(obj).closest('tr').remove();
	
	var data=$(obj).attr('data');
	var longitude = data.split('_')[0];
	var latitude = data.split('_')[1];
	
	var jsonVal = $('#areaList').val();
	var json;
	if(!jsonVal) {
		json = new Array();
	} else {
		json = eval(jsonVal);
	}
	
	$.each(json, function(i, jsonObj){
		if(jsonObj.longitude == longitude && jsonObj.latitude == latitude) {
			json.splice(i,1);
			$('#areaList').val(JSON.stringify(json));
			return false;
		}
	});
}
</script>
