<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<div class="navbar-buttons navbar-header pull-right" role="navigation">
    <ul class="nav ace-nav">
        <!-- #section:basics/navbar.user_menu -->
        <li class="grey">
            <a id="control_page" href="#">
                <i class="ace-icon fa fa-home"></i>
                主页
            </a>
        </li>
        <li class="green">
            <a id="admin_page" href="${pageContext.request.contextPath}/admin/admin/list">
                <i class="ace-icon fa fa-user"></i>
                管理员
            </a>
        </li>

        <li class="purple">
            <a id="user_page" href="${pageContext.request.contextPath}/admin/user/list">
                <i class="ace-icon fa fa-group"></i>
                用户管理
            </a>
        </li>

        <li class="light-blue">
            <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                <img class="nav-user-photo" src="${pageContext.request.contextPath}/resources/rear-end/assets/avatars/user.jpg" alt="Jason's Photo" />
                    <span class="user-info">
                        <small>欢迎,</small>
                        ${loginAdmin.name}
                    </span>

                <i class="ace-icon fa fa-caret-down"></i>
            </a>

            <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                <li>
                    <a href="${pageContext.request.contextPath}/admin/admin/saveUI/${loginAdmin.a_id}">
                        <i class="ace-icon fa fa-user"></i>
                        我的账户
                    </a>
                </li>

                <li class="divider"></li>

                <li>
                    <a href="#">
                        <i class="ace-icon fa fa-power-off"></i>
                        注销
                    </a>
                </li>
            </ul>
        </li>

        <!-- /section:basics/navbar.user_menu -->
    </ul>
</div>

<!-- /section:basics/navbar.dropdown -->
</div><!-- /.navbar-container -->
</div>
