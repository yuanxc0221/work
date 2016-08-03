<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!-- ace settings handler -->
<script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/ace-extra.js"></script>
<!--[if lte IE 8]>
<script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/html5shiv.js"></script>
<script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/respond.js"></script>
<![endif]-->
<script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/bootstrap.js"></script>

<!-- page specific plugin scripts -->
<script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/jquery.dataTables.js"></script>
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
<script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/ace/elements.onpage-help.js"></script>
<script src="${pageContext.request.contextPath}/resources/rear-end/assets/js/ace/ace.onpage-help.js"></script>
<script src="${pageContext.request.contextPath}/resources/rear-end/docs/assets/js/rainbow.js"></script>
<script src="${pageContext.request.contextPath}/resources/rear-end/docs/assets/js/language/generic.js"></script>
<script src="${pageContext.request.contextPath}/resources/rear-end/docs/assets/js/language/html.js"></script>
<script src="${pageContext.request.contextPath}/resources/rear-end/docs/assets/js/language/css.js"></script>
<script src="${pageContext.request.contextPath}/resources/rear-end/docs/assets/js/language/javascript.js"></script>