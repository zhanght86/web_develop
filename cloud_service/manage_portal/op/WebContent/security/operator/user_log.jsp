<%@page import="com.zhicloud.op.login.LoginInfo"%>
<%@page import="com.zhicloud.op.app.helper.LoginHelper"%>
<%@page import="com.zhicloud.op.exception.ErrorCode"%>
<%@page import="com.zhicloud.op.vo.MarkVO"%>
<%@page import="java.util.List"%>
<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
	Integer userType = Integer.valueOf(request.getParameter("userType"));
	LoginInfo loginInfo = LoginHelper.getLoginInfo(request, userType);
 %>
<!DOCTYPE html>
<!-- user_log.jsp -->
<html>
<head>
	<meta charset="UTF-8" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=9;IE=8;IE=7;" />
	<title>运营商管理员 - 用户日志</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
</head>

<body style="visibility:hidden;">
<div class="oper-wrap">
	<div class="tab-container">
		<div id="toolbar">
			<div style="display: table; width: 100%;"> 
				<div class="btn-info">
					<a class="easyui-linkbutton oper-btn-sty" href="javascript:;" data-options="plain:true,iconCls:'icon-print'" id="export_data_btn">导出数据</a>
				</div>
				<div style="display: table-cell; text-align: right;">
					<span class="sear-row">
						<label class="f-mr5">用户类型</label>
						<select id="userType" class="slt-sty">
							<option value="">全部</option>  
				            <option value="2">运营商</option> 
				            <option value="3">代理商</option> 
				            <option value="4">终端用户</option> 
						</select>
					</span>
					<span class="sear-row">
						<label class="f-ml10 f-mr5">操作状态</label>
						<select id="status" class="slt-sty">
							<option value="">全部</option>  
				            <option value="1">成功</option> 
				            <option value="2">失败</option> 
						</select>
					</span>
					<span class="sear-row">
						<label class="f-ml10 f-mr5" style="width:96px;">操作内容或用户名</label>
						<input type="text" id="content" class="messager-input" /> 
					</span>
					<span class="sear-row">
						<a class="easyui-linkbutton oper-btn-sty f-ml10" href="javascript:;" data-options="iconCls:'icon-search'" id="query_agent_btn">查询</a>
					</span>
				</div>
			</div>
		</div>
		<table id="oper_log_datagrid" class="easyui-datagrid" title="用户日志" data-options="url: '<%=request.getContextPath()%>/bean/ajax.do?userType=<%=userType%>&bean=operLogService&method=queryOperLog',queryParams: {},toolbar: '#toolbar',rownumbers: true,striped: true,remoteSort:false,fitColumns: true,pagination: true,pageSize: 20,view: createView(),onLoadSuccess: onLoadSuccess">
			<thead>
				<tr>
					<th data-options="field:'operTime',formatter:timeFormat,width:180">时间</th>
					<th data-options="field:'name',width:180">昵称</th>
					<th data-options="field:'account',width:180">用户名</th>
					<th data-options="field:'userType',formatter:typeFormat,width:180">用户类型</th>
					<th data-options="field:'content',width:340">操作内容</th>
					<th data-options="field:'status',formatter:formatStatus,width:60">状态</th>
				</tr>
			</thead>
		</table>
	</div>
</div>

<!-- JavaScript -->
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
$("#oper_log_datagrid").height( $(document.body).height()-20);
 
function timeFormat(val, row)
{
	return $.formatDateString(val, "yyyyMMddHHmmssSSS", "yyyy-MM-dd HH:mm:ss");
}
function formatStatus(val, row)
{  
	if(val == 1){  
	    return "成功";  
	}else if(val == 2) {
	    return "失败";  
	} 
}   
function typeFormat(val, row)
{  
	if(val == 1){  
	    return "超级管理员";  
	}else if(val == 2) {
	    return "运营商";  
	}else if(val == 3) {
	    return "代理商";  
	}else if(val == 4) {
	    return "终端用户";  
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
}

$(function(){
	// 查询
	$("#query_agent_btn").click(function(){
		var queryParams = {};
		queryParams.content = $("#content").val().trim();
		queryParams.status = $("#status").val().trim();
		queryParams.type = $("#userType").val();
		$('#oper_log_datagrid').datagrid({
			"queryParams": queryParams
		});
	});
	//按标签查询
	$("#status").change(function(){
		var queryParams = {};
		queryParams.content = $("#content").val().trim();
		queryParams.status = $("#status").val().trim();
		queryParams.type = $("#userType").val();
		$('#oper_log_datagrid').datagrid({
			"queryParams": queryParams
		});
	}); 
	$("#userType").change(function(){
		var queryParams = {};
		queryParams.content = $("#content").val().trim();
		queryParams.status = $("#status").val().trim();
		queryParams.type = $("#userType").val();
		$('#oper_log_datagrid').datagrid({
			"queryParams": queryParams
		});
	}); 
	//导出数据
	$("#export_data_btn").click(function() {
		var queryParams = "";
		queryParams += "content="+ $("#content").val().trim();
		queryParams +="&status="+ $("#status").val().trim();
		queryParams +="&userType="+$("#userType").val().trim();
		top.$.messager.confirm("确认", "确定导出？", function (r) {  
	        if (r) {   
				window.location.href= "<%=request.getContextPath()%>/userLogExportData.do?"+queryParams;
	        }  
	    });   
	});
	 $('#content').bind('keypress',function(event){
        if(event.keyCode == "13")    
        {
        	$("#query_agent_btn").click();
        }
    });
});
</script>
</body>
</html>