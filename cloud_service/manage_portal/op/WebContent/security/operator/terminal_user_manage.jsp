﻿﻿<%@page import="com.zhicloud.op.login.LoginInfo"%>
<%@page import="com.zhicloud.op.app.helper.LoginHelper"%>
<%@page import="com.zhicloud.op.vo.MarkVO"%>
<%@page import="java.util.List"%>
<%@page import="com.zhicloud.op.exception.ErrorCode"%>
<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
	Integer userType = Integer.valueOf(request.getParameter("userType"));
	LoginInfo loginInfo = LoginHelper.getLoginInfo(request, userType);
	List<MarkVO> markList = (List<MarkVO>)request.getAttribute("markList");
%>
<!DOCTYPE html>
<!-- terminal_user_manage.jsp -->
<html>
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=9;IE=8;IE=7;" />
		
		<title>运营商管理员 - 终端用户管理</title>
		
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/easyui/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/easyui/themes/icon.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
		<style type="text/css">
		#agent_datagrid {
			border: 0px solid red;
		}
		.panel-header {
			border-top: 0px;
			border-bottom: 1px solid #dddddd;
		}
		.panel-header,.panel-body {
			border-left: 0px;
			border-right: 0px;
		}
		.panel-body {
			border-bottom: 0px;
		} 
		.messager-input {
		  width: 100px;
		  padding: 2px 2px 3px 2px;
		  height:16px;
		  border: 1px solid #95B8E7;
		  margin:2px;
		}
		</style>
	</head>
	<body style="visibility:hidden;">
		<form id="big_form"  method="post">
	        <input name="terminalUser_id" id="terminalUser_id" type="hidden" value=""/>
			<table id="terminal_user_datagrid"  class="easyui-datagrid" title="终端用户管理"
				data-options="
					url: '<%=request.getContextPath()%>/bean/ajax.do?userType=<%=userType%>&bean=terminalUserService&method=queryTerminalUserForOperator',
					queryParams: {},
					toolbar: '#toolbar',
					rownumbers: true,
					striped: true,
					remoteSort: false,
					fitColumns: false,
					pagination: true,
					pageList: [10, 20, 50, 100, 200],
					pageSize: 20,
					view:createView(),
					onLoadSuccess: onLoadSuccess
				">
				<thead>
					<tr>
						<th data-options="checkbox:true"></th>
						<th field="name" width="100px">昵称</th>
						<th field="account" width="100px" sortable=true>邮箱</th>
						<th field="phone" width="100px">手机</th>
						<th field="belongingAccount" formatter="belongingFormatter" width="100px" sortable=true>归属</th>
						<th field="markName"   width="80px" sortable=true>标签</th>
						<th field="percentOff"   width="80px" sortable=true>折扣率(%)</th>
						<th field="account_balance"   width="80px" sortable=true>账户余额</th>
						<th field="recharge"   width="80px" sortable=true>累计充值</th>
						<th field="consum"   width="80px" sortable=true>累计消费</th>
						<th field="hostAmount" formatter="hostFormatter"  width="80px" sortable=true>主机数量</th>
						<th field="vpcAmount" formatter="vpcFormatter" width="80px" sortable=true>VPC数量</th>
						<th field="diskAmount" formatter="diskFormatter" width="80px" sortable=true>云硬盘数量</th>
						<th field="status" formatter="formatStatus" width="80px">状态</th>
						<th field="createTime" formatter="timeFormat" width="100px">创建时间</th>
						<th field="lastOperTime" formatter="timeFormat" width="100px">最近操作时间</th>
						<th field="operate" formatter="terminalUserColumnFormatter" width="300px">操作</th>
					</tr>
				</thead>
			</table>
	
			<div id="toolbar" style="padding: 3px;">
				<div style="display: table; width: 100%;">
					<div style="margin-bottom:5px;">
						<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" id="add_terminal_user_btn">添加</a> 
						<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" id="del_terminal_user_btn">删除</a>
						<a href="#" class="easyui-linkbutton" iconCls="icon-ok" plain="true" id="set_terminal_user_btn">设置标签</a>
						<a href="#" class="easyui-linkbutton" iconCls="icon-filter" plain="true" id="cash_terminal_user_btn">发放现金券</a>
						<a href="#" class="easyui-linkbutton" iconCls="icon-print" plain="true" id="export_data_btn">导出数据</a>
						<a href="#" class="easyui-linkbutton" iconCls="icon-print" plain="true" id="export_consumdata_btn">导出消费数据</a>
					</div>
					<div style="margin-left:5px;">
					折扣&#12288;&#12288;  
					<select id="percentoff_op" style="position: relative; top: 2px;">
						<option value = "0">等于</option>
						<option value = "1">大于</option>
						<option value = "-1">小于</option>
					</select>
					<input class="messager-input" type="text" name = "percentoff" id="percentoff"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					账户余额
					<select id="account_balance_op" style="position: relative; top: 2px;">
						<option value = "0">等于</option>
						<option value = "1">大于</option>
						<option value = "-1">小于</option>
					</select>
					<input class="messager-input" type="text" name = "account_balance" id="account_balance"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span style="width:60px;">创建时间</span> 从 <input class="easyui-datebox" type="text" name = "create_time_from" id="create_time_from" style="width:100px"/>
					到 <input class="easyui-datebox" type="text" name = "create_time_to" id="create_time_to" style="width:100px"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span style="width:60px;">充值时间</span> 从 <input class="easyui-datebox" type="text" name = "recharge_time_from" id="recharge_time_from" style="width:100px"/>
						到 <input class="easyui-datebox" type="text" name = "recharge_time_to" id="recharge_time_to" style="width:100px"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span style="width:60px;">消费时间</span> 从 <input class="easyui-datebox" type="text" name = "consum_time_from" id="consum_time_from" style="width:100px"/>
					到 <input class="easyui-datebox" type="text" name = "consum_time_to" id="consum_time_to" style="width:100px"/>					
					<br>
					累计充值
					<select id="recharge_op" style="position: relative; top: 2px;">
						<option value = "0">等于</option>
						<option value = "1">大于</option>
						<option value = "-1">小于</option>
					</select>					
					<input class="messager-input" type="text" name = "recharge" id="recharge"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					累计消费
					<select id="consum_op" style="position: relative; top: 2px;">
						<option value = "0">等于</option>
						<option value = "1">大于</option>
						<option value = "-1">小于</option>
					</select>						
					<input class="messager-input" type="text" name = "consum" id="consum"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					标签&#12288;&#12288;&#12288;&nbsp;
						<select id="query_by_mark" style="position: relative; top: 2px;">
							<option value="all">全部</option>
							<%
							for( MarkVO mark : markList ) 
							{ 
				  			%> 
				            <option value="<%=mark.getId()%>"><%=mark.getName()%></option>
				            <%
								} 
						    %>
						</select>
						邮箱<input class="messager-input" type="text" name = "account" id="account"/>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						手机号码&nbsp;&nbsp;&nbsp;&nbsp;<input class="messager-input" type="text" name = "phone" id="phone"/> 

						<a href="#" class="easyui-linkbutton" iconCls="icon-search" id="query_agent_btn">查询</a>
						<a href="#" class="easyui-linkbutton" iconCls="icon-redo" id="clear_agent_btn">清除</a>
						
					</div>
				</div>
			</div>
		</form>
	</body>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.ext.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.util.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript">
	window.name = "selfWin";
	
	var ajax = new RemoteCallUtil("<%=request.getContextPath()%>/bean/call.do?userType=<%=userType%>");
	ajax.async = false;
	

	// 布局初始化
	$("#terminal_user_datagrid").height( $(document.body).height());

	function formatCreateTime(val, row)
	{
		return $.formatDateString(val, "yyyyMMddHHmmssSSS", "yyyy-MM-dd HH:mm:ss");
	}
	
	function formatStatus(val,row)
	{  
		if(val == 1) {  
		    return "未验证";  
		} else if(val == 2) {
		    return "正常";  
		} else if(val == 3) {
		 	return "禁用";
		} else if(val == 4) {
			return "欠费";
		} else {
			return "结束";
		}
	}  
	function timeFormat(val, row)
	{
		if(val!=null && val!=""){
			return $.formatDateString(val, "yyyyMMddHHmmssSSS", "yyyy-MM-dd HH:mm:ss");
		}else{
			return "无";
		}
	}
	function formatBelongingType(val,row){
		if(val == 1){
			return "运营商";
		}else{
			return "代理商";
		}
	}
	
	function terminalUserColumnFormatter(value, row, index)
	{
		return "<div row_index='"+index+"'>\
					<a href='#' class='datagrid_row_linkbutton modify_btn'>修改</a>\
					<a href='#' class='datagrid_row_linkbutton reset_password_btn'>重置密码</a>\
					<a href='#' class='datagrid_row_linkbutton recharge_btn'>充值记录</a>\
					<a href='#' class='datagrid_row_linkbutton consume_btn'>消费记录</a>\
					<a href='#' class='datagrid_row_linkbutton operation_btn'>操作日志</a>\
				</div>";
	}
	function hostFormatter(value, row, index)
	{
		var host_amount = $("#terminal_user_datagrid").datagrid("getData").rows[index].hostAmount;
		if(host_amount>0){
			return "<div row_index='"+index+"'>\
						<a href='#' class='datagrid_row_linkbutton detail_host_btn'>"+host_amount+"</a>\
					</div>";
		}else{
			return "0";
		}
	}
	function vpcFormatter(value, row, index)
	{
		var vpc_amount = $("#terminal_user_datagrid").datagrid("getData").rows[index].vpcAmount;
		if(vpc_amount>0){
			return "<div row_index='"+index+"'>\
						<a href='#' class='datagrid_row_linkbutton detail_vpc_btn'>"+vpc_amount+"</a>\
					</div>";
		}else{
			return "0";
		}
	}
	function diskFormatter(value, row, index)
	{
		var disk_amount = $("#terminal_user_datagrid").datagrid("getData").rows[index].diskAmount;
		if(disk_amount>0){
			return "<div row_index='"+index+"'>\
						<a href='#' class='datagrid_row_linkbutton detail_disk_btn'>"+disk_amount+"</a>\
					</div>";
		}else{
			return "0";
		}
	}
	
	function belongingFormatter(value, row, index)
	{
		var type = $("#terminal_user_datagrid").datagrid("getData").rows[index].belongingType;
		var account = $("#terminal_user_datagrid").datagrid("getData").rows[index].belongingAccount;
		if(account==null || account==""){
			return "";
		}
		else if(type==1){
			return "<div row_index='"+index+"'>\
					[运]"+account+"\
				</div>";
		}else if(type==2){
			return "<div row_index='"+index+"'>\
				[代]"+account+"\
			</div>";
		}else{
			return "";
		}
	}
	
	//查询结果为空
	function createView(){
		return $.extend({},$.fn.datagrid.defaults.view,{
		    onAfterRender:function(target){
		        $.fn.datagrid.defaults.view.onAfterRender.call(this,target);
		        var opts = $(target).datagrid('options');
		        var vc = $(target).datagrid('getPanel').children('div.datagrid-view');
		        vc.children('div.datagrid-empty').remove();
		        if (!$(target).datagrid('getRows').length){
		            var d = $('<div class="datagrid-empty"></div>').html( '没有相关记录').appendTo(vc);
		            d.css({
		                position:'absolute',
		                left:0,
		                top:50,
		                width:'100%',
		                textAlign:'center'
		            });
		        }
		    }
	    });
	}
	
	function onLoadSuccess()
	{
		$("body").css({
			"visibility":"visible"
		});
		// 每一行的'修改'按钮
		$("a.modify_btn").click(function(){
			$this = $(this);
			rowIndex = $this.parent().attr("row_index");
			var data = $("#terminal_user_datagrid").datagrid("getData");
			var id = data.rows[rowIndex].id; 
			top.showSingleDialog({
				url: "<%=request.getContextPath()%>/bean/page.do?type=4&userType=<%=userType%>&bean=terminalUserService&method=modPage&terminalUserId="+encodeURIComponent(id),
				onClose: function(data){
					$('#terminal_user_datagrid').datagrid('reload');
				}
			});
		});
		// 每一行的'重置密码'按钮
		$("a.reset_password_btn").click(function(){
			$this = $(this);
			rowIndex = $this.parent().attr("row_index");
			var data = $("#terminal_user_datagrid").datagrid("getData");
			var id = data.rows[rowIndex].id;
			top.showSingleDialog({
				url: "<%=request.getContextPath()%>/bean/page.do?type=4&userType=<%=userType%>&bean=terminalUserService&method=resetPasswordPage&terminalUserId="+encodeURIComponent(id),
				onClose: function(data){
					$('#terminal_user_datagrid').datagrid('reload');
				}
			});
		});
		// 每一行的'充值记录'按钮
		$("a.recharge_btn").click(function(){
			$this = $(this);
			rowIndex = $this.parent().attr("row_index");
			var data = $("#terminal_user_datagrid").datagrid("getData");
			var id = data.rows[rowIndex].id;
			top.showSingleDialog({
				url: "<%=request.getContextPath()%>/bean/page.do?type=4&userType=<%=userType%>&bean=accountBalanceService&method=getRechargeRecordByUserId&terminalUserId="+encodeURIComponent(id),
				onClose: function(data){
					$('#terminal_user_datagrid').datagrid('reload');
				}
			});
		});
		// 每一行的'消费记录'按钮
		$("a.consume_btn").click(function(){
			$this = $(this);
			rowIndex = $this.parent().attr("row_index");
			var data = $("#terminal_user_datagrid").datagrid("getData");
			var id = data.rows[rowIndex].id;
			top.showSingleDialog({
				url: "<%=request.getContextPath()%>/bean/page.do?type=4&userType=<%=userType%>&bean=accountBalanceService&method=toConsumptionRecordPage&terminalUserId="+encodeURIComponent(id),
				onClose: function(data){
					$('#terminal_user_datagrid').datagrid('reload');
				}
			});
		});
		// 每一行的'操作日志'按钮
		$("a.operation_btn").click(function(){
			$this = $(this);
			rowIndex = $this.parent().attr("row_index");
			var data = $("#terminal_user_datagrid").datagrid("getData");
			var id = data.rows[rowIndex].id;
			top.showSingleDialog({
				url: "<%=request.getContextPath()%>/bean/page.do?type=4&userType=<%=userType%>&bean=operLogService&method=managePage&terminalUserId="+encodeURIComponent(id),
				onClose: function(data){
					$('#terminal_user_datagrid').datagrid('reload');
				}
			});
		});
		// 每一行的'主机数量详情'按钮
		$("a.detail_host_btn").click(function(){
			$this = $(this);
			rowIndex = $this.parent().attr("row_index");
			var data = $("#terminal_user_datagrid").datagrid("getData");
			var id = data.rows[rowIndex].id;
			window.location.href = "<%=request.getContextPath()%>/bean/ajax.do?userType=<%=userType%>&bean=cloudHostService&method=managePage&user_id="+id;
		});
		// 每一行的'vpc数量详情'按钮
		$("a.detail_vpc_btn").click(function(){
			$this = $(this);
			rowIndex = $this.parent().attr("row_index");
			var data = $("#terminal_user_datagrid").datagrid("getData");
			var id = data.rows[rowIndex].id;
			window.location.href = "<%=request.getContextPath()%>/bean/ajax.do?userType=<%=userType%>&bean=vpcService&method=getAllVpcPage&user_id="+id;
		});
		// 每一行的'云硬盘数量详情'按钮
		$("a.detail_disk_btn").click(function(){
			$this = $(this);
			rowIndex = $this.parent().attr("row_index");
			var data = $("#terminal_user_datagrid").datagrid("getData");
			var id = data.rows[rowIndex].id;
			window.location.href = "<%=request.getContextPath()%>/bean/ajax.do?userType=<%=userType%>&bean=cloudDiskService&method=managePage&user_id="+id;
		});
	}
	
	$(function(){
		// 查询
		$("#query_agent_btn").click(function(){
			var queryParams = {};
			queryParams.percent_off_op = $("#percentoff_op").val().trim();//.combobox("getValue");
			queryParams.percent_off = $("#percentoff").val().trim();
			if($("#percentoff").val()!=""){
			if(!(/^[0-9][0-9]?$/.test($("#percentoff").val()))){ 
			    top.$.messager.alert("警告","折扣请输入0-99的整数","warning");
				return;
			}
			}
			
			queryParams.account_balance = $("#account_balance").val().trim();
			queryParams.account_balance_op = $("#account_balance_op").val().trim();//.combobox("getValue");
			
			if($("#account_balance").val()!=""){
				if(!(/^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/.test($("#account_balance").val()))){ 
				    top.$.messager.alert("警告","请输入正确的账户余额","warning");
					return;
				}
			}		
			queryParams.create_time_from = $("#create_time_from").datebox("getValue");
			if($("#create_time_from").datebox("getValue")!=""){
				if(!(/\d{4}-\d{2}-\d{2}/.test($("#create_time_from").datebox("getValue")))){ 
				    top.$.messager.alert("警告","请输入正确的创建起始日期","warning");
					return;
				}
			}				
			queryParams.create_time_to = $("#create_time_to").datebox("getValue");
			if($("#create_time_to").datebox("getValue")!=""){
				if(!(/\d{4}-\d{2}-\d{2}/.test($("#create_time_to").datebox("getValue")))){ 
				    top.$.messager.alert("警告","请输入正确的创建截止日期","warning");
					return;
				}
			}		
			queryParams.recharge_time_from = $("#recharge_time_from").datebox("getValue");
			if($("#recharge_time_from").datebox("getValue")!=""){
				if(!(/\d{4}-\d{2}-\d{2}/.test($("#recharge_time_from").datebox("getValue")))){ 
				    top.$.messager.alert("警告","请输入正确的充值起始日期","warning");
					return;
				}
			}	
			
			queryParams.recharge_time_to=$("#recharge_time_to").datebox("getValue");
			if($("#recharge_time_to").datebox("getValue")!=""){
				if(!(/\d{4}-\d{2}-\d{2}/.test($("#recharge_time_to").datebox("getValue")))){ 
				    top.$.messager.alert("警告","请输入正确的充值截止日期","warning");
					return;
				}
			}	
			
			queryParams.consum_time_from = $("#consum_time_from").datebox("getValue");
			if($("#consum_time_from").datebox("getValue")!=""){
				if(!(/\d{4}-\d{2}-\d{2}/.test($("#consum_time_from").datebox("getValue")))){ 
				    top.$.messager.alert("警告","请输入正确的消费起始日期","warning");
					return;
				}
			}	
			
			queryParams.consum_time_to=$("#consum_time_to").datebox("getValue");
			if($("#consum_time_to").datebox("getValue")!=""){
				if(!(/\d{4}-\d{2}-\d{2}/.test($("#consum_time_to").datebox("getValue")))){ 
				    top.$.messager.alert("警告","请输入正确的消费截止日期","warning");
					return;
				}
			}
			
			queryParams.recharge = $("#recharge").val().trim();
			queryParams.recharge_op = $("#recharge_op").val().trim();//.combobox("getValue");
			if($("#recharge").val()!=""){
				if(!(/^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/.test($("#recharge").val()))){ 
				    top.$.messager.alert("警告","请输入正确的充值金额","warning");
					return;
				}
			}				
			
			queryParams.consum = $("#consum").val().trim();
			queryParams.consum_op = $("#consum_op").val().trim();//.combobox("getValue");
			
			if($("#consum").val()!=""){
				if(!(/^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/.test($("#consum").val()))){ 
				    top.$.messager.alert("警告","请输入正确的消费金额","warning");
					return;
				}
			}				
			queryParams.account = $("#account").val().trim();
			queryParams.phone = $("#phone").val().trim();
			if($("#phone").val()!=""){
				if(!(/^[0-9][0-9]{0,10}?$/.test($("#phone").val()))){ 
				    top.$.messager.alert("警告","请输入正确的手机号码","warning");
					return;
				}
			}
			queryParams.query_mark = $("#query_by_mark").val().trim();//.combobox("getValue");
			$('#terminal_user_datagrid').datagrid({
				"queryParams": queryParams
			});
		});
		//清除
		$("#clear_agent_btn").click(function(){
			$("#percentoff").val("");
			$("#percentoff_op").val("0");//.combobox("setValue","0");
			$("#account_balance").val("");
			$("#account_balance_op").val("0");//.combobox("setValue","0");
			$("#create_time_from").val("");
			$("#create_time_to").val("");
			$("#recharge").val("");
			$("#recharge_op").val("0");//.combobox("setValue","0");
			$("#consum").val("");
			$("#consum_op").val("0");//.combobox("setValue","0");
			$("#account").val("");
			$("#query_by_mark").val("all");//.combobox("setValue","all");
			$("#create_time_from").datebox("setValue","");
			$("#create_time_to").datebox("setValue","");
			$("#recharge_time_from").datebox("setValue","");
			$("#recharge_time_to").datebox("setValue","");
			$("#consum_time_from").datebox("setValue","");
			$("#consum_time_to").datebox("setValue","");
			$("#phone").val("");
			
		});		
		// 添加终端用户
		$("#add_terminal_user_btn").click(function(){
			top.showSingleDialog({
				url: "<%=request.getContextPath()%>/bean/page.do?userType=<%=userType%>&bean=terminalUserService&method=addPage",
				onClose: function(data){
					$('#terminal_user_datagrid').datagrid('reload');
				}
			});
		});
		// 删除终端用户
		$("#del_terminal_user_btn").click(function() {
			var rows = $('#terminal_user_datagrid').datagrid('getSelections');
			if (rows == null || rows.length == 0) {
				top.$.messager.alert("警告","未选择删除项","warning");
				return;
			}
			var ids = rows.joinProperty("id");
			top.$.messager.confirm("确认", "删除终端用户，并删除其已申请的云主机<br/>确定要删除吗?", function (r) {  
		        if (r) {   
					ajax.remoteCall("bean://terminalUserService:deleteTerminalUserByIds",
						[ ids ], 
						function(reply) {
							if (reply.status == "exception") {
								if(reply.errorCode=="<%=ErrorCode.ERROR_CODE_FAIL_TO_CALL_BEFORE_LOGIN%>"){
									top.$.messager.alert("警告","会话超时，请重新登录","warning",function(){
										top.location.reload();
									});
								}else{
									top.$.messager.alert("警告",reply.exceptionMessage,"warning",function(){
										top.location.reload();
									});
								}
							} else {
								$('#terminal_user_datagrid').datagrid(
										'reload');
							}
						}
					);
		        }  
		    }); 
		});
		$("#terminal_user_add_dlg_close_btn").click(function() {
			$("#win").dialog("close");
		});
		// 批量设置标签
		$("#set_terminal_user_btn").click(function() {
			var rows = $('#terminal_user_datagrid').datagrid('getSelections');
			if (rows == null || rows.length == 0) {
				top.$.messager.alert("警告","未选择数据项","warning");
				return;
			}
			top.showSingleDialog({
				url: "<%=request.getContextPath()%>/bean/page.do?userType=<%=userType%>&bean=terminalUserService&method=setMarkPage&userids="+rows.joinProperty("id").toString(),
				onClose: function(data){
					$('#terminal_user_datagrid').datagrid('reload');
				}
			});
		});		
		// 发放现金券
		$("#cash_terminal_user_btn").click(function() {
			var rows = $('#terminal_user_datagrid').datagrid('getSelections');
			if (rows == null || rows.length == 0) {
				top.$.messager.alert("警告","未选择数据项","warning");
				return;
			}
			if(rows.length!=1){
				top.$.messager.alert("警告","请选择一条数据进行操作","warning");
				return;				
			}
			top.showSingleDialog({
				url: "<%=request.getContextPath()%>/bean/page.do?userType=<%=userType%>&bean=terminalUserService&method=operatorCashCouponPage&userid="+rows[0].id,
				onClose: function(data){
					$('#terminal_user_datagrid').datagrid('reload');
				}
			});
		});	
		//导出数据
		$("#export_data_btn").click(function() {
			var queryParams = "";
			queryParams += "percent_off_op="+ $("#percentoff_op").val().trim();//.combobox("getValue");
			queryParams +="&percent_off="+ $("#percentoff").val().trim();
			if($("#percentoff").val()!=""){
			if(!(/^[0-9][0-9]?$/.test($("#percentoff").val()))){ 
			    top.$.messager.alert("警告","折扣请输入0-99的整数","warning");
				return;
			}
			}
			
			queryParams +="&account_balance="+$("#account_balance").val().trim();
			queryParams +="&account_balance_op="+$("#account_balance_op").val().trim();//.combobox("getValue");
			
			if($("#account_balance").val()!=""){
				if(!(/^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/.test($("#account_balance").val()))){ 
				    top.$.messager.alert("警告","请输入正确的账户余额","warning");
					return;
				}
			}		
			queryParams +="&create_time_from="+$("#create_time_from").datebox("getValue");
			if($("#create_time_from").datebox("getValue")!=""){
				if(!(/\d{4}-\d{2}-\d{2}/.test($("#create_time_from").datebox("getValue")))){ 
				    top.$.messager.alert("警告","请输入正确的创建起始日期","warning");
					return;
				}
			}				
			queryParams +="&create_time_to="+$("#create_time_to").datebox("getValue");
			if($("#create_time_to").datebox("getValue")!=""){
				if(!(/\d{4}-\d{2}-\d{2}/.test($("#create_time_to").datebox("getValue")))){ 
				    top.$.messager.alert("警告","请输入正确的创建截止日期","warning");
					return;
				}
			}	
			
			queryParams +="&recharge_time_from="+$("#recharge_time_from").datebox("getValue");
			if($("#recharge_time_from").datebox("getValue")!=""){
				if(!(/\d{4}-\d{2}-\d{2}/.test($("#recharge_time_from").datebox("getValue")))){ 
				    top.$.messager.alert("警告","请输入正确的充值起始日期","warning");
					return;
				}
			}	
			
			queryParams +="&recharge_time_to="+$("#recharge_time_to").datebox("getValue");
			if($("#recharge_time_to").datebox("getValue")!=""){
				if(!(/\d{4}-\d{2}-\d{2}/.test($("#recharge_time_to").datebox("getValue")))){ 
				    top.$.messager.alert("警告","请输入正确的充值截止日期","warning");
					return;
				}
			}		

			queryParams +="&consum_time_from="+$("#consum_time_from").datebox("getValue");
			if($("#consum_time_from").datebox("getValue")!=""){
				if(!(/\d{4}-\d{2}-\d{2}/.test($("#consum_time_from").datebox("getValue")))){ 
				    top.$.messager.alert("警告","请输入正确的消费起始日期","warning");
					return;
				}
			}	
			
			queryParams +="&consum_time_to="+$("#consum_time_to").datebox("getValue");
			if($("#consum_time_to").datebox("getValue")!=""){
				if(!(/\d{4}-\d{2}-\d{2}/.test($("#consum_time_to").datebox("getValue")))){ 
				    top.$.messager.alert("警告","请输入正确的消费截止日期","warning");
					return;
				}
			}	
			
			queryParams +="&recharge="+ $("#recharge").val().trim();
			queryParams +="&recharge_op="+$("#recharge_op").val().trim();//.combobox("getValue");
			if($("#recharge").val()!=""){
				if(!(/^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/.test($("#recharge").val()))){ 
				    top.$.messager.alert("警告","请输入正确的充值金额","warning");
					return;
				}
			}				
			
			queryParams +="&consum="+$("#consum").val().trim();
			queryParams +="&consum_op="+$("#consum_op").val().trim();//.combobox("getValue");
			
			if($("#consum").val()!=""){
				if(!(/^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/.test($("#consum").val()))){ 
				    top.$.messager.alert("警告","请输入正确的消费金额","warning");
					return;
				}
			}				
			queryParams +="&account="+ $("#account").val().trim();
			queryParams +="&query_mark="+$("#query_by_mark").val().trim();//.combobox("getValue");
			if($("#account").val().trim()!=""){
				if($("#account").val().trim().length>50){ 
				    top.$.messager.alert("警告","邮箱最多允许50个字符","warning");
					return;
				}
			}
			top.$.messager.confirm("确认", "确定导出？", function (r) {  
		        if (r) {   
					window.location.href= "<%=request.getContextPath()%>/terminaluserExportData.do?"+queryParams;
		        }  
		    });   
		});		
		//导出消费数据
		$("#export_consumdata_btn").click(function() {
			var queryParams = "";
			if($("#consum_time_from").datebox("getValue")==""){
			    top.$.messager.alert("警告","请输入消费起始日期","warning");
				return;
			}
			queryParams +="&consum_time_from="+$("#consum_time_from").datebox("getValue");
			if($("#consum_time_from").datebox("getValue")!=""){
				if(!(/\d{4}-\d{2}-\d{2}/.test($("#consum_time_from").datebox("getValue")))){ 
				    top.$.messager.alert("警告","请输入正确的消费起始日期","warning");
					return;
				}
			}	
			if($("#consum_time_to").datebox("getValue")==""){
			    top.$.messager.alert("警告","请输入消费截止日期","warning");
				return;
			}			
			queryParams +="&consum_time_to="+$("#consum_time_to").datebox("getValue");
			if($("#consum_time_to").datebox("getValue")!=""){
				if(!(/\d{4}-\d{2}-\d{2}/.test($("#consum_time_to").datebox("getValue")))){ 
				    top.$.messager.alert("警告","请输入正确的消费截止日期","warning");
					return;
				}
			}	
			
			top.$.messager.confirm("确认", "确定导出？", function (r) {  
		        if (r) {   
					window.location.href= "<%=request.getContextPath()%>/userConsumExportData.do?"+queryParams;
		        }  
		    });   
		});			
		$('#terminal_user_account').bind('keypress',function(event){
	        if(event.keyCode == "13")    
	        {
	        	$("#query_terminal_user_btn").click();
	        }
	    });
	});
	</script>
</html>