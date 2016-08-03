<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>Form Elements - Ace Admin</title>

    <meta name="description" content="Common form elements and layouts" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/rear-end/assets/css/bootstrap.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/rear-end/assets/css/font-awesome.css" />

    <!-- page specific plugin styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/rear-end/assets/css/jquery-ui.custom.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/rear-end/assets/css/chosen.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/rear-end/assets/css/datepicker.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/rear-end/assets/css/bootstrap-timepicker.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/rear-end/assets/css/daterangepicker.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/rear-end/assets/css/bootstrap-datetimepicker.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/rear-end/assets/css/colorpicker.css" />

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
<div class="row">
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
                            Pizza后台管理
                        </small>
                    </a>
                </div>
            </div>
                <%@ include file="../navbar.jsp" %>
<div class="row">
    <div class="col-xs-12">
        <h3 class="header smaller lighter blue">　
            <i class="glyphicon glyphicon-th"></i>
            管理员编辑
        </h3>
        <div class="table-header">
            管理员编辑
        </div>
        <!-- PAGE CONTENT BEGINS -->
        <br><br>
        <form action="${pageContext.request.contextPath}/admin/admin/${ admin.a_id == null ? 'add' : 'update' }" id="admin-form" method="post" class="form-horizontal" role="form">
            <fieldset>
                <div class="hidden">
                    <input name="a_id" type="hidden" value="${admin.a_id}"/>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="account"> 登录账号 </label>
                    <div class="col-sm-9">
                        <input type="text" ${ admin.account == null ? 'add' : 'readonly' } id="account" name="account" class="col-xs-10 col-sm-5" value="${admin.account}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="name"> 姓名 </label>
                    <div class="col-sm-9">
                        <input type="text" id="name" name="name" value="${admin.name}" class="col-xs-10 col-sm-5"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="password"> 密码 </label>
                    <div class="col-sm-9">
                        <input type="password" id="password" name="password"
                               class="col-xs-10 col-sm-5"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="phoneNumber"> 手机号码 </label>
                    <div class="col-sm-9">
                        <input type="text" id="phoneNumber" name="phoneNumber"
                               class="col-xs-10 col-sm-5" value="${admin.phoneNumber}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="email"> 邮箱 </label>
                    <div class="col-sm-9">
                        <input type="email" id="email" name="email"
                               class="col-xs-10 col-sm-5" value="${admin.email}"/>
                    </div>
                </div>
                <div class="clearfix form-actions">
                    <div class="col-md-offset-3 col-md-9">
                        <input class="btn btn-info " type="submit" value="保存"/>
                        &nbsp; &nbsp; &nbsp;
                        <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/admin/list">返回</a>
                    </div>
                </div>
                <div class="hr hr-24"></div>
            </fieldset>
        </form>
        <div class="hr hr-18 dotted hr-double"></div>
        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div><!-- /.main-container -->
</div>

<!-- basic scripts -->

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
<script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/bootstrap.js"></script>

<!-- page specific plugin scripts -->

<!--[if lte IE 8]>
<script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/excanvas.js"></script>
<![endif]-->
<script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/jquery-ui.custom.js"></script>
<script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/jquery.ui.touch-punch.js"></script>
<script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/chosen.jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/fuelux/fuelux.spinner.js"></script>
<script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/date-time/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/date-time/bootstrap-timepicker.js"></script>
<script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/date-time/moment.js"></script>
<script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/date-time/daterangepicker.js"></script>
<script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/date-time/bootstrap-datetimepicker.js"></script>
<script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/bootstrap-colorpicker.js"></script>
<script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/jquery.knob.js"></script>
<script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/jquery.autosize.js"></script>
<script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/jquery.inputlimiter.1.3.1.js"></script>
<script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/jquery.maskedinput.js"></script>
<script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/bootstrap-tag.js"></script>

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
