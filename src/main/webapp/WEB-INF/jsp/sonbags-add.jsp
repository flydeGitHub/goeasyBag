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
<title>增加子柜子</title>
</head>
<body>
	<center>
		<form style="width: 380px; margin-top: 50px;" class="myform"
			id="myform" method="post">
			<table>
				<tr>
					<td class="label"  
						style="padding-left: 100px; font-size: 17px;">父柜子号</td>
					<td>
				 	<input type="text" class="easyui-numberbox" name="parentbagsid" id="parentbagsid"
						style="width: 100%;" readonly="readonly" value=${parentbags.parentbagsid } 
						 />   
					</td>
				</tr>
				<tr>
					<td class="label" style="padding-left: 100px; font-size:17px;">柜子地址</td>
					<td><input class="easyui-textbox" name="address" id="address"
						 value=${parentbags.address } readonly="readonly"
						style="width: 100%;"</td>
				</tr>
				<tr>
					<td class="label"  
						style="padding-left: 100px; font-size: 17px;">子柜子号</td>
					<td>
	<%-- 			 	<input type="text" class="easyui-numberbox" name="sonbagid" id="sonbagid"
						style="width: 100%;" value=${parentbags.parentbagsid } 
						data-options="required: true,min:0,validateOnCreate: false,missingMessage: '请输入子柜子号'"/>   
					 --%>
			<input   name="sonbagid" id="sonbagid"
						style="width: 100%;" value=${parentbags.parentbagsid }  class="easyui-validatebox"
						 data-options="required:true,min:0,validateOnCreate: false,missingMessage: '请输入子柜子号',validType:'num[${parentbags.parentbagsid}]'">		
					</td>
				</tr>
				
				 	<tr>
					<td class="label" style="padding-left: 100px; font-size: 17px;">是否在用</td>
					<td><select id="isusered" name="isusered" style="width: 200px;">
 
							<option value="1">正在使用</option>
							<option value="0">未使用</option>
							<option value="2">故障</option>
							
					</select></td>
				</tr>
				
					<tr>
					<td class="label" style="padding-left: 100px; font-size: 17px;">柜子类型</td>
					<td><select id="type" name="type" style="width: 200px;">
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
	//子柜子号码验证 
    $.extend($.fn.validatebox.defaults.rules, {
        num: {
    		validator: function(value, param){
    		 
    			 return value > param[0];
    		},
    		message: '子柜子号必须以父柜子号开头'
        }
    });
 function submitForm() { 
             
			$('#myform').form('submit', {
				url : '${pageContext.request.contextPath}/addSonbag',
				onSubmit : function() {
			 return $(this).form('validate');
			  
				},
				success : function(data, status) {
				 
					if (data=="success") { 
						 msgShow('系统提示', '增加成功！', 'info'); 
 window.location.href="${pageContext.request.contextPath}/sonbags?parentbagsid="+${parentbags.parentbagsid } +"";		   
						 
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