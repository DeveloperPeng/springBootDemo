[#ftl strip_whitespace=true]
[#import "${ctx}/common/macroes.ftl" as macro]
<!DOCTYPE html>
<html>
    <head>
        <title>欢迎登录</title>
        [#include "${ctx}/common/head.ftl"/]
    </head>
    <body class="login-layout light-login">
        <div class="main-container">
            <div class="main-content">
                <div class="row">
                    <div class="col-sm-10 col-sm-offset-1">
                        <div class="login-container">
                            <div class="center">
                                <h1>
                                    <i class="ace-icon fa fa-users green"></i>
                                    <span class="red">鹏仔的</span>
                                    <span class="white" id="id-text2">管理系统</span>
                                </h1>
                                <h6 class="blue" id="id-company-text">&copy; 2011-2018 wp.com All Rights Reserved</h6>
                            </div>

                            <div class="space-6"></div>

                            <div class="position-relative">
                                <div id="login-box" class="login-box visible widget-box no-border">
                                    <div class="widget-body">
                                        <div class="widget-main">
                                            <h4 class="header blue lighter bigger">
                                                <i class="ace-icon fa fa-coffee green"></i>
                                                Please Enter Your Information
                                            </h4>

                                            <div class="space-6"></div>

                                            <form action="${ctx}/signin" method="post" name="userForm" id="userForm">
                                                <fieldset>
                                                    <label class="block clearfix">
                                                            <span class="block input-icon input-icon-right">
                                                                <input type="text" class="form-control" name="user.username" id="username" value="${userForm.user.username!''}" placeholder="Username" required="" />
                                                                <i class="ace-icon fa fa-user"></i>
                                                            </span>
                                                    </label>

                                                    <label class="block clearfix">
                                                            <span class="block input-icon input-icon-right">
                                                                <input type="password" class="form-control" name="user.password" id="password" value="${userForm.user.password!''}" placeholder="Password" required="" />
                                                                <i class="ace-icon fa fa-lock"></i>
                                                            </span>
                                                    </label>
                                                    <label class="block clearfix">
                                                                <span class="block input-icon input-icon-right">
                                                                    <input type="text" name="captcha" id = "captcha" value="${userForm.captcha!''}" placeholder="验证码" required="" style="width:200px;" />
                                                                    <img id="captchaImg" height="32" width="101" title="看不清？点击图片刷新" style="float:right;"/>
                                                                </span>
                                                    </label>
                                                    [@macro.errors /]
                                                    [@macro.errorMsg /]

                                                    <div id="message" class="block clearfix">

                                                    </div>

                                                    <div class="clearfix">
                                                        <button type="submit" class="width-35 pull-right btn btn-sm btn-primary">
                                                            <i class="ace-icon fa fa-key"></i>
                                                            <span class="bigger-110">Login</span>
                                                        </button>
                                                    </div>

                                                    <div class="space-4"></div>
                                                </fieldset>
                                            </form>


                                            [#--<form action="${ctx}/signin" method="post" name="userForm" id="userForm">--]
                                                [#--<input type="hidden" name="systemVerify" value="${userForm.systemVerify!''}"/>--]
                                                [#--<input type="hidden" name="redirectUrl" value="${userForm.redirectUrl!''}"/>--]

                                                [#--<fieldset>--]
                                                    [#--<label class="block clearfix">--]
                                                        [#--<span class="block input-icon input-icon-right">--]
                                                            [#--<input type="text" class="form-control" name="userInfo.username" id="username" value="${userForm.userInfo.username!''}" placeholder="Username" required="" />--]
                                                            [#--<i class="ace-icon fa fa-user"></i>--]
                                                        [#--</span>--]
                                                    [#--</label>--]

                                                    [#--<label class="block clearfix">--]
                                                        [#--<span class="block input-icon input-icon-right">--]
                                                            [#--<input type="password" class="form-control" name="userInfo.password" id="password" value="${userForm.userInfo.password!''}" placeholder="Password" required="" />--]
                                                            [#--<i class="ace-icon fa fa-lock"></i>--]
                                                        [#--</span>--]
                                                    [#--</label>--]

                                                    [#--[#if userForm.systemVerifyType == 1]--]
                                                        [#--<label class="block clearfix">--]
                                                                    [#--<span class="block input-icon input-icon-right">--]
                                                                        [#--<input type="text" name="captcha" id = "captcha" value="${userForm.captcha!''}" placeholder="验证码" required="" style="width:200px;" />--]
                                                                        [#--<img id="captchaImg" height="32" width="101" title="看不清？点击图片刷新" style="float:right;"/>--]
                                                                    [#--</span>--]
                                                        [#--</label>--]

                                                        [#--<label class="block clearfix">--]
                                                                [#--<span class="block input-icon input-icon-right">--]
                                                                    [#--<input type="text" name="phoneCaptcha" id="phoneCaptcha" value="${userForm.phoneCaptcha!''}" placeholder="手机验证码" required="" style="width:200px;" />--]
                                                                    [#--<div style="float:right;margin-top:2px;margin-right:15px"><button id="queryPhoneCaptcha" type="button"  style="float:right;"/>获取</button></div>--]
                                                                [#--</span>--]
                                                        [#--</label>--]
                                                    [#--[#elseif userForm.systemVerifyType == 2]--]
                                                       [#--<label class="block clearfix">--]
                                                                [#--<span class="block input-icon input-icon-right">--]
                                                                    [#--<input type="text" class="form-control" name="phoneCaptcha" id="phoneCaptcha" value="${userForm.phoneCaptcha!''}" placeholder="动态验证码" required=""/>--]
                                                                [#--</span>--]
                                                       [#--</label>--]
                                                    [#--[/#if]--]

                                                    [#--[@macro.errors /]--]
                                                    [#--[@macro.errorMsg /]--]

                                                    [#--<div id="message" class="block clearfix">--]

                                                    [#--</div>--]

                                                    [#--<div class="clearfix">--]
                                                        [#--<button type="submit" class="width-35 pull-right btn btn-sm btn-primary">--]
                                                            [#--<i class="ace-icon fa fa-key"></i>--]
                                                            [#--<span class="bigger-110">Login</span>--]
                                                        [#--</button>--]
                                                    [#--</div>--]

                                                    [#--<div class="space-4"></div>--]
                                                [#--</fieldset>--]
                                            [#--</form>--]
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        [#include "${ctx}/common/footer.ftl"/]

        <script>

            var clickIndex = 0;

            if (window != top) {
                top.location.href = location.href;
            }
            $(function() {
                var captchaUrl = "${ctx}/kaptcha?";
                $('#captchaImg').prop('src', captchaUrl + (new Date()).getTime());
                $('#captchaImg').click(function () {
                    $(this).prop('src', captchaUrl + (new Date()).getTime());
                });


                $('#queryPhoneCaptcha').click(function () {
                    $.ajax({
                        type: "post",
                        url: "${ctx}/signin/sendPhoneCaptcha",
                        data: {"username" :  $("#username").val(), "captcha" :  $("#captcha").val()},
                        dataType: "json",
                        async: false,
                        success: function (data) {
                            var html = " <div class=\"hr-8\"></div>\n" +
                                    "                                                        <div class=\"alert alert-success no-margin\">\n" +
                                    "                                                            <i class=\"ace-icon fa fa-check green\"></i>\n" +
                                    data.msg +
                                    "                                                        </div>\n" +
                                    "                                                        <div class=\"hr-8\"></div>";

                            $("#message").html(html);
                            $("#captchaImg").prop('src', captchaUrl + (new Date()).getTime());
                        },
                        error: function (xmlHttpRequest, error) {
                        },
                        complete: function (xmlHttpRequest) {
                            if (clickIndex > 0) {
                                $("#captchaImg").prop('src', captchaUrl + (new Date()).getTime());
                            }

                            clickIndex++;
                        }
                    });
                });
            });
        </script>
    </body>
</html>