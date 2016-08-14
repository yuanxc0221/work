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
        <%@ include file="../Unavbar.jsp" %>
        <div class="row">
            <div class="col-lg-12">
                <h3 class="header smaller lighter blue">　
                    <i class="glyphicon glyphicon-th"></i>
                    个人中心
                </h3>
                <div class="table-header">
                    个人中心
                    <a class="btn btn-sm btn-primary-outline pull-right col-xs-1" href="${pageContext.request.contextPath}/admin/user/saveUI" id="add-row"><i class="glyphicon glyphicon-plus"></i> 添加</a>
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


<c:if test="${result!=null}">
    <script type="application/javascript">
        $().ready(function(){
            if(${result.success}){
                $("#msg >p").text("提示:${result.msg}");
                $("#msg").removeAttrs("hidden");
            }else{
                $("#msg >p").text("提示:${result.msg}");
                $("#msg").removeAttrs("hidden");
            }
            setTimeout(function(){    //设时延迟0.5s执行
                $("#msg").attr("hidden","hidden");
            },5000)
        })
    </script>
</c:if>
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
