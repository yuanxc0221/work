<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
<head>
    <title>
      用户登录
    </title>
    <!--<link href="http://fonts.googleapis.com/css?family=Lato:100,300,400,700" media="all" rel="stylesheet" type="text/css" />-->
    <%@ include file="/se7en_css.jsp" %>
    <%@ include file="/se7en_js.jsp" %>
    <script src="${pageContext.request.contextPath}/resources/lib/messenger/build/js/messenger.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/lib/messenger/build/css/messenger.css"  rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/lib/messenger/build/css/messenger-theme-air.css"  rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/lib/messenger/build/css/messenger-theme-future.css" />

    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
  </head>
  <body class="login1">
    <!-- Login Screen -->
    <div class="login-wrapper">
      <div class="login-container">
        <a href="${pageContext.request.contextPath}/index.jsp"><img width="100" height="30" src="${pageContext.request.contextPath}/resources/admin/images/logo-login%402x.png" /></a>
        <form id="login-form" action="${pageContext.request.contextPath}/user/user/login" method="post">
          <div class="form-group">
            <input class="form-control" id="username" name="username" placeholder="登录名" type="text">
          </div>
          <div class="form-group">
            <input class="form-control" id="password" name="password" placeholder="密码" type="password">
              <input type="submit" value="&#xf054;">
          </div>
          <div class="form-options clearfix">
            <%--<a class="pull-right" href="#">Forgot password?</a>
            <div class="text-left">
              <label class="checkbox"><input type="checkbox"><span>Remember me</span></label>
            </div>--%>
          </div>
            <div class="social-login clearfix">
                <%--<input class="btn btn-primary pull-left facebook" type="submit"/>提交--%>
                <a class="btn btn-primary twitter" href="${pageContext.request.contextPath}/registerUI.jsp">立即注册</a>
            </div>
        </form>
      </div>
    </div>
    <!-- End Login Screen -->
    <script type="text/javascript">
        $(document).ready(function() {
            $("#login-form").validate({
                rules: {
                    username: {
                        required: true,
                        minlength: 5
                    },
                    password: {
                        required: true,
                        minlength: 6
                    }
                },
                messages: {
                    username: {
                        required: "请输入您的登录名",
                        minlength: "登录名长度不能小于5位"
                    },
                    password: {
                        required: "请填写密码",
                        minlength: "密码长度不能小于6位"
                    }
                }
            });
        });
    </script>
    <c:if test="${result!=null}">
        <script>
            $().ready(function(){
                var success=${result.success};
                var msg='${result.msg}';
                var type="error";
                if(success==true){
                    type="success"
                }
                Messenger.options = {
                    extraClasses: 'messenger-fixed messenger-theme-future  messenger-on-top messenger-on-left'
                }
                $.globalMessenger().post({  message:"提示："+ msg,
                    type: type,
                    hideAfter: 3,
                    showCloseButton: true})
            })
        </script>
    </c:if>
  </body>
</html>