<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<!-- terminal_information_push_add.jsp -->
<html>
<head>
	<title>控制台-${productName}</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="UTF-8" />
	<link rel="icon" type="image/ico" href="<%=request.getContextPath()%>/assets/images/favicon.ico" />
	<!-- Bootstrap -->
	<link href="<%=request.getContextPath()%>/assets/css/vendor/bootstrap/bootstrap.min.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/font-awesome/css/font-awesome.css" rel="stylesheet">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/vendor/animate/animate.css">
	<link type="text/css" rel="stylesheet" media="all" href="<%=request.getContextPath()%>/assets/js/vendor/mmenu/css/jquery.mmenu.all.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/js/vendor/videobackground/css/jquery.videobackground.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/vendor/bootstrap-checkbox.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/js/vendor/chosen/css/chosen.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/js/vendor/chosen/css/chosen-bootstrap.css">
	<link href="<%=request.getContextPath()%>/assets/css/zhicloud.css" rel="stylesheet">
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
	<![endif]-->
</head>
<body class="bg-1">
<!-- Preloader -->
<div class="mask"><div id="loader"></div></div>
<!--/Preloader -->

<!-- Wrap all page content here -->
<div id="wrap">
	<!-- Make page fluid -->
	<div class="row">
		<%@include file="/views/common/common_menus.jsp" %>
		<!-- Page content -->
		<div id="content" class="col-md-12">
			<!-- page header -->
			<div class="pageheader"><h2><i class="fa fa-database"></i>消息推送管理</h2></div>
			<!-- /page header -->

			<!-- content main container -->
			<div class="main">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">
						<!-- tile -->
						<section class="tile color transparent-black">
							<!-- tile widget -->
							<div class="tile-widget color transparent-black rounded-top-corners nopadding nobg">
								<!-- Nav tabs -->
								<ul class="nav nav-tabs tabdrop">
									<li class="active"><a href="#users-tab" data-toggle="tab" onclick="window.location.href='<%=request.getContextPath() %>/terminalinfo/add';">消息推送</a></li>
									<li><a href="#orders-tab" onclick="window.location.href='<%=request.getContextPath() %>/terminalinfo/list';" data-toggle="tab">消息记录</a></li>
									<div id="space"></div>
								</ul>
								<!-- / Nav tabs -->
							</div>
							<!-- /tile widget -->
	
							<!-- tile header -->
							<div class="tile-header">
								<h3>输入数据推送信息</h3>
								<div class="controls"><a href="#" class="refresh"><i class="fa fa-refresh"></i></a></div>
							</div>
							<!-- /tile header -->

							<!-- tile body -->
							<div class="tile-body">
								<form class="form-horizontal" role="form" parsley-validate id="basicvalidations" action="<%=request.getContextPath() %>/terminalinfo/add" method="post"   >
									<div class="form-group">
										<label for="input07" class="col-sm-2 control-label">收件人*</label>
										<div class="col-sm-4" id="selectbox">
											<select class="chosen-select chosen-transparent form-control" name="groupId" id="input07" parsley-trigger="change" parsley-required="true" parsley-error-container="#selectbox">
												<option value="">请选择收件人</option> 
												<option value="all">所有人</option> 
												<c:forEach items="${groupList }" var="sdi"><option value="${sdi.id }">${sdi.groupName }</option></c:forEach>  
											</select>
										</div>
									</div>
									
									<div class="form-group">
										<label for="input01" class="col-sm-2 control-label">标题 *</label>
										<div class="col-sm-4"><input type="text" class="form-control tit-sty" id="title" name="title"  parsley-trigger="change" parsley-required="true" parsley-maxlength="50"></div>
									</div>
									
									<div class="form-group">
										<label for="region" class="col-sm-2 control-label">地区</label>
										<div class="col-sm-4" id="select_region">
											<select class="chosen-select chosen-transparent form-control" id = "region" name="region">
												<option value="">请选择地区</option>
												<option value="北京">北京</option>
												<option value="天津">天津</option>
												<option value="河北">河北</option>
												<option value="山西">山西</option>
												<option value="内蒙古">内蒙古</option>
												<option value="辽宁">辽宁</option>
												<option value="吉林">吉林</option>
												<option value="黑龙江">黑龙江</option>
												<option value="上海">上海</option>
												<option value="江苏">江苏</option>
												<option value="浙江">浙江</option>
												<option value="安徽">安徽</option>
												<option value="福建">福建</option>
												<option value="江西">江西</option>
												<option value="山东">山东</option>
												<option value="河南">河南</option>
												<option value="湖北">湖北</option>
												<option value="湖南">湖南</option>
												<option value="广东">广东</option>
												<option value="广西">广西</option>
												<option value="海南">海南</option>
												<option value="重庆">重庆</option>
												<option value="四川">四川</option>
												<option value="贵州">贵州</option>
												<option value="云南">云南</option>
												<option value="西藏">西藏</option>
												<option value="陕西">陕西</option>
												<option value="甘肃">甘肃</option>
												<option value="青海">青海</option>
												<option value="宁夏">宁夏</option>
												<option value="新疆">新疆</option>
											</select>
										</div>
									</div>

									<div class="form-group">
										<label for="industry" class="col-sm-2 control-label">行业</label>
										<div class="col-sm-4" id="select_industry">
											<select class="chosen-select chosen-transparent form-control" id = "industry" name="industry">
												<option value="">请选择行业</option>
												<option value="计算机/互联网/通信/电子">计算机/互联网/通信/电子</option>
												<option value="会计/金融/银行/保险">会计/金融/银行/保险</option>
												<option value="贸易/消费/制造/营运">贸易/消费/制造/营运</option>
												<option value="制药/医疗">制药/医疗</option>
												<option value="广告/媒体">广告/媒体</option>
												<option value="房地产/建筑">房地产/建筑</option>
												<option value="专业服务/教育/培训">专业服务/教育/培训</option>
												<option value="服务业">服务业</option>
												<option value="物流/运输">物流/运输</option>
												<option value="能源/原材料">能源/原材料</option>
												<option value="政府/非赢利性机构/其它">政府/非赢利性机构/其它</option>
											</select>
										</div>
									</div>
									                
									<div class="form-group">
										<label for="input05" class="col-sm-2 control-label">内容*</label>
										<div class="col-sm-4"><textarea class="form-control" parsley-trigger="change" parsley-required="true" parsley-maxlength="500" id="content" name="content" rows="6"></textarea></div>
									</div>

									<div class="form-group form-footer footer-white">
										<div class="col-sm-offset-4 col-sm-8">
											<button type="button" class="btn btn-greensea" onclick="saveForm();"><i class="fa fa-plus"></i><span>添加</span></button>
											<button type="reset" class="btn btn-red" onclick="window.location.reload();"><i class="fa fa-refresh"></i><span>重置</span></button>
										</div>
									</div>
								</form>
							</div>
							<!-- /tile body -->
						</section>
						<!-- /tile -->
                
						<div class="tile-body">
							<a href="#modalDialog" id="dia" role="button"  data-toggle="modal"> </a>
							<a href="#modalConfirm" id="con" role="button"   data-toggle="modal"> </a>
							<div class="modal fade" id="modalDialog" tabindex="-1" role="dialog" aria-labelledby="modalDialogLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content" style="width:60%;margin-left:20%;">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">Close</button>
											<h3 class="modal-title" id="modalDialogLabel"><strong>提示</strong></h3>
										</div>
										<div class="modal-body"><p id="tipscontent"></p></div>
									</div>
								</div>
							</div>

							<div class="modal fade" id="modalConfirm" tabindex="-1" role="dialog" aria-labelledby="modalConfirmLabel" aria-hidden="true"  >
								<div class="modal-dialog">
									<div class="modal-content" style="width:60%;margin-left:20%;">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">Close</button>
											<h3 class="modal-title" id="modalConfirmLabel"><strong>确认</strong> </h3>
										</div>
										<div class="modal-body">
											<form role="form"><div class="form-group"><label style="align:center;" id="confirmcontent">确定要删除该镜像吗？</label></div></form>
										</div>
										<div class="modal-footer">
											<button class="btn btn-green"   onclick="toDelete();" data-dismiss="modal" aria-hidden="true">确定</button>
											<button class="btn btn-red" data-dismiss="modal" aria-hidden="true">取消</button>
										</div>
									</div>
								</div>
							</div>                       
						</div>
					</div> 
				</div>
				<!-- /row -->
			</div>
			<!-- /content container -->
		</div>
		<!-- Page content end -->
	</div>
	<!-- Make page fluid-->
</div>
<!-- Wrap all page content end -->
<section class="videocontent" id="video"></section>

<!-- JavaScript -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/plugins/jquery.form.js"></script>
<script>
    var path = '<%=request.getContextPath()%>'; 
    var isCommited = false;

    $(function(){
      $(".chosen-select").chosen({disable_search_threshold: 10});
      //chosen select input
      
      $("#space").width($("body #content .tile .tile-widget.color.transparent-black.nobg .tabdrop").width()
				 -$("body #content .tile .tile-widget.color.transparent-black.nobg .tabdrop li").eq(0).width()
				 -$("body #content .tile .tile-widget.color.transparent-black.nobg .tabdrop li").eq(1).width()
				 -$("body #content .tile .tile-widget.color.transparent-black.nobg .tabdrop li").eq(2).width()
				 -$("body #content .tile .tile-widget.color.transparent-black.nobg .tabdrop li").eq(3).width()
				 -1).height(
				  $("body #content .tile .tile-widget.color.transparent-black.nobg .tabdrop li").eq(0).height());
		$(window).resize(function(){
			 $("#space").width($("body #content .tile .tile-widget.color.transparent-black.nobg .tabdrop").width()
					 -$("body #content .tile .tile-widget.color.transparent-black.nobg .tabdrop li").eq(0).width()
					 -$("body #content .tile .tile-widget.color.transparent-black.nobg .tabdrop li").eq(1).width()
					 -$("body #content .tile .tile-widget.color.transparent-black.nobg .tabdrop li").eq(2).width()
					 -$("body #content .tile .tile-widget.color.transparent-black.nobg .tabdrop li").eq(3).width()
					 -1);
		});
    });
    function saveForm(){
		if(isCommited){
     		return false;
		 } 
		isCommited=true;
    	
		jQuery.ajax({
	        url: path+'/main/checklogin',
	        type: 'post', 
	        dataType: 'json',
	        timeout: 10000,
	        async: true,
	        error: function()
	        {   
	        	isCommited = false; 
	            alert('Error!');
	        },
	        success: function(result)
	        {
	        	if(result.status == "fail"){ 
	        		 isCommited = false;  
	        		 $("#tipscontent").html("登录超时，请重新登录");
	     		      $("#dia").click();
	     		      
		        	}else{ 
 		        			var options = {
 		        					success:function result(data){
 		        						if(data.status == "fail"){
 		        							  isCommited = false; 
							        		  $("#tipscontent").html("添加失败");
							     		      $("#dia").click();  		        							
 		        						}else{  		        							
 		        							window.location.href = path+"/terminalinfo/list" 
 		        						}
 		        					},
 		        					dataType:'json',
 		        					timeout:10000
 		        			};
 		        			var form = jQuery("#basicvalidations");
 		        			form.parsley('validate');
 		        			if(form.parsley('isValid')){  		        				
			        			jQuery("#basicvalidations").ajaxSubmit(options); 
 		        			}
		        	} 
	        }
	     }); 
		
	}
      
    </script>
  </body>
</html>
      

      

      
 
