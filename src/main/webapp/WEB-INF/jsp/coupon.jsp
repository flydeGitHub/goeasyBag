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
<script type="text/javascript" src='js/easyloader.js'>
	
</script>
<title>优惠券修改</title>
</head>

<body> 
	<table id="coupon_grid"></table>
</body>
<script type="text/javascript">  

	var $datagrid = $("#coupon_grid");
	$datagrid.datagrid({
		//条纹  
		striped : true,
		//标题  
		title : '优惠券 ',
		//提交的url地址  
		url : '${pageContext.request.contextPath}/couponList',
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
		columns : [ [ {
			field : 'name',
			title : '优惠券名称',
			height : 30,
			width : 30,
			align : 'center',
			sortable : 'true',//排序  
			readonly : 'true',
			disabled : true
		//禁止编辑   
		}, {
			field : 'rule',
			title : '优惠券规则',
			width : 50,
			height : 30,
			align : 'center',
			readonly : 'true',
			disabled : true
		}, {
			field : 'soule',
			title : '优惠券方案',
			width : 50,
			height : 30,
			align : 'center',
			readonly : 'true',
			disabled : true
		}, {
			field : 'start_time',
			title : '开始时间',
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
		}, {
			field : 'end_time',
			title : '截止时间',
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
		}, {
			field : 'status',
			title : '状态',
			width : 70,
			height : 30,
			align : 'center',
			readonly : 'true',
			disabled : true
		} ] ],
		toolbar:[
			 {
					id : 'AddCoupon',
					text : '新增',
					iconCls : 'icon-add',
					handler : function() {//回调函数 
						var tabTitle = "增加";
						var url ="coupon-add.action";
						var icon = 'icon-add'; 
						window.parent.addTab(tabTitle, url, icon); 
					}
				}  
		]

	});

	function searchForm() {
		$datagrid.datagrid('load', {
			phone : $('#phone').val()
		});
	}
</script>
</html>