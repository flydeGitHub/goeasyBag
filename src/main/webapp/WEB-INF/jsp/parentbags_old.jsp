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
<title>父柜子信息</title>
</head>

<body>
	<table id="parentbags_grid"></table>
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
	
	var rowEditor; //判断用户是否处于编辑状态
	var flag; //判断新增和修改方法  
	var $datagrid = $("#parentbags_grid");
	$datagrid.datagrid({
		//条纹  
		striped : true,
		//工具栏
		toolbar : [ {
			id : 'AddParent',
			text : '新增',
			iconCls : 'icon-add',
			handler : function() {//回调函数 
				alert("新增");
			}
		}, {
			id : 'UpdateParent',
			text : '修改',
			iconCls : 'icon-edit',
			handler : function() {//回调函数 
				var rows = $datagrid.datagrid('getSelected');
				 
				if (rows.length <= 0) {
					$.messager.alert('警告', '您没有选择', 'error');
				} else if (rows.length > 1) {
					$.messager.alert('警告', '不支持批量修改', 'error');
				} else {
					$.messager.confirm('确定', '您确定要修改吗', function(t) {
						alert("chenggong");
						if(t){
							//ajax 删除选中的数据 
							alert("ajax");
							  alert(rows.parentbagsid);
		  $.post("${pageContext.request.contextPath}/deleteParent",{  
			 id:rows.parentbagsid 
            } ,function(data, status) {
            	alert("data");
            	if(data=="success")
            		{
            		 $datagrid.datagrid('acceptChanges'); 
            		 msgShow('系统提示', '刪除成功！', 'info'); 
            		}
            	else
            		{
            		if(data=="false")
            			{
            			 msgShow('系统提示', '删除失败系统异常！', 'info');
            			}
            		}
               
            }) ;
		  var  editRow = undefined;  
          $datagrid.datagrid('reload');
							}else
							{
								datagrid.datagrid('rejectChanges'); 
								  $datagrid.datagrid('beginEdit', editRow);  
									 $.messager.alert('错误', r.msg, 'error'); 	
            	
							}
						$datagrid.datagrid('unselectAll');  
					});

				}
			}
		}
		, {
			id : 'showSonBags',
			text : '显示子柜子',
			iconCls : 'icon-edit',
			handler : function() {//回调函数 
				alert("显示子柜子 ");
				var rows = $datagrid.datagrid('getSelected');
				alert(rows);
				if (rows.length <= 0) {
					$.messager.alert('警告', '您没有选择', 'error');
				} else if (rows.length > 1) {
					$.messager.alert('警告', '请选择仅一行数据', 'error');
				}else
					{
					
					
					} 
			}
		}
		],
		//标题  
		title : '父柜子详情 ',
		//提交的url地址  
		url : '${pageContext.request.contextPath}/parentbagsList',
		//允许收缩数据  
		collapsible : 'true',
		//分页  
		pagination : 'true',
		//自适应  
		fit : 'true',
		//默认页容量  
		pageSize : [ 5, 10, 15, 20, 50 ],
		//分页工具位置  
		pagePosition : 'top',
		//列自适应  
		fitColumns : 'true',
		//显示编号  
		rownumbers : 'true',
		//排序  
		sortable : 'true',
		sortName : 'parentbagsid',

		//列字段  
		columns : [ [ {
			field : 'parentbagsid',
			title : '父柜子号',
			height : 30,
			width : 30,
			align : 'center',
			sortable : 'true',//排序  
			readonly : 'true',
			disabled : true
		//禁止编辑   
		}, {
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
			field : 'latitude',
			title : '地址纬度',
			height : 30,
			width : 30,
			align : 'center',
			sortable : 'true',//排序  
			readonly : 'true',
			disabled : true
		//禁止编辑   
		}, {
			field : 'longitude',
			title : '地址经度',
			height : 30,
			width : 30,
			align : 'center',
			sortable : 'true',//排序  
			readonly : 'true',
			disabled : true
		//禁止编辑   
		},{
			field:'son',
			title:'操作', 
			width : 30,
			sortable:true,
			align:"center", 
			formatter:function(companyName,row){
				return "<a href=\"javascript:linkManList('"+row.parentbagsid+"');\">查看子柜</a>";
				} 
				}  
		] ]
	});
	 function linkManList(parentbagsid){
		window.location.href="${pageContext.request.contextPath}/sonbags?parentbagsid="+parentbagsid+"";		   
	 }
</script>
</html>