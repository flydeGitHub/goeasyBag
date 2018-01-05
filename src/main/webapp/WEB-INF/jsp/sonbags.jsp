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
<script type="text/javascript" src='js/outlook2.js'> </script>
<script type="text/javascript" src='js/easyloader.js'> </script>
<title>子柜子信息</title>
</head>

<body> 
	<table id="sonbags_grid"></table>
	<div id="toolbar">
	<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="javascript:$('#dg').edatagrid('addRow')">New</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="javascript:$('#dg').edatagrid('destroyRow')">Destroy</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="javascript:$('#dg').edatagrid('saveRow')">Save</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="javascript:$('#dg').edatagrid('cancelRow')">Cancel</a>
</div>
</body>
<script type="text/javascript">
/* function jsonTimeStamp(milliseconds) {
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

} */
var parentbagsid = "<%=request.getParameter("parentbagsid")%>";  
	var $datagrid = $("#sonbags_grid");
	$datagrid.datagrid({
		//条纹  
		striped : true,
		//标题  
		title : '子柜子详情 ',
		//提交的url地址  
		url : '${pageContext.request.contextPath}/sonbagList?parentbagsid='+parentbagsid,
	 
				//允许收缩数据  
		collapsible : 'true',
		//分页  
		pagination : 'true',
		//自适应  
		fit : 'true', 
		//分页工具位置  
		pagePosition : 'top',
		//列自适应  
		fitColumns : 'true',
		//显示编号  
		rownumbers : 'true',
		//排序  
		sortable : 'true',
		 
		//主键  
		// idField:'id',  
		//列字段  
		columns : [ [ 
		
	 {
			field : 'parentbagsid',
			title : '父柜子号',
			height : 30,
			width : 30,
			align : 'center',
			sortable : 'true',//排序  
			readonly : 'true',
			disabled : true
		//禁止编辑   
		},
		 	{
			field:'sonbagid',
			title:'子柜子号',
			height : 30,
			width : 30,
			align : 'center',
			sortable : 'true',//排序  
			readonly : 'true',
			disabled : true 
			
		},
		{
			field : 'created',
			title : '创建时间',
			formatter : function(value, row, index) { 
				var unixTimestamp = new Date(value * 1000);
				commonTime = unixTimestamp.toLocaleString();
				return commonTime;
			},
			height : 30,
			width : 30,
			align : 'center',
			sortable : 'true',//排序  
			readonly : 'true',
			disabled : true
		//禁止编辑   
		}, {
			field : 'updated',
			title : '更新时间',
			formatter : function(value, row, index) { 
				var unixTimestamp = new Date(value * 1000);
				commonTime = unixTimestamp.toLocaleString();
				return commonTime;
			},
			width : 30,
			height : 30,
			align : 'center',
			readonly : 'true',
			disabled : true
		}, {
			field : 'address',
			title : '柜子地址',
			height : 30,
			width : 30,
			align : 'center',
			sortable : 'true',//排序  
			readonly : 'true',
			disabled : true
		//禁止编辑   
		}, {
			field : 'isusered',
			title : '是否在用',
			height : 30,
			width : 30,
			align : 'center',
			sortable : 'true',//排序  
			readonly : 'true',
			disabled : true
		//禁止编辑   
		},   {
			field : 'type',
			title : '柜子类型', 
			height : 30,
			width : 30,
			align : 'center',
			sortable : 'true',//排序  
			readonly : 'true',
			disabled : true
		//禁止编辑   
		},
		{
			field:'操作',
			title:'操作', 
			width : 30,
			sortable:true,
			align:"center", 
			formatter:function(companyName,row){
				return "<a href=\"javascript:edit('"+row.sonbagid+"');\">修改</a> ";
				} 
				} 
		] ],
		toolbar: 
			  [
			 {
					id : 'AddSon',
					text : '新增',
					iconCls : 'icon-add',
					handler : function() {//回调函数 
		 window.location.href="${pageContext.request.contextPath}/sonbagadd?parentbagsid="+parentbagsid+"";
						 
				} 
			 }
			
		]  

	});
	 function edit(sonbagid){  
			window.location.href="${pageContext.request.contextPath}/sonbags-edit?sonbagid="+sonbagid+"&parentbagsid="+parentbagsid+"";
	 
	 }
</script>
</html>