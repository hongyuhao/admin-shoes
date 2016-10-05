<%@ page trimDirectiveWhitespaces="true" %> 
<%@ page contentType="text/html;charset=utf-8"%>
<script type="text/javascript">
/**
 * 封装图表插件
 * 
 * 参数讲解  
    	businessType：业务类型    1：用户统计     2：测量统计   3：消息统计  4：设备统计    详情参考StatisticsNameEnum类
    	dataType：数据类型，用于显示线的名称
    	time：时间，用于显示X轴数据
    	data：统计量，用于显示Y轴数据
 */
 function paintTrend(businessType,time,data, idStr) {
        Highcharts.setOptions({
               lang:{
                  contextButtonTitle:"图表导出菜单",
                  decimalPoint:".",
                  downloadJPEG:"下载JPEG图片",
                  downloadPDF:"下载PDF文件",
                  downloadPNG:"下载PNG文件",
                  downloadSVG:"下载SVG文件",
                  drillUpText:"返回 {series.name}",
                  loading:"加载中",
                  months:["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"],
                  noData:"没有数据",
                  numericSymbols: [ "千" , "兆" , "G" , "T" , "P" , "E"],
                  printChart:"打印图表",
                  resetZoom:"恢复缩放",
                  resetZoomTitle:"恢复图表",
                  shortMonths: [ "Jan" , "Feb" , "Mar" , "Apr" , "May" , "Jun" , "Jul" , "Aug" , "Sep" , 
                           "Oct" , "Nov" , "Dec"],
                  thousandsSep:",",
                  weekdays: ["星期一", "星期二", "星期三", "星期三", "星期四", "星期五", "星期六","星期天"]
               }
        }); 
   
       $('#' + idStr).highcharts({
           title: {
               text: '用户统计',
               x: -20 //center
           },
           plotOptions: {
               series: {
                   allowPointSelect: true
               }
           },
           credits: {
               text: '蛙鸣健康',
               href: 'http://www.frogshealth.com'
           },
           scrollbar: {
	            enabled: true
	        },
           subtitle: {
               text: '',
               x: -20
           },
           chart: {
 	            zoomType: 'x'
             },
           xAxis: {
               categories: [],
               id: 'x-axis'
           },
           yAxis: {
               title: {
                   text: '人数'
               },
               plotLines: [{
                   value: 0,
                   width: 1,
                   color: '#808080'
               }]
           },
           tooltip: {
               valueSuffix: "${flag==1?'元':'人'}"
           },
           legend: {
               layout: 'vertical',
               align: 'right',
               verticalAlign: 'middle',
               borderWidth: 0
           },
           series:[]
       });
       
      
       var statisticsNameMap = eval('(' + '${StatisticsNameMap }' + ')');
       var title = statisticsNameMap[businessType];
       var chart = $('#' + idStr).highcharts();
       
       //设置Title
       chart.setTitle({text: title});
      
       var  flag = '${flag}'; 
       if(flag == 1){
    	   chart.yAxis[0].setTitle({
               text: '金额'
           });
       }
    	   
       
       //设置X轴的数据
       chart.get('x-axis').setCategories(time);
       
       //设置Y轴的数据 
       for(var o in data){ 
          chart.addSeries(data[o]);  
       } 
   };
     
 </script>