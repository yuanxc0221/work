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
                    个人中心
                </small>
            </a>
        </div>
        <%@ include file="../navbar.jsp" %>
        <div class="row">
            <div class="col-lg-12">
                <h3 class="header smaller lighter blue">　
                    <i class="glyphicon glyphicon-th"></i>
                    订单管理
                </h3>
                <div class="table-header">
                    datatables
                    　　
                </div>
                <div class="widget-container fluid-height clearfix" >
                    <div id="sample-table-2_wrapper" class="widget-content padded clearfix dataTables_wrapper form-inline no-footer">
                        <table id="datatable-editable" class="table table-striped table-bordered table-hover dataTable no-footer" role="grid">
                            <thead>
                            <th width="150px">订单号</th>
                            <th width="150px">下单人</th>
                            <th width="150px">下单人手机号码</th>
                            <th width="150px">下单人地址</th>
                            <th width="150px">下单时间</th>
                            <th width="140px">操作</th>
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
        $("#goodsType_page").addClass("current");
        var oTable= $("#datatable-editable").dataTable({
            "bProcessing": true, // 是否显示取数据时的那个等待提示
            "bServerSide": true,//这个用来指明是通过服务端来取数据
            "sPaginationType": "full_numbers", //分页风格，full_number会把所有页码显示出来（大概是，自己尝试）
            "iDisplayLength": 10,//每页显示10条数据
            "sAjaxSource": "${pageContext.request.contextPath}/admin/orders/dataTable",//这个是请求的地址
            "fnServerData": retrieveData ,
            "oLanguage" : { // 汉化
                "sProcessing" : "正在加载数据...",
                "sLengthMenu" : "显示_MENU_条 ",
                "sZeroRecords" : "没有您要搜索的内容",
                "sInfo" : "从_START_ 到 _END_ 条记录——总记录数为 _TOTAL_ 条",
                "sInfoEmpty" : "记录数为0",
                "sInfoFiltered" : "(全部记录数 _MAX_  条)",
                "sInfoPostFix" : "",
                "sSearch" : "搜索",
                "sUrl" : "",
                "oPaginate" : {
                    "sFirst" : "第一页",
                    "sPrevious" : " 上一页 ",
                    "sNext" : " 下一页 ",
                    "sLast" : " 最后一页 "
                }
            },
            "aoColumns":
                    [
                        { "mData": "o_sign", 'sClass':'center'},
                        { "mData": "user.name", 'sClass':'center'},
                        { "mData": "user.phone", 'sClass':'center'},
                        { "mData": "user.address", 'sClass':'center'},
                        { "mData": "o_time", 'sClass':'center'},
                        {
                            "mDataProp": "o_integrate",
                            "bSearchable": false,
                            "bSortable": false,
                            "fnRender": function(obj) {
                                var id=obj.aData.o_integrate;
                                var render=  '<a target="_blank"  href="${pageContext.request.contextPath}/admin/orders/saveUI/'+id+'"><i class="glyphicon glyphicon-search"></i>查看</a>';
                                render += '&nbsp;&nbsp;';
                                render += '<a class="delete-row" href="#" name='+id+'><i class="glyphicon glyphicon-remove"></i>删除</a>';
                                return render;
                            }
                        }

                    ]
        });

// 3个参数的名字可以随便命名,但必须是3个参数,少一个都不行
        function retrieveData( sSource111,aoData111, fnCallback111) {
            var arrayObj=new Array(
                    { "mData": "o_sign", 'sClass':'center'},
                    { "mData": "user.name", 'sClass':'center'},
                    { "mData": "user.phone", 'sClass':'center'},
                    { "mData": "user.address", 'sClass':'center'},
                    { "mData": "o_time", 'sClass':'center'},
                    { "mData": "o_id", 'sClass':'center'}

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
                url : sSource111,//这个就是请求地址对应sAjaxSource
                data :{"sort":sort,"order":order,"pageOffset":pageOffset,"size":size,"searchText":searchtext,"pageNo":page,"sEcho":sEcho},//这个是把datatable的一些基本数据传给后台,比如起始位置,每页显示的行数
                type : 'post',
                dataType : 'json',
                async : false,
                success : function(result) {
                    console.info(result)
                    fnCallback111(result);//把返回的数据传给这个方法就可以了,datatable会自动绑定数据的
                },
                error : function(msg) {
                }
            });
        }
        var nEditing = null;

        $('#datatable-editable').on('click', 'a.delete-row', function (e) {
            var id=$(this).attr("name");
            var nRow = $(this).parents('tr')[0];
            $.post("${pageContext.request.contextPath}/admin/orders/delete/"+id, function(data){
                if (data.success == true) {
                    oTable.fnDeleteRow( nRow );
                    $._messengerDefaults = {
                        extraClasses: 'messenger-fixed messenger-theme-future  messenger-on-top messenger-on-left'
                    }
                    $.globalMessenger().post({
                        message: "提示：" + data.msg,
                        type: "success",
                        hideAfter: 2,
                        showCloseButton: true
                    })
                } else {
                    $._messengerDefaults = {
                        extraClasses: 'messenger-fixed messenger-theme-future  messenger-on-top messenger-on-left'
                    }
                    $.globalMessenger().post({
                        message: "提示：" + data.msg,
                        type: "error",
                        hideAfter: 2,
                        showCloseButton: true
                    })
                }
            },"json");
        } );

    });
</script>
<c:if test="${result!=null}">
    <script>
        $().ready(function(){               //当 DOM（文档对象模型） 已经加载，并且页面（包括图像）已经完全呈现时，会发生 ready 事件。
            var success=${result.success};   //    由于该事件在文档就绪后发生，因此把所有其他的 jQuery 事件和函数置于该事件中是非常好的做法。正如上面的例子中那样。
            var msg='${result.msg}';        //ready() 函数规定当 ready 事件发生时执行的代码。
            var type="error";               //ready() 函数仅能用于当前文档，因此无需选择器。
            if(success==true){
                type="success"
            }
            $._messengerDefaults = {
                extraClasses: 'messenger-fixed messenger-theme-future  messenger-on-top messenger-on-left'
            }
            $.globalMessenger().post({  message:"提示："+ msg,
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
