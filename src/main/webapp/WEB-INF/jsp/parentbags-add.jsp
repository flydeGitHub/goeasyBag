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
<title>增加父柜子</title>
</head>
<body>
	<center>
		<form style="width: 380px; margin-top: 50px;" class="myform"
			id="myform" method="post">
			<table>
				<tr>
					<td class="label" width="250px;"
						style="padding-left: 100px; font-size: 17px;">父柜子号：</td>
					<td>
				 	<input type="text" class="easyui-numberbox" name="parentbagsid" id="parentbagsid"
						style="width: 100%;"
						data-options="required: true,min:0, validateOnCreate: false,missingMessage: '请输入父柜子号'"/>   
					</td>
				</tr>
				<tr>
					<td class="label" style="padding-left: 100px; font-size:17px;">柜子地址</td>
					<td><input class="easyui-textbox" name="address" id="address"
						data-options="required: true, validateOnCreate: false, missingMessage: '请输入柜子地址'
						,validType:'isBlank'
						"
						style="width: 100%;"</td>
				</tr>

				 	<tr>
					<td class="label" style="padding-left: 100px; font-size: 17px;">地址经度：</td>
					<td><input class="easyui-textbox" name="longitude" id="longitude"
						data-options="required: true, validateOnCreate: false, missingMessage: '地址经度',validType:'isLongitude'" /></td>
				</tr>
				<tr>
					<tr>
					<td class="label" style=" padding-left: 100px; font-size: 17px; ">地址纬度：</td>
					<td><input class="easyui-textbox" name="latitude" id="latitude"
						data-options="required: true, validateOnCreate: false, missingMessage: '地址纬度',validType:'isLatitude'" /></td>
				</tr> 
			 
				<tr>
					<td colspan="2" style="margin-left: 400px;" class="formBtn">
						<button class="easyui-linkbutton" type="button"
							style="margin-left: 190px; margin-top: 20px;"
							onclick="submitForm()">保存</button>

						<button class="easyui-linkbutton" type="reset">重置</button>


					</td>

				</tr>
			</table>
		</form>
	</center>
	<script type="text/javascript">
   //非空
	$.extend($.fn.validatebox.defaults.rules, {
        isBlank: {
            validator: function (value, param) { return $.trim(value) != '' },
            message: '不能为空，全空格也不行'
        }
    });
    //经度
    $.extend($.fn.validatebox.defaults.rules, {
    	isLongitude: {
            validator: function (value) { 
            	return /^-?(([1-9]\d?)|(1[1-7]\d)|180)(\.\d{1,6})?$/.test(value);

            },
            message: '经度格式不正确'
        }
    });
    //纬度
    $.extend($.fn.validatebox.defaults.rules, {
    	isLatitude: {
            validator: function (value) { 
            	return /^-?(([1-8]\d?)|([1-8]\d)|90)(\.\d{1,6})?$/.test(value); 
            },
            message: '纬度格式不正确'
        }
    });
    
 function submitForm() { 
             
			$('#myform').form('submit', {
				url : '${pageContext.request.contextPath}/addParentbag',
				onSubmit : function() {
			 return $(this).form('validate');
			  
				},
				success : function(data, status) {
				 
					if (data=="success") { 
						 msgShow('系统提示', '增加成功！', 'info'); 
						 
					} 
					else{
						
						if(data=="exist")
						{
						 msgShow('系统提示', '柜子号已经存在，增加失败 ！', 'info'); 
						}
						else
						{
						 msgShow('系统提示', '系统错误，增加失败 ！', 'info');  
						}
					}	 
				}
			});    
		} 
	</script>
</body>
</html>