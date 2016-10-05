
<%@include file="/inc/taglibs.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript">
function RGUpload() {
   var formData = new FormData();
    var fileObj = document.getElementById("file").files[0];
    formData.append("file", fileObj);
    $.ajax({
        url: 'http://admin.frogshealth.com/admin/datacenter/simRecharge/RGSnUpload.json' ,
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,

        success: function (returndata) {

             var last=JSON.stringify(returndata);

             alert(last);
         },
         error: function (returndata) {

             var last=JSON.stringify(returndata);

             alert(last);
         }
    });
}  
function BGUpload() {
	   var formData = new FormData();
	    var fileObj = document.getElementById("file").files[0];
	    formData.append("file", fileObj);
	    $.ajax({
	        url: 'http://admin.frogshealth.com/admin/datacenter/simRecharge/BGSnUpload.json' ,
	        type: 'POST',
	        data: formData,
	        contentType: false,
	        processData: false,

	        success: function (returndata) {

	             var last=JSON.stringify(returndata);

	             alert(last);
	         },
	         error: function (returndata) {

	             var last=JSON.stringify(returndata);

	             alert(last);
	         }
	    });
	}  

    </script>
<div class="pageContent">
    <form id= "uploadForm" enctype="multipart/form-data">
         <br>
          <p >选择文件 <input type="file" name="file" id="file"/></p>
           <br>
          <input type="button" value="瑞光excel上传 " onclick="RGUpload()"/>
          <br> <br>
          <input type="button" value="血糖仪excel上传 " onclick="BGUpload()"/>
  	</form>
</div>