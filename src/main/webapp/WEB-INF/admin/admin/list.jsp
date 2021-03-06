<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>Tables - Ace Admin</title>
		<meta name="description" content="Static &amp; Dynamic Tables" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
       <%-- <%@ include file="${pageContext.request.contextPath}/resources/rear-end/ace_css.jsp" %>--%>
        <!-- bootstrap & fontawesome -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/rear-end/assets/css/bootstrap.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/rear-end/assets/css/font-awesome.css" />

        <!-- page specific plugin styles -->

        <!-- text fonts -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/rear-end/assets/css/ace-fonts.css" />

        <!-- ace styles -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/rear-end/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />

        <!--[if lte IE 9]>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/rear-end/assets/css/ace-part2.css" class="ace-main-stylesheet" />
        <![endif]-->

        <!--[if lte IE 9]>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/rear-end/assets/css/ace-ie.css" />
        <![endif]-->

        <!-- inline styles related to this page -->
        <%@ include file="../messenger_css.jsp" %>
        <!-- ace settings handler -->
        <script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/ace-extra.js"></script>

        <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

        <!--[if lte IE 8]>
        <script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/html5shiv.js"></script>
        <script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/respond.js"></script>
        <![endif]-->
	</head>
	<body class="no-skin">
    <%--<%@ include file="${pageContext.request.contextPath}/resources/rear-end/ace_js.jsp" %>--%>
		<!-- #section:basics/navbar.layout -->
		<div id="navbar" class="navbar navbar-default">
			<script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>

			<div class="navbar-container" id="navbar-container">
				<!-- #section:basics/sidebar.mobile.toggle -->
				<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
					<span class="sr-only">Toggle sidebar</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<!-- /section:basics/sidebar.mobile.toggle -->
				<div class="navbar-header pull-left">
					<!-- #section:basics/navbar.layout.brand -->
					<a href="#" class="navbar-brand">
						<small>
							<i class="fa fa-leaf"></i>
							Pizza????????????
						</small>
					</a>
				</div>
				<%@ include file="../navbar.jsp" %>
			<div class="row">
				<div class="col-lg-12">
					<h3 class="header smaller lighter blue">???
                        <i class="glyphicon glyphicon-th"></i>
                        ???????????????
                    </h3>
					<div class="table-header">
						datatables
                        <a class="btn btn-sm btn-primary-outline pull-right col-xs-1" href="${pageContext.request.contextPath}/admin/admin/saveUI" id="add-row"><i class="glyphicon glyphicon-plus"></i> ??????</a>
					</div>
					<div class="widget-container fluid-height clearfix" >
						<div id="sample-table-2_wrapper" class="widget-content padded clearfix dataTables_wrapper form-inline no-footer">
							<table id="datatable-editable" class="table table-striped table-bordered table-hover dataTable no-footer" role="grid">
                                <thead>
                                        <th width="200px">?????????</th>
                                        <th width="200px">??????</th>
                                        <th width="200px">??????</th>
                                        <th width="200px">??????</th>
                                        <th width="150px">??????</th>
                                        <%--<th class="sorting_disabled" rowspan="1" colspan="1" aria-label=""></th>--%>
                                </thead>
                                <tbody>
                                </tbody>
					    	</table>
							</div>
						</div>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->
		</div>
		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='${pageContext.request.contextPath}/resources/rear-end/assets/js/jquery.js'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='${pageContext.request.contextPath}/resources/rear-end/assets/js/jquery1x.js'>"+"<"+"/script>");
</script>
<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='${pageContext.request.contextPath}/resources/rear-end/assets/js/jquery.mobile.custom.js'>"+"<"+"/script>");
		</script>
		<script type="text/javascript"> ace.vars['base'] = '${pageContext.request.contextPath}/resources/rear-end'; </script>

    <script type="text/javascript">
        $(document).ready(function() {
            $("#admin_page").addClass("current");
            var oTable= $("#datatable-editable").dataTable({
                "bProcessing": true, // ?????????????????????????????????????????????
                "bServerSide": true,//????????????????????????????????????????????????
                "sPaginationType": "full_numbers", //???????????????full_number????????????????????????????????????????????????????????????
                "iDisplayLength": 10,//????????????10?????????
                "sAjaxSource": "${pageContext.request.contextPath}/admin/admin/dataTable",//????????????????????????
                "fnServerData": retrieveData ,
                "oLanguage" : { // ??????
                    "sProcessing" : "??????????????????...",
                    "sLengthMenu" : "??????_MENU_??? ",
                    "sZeroRecords" : "???????????????????????????",
                    "sInfo" : "???_START_ ??? _END_ ?????????????????????????????? _TOTAL_ ???",
                    "sInfoEmpty" : "????????????0",
                    "sInfoFiltered" : "(??????????????? _MAX_  ???)",
                    "sInfoPostFix" : "",
                    "sSearch" : "??????",
                    "sUrl" : "",
                    "oPaginate" : {
                        "sFirst" : "?????????",
                        "sPrevious" : " ????????? ",
                        "sNext" : " ????????? ",
                        "sLast" : " ???????????? "
                    }
                },
                "aoColumns":
                        [
                            { "mData": "account", 'sClass':'center'},
                            { "mData": "name", 'sClass':'center'},
                            { "mData": "phoneNumber", 'sClass':'center'},
                            { "mData": "email", 'sClass':'center'},
                            {
                                "mDataProp": "a_id",
                                "bSearchable": false,
                                "bSortable": false,
                                "fnRender": function(obj) {
                                    var id=obj.aData.a_id;
                                    var render=  '<a target="_blank"  href="${pageContext.request.contextPath}/admin/admin/show/'+id+'"><i class="glyphicon glyphicon-search"></i>??????</a>';
                                    render += '&nbsp;&nbsp;';
                                    return render;
                                }
                            }

                        ]
            });

// 3????????????????????????????????????,????????????3?????????,??????????????????
            function retrieveData( sSource111,aoData111, fnCallback111) {
                var arrayObj=new Array(
                        { "mData": "account", 'sClass':'center'},
                        { "mData": "name", 'sClass':'center'},
                        { "mData": "phone_number", 'sClass':'center'},
                        { "mData": "email", 'sClass':'center'},
                        { "mData": "a_id", 'sClass':'center'}
                );
                var searchtext="";
                var sort="";
                var order="";
                var pageOffset=0;
                var size=10;
                var sEcho=0;
                for(var i=0;i<aoData111.length;i++){
                    var value=aoData111[i].value;
                    if(aoData111[i].name=="iSortCol_0"){
                        sort=arrayObj[value].mData;
                    }
                    if(aoData111[i].name=="sSortDir_0"){
                        order=value;
                    }
                    if(aoData111[i].name=="sSearch"){
                        searchtext=value;
                    }
                    if(aoData111[i].name=="iDisplayStart"){
                        pageOffset=value
                    }
                    if(aoData111[i].name=="iDisplayLength"){
                        size=value
                    }
                    if(aoData111[i].name=="sEcho"){
                        sEcho=value;
                    }

                }
                var page=Math.floor(pageOffset/size)+1;
                $.ajax({
                    url : sSource111,//??????????????????????????????sAjaxSource
                    data :{"sort":sort,"order":order,"pageOffset":pageOffset,"size":size,"searchText":searchtext,"page":page,"sEcho":sEcho},//????????????datatable?????????????????????????????????,??????????????????,?????????????????????
                    type : 'post',
                    dataType : 'json',
                    async : false,
                    success : function(result) {
                        console.info(result)
                        fnCallback111(result);//????????????????????????????????????????????????,datatable????????????????????????
                    },
                    error : function(msg) {
                    }
                });
            }
            var nEditing = null;

            $('#datatable-editable').on('click', 'a.delete-row', function (e) {
                var id=$(this).attr("name");
                var nRow = $(this).parents('tr')[0];
                $.post("${pageContext.request.contextPath}/admin/admin/delete/"+id, function(result){
                    if(result.success){
                        oTable.fnDeleteRow( nRow );
                        $("#msg >p").text("??????:"+result.msg);
                        $("#msg").removeAttrs("hidden");
                    }else{
                        $("#msg >p").text("??????:"+result.msg);
                        $("#msg").removeAttrs("hidden");
                    }
                    setTimeout(function(){    //????????????0.5s??????
                        $("#msg").attr("hidden","hidden");
                    },5000)
                },"json");
            } );

        });
    </script>
    <c:if test="${result!=null}">
        <script>
            $().ready(function(){               //??? DOM???????????????????????? ?????????????????????????????????????????????????????????????????????????????? ready ?????????
                var success=${result.success};   //    ?????????????????????????????????????????????????????????????????? jQuery ??????????????????????????????????????????????????????????????????????????????????????????
                var msg='${result.msg}';        //ready() ??????????????? ready ?????????????????????????????????
                var type="error";               //ready() ?????????????????????????????????????????????????????????
                if(success==true){
                    type="success"
                }
                $._messengerDefaults = {
                    extraClasses: 'messenger-fixed messenger-theme-future  messenger-on-top messenger-on-left'
                }
                $.globalMessenger().post({  message:"?????????"+ msg,
                    type: type,
                    hideAfter: 3,
                    showCloseButton: true})
            })
        </script>
    </c:if>
    <%@ include file="../messenger_js.jsp" %>
    <script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/bootstrap.js"></script>

    <!-- page specific plugin scripts -->
    <script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/jquery.dataTables.bootstrap.js"></script>

    <!-- ace scripts -->
    <script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/ace/elements.scroller.js"></script>
    <script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/ace/elements.colorpicker.js"></script>
    <script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/ace/elements.fileinput.js"></script>
    <script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/ace/elements.typeahead.js"></script>
    <script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/ace/elements.wysiwyg.js"></script>
    <script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/ace/elements.spinner.js"></script>
    <script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/ace/elements.treeview.js"></script>
    <script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/ace/elements.wizard.js"></script>
    <script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/ace/elements.aside.js"></script>
    <script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/ace/ace.js"></script>
    <script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/ace/ace.ajax-content.js"></script>
    <script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/ace/ace.touch-drag.js"></script>
    <script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/ace/ace.sidebar.js"></script>
    <script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/ace/ace.sidebar-scroll-1.js"></script>
    <script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/ace/ace.submenu-hover.js"></script>
    <script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/ace/ace.widget-box.js"></script>
    <script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/ace/ace.settings.js"></script>
    <script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/ace/ace.settings-rtl.js"></script>
    <script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/ace/ace.settings-skin.js"></script>
    <script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/ace/ace.widget-on-reload.js"></script>
    <script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/ace/ace.searchbox-autocomplete.js"></script>
    <!-- the following scripts are used in demo only for onpage help and you don't need them -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/rear-end/assets/css/ace.onpage-help.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/rear-end/docs/assets/js/themes/sunburst.css" />

    <script type="text/javascript"> ace.vars['base'] = '${pageContext.request.contextPath}/resources/rear-end'; </script>
    <script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/ace/elements.onpage-help.js"></script>
    <script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/ace/ace.onpage-help.js"></script>
    <script src="${pageContext.request.contextPath}/resources/rear-end/docs/assets/js/rainbow.js"></script>
    <script src="${pageContext.request.contextPath}/resources/rear-end/docs/assets/js/language/generic.js"></script>
    <script src="${pageContext.request.contextPath}/resources/rear-end/docs/assets/js/language/html.js"></script>
    <script src="${pageContext.request.contextPath}/resources/rear-end/docs/assets/js/language/css.js"></script>
    <script src="${pageContext.request.contextPath}/resources/rear-end/docs/assets/js/language/javascript.js"></script>



    </body>
</html>
