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
<title>修改父柜子</title>
</head>
<body>
	<center>
		<form style="width: 380px; margin-top: 50px;" class="myform"
			id="myform" method="post">
			<table>
				<tr>
					<td class="label" width="250px;"
						style="padding-left: 100px; font-size: 17px;">父柜子号：</td>
					<td><input type="text" class="easyui-numberbox"
						name="parentbagsid" id="parentbagsid" readonly="readonly"
						value=${parentbags.parentbagsid } /></td>
				</tr>
				<tr>
					<td class="label" style="padding-left: 100px; font-size: 17px;">柜子地址</td>
					<td><input class="easyui-textbox" name="address" id="address"
						value=${parentbags.address }
						data-options="required: true, validateOnCreate: false, missingMessage: '请输入柜子地址'
						,validType:'isBlank'
						"
						style="width: 100%;"</td>
				</tr>

				<tr>
					<td class="label" style="padding-left: 100px; font-size: 17px;">地址经度：</td>
					<td><input class="easyui-numberbox" name="longitude"
						id="longitude" value=${parentbags.longitude }
						data-options="required: true,precision:6, validateOnCreate: false, missingMessage: '地址经度',validType:'isLongitude'" /></td>
				</tr>
				<tr>
				<tr>
					<td class="label" style="padding-left: 100px; font-size: 17px;">地址纬度：</td>
					<td><input class="easyui-numberbox" name="latitude"
						id="latitude" value=${parentbags.latitude }
						data-options="required: true,precision:6, validateOnCreate: false, missingMessage: '地址纬度',validType:'isLatitude'" /></td>
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
			isBlank : {
				validator : function(value, param) {
					return $.trim(value) != ''
				},
				message : '不能为空，全空格也不行'
			}
		});
		//经度
		$.extend($.fn.validatebox.defaults.rules, {
			isLongitude : {
				validator : function(value) {
					return /^-?(([1-9]\d?)|(1[1-7]\d)|180)(\.\d{1,6})?$/
							.test(value);

				},
				message : '经度格式不正确'
			}
		});
		//纬度
		$.extend($.fn.validatebox.defaults.rules, {
			isLatitude : {
				validator : function(value) {
					return /^-?(([1-8]\d?)|([1-8]\d)|90)(\.\d{1,6})?$/
							.test(value);
				},
				message : '纬度格式不正确'
			}
		});

		function submitForm() {

			$('#myform')
					.form(
							'submit',
							{
								url : '${pageContext.request.contextPath}/editParentbag',
								onSubmit : function() {
									return $(this).form('validate');

								},
								success : function(data, status) {

									if (data == "success") {
										msgShow('系统提示', '修改成功！', 'info');
										window.location.href = "${pageContext.request.contextPath}/parentbags";
									} else {
										msgShow('系统提示', '系统错误，修改失败 ！', 'info');
									}
								}
							});
		}
	</script>
</body>
</html>