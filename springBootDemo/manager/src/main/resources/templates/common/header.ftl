<style>
    .ace-nav > li.light-blue > a {
        background-color: #404040;
    }
    .nav .open > a, .nav .open > a:hover, .nav .open > a:focus {
        background-color: #404040;
    }
    .navbar {background: #20222A;}
</style>

<div id="navbar" class="navbar navbar-default navbar-fixed-top">
    <script type="text/javascript">
        try{ace.settings.check('navbar' , 'fixed');}catch(e){}
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
            <a class="navbar-brand">
                <small> <i class="fa fa-futbol-o"></i> 鹏仔的综合管理系统 </small>
            </a>

            <!-- /section:basics/navbar.layout.brand -->

            <!-- #section:basics/navbar.toggle -->

            <!-- /section:basics/navbar.toggle -->
        </div>

        <!-- #section:basics/navbar.dropdown -->
        <div class="navbar-buttons navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">
                <li>
                    <#--<a>欢迎登录, ${currentUser.username}</a>-->
                    <a>欢迎登录, 鹏仔</a>
                </li>
                <li>
                    <a data-toggle="dropdown"  class="dropdown-toggle" href="#">
                        <img class="nav-user-photo" src="${ctx}/static/ace/avatars/userPeng.jpg" alt="Jason's Photo" />
								<span class="user-info" id="user_info">
								</span>
                        <i class="ace-icon fa fa-caret-down"></i>
                    </a>

                    <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li>
                            <a onclick="diag('修改密码', '${ctx}/user/password/change');" style="cursor:pointer;"><i class="ace-icon fa fa-cog"></i>修改密码</a><!-- editUserH()在 WebRoot\static\js\myjs\head.js中 -->
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="${ctx}/signout"><i class="ace-icon fa fa-power-off"></i>退出登录</a>
                        </li>
                    </ul>
                </li>

                <!-- /section:basics/navbar.user_menu -->
            </ul>
        </div>
        <!-- /section:basics/navbar.dropdown -->
    </div><!-- /.navbar-container -->
</div>
<#--
<div id="fhsmsobj"><!-- 站内信声音消息提示 &ndash;&gt;</div>-->
