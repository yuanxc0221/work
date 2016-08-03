<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>  
<head>
    <meta charset="utf-8">
    <title>
        用户信息编辑
    </title>
    <%@ include file="../se7en_css.jsp" %>

    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
</head>
<body>
<div class="modal-shiftfix">
    <!-- Navigation -->
    <%@ include file="../navigation.jsp" %>
      <div class="container-fluid main-content"><div class="page-title">
      </div>
          <div class="row">
              <div class="col-lg-12">
                  <ul class="breadcrumb">
                      <li>
                          <a href="${pageContext.request.contextPath}/admin/index"></a><i class="icon-home"></i>
                      </li>
                      <li>
                          <a href="${pageContext.request.contextPath}/admin/user/list">用户管理</a>
                      </li>
                      <li class="active">
                          用户保存
                      </li>
                  </ul>
              </div>
              <div class="col-md-12">
                  <div class="widget-container">
                      <div class="heading">
                          <i class="icon-shield"></i>用户保存
                      </div>
                      <div class="widget-content padded">
                          <form action="${pageContext.request.contextPath}/admin/user/${ user.u_id == null ? 'add' : 'update' }" id="user-form" method="post">
                              <fieldset>
                                  <div class="row">
                                      <div class="col-md-6 col-md-offset-3">
                                          <div class="hidden">
                                              <input name="u_id" type="hidden" value="${u_id}"/>
                                          </div>
                                          <div class="form-group">
                                              <label for="name">姓名</label>
                                              <input class="form-control" id="name" name="name" type="text" value="${user.name} ">
                                          </div>
                                          <div class="form-group">
                                              <label for="sex">学生性别</label>
                                              <select class="form-control"id="sex" name="sex" >
                                                  <c:choose>
                                                      <c:when test="${user.sex==null||user.sex=='未选择'}">
                                                          <option value="未选择">请选择</option>
                                                          <option value="男">男</option>
                                                          <option value="女">女</option>
                                                      </c:when>
                                                      <c:when test="${user.sex!='未选择'&&user.sex!=null}">
                                                          <c:if test="${user.sex=='男'}">
                                                              <option value="${user.sex}">${user.sex}</option>
                                                              <option value="女">女</option>
                                                          </c:if>
                                                          <c:if test="${user.sex=='女'}">
                                                              <option value="${user.sex}">${user.sex}</option>
                                                              <option value="男">男</option>
                                                          </c:if>
                                                      </c:when>
                                                  </c:choose>
                                              </select>
                                          </div>
                                          <div class="form-group">
                                              <label for="username">登录名</label>
                                              <input class="form-control" id="username" name="username" type="text" value="${user.username}">
                                          </div>
                                          <div class="form-group">
                                              <label for="phone">手机号码</label>
                                              <input class="form-control" id="phone" name="phone" type="text" value="${user.phone}">
                                          </div>
                                          <div class="form-group">
                                              <label for="email">邮箱</label>
                                              <input class="form-control" id="email" name="email" type="email" value="${user.email}">
                                          </div>
                                          <div class="form-group">
                                              <label for="introduction">个人说明</label>
                                              <textarea id="introduction" name="introduction" class="form-control" rows="3" type="text">${user.introduction}</textarea>
                                          </div>
                                      </div>
                                  </div>
                                  <br>
                                  <div class="col-md-offset-5 col-md-2">
                                      <input class="btn btn-primary " type="submit" value="保存">
                                  </div>

                              </fieldset>
                          </form>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </div>
<%@ include file="../se7en_js.jsp" %>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#user_page").addClass("current");
            $("#user-form").validate({
                rules: {
                    name: "required",
                    phoneNumber: {
                        minlength: 11,
                        maxlength: 11,
                        number: true
                    },
                    email: {
                        email: true
                    },
                    className: "required",
                },
                messages: {
                    name: "请填写您的姓名",
                    phoneNumber: '请输入正确的手机号码',
                    email: "请填写正确的邮箱地址",
                    className: "required",
                }
            });
        });
    </script>

  </body>
</html>