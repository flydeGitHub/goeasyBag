<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="css/default.css">
<link rel="stylesheet" type="text/css"
	href="js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="js/themes/icon.css">
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.1.2.2.js"></script>
<script type="text/javascript" src='js/outlook2.js'> </script>
<script type="text/javascript" src='js/easyloader.js'> </script>
<title>用户推荐位置查看</title>
</head>

<body>
	<!-- <h1>用户推荐位置</h1> -->
<!-- 	<div id="toolbar" style="margin-bottom: 30px;margin-top: 30px" >
	 
	查询表单 
		<label>用户电话：</label>
		<input name="phone" id="phone" class="easyui-textbox"> 
	<tr>
					<td class="label" style="padding-left: 100px; font-size: 17px;">最早时间：</td>
					<td><input id="start_time" name="start_time" 
						type="text" class="easyui-datetimebox" /></td> 
				</tr>
				<tr>
					<td class="label" style="padding-left: 100px; font-size: 17px;">最晚时间：</td>
					<td><input id="end_time" name="end_time" type="text"
						class="easyui-datetimebox"></td>
				</tr>
	<button type="button" class="easyui-linkbutton"  onclick="searchForm()">搜索</button>
 
</div>   -->
	<table id="position_grid"></table>
</body>
<script type="text/javascript">
var $datagrid = $("#position_grid");

function searchForm(){
	alert("dsaf");
	    $datagrid.datagrid('load',{  
		phone: $('#phone').val()  
	});    
	//window.location.href="${pageContext.request.contextPath}/positionList"
    /* $.post("${pageContext.request.contextPath}/positionList",{  
    	phone: $('#phone').val() 
    } ,function(data, status) { 
    	 
    });   */ 	 
}

	
	$datagrid.datagrid({
		//条纹  
		striped : true,  
		 
		//标题  
		title : '推荐位置 ',
		//提交的url地址  
		url : '${pageContext.request.contextPath}/positionList',
		//  url:'/positionList',   
		//允许收缩数据  
		collapsible : 'true',
		//分页  
		pagination : 'true',
		//自适应  
		fit : 'true',
		//默认页容量  
		pageSize : '3',
		//分页工具位置  
		pagePosition : 'top',
		//列自适应  
		fitColumns : 'true',
		//显示编号  
		rownumbers : 'true',
		//排序  
		sortable : 'true',
		sortName : 'id',
		//主键  
		// idField:'id',  
		//列字段  
		columns : [ [   {
			field : 'newphone',
			title : '用户电话',
			width : 50,
			height : 30,
			align : 'center',
			readonly : 'true',
			disabled : true
		}, {
			field : 'created',
			formatter : function(value, row, index) {
				var unixTimestamp = new Date(value * 1000);
				commonTime = unixTimestamp.toLocaleString();
				return commonTime;
			},
			title : '推荐时间',
			width : 50,
			height : 30,
			align : 'center',
			readonly : 'true',
			disabled : true
		}, {
			field : 'address',
			title : '推荐地址',
			width : 70,
			height : 30,
			align : 'center',
			readonly : 'true',
			disabled : true
		}, {
			field : 'information',
			width : 100,
			height : 30,
			title : '用户提交信息',
			align : 'center',
			readonly : 'true',
			disabled : true
		} ] ]

	});  
</script>
</html>