<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<!-- terminal_box_manage.jsp -->
<html>
  <head>
    <title>控制台-${productName}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8" />

    <link rel="icon" type="image/ico" href="<%=request.getContextPath()%>/assets/images/favicon.ico" />
    <!-- Bootstrap -->
    <link href="<%=request.getContextPath()%>/assets/css/vendor/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/vendor/animate/animate.min.css">
    <link type="text/css" rel="stylesheet" media="all" href="<%=request.getContextPath()%>/assets/js/vendor/mmenu/css/jquery.mmenu.all.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/js/vendor/videobackground/css/jquery.videobackground.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/vendor/bootstrap-checkbox.css">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/js/vendor/rickshaw/css/rickshaw.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/js/vendor/morris/css/morris.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/js/vendor/tabdrop/css/tabdrop.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/js/vendor/summernote/css/summernote.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/js/vendor/summernote/css/summernote-bs3.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/js/vendor/chosen/css/chosen.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/js/vendor/chosen/css/chosen-bootstrap.css">

    <link href="<%=request.getContextPath()%>/assets/css/zhicloud.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="<%=request.getContextPath()%>/assets/js/html5shiv.js"></script>
      <script src="<%=request.getContextPath()%>/assets/js/respond.min.js"></script>
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
          <div class="pageheader">
            

            <h2><i class="fa fa-hdd-o"></i> 云终端管理</h2>
            

          </div>
          <!-- /page header -->
          

          <!-- content main container -->
          <div class="main">



            


            <!-- row -->
            <div class="row">
              
              
              <!-- col 6 -->
          <div class="col-md-12">

				  <section class="tile color transparent-black">


 
                  <!-- tile header -->
                      <div class="tile-header">
                          <button type="button" class="btn btn-red delete" id="boxAdd">
                              <i class="fa fa-plus"></i>
                              <span> 新增云终端 </span>
                          </button>
                    <button type="button" class="btn btn-green file-excel-o" onclick="exportData('/export/boxdata')">
                              <i class="fa fa-file-excel-o"></i>
                              <span>导出数据</span>
                    </button>
                      </div>
                      <div class="tile-widget bg-transparent-black-1" >
                          <div class="row">
                              <div class="col-sm-6 col-xs-6" style="z-index: 100;">
                                  <div class="input-group table-options">
                                      <span class="input-group-btn">
                                          <input id="param" type="text" name="param" value="${parameter == null?"":parameter}"/>
                                      </span>
                                      <span class="input-group-btn">
                                          <select id="status" class="chosen-select form-control" style="width: 150px;">
                                              <option value="">分配状态(全部)</option>
                                              <c:if test="${status == 0}">
                                                  <option value="0" selected="selected">未分配</option>
                                              </c:if>
                                              <c:if test="${status != 0}">
                                                  <option value="0">未分配</option>
                                              </c:if>
                                              <c:if test="${status == 1}">
                                                  <option value="1" selected="selected">已分配</option>
                                              </c:if>
                                              <c:if test="${status != 1}">
                                                  <option value="1">已分配</option>
                                              </c:if>
                                          </select>
                              <%--</span>--%>
                           <%--<span class="input-group-btn">--%>
                                          <button id="search_btn" class="btn btn-default" type="button">查看</button>
                                      </span>
                                  </div>
                              </div>
                          </div>
                      </div>
                  <!-- /tile header -->

                  <div class="tile-body no-vpadding">

                    <div class="table-responsive">
                    
                      <table  class="table table-datatable table-custom table-sortable" id="basicDataTable">
                        <thead>
                          <tr>
						    <th class="no-sort">
                            <div class="checkbox check-transparent">
                              <input type="checkbox" value="1" id="allchck">
                              <label for="allchck"></label>
                            </div>
                          </th>
                              <th class="sortable sort-alpha">编号</th>
                              <th class="sortable sort-amount">云终端名称</th>
                              <th class="sortable sort-amount">创建时间</th>
                              <th class="sortable sort-amount">分配用户</th>
                              <th class="sortable sort-amount">分配时间</th>
                              <th class="sortable sort-amount">状态</th>
                              <th class="no-sort">操作</th>
                          </tr>
                        </thead>
                        <tbody>
                          <c:forEach items="${terminal_box_list}" var="terminal_boxes">
                    		<tr class="gradeX">
                    		<td>
								<div class="checkbox check-transparent">
								  <input type="checkbox" value="${terminal_boxes.id}" name="checkboxid" id="chck${terminal_boxes.id}" >
								  <label for="chck${terminal_boxes.id}"></label>
								</div>
                                </td>
                                <td class="cut"><a style="color:#323232;cursor:pointer" href="javascript:void(0);" onclick="mod_box('${terminal_boxes.id }');">${terminal_boxes.serialNumber}</a></td>
                                <td class="cut">${terminal_boxes.name}</td>
                                <td class="cut"><fmt:formatDate
                                        value="${terminal_boxes.createTimeDate}"
                                        pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                <td class="cut">
                                    <c:if test="${terminal_boxes.allocateUser != null}">
                                        ${terminal_boxes.allocateUser}
                                    </c:if>
                                    <c:if test="${terminal_boxes.allocateUser == null}">
                                        无
                                    </c:if>
                                </td>
                                <td class="cut">
                                    <c:if test="${terminal_boxes.allocateTimeDate != null}">
                                        <fmt:formatDate value="${terminal_boxes.allocateTimeDate}"
                                                        pattern="yyyy-MM-dd HH:mm:ss"/>
                                    </c:if>
                                    <c:if test="${terminal_boxes.allocateTimeDate == null}">
                                        无
                                    </c:if>
                                </td>
                                <td>
                                    <c:if test="${terminal_boxes.status == 0}">
                                        <span class="label label-greensea">未分配</span>
                                    </c:if>
                                    <c:if test="${terminal_boxes.status == 1}">
                                        <span class="label label-danger">已分配</span>
                                    </c:if>
                                </td>
                                <td>
                                    <div class="btn-group">
                                        <button type="button"
                                                class="btn btn-default btn-xs dropdown-toggle"
                                                data-toggle="dropdown">
                                            操作 <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu" role="menu">
                                            <li>
                                                <c:if test="${terminal_boxes.status == 0}">
                                                    <a href="#" onclick="allocate_box('${terminal_boxes.id }');">分配</a>
                                                </c:if>
                                                <c:if test="${terminal_boxes.status == 1}">
                                                    <a href="#" onclick="release_box('${terminal_boxes.id }');">回收</a>
                                                </c:if>

                                            </li>
                                            <li><a href="#" onclick="mod_box('${terminal_boxes.id }');">修改</a></li>
                                            <li class="divider"></li>
                                            <li><a href="#" onclick="del_box('${terminal_boxes.id }');">删除</a></li>
                                        </ul>
                                    </div>
                                </td>
                        </tr>
                    	</c:forEach>
                           
                        </tbody>
                      </table>
                      
                    </div>
                    
                    
                    
                  </div>
                   <div class="col-sm-2" style="margin-top: -40px;">
                        <div class="input-group table-options">
                          <select class="chosen-select form-control" id="oper_select">
                            <option value="">批量操作</option> 
                            <option value="delete">删除</option>
                          </select>
                          <span class="input-group-btn">
                            <button class="btn btn-default" type="button" id="submit_oper">提交</button>
                          </span>
                        </div>
                      </div>  
                    <div class="tile-body">

                    <a href="#modalDialog" id="dia" role="button"  data-toggle="modal"> </a>
                    <a href="#modalConfirm" id="con" role="button"   data-toggle="modal"> </a>

                    <div class="modal fade" id="modalConfirm" tabindex="-1" role="dialog" aria-labelledby="modalConfirmLabel" aria-hidden="true"  >
                      <div class="modal-dialog">
                        <div class="modal-content" style="width:60%;margin-left:20%;">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Close</button>
                            <h3 class="modal-title" id="modalConfirmLabel"><strong>确认</strong> </h3>
                          </div>
                          <div class="modal-body">
                            <form role="form">   

                              <div class="form-group">
                                <label style="align:center;" id="confirmcontent">确定要删除该云终端吗？</label>
                               </div>

                            </form>
                          </div>
                            <div class="modal-footer">
                                <button class="btn btn-green" id="confirm_btn" onclick="" data-dismiss="modal" aria-hidden="true">确定
                                </button>
                                <button class="btn btn-red" data-dismiss="modal" aria-hidden="true">取消</button>
                            </div>
                        </div><!-- /.modal-content -->
                      </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->    
                    
                    <%--<div class="modal fade" id="modalimagetype" tabindex="-1" role="dialog" aria-labelledby="modalConfirmLabel" aria-hidden="true">--%>
                      <%--<div class="modal-dialog">--%>
                        <%--<div class="modal-content">--%>
                          <%--<div class="modal-header">--%>
                            <%--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">Close</button>--%>
                            <%--<h3 class="modal-title" id="modalConfirmLabel"><strong>镜像用途</strong></h3>--%>
                          <%--</div>--%>
                          <%--<div class="modal-body">--%>
                            <%--<form class="form-horizontal" role="form" parsley-validate id="basicvalidations_imagetype" action="<%=request.getContextPath() %>/image/change/imagetype" method="post"   >--%>
                            	<%--<input id = "ids_type" name="ids" type="hidden"> --%>
                              <%--<div class="form-group">--%>
		                        <%--<label for="input01" class="col-sm-2 control-label">镜像用途</label>--%>
		                        <%--<div class="col-sm-16">--%>
		                          <%--<div class="radio   col-md-4">--%>
		                            <%--<input type="radio" name="imageType"   id="optionsRadios11" value="1" checked>--%>
		                            <%--<label for="optionsRadios11">通用镜像</label>--%>
		                          <%--</div>--%>
		                          <%--<div class="radio  col-md-4">--%>
		                            <%--<input type="radio" name="imageType"   id="optionsRadios12" value="2">--%>
		                            <%--<label for="optionsRadios12">桌面云专用镜像</label>--%>
		                          <%--</div> --%>
		                           <%----%>
		                        <%--</div>--%>
		                      <%--</div>--%>
		                      <%--<div class="form-group">--%>
		                        <%--<label for="input01" class="col-sm-2 control-label"></label>--%>
		                        <%--<div class="col-sm-16"> --%>
		                          <%--<div class="radio  col-md-4">--%>
		                            <%--<input type="radio" name="imageType"   id="optionsRadios13" value="3">--%>
		                            <%--<label for="optionsRadios13">云主机专用镜像</label>--%>
		                          <%--</div>--%>
		                          <%--<div class="radio  col-md-4">--%>
		                            <%--<input type="radio" name="imageType"   id="optionsRadios14" value="4">--%>
		                            <%--<label for="optionsRadios14">专属云专用镜像</label>--%>
		                          <%--</div>--%>
		                        <%--</div>--%>
		                      <%--</div>--%>

                            <%--</form>--%>
                          <%--</div>--%>
                          <%--<div class="modal-footer">--%>
                            <%--<button class="btn btn-green" onclick="saveImageType();">保存</button>--%>
                            <%--<button class="btn btn-red" data-dismiss="modal" aria-hidden="true">关闭</button>--%>
                          <%--</div>--%>
                        <%--</div><!-- /.modal-content -->--%>
                      <%--</div><!-- /.modal-dialog -->--%>
                    <%--</div><!-- /.modal -->    --%>
                    
                    <div class="modal fade" id="modalDialog" tabindex="-1" role="dialog" aria-labelledby="modalDialogLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content" style="width:60%;margin-left:20%;">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Close</button>
                            <h3 class="modal-title" id="modalDialogLabel"><strong>提示</strong></h3>
                          </div>
                          <div class="modal-body">
                            <p id="tipscontent"></p>
                          </div>
                        </div><!-- /.modal-content -->
                      </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->                        

                  </div> 
 
                </section>
                
                


                
                
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



     
     
    

    <script>
        var path = "<%=request.getContextPath()%>";
        var curId = "";
        var ids = [];
   
    
    $(function(){

      // Add custom class to pagination div
      $.fn.dataTableExt.oStdClasses.sPaging = 'dataTables_paginate pagination-sm paging_bootstrap paging_custom';  
 
      /*************************************************/
      /**************** BASIC DATATABLE ****************/
      /*************************************************/

      /* Define two custom functions (asc and desc) for string sorting */
      jQuery.fn.dataTableExt.oSort['string-case-asc']  = function(x,y) {
          return ((x < y) ? -1 : ((x > y) ?  1 : 0));
      };
       
      jQuery.fn.dataTableExt.oSort['string-case-desc'] = function(x,y) {
          return ((x < y) ?  1 : ((x > y) ? -1 : 0));
      };
 

      /* Build the DataTable with third column using our custom sort functions */
      var oTable01 = $('#basicDataTable').dataTable({
        "sDom":
          "R<'row'<'col-md-6'l><'col-md-6'f>r>"+
          "t"+
          "<'row'<'col-md-4 sm-center'i><'col-md-4'><'col-md-4 text-right sm-center'p>>",
        "oLanguage": {
          "sSearch": "搜索"
        },
        "aaSorting": [ [5,'desc']],
        "aoColumnDefs": [
                         { 'bSortable': false, 'aTargets': [ "no-sort" ] }
                       ], 
        "fnInitComplete": function(oSettings, json) {
            $('.dataTables_filter').css("text-align","right");
            $('.dataTables_filter').css("margin-top","-40px");
            $('.dataTables_filter').css("margin-bottom","0px");
            $('.dataTables_filter input').attr("placeholder", "Search");        }
      });
      
      
 
 

      /* Get the rows which are currently selected */
      function fnGetSelected(oTable01Local){
        return oTable01Local.$('tr.row_selected');
      };
 	  $("div[class='col-md-4 text-right sm-center']").attr("class","tile-footer text-right"); 

       
      
    })
    
     $(function(){

         $("#boxAdd").click(function(){
             window.location.href = "${pageContext.request.contextPath}/box/add";
         });

         jQuery("#submit_oper").click(function(){
             var option = jQuery("#oper_select").val();
             if(option=="delete"){
                 var myids = [];
                 var datatable = $("#basicDataTable").find("tbody tr input[type=checkbox]:checked");
                 $(datatable).each(function(){
                     myids.push(jQuery(this).val());
                 });
                 if(myids.length < 1){
                     $("#tipscontent").html("请选择要删除的云终端");
                     $("#dia").click();
                     return;
                 }
                 ids = myids;
                 $("#confirmcontent").html("确定要删除所选云终端吗？");
                 $("#confirm_btn").attr("onclick","deleteMultTerminalBox();");
                 $("#con").click();
             }
         });

        //check all checkboxes
         $('table thead input[type="checkbox"]').change(function () {
          $(this).parents('table').find('tbody input[type="checkbox"]').prop('checked', $(this).prop('checked'));
        });
  
        // sortable table
        $('.table.table-sortable th.sortable').click(function() {
          var o = $(this).hasClass('sort-asc') ? 'sort-desc' : 'sort-asc';
          $(this).parents('table').find('th.sortable').removeClass('sort-asc').removeClass('sort-desc');
          $(this).addClass(o);
        });

        //chosen select input
        $(".chosen-select").chosen({disable_search_threshold: 10});

        //check toggling
        $('.check-toggler').on('click', function(){
          $(this).toggleClass('checked');
        });

         $("#search_btn").click(function(){
             var param = $("#param").val();
             var status = $("#status").val();
             window.location.href = encodeURI(path + "/box/list?param="+param+"&status="+status);

         });

         $('#param').bind('keypress',function(event){
             if(event.keyCode == "13")
             {
                 $("#search_btn").click();
             }
         });
        
      });

        function mod_box(id) {
            window.location.href = "${pageContext.request.contextPath}/box/"+id+"/modify";
        }

        function del_box(id) {
            $("#confirmcontent").html("确定要删除该云终端吗？");
            curId = id;
            $("#confirm_btn").attr("onclick","deleteTerminalBox();");
            $("#con").click();
        }

        function allocate_box(id) {
            window.location.href = "${pageContext.request.contextPath}/box/"+id+"/allocate";
        }

        function release_box(id) {
            $("#confirmcontent").html("确定要回收该云终端吗？");
            curId = id;
            $("#confirm_btn").attr("onclick","releaseTerminalBox();");
            $("#con").click();
        }

        function releaseTerminalBox() {
            jQuery.ajax({
                url: '<%=request.getContextPath()%>/box/release',
                type: 'post',
                dataType: 'json',
                data:{id:curId},
                async: false,
                timeout: 10000,
                error: function()
                {
                },
                success: function(result)
                {
                    if(result.status=="success"){
                        location.href = path + "/box/list";
                    }else{
                        $("#tipscontent").html(result.message);
                        $("#dia").click();
                    }
                }

            });
        }

        function deleteTerminalBox(){
            jQuery.get("${pageContext.request.contextPath}/box/"+curId+"/delete",
                    function(data){
                        if(data.status=="success"){
                            location.href = "${pageContext.request.contextPath}/box/list";
                        }else{
                            jQuery("#tipscontent").html(data.message);
                            jQuery("#dia").click();
                        }
                    });

        }

        function deleteMultTerminalBox(){
            jQuery.ajax({
                url: '<%=request.getContextPath()%>/box/delete',
                type: 'post',
                dataType: 'json',
                data:{ids:ids},
                async: false,
                timeout: 10000,
                error: function()
                {
                },
                success: function(result)
                {
                    if(result.status=="success"){
                        location.href = path + "/box/list";
                    }else{
                        $("#tipscontent").html(result.message);
                        $("#dia").click();
                    }
                }

            });
        }
      
    </script>
    
  </body>
</html>
      
