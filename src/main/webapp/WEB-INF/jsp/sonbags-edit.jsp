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
<title>修改子柜子</title>
</head>
<body>
	<center>
		<form style="width: 380px; margin-top: 50px;" class="myform"
			id="myform" method="post">
			<table>
				<tr>
					<td class="label" 
						style="padding-left: 100px; font-size: 17px;">父柜子号</td>
					<td><input type="text" class="easyui-numberbox"
						name="parentbagsid" id="parentbagsid" readonly="readonly"
						value=${parentbags.parentbagsid } /></td>
				</tr>
				<tr>
					<td class="label" 
						style="padding-left: 100px; font-size: 17px;">子柜子号</td>
					<td><input type="text" class="easyui-numberbox"
						name="sonbagid" id="sonbagid" readonly="readonly"
						value=${sonbags.sonbagid } /></td>
				</tr>
				<tr>
					<td class="label" style="padding-left: 100px; font-size: 17px;">柜子地址</td>
					<td><input class="easyui-textbox" name="address" id="address"
						value=${parentbags.address } readonly="readonly" 
						style="width: 100%;"</td>
				</tr>

				<tr>
					<td class="label" style="padding-left: 100px; font-size: 17px;">地址经度</td>
					<td><input class="easyui-numberbox" name="longitude"
						id="longitude" value=${parentbags.longitude } readonly="readonly"
						 data-options="precision:6"
 
						  /></td>
				</tr>
				<tr>
				<tr>
					<td class="label" style="padding-left: 100px; font-size: 17px;">地址纬度</td>
					<td><input class="easyui-numberbox" name="latitude"  data-options="precision:6"
						id="latitude" value=${parentbags.latitude } readonly="readonly"
					  /></td>
				</tr>
				
				 	<tr>
					<td class="label" style="padding-left: 100px; font-size: 17px;">是否在用</td>
					<td><select id="isusered" value=${sonbags.isusered } name="isusered" style="width: 200px;">
 
							<option value="1">正在使用</option>
							<option value="0">未使用</option>
							<option value="2">故障</option>
							
					</select></td>
				</tr>
				
					<tr>
					<td class="label" style="padding-left: 100px; font-size: 17px;">柜子类型</td>
					<td><select id="type" value=${ sonbags.type} name="type" style="width: 200px;">
							<option value="big">大柜子</option>
							<option value="small">小柜子</option>
					</select></td>
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
		 

		function submitForm() {

			$('#myform')
					.form(
							'submit',
							{
								url : '${pageContext.request.contextPath}/editSonbag',
								onSubmit : function() {
									return $(this).form('validate');

								},
								success : function(data, status) {

									if (data == "success") {
										msgShow('系统提示', '修改成功！', 'info');
										window.location.href = "${pageContext.request.contextPath}/sonbags?parentbagsid="+${parentbags.parentbagsid } +"";
									} else {
										msgShow('系统提示', '系统错误，修改失败 ！', 'info');
									}
								}
							});
		}
	</script>
</body>
</html>