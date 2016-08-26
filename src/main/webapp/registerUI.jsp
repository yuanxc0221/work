<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
<head>
    <title>
     用户注册
    </title>
    <!--<link href="http://fonts.googleapis.com/css?family=Lato:100,300,400,700" media="all" rel="stylesheet" type="text/css" />-->
    <%@ include file="/se7en_css.jsp" %>
    <%@ include file="/se7en_js.jsp" %>
    <script src="${pageContext.request.contextPath}/resources/lib/messenger/build/js/messenger.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/lib/messenger/build/css/messenger.css"  rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/lib/messenger/build/css/messenger-theme-air.css"  rel="stylesheet" type="text/css" />

    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
  </head>
  <body class="login1 signup">
    <!-- Login Screen -->
    <div class="login-wrapper">
      <div class="login-container">
        <a href="index.html"><img width="100" height="30" src="${pageContext.request.contextPath}/resources/admin/images/logo-login%402x.png" /></a>
        <form id="register-form" action="${pageContext.request.contextPath}/user/user/add" method="post">
          <div class="form-group">
            <input class="form-control" id="username" name="username" type="text" placeholder="登录名">
          </div>
          <div class="form-group">
            <input class="form-control" id="password" name="password" type="password" placeholder="密码">
          </div>

           <div class="form-group">
                <input class="form-control" id="confirm_password" name="confirm_password" type="password" placeholder="再次确认密码">
            </div>
            <div class="form-group">
                <input class="form-control" id="name" name="name" type="text" placeholder="姓名">
            </div>
            <div class="form-group">
                <input class="form-control" id="phone" name="phone" type="text" placeholder="手机号码">
            </div>

            <div class="form-group">
                <input class="form-control" id="address" name="address" type="text" placeholder="地址">
                <input type="submit" value="&#xf054;">
            </div>
            <br>
            <div class="social-login clearfix">
                <%--<input class="btn btn-primary btn-block pull-left twitter" value="提交" type="submit"/>--%>
                <a class="btn btn-primary facebook" href="${pageContext.request.contextPath}/loginUI.jsp">立即登录</a>
            </div>
        </form>
      </div>
    </div>
    <!-- End Login Screen -->

    <script type="text/javascript">
        $(document).ready(function() {
            $("#register-form").validate({
                rules: {
                    name: "required",
                    username: {
                        required: true,
                        minlength: 5
                    },
                    phone: {
                        minlength: 11,
                        maxlength: 11,
                        number: true
                    },
                    password: {
                        required: true,
                        minlength: 6
                    },
                    confirm_password: {
                     required: true,
                     minlength: 6,
                     equalTo: "#password"
                     },
                    address:"required"

                },
                messages: {
                    name: "请填写您的姓名",
                    username: {
                        required: "请输入您的登录名",
                        minlength: "登录名长度不能小于5位"
                    },
                    password: {
                        required: "请填写密码",
                        minlength: "密码长度不能小于6位"
                    },
                    confirm_password: {
                        required: "请重复填写密码",
                        minlength: "密码长度不能小于6位",
                        equalTo: "两次密码不一致"
                    },
                    phone: '请输入正确的手机号码',
                    address: "请输入您的收货地址"
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
                    extraClasses: 'messenger-fixed messenger-on-top messenger-on-left',
                    theme: 'future'
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