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
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<script type="text/javascript" src='js/outlook2.js'></script>

<script type="text/javascript" src='js/locale/easyui-lang-zh_CN.js'></script>
<title>增加优惠券</title>
</head>
<body>
	<center>
		<form style="width: 500px; margin-top: 50px;" class="myform"
			id="myform" method="post">
			<table>
				<tr>
					<td class="label" width="250px;"
						style="padding-left: 100px; font-size: 17px;">优惠券名称：</td>
					<td><input class="easyui-textbox" name="name" id="name"
						style="width: 100%;"
						data-options="required: true, validateOnCreate: false, missingMessage: '请输入优惠券名称',validType:'isBlank'" />
					</td>
				</tr>
				<tr>
					<td class="label" style="padding-left: 100px; font-size: 17px;">优惠券规则：</td>
					<td><input class="easyui-textbox" name="rule" id="rule"
						data-options="required: true, validateOnCreate: false, missingMessage: '请输入优惠券规则',validType:'isBlank'"
						style="width: 100%;"</td>
				</tr>

				<tr>
					<td class="label" style="padding-left: 100px; font-size: 17px;">优惠券方案：</td>
					<td><input class="easyui-textbox" name="soule" id="soule"
						data-options="required: true, validateOnCreate: false, missingMessage: '请输入优惠券方案',validType:'isBlank'" /></td>
				</tr>
				<tr>
					<td class="label" style="padding-left: 100px; font-size: 17px;">开始时间：</td>
					<td><input id="start_time" name="start_time"
						data-options="required: true,validateOnCreate: false, missingMessage: '请输入优惠券开始时间' "
						type="text" class="easyui-datetimebox" /></td>
					<!--  formatter:formatter,parser:parser -->
				</tr>
				<tr>
					<td class="label" style="padding-left: 100px; font-size: 17px;">截止时间：</td>
					<td><input id="end_time" name="end_time" type="text"
						data-options="required: true,validateOnCreate: false,validType:'equaldDate[\'#start_time\']',missingMessage: '请输入优惠券截止时间'"
						class="easyui-datetimebox"></td>
				</tr>
				<tr>
					<td class="label" style="padding-left: 100px; font-size: 17px;">状态：</td>
					<td><select id="status" name="status" style="width: 200px;">

							<option value="1">启用</option>
							<option value="0">未启用</option>
					</select></td>
				</tr>
				<tr>
					<td colspan="2" style="margin-left: 400px;" class="formBtn">
						<button class="easyui-linkbutton" type="button"
							style="margin-left: 250px; margin-top: 20px;"
							onclick="submitForm()">保存</button>

						<button class="easyui-linkbutton" type="reset">重置</button>


					</td>

				</tr>
			</table>
		</form>
	</center>
	<script type="text/javascript">
	/* 
	当 控件是datebox的用法 
 function formatter(date){
      
     var y = date.getFullYear();    
     var m = date.getMonth()+1;    
     var d = date.getDate();    
     var h = date.getHours(); 
    
   var min= date.getMinutes();
     var sec= date.getSeconds();  
     var str = y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d)+' '+(h<10?('0'+h):h)+':'+(min<10?('0'+min):min)+':'+(sec<10?('0'+sec):sec);    
     return str; 
 }
 function parser(s){
	 if (!s) return new Date();    
     var y = s.substring(0,4);    
     var m =s.substring(5,7);    
     var d = s.substring(8,10);    
     var h = s.substring(11,13);    
     var min = s.substring(14,16);    
     var sec = s.substring(17,19);    
     if (!isNaN(y) && !isNaN(m) && !isNaN(d) && !isNaN(h) && !isNaN(min) && !isNaN(sec)){    
         return new Date(y,m-1,d,h,min,sec);    
     } else {    
         return new Date();    
     }    
 } */
 //非空
	$.extend($.fn.validatebox.defaults.rules, {
     isBlank: {
         validator: function (value, param) { return $.trim(value) != '' },
         message: '不能为空，全空格也不行'
     }
 });
 
 //重写系统验证规则 
 $.extend($.fn.validatebox.defaults.rules, {  
     equaldDate: {  
         validator: function (value, param) {  
             var start = $(param[0]).datetimebox('getValue');  //获取开始时间    
             return value > start;                             //有效范围为当前时间大于开始时间    
         },  
         message: '截止日期应大于开始日期!'                     //匹配失败消息  
     }  
 });  
 function submitForm() { 
             
			$('#myform').form('submit', {
				url : '${pageContext.request.contextPath}/addcoupon',
				onSubmit : function() {
					//alert("canshu");
					//处理表单数据 转化成时间戳 但是并不能作为新的参数传过去后台   
					 // $('#start_time').val(new Date($("#start_time").datetimebox("getValue")).getTime());
			 
			        return $(this).form('validate');
			  
				},
				success : function(data, status) {
					//alert("返回");  
					//alert(data);
					if (data=="success") { 
						 msgShow('系统提示', '增加成功！', 'info'); 
						 
						//addTab('查询商品', 'item-list'); 
					} 

				}
			});    
		} 
	</script>
</body>
</html>