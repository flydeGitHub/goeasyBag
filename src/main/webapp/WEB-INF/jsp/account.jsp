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
<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.1.2.2.js"></script>
<script type="text/javascript" src='js/outlook2.js'></script>
	
</script>
<title>用户余额</title>
</head>

<body>
	<table id="account_grid"></table>
</body>
<script type="text/javascript">
	var $datagrid = $("#account_grid");
	$datagrid.datagrid({
		//条纹  
		striped : true,
		//标题  
		title : '用户余额 ',
		//提交的url地址  
		url : '${pageContext.request.contextPath}/accountList',
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
		columns : [ [ {
			field : 'nickname',
			title : '用户昵称',
			width : 50,
			height : 30,
			align : 'center',
			readonly : 'true',
			disabled : true
		}, {
			field : 'balance',
			title : '用户余额(元 )',
			formatter:function(val,rowData,rowIndex){
		        if(val!=null)
		            return val.toFixed(2);
		   },
			
			height : 30,
			width : 30,
			align : 'center',
			sortable : 'true',//排序  
			readonly : 'true',
			disabled : true
		//禁止编辑   
		}, {
			field : 'newphone',
			title : '用户电话',
			width : 50,
			height : 30,
			align : 'center',
			readonly : 'true',
			disabled : true
		} ] ]

	});
</script>
</html>