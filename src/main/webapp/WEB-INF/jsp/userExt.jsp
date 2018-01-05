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

<title>用户信息</title>
</head>

<body>
	<table id="userExt_grid"></table>
</body>
<script type="text/javascript">
function jsonTimeStamp(milliseconds) {
	if (milliseconds != "" && milliseconds != null
			&& milliseconds != "null") {
		var datetime = new Date();
		datetime.setTime(milliseconds);
		var year = datetime.getFullYear();
		var month = datetime.getMonth() + 1 < 10 ? "0"
				+ (datetime.getMonth() + 1) : datetime.getMonth() + 1;
		var date = datetime.getDate() < 10 ? "0" + datetime.getDate()
				: datetime.getDate();
		var hour = datetime.getHours() < 10 ? "0" + datetime.getHours()
				: datetime.getHours();
		var minute = datetime.getMinutes() < 10 ? "0"
				+ datetime.getMinutes() : datetime.getMinutes();
		var second = datetime.getSeconds() < 10 ? "0"
				+ datetime.getSeconds() : datetime.getSeconds();
		return year + "-" + month + "-" + date + " " + hour + ":" + minute
				+ ":" + second;
	} else {
		return "";
	}

}
	var $datagrid = $("#userExt_grid");
	$datagrid.datagrid({
		//条纹  
		striped : true,
		//标题  
		title : '用户信息 ',
		//提交的url地址  
		url : '${pageContext.request.contextPath}/userExtList',
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
			field : 'newphone',
			title : '现用电话',
			width : 50,
			height : 30,
			align : 'center',
			readonly : 'true',
			disabled : true
		} , {
			field : 'phone',
			title : '曾用电话',
			width : 50,
			height : 30,
			align : 'center',
			readonly : 'true',
			disabled : true
		} , {
			field : 'sex',
			title : '性别',
			width : 50,
			height : 30,
			align : 'center',
			readonly : 'true',
			disabled : true
		} , {
			field : 'birthday',
			title : '生日',
			formatter : function(value, row, index) { 
				var unixTimestamp = new Date(value * 1000);
				commonTime = unixTimestamp.toLocaleString();
				return commonTime;
			},
			width : 50,
			height : 30,
			align : 'center',
			readonly : 'true',
			disabled : true
		} , { 
			field : 'created',
			title : '注册时间',
			formatter : function(value, row, index) { 
				var unixTimestamp = new Date(value * 1000);
				commonTime = unixTimestamp.toLocaleString();
				return commonTime;
			},
			width : 50,
			height : 30,
			align : 'center',
			readonly : 'true',
			disabled : true
		} , { 
			field : 'updated',
			title : '电话更新时间',
			formatter : function(value, row, index) { 
				var unixTimestamp = new Date(value * 1000);
				commonTime = unixTimestamp.toLocaleString();
				return commonTime;
			},
			width : 50,
			height : 30,
			align : 'center',
			readonly : 'true',
			disabled : true
		}  , { 
			field : 'head',
			title : '头像',
			width : 50,
			height : 30,
			align : 'center',
			readonly : 'true',
			disabled : true
		}  ] ]

	});
</script>
</html>