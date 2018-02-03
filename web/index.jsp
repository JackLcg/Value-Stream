<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=5,IE=9" ><![endif]-->
<%
    String basePath = "http://innovation.xjtu.edu.cn:80/StaticFiles/web-resources/frames/mes/1.0-SNAPSHOT/";
    String appPath = "http://innovation.xjtu.edu.cn:80/InnovationToolsPlatform/";
%>
<html>
<head>
    <title>价值流绘图</title>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="msapplication-config" content="images/browserconfig.xml">
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="theme-color" content="#d89000">
    <%--//ace-titlebar start--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!-- basic styles -->
    <link href="<%=basePath%>assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="<%=basePath%>assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>assets/css/ace.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>assets/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>assets/css/ace-skins.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>assets/css/ace-modify.css"/>

    <script src="<%=basePath%>assets/js/jquery.min.js"></script>
    <script src="<%=basePath%>assets/js/ace-extra.min.js"></script>


    <!--[if lte IE 8]>
    <script src="<%=basePath%>assets/js/excanvas.min.js"></script>
    <![endif]-->

    <script type="text/javascript">
        if ("ontouchend" in document) document.write("<script src='<%=basePath%>assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
    </script>
    <script src="<%=basePath%>assets/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>assets/js/typeahead-bs2.min.js"></script>
    <script src="<%=basePath%>assets/js/jquery-ui-1.10.3.custom.min.js"></script>
    <script src="<%=basePath%>assets/js/jquery.ui.touch-punch.min.js"></script>
    <script src="<%=basePath%>assets/js/chosen.jquery.min.js"></script>
    <script src="<%=basePath%>assets/js/fuelux/fuelux.spinner.min.js"></script>
    <script src="<%=basePath%>assets/js/date-time/bootstrap-datepicker.min.js"></script>
    <script src="<%=basePath%>assets/js/date-time/bootstrap-timepicker.min.js"></script>
    <script src="<%=basePath%>assets/js/date-time/moment.min.js"></script>
    <script src="<%=basePath%>assets/js/date-time/daterangepicker.min.js"></script>
    <script src="<%=basePath%>assets/js/bootstrap-colorpicker.min.js"></script>
    <script src="<%=basePath%>assets/js/jquery.knob.min.js"></script>
    <script src="<%=basePath%>assets/js/jquery.autosize.min.js"></script>
    <script src="<%=basePath%>assets/js/jquery.inputlimiter.1.3.1.min.js"></script>
    <script src="<%=basePath%>assets/js/jquery.maskedinput.min.js"></script>
    <script src="<%=basePath%>assets/js/bootstrap-tag.min.js"></script>

    <!-- ace scripts -->

    <script src="<%=basePath%>assets/js/ace-elements.min.js"></script>
    <script src="<%=basePath%>assets/js/ace.min.js"></script>


    <!-- custom js -->
    <%--<script type="text/javascript" src="../static/js/cookie.js"></script>--%>
    <style type="text/css">
        .main-content {
            margin-left: 0px;
        }

        .breadcrumb {
            margin-left: 25px;
        }
    </style>
    <%--//ace-titlebar end--%>
    <script type="text/javascript">
        /**
         * URL Parameters and protocol description are here:
         *
         * https://support.draw.io/pages/viewpage.action?pageId=12878136
         *
         * Parameters for developers:
         *
         * - dev=1: For developers only
         * - test=1: For developers only
         * - drawdev=1: For developers only
         * - export=URL for export: For developers only
         * - page=n: For developers only
         * - ignoremime=1: For developers only (see DriveClient.js). Use Cmd-S to override mime.
         * - createindex=1: For developers only (see etc/build/README)
         * - filesupport=0: For developers only (see Editor.js in core)
         * - savesidebar=1: For developers only (see Sidebar.js)
         * - pages=1: For developers only (see Pages.js)
         * - lic=email: For developers only (see LicenseServlet.java)
         * --
         * - networkshapes=1: For testing network shapes (temporary)
         */
        var urlParams = (function () {
            // Sidebar.prototype.defaultEntries=general;
            var result = new Object();
            var params = window.location.search.slice(1).split('&');

            for (var i = 0; i < params.length; i++) {
                idx = params[i].indexOf('=');

                if (idx > 0) {
                    result[params[i].substring(0, idx)] = params[i].substring(idx + 1);
                }
            }

            return result;
        })();
        /**
         * Adds meta tags with application name (depends on offline URL parameter)
         */
        (function () {
            function addMeta(name, content) {
                try {
                    var s = document.createElement('meta');
                    s.setAttribute('name', name);
                    s.setAttribute('content', content);

                    var t = document.getElementsByTagName('meta')[0];
                    t.parentNode.insertBefore(s, t);
                }
                catch (e) {
                    // ignore
                }
            };

            var name = '价值流绘图';

            if (urlParams['offline'] === '1') {
                name += ' app';
            }

            addMeta('apple-mobile-web-app-title', name);
            addMeta('application-name', name);
        })();

    </script>
    <link rel="stylesheet" type="text/css" href="styles/grapheditor.css">
    <link rel="manifest" href="images/manifest.json">
    <%--<link rel="shortcut icon" href="favicon.ico">--%>
    <!-- Workaround for binary XHR in IE 9/10, see App.loadUrl -->
    <!--[if (IE 9)|(IE 10)]><!-->
    <script type="text/vbscript">
			Function mxUtilsBinaryToArray(Binary)
				Dim i
				ReDim byteArray(LenB(Binary))
				For i = 1 To LenB(Binary)
					byteArray(i-1) = AscB(MidB(Binary, i, 1))
				Next
				mxUtilsBinaryToArray = byteArray
			End Function

    </script>
    <!--<![endif]-->
    <script type="text/javascript">
        /**
         * Synchronously adds scripts to the page.
         */
        function mxscript(src, onLoad, id, dataAppKey) {
            if (onLoad != null) {
                var s = document.createElement('script');
                s.setAttribute('type', 'text/javascript');
                s.setAttribute('src', src);
                var r = false;

                if (id != null) {
                    s.setAttribute('id', id);
                }

                if (dataAppKey != null) {
                    s.setAttribute('data-app-key', dataAppKey);
                }

                s.onload = s.onreadystatechange = function () {
                    if (!r && (!this.readyState || this.readyState == 'complete')) {
                        r = true;
                        onLoad();
                    }
                };

                var t = document.getElementsByTagName('script')[0];
                t.parentNode.insertBefore(s, t);
            }
            else {
                document.write('<script src="' + src + '"' + ((id != null) ? ' id="' + id + '" ' : '') +
                    ((dataAppKey != null) ? ' data-app-key="' + dataAppKey + '" ' : '') + '></scr' + 'ipt>');
            }
        }
        ;

        /**
         * Asynchronously adds scripts to the page.
         */
        function mxinclude(src) {
            var g = document.createElement('script');
            g.type = 'text/javascript';
            g.async = true;
            g.src = src;
            var s = document.getElementsByTagName('script')[0];
            s.parentNode.insertBefore(g, s);
        }
        ;

        // Checks for local storage
        var isLocalStorage = false;
        try {
            isLocalStorage = urlParams['local'] != '1' && typeof(localStorage) != 'undefined';
        }
        catch (e) {
            // ignored
        }

        var t0 = new Date();

        // Changes paths for local development environment
        if (urlParams['dev'] == '1') {
            // Used to request grapheditor/mxgraph sources in dev mode
            var mxDevUrl = document.location.protocol + '//devhost.jgraph.com/mxgraph2';

            if (document.location.protocol == 'file:') {
                mxDevUrl = '../../mxgraph2';

                // Forces includes for dev environment in node.js
                mxForceIncludes = true;
            }
            var geBasePath = mxDevUrl + '/javascript/examples/grapheditor/www/js';
            var mxBasePath = mxDevUrl + '/javascript/src';
            // Used to request draw.io sources in dev mode
            var drawDevUrl = '';
            if (urlParams['drawdev'] == '1') {
                drawDevUrl = document.location.protocol + '//drawhost.jgraph.com/';
            }
            mxscript(drawDevUrl + 'js/diagramly/Init.js');
            mxscript(geBasePath + '/Init.js');
            mxscript(mxDevUrl + '/javascript/src/js/mxClient.js');
            // Adds all JS code that depends on mxClient. This indirection via Devel.js is
            // required in some browsers to make sure mxClient.js (and the files that it
            // loads asynchronously) are available when the code loaded in Devel.js runs.
            mxscript(drawDevUrl + 'js/diagramly/Devel.js');
        }
        else {
            mxscript('js/app.min.js');
        }
        if (window && window.process && window.process.type) {
            // Electron
            mxscript('js/diagramly/ElectronApp.js');
        }
        // Adds basic error handling
        window.onerror = function () {
            var status = document.getElementById('geStatus');
            if (status != null) {
                status.innerHTML = 'Page could not be loaded. Please try refreshing.';
            }
        };
        //       alert(getShowStartScreen());
        // alert("123");
    </script>
</head>
<%
    String userName = (String) request.getAttribute("username");
    userName = "111";
%>
<body>
<%--//ace-titlebar start--%>

<!-- 页面顶部导航栏 -->
<div class="navbar navbar-default" id="navbar" style="height: 40px!important;">
    <script type="text/javascript">
        try {
            ace.settings.check('navbar', 'fixed')
        } catch (e) {
        }
    </script>

    <div class="navbar-container" id="navbar-container">
        <div class="navbar-header pull-left">
            <a id="href0" href="<%=appPath%>appList" class="navbar-brand">
                <small><i
                        class="icon-leaf"></i> 小微企业多创新方法融合与集成应用平台
                </small>
            </a>
            <a id="href1" href="#" class="navbar-brand">
                <small>创新管理工具集
                </small>
            </a>
            <!-- /.brand -->
        </div>
        <!-- /.navbar-header -->
        <div class="navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">
                <li class="grey">
                    <a id="href2" data-toggle="dropdown" href="<%=appPath%>appList" onclick="gotoHref(this)"
                       class="dropdown-toggle"> <img class="nav-user-photo"
                                                     src="<%=basePath%>assets/avatars/platform.png"
                                                     alt="Jason's Photo"/>
                        平台主页
                    </a>
                </li>
                <%
                    if (userName == null || userName.equals("anon")) {
                    } else {
                %>

                <li class="purple">
                    <a data-toggle="dropdown" href="#" onclick="gotoHref(this)"
                       class="dropdown-toggle"> <img class="nav-user-photo"
                                                     src="<%=basePath%>assets/avatars/process.png" alt="Jason's Photo"/>
                        模板层
                        <i class="icon-caret-down"></i>
                    </a>
                    <ul id="templateList"
                        class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li>
                            <a data-toggle="dropdown" href="#" onclick="gotoHref(this)"
                               class="dropdown-toggle"> <img class="nav-user-photo"
                                                             src="<%=basePath%>assets/avatars/manage.png"
                                                             alt="Jason's Photo"/>
                                DMAIC模板
                            </a>
                        </li>
                        <li>
                            <a data-toggle="dropdown" href="#" onclick="gotoHref(this)"
                               class="dropdown-toggle"> <img class="nav-user-photo"
                                                             src="<%=basePath%>assets/avatars/manage.png"
                                                             alt="Jason's Photo"/>
                                知识工程模板
                            </a>
                        </li>
                        <li>
                            <a data-toggle="dropdown" href="#" onclick="gotoHref(this)"
                               class="dropdown-toggle"> <img class="nav-user-photo"
                                                             src="<%=basePath%>assets/avatars/manage.png"
                                                             alt="Jason's Photo"/>
                                价值流模板
                            </a>
                        </li>
                        <li>
                            <a data-toggle="dropdown" href="#" onclick="gotoHref(this)"
                               class="dropdown-toggle"> <img class="nav-user-photo"
                                                             src="<%=basePath%>assets/avatars/manage.png"
                                                             alt="Jason's Photo"/>
                                5S模板
                            </a>
                        </li>
                        <li>
                            <a data-toggle="dropdown" href="#" onclick="gotoHref(this)"
                               class="dropdown-toggle"> <img class="nav-user-photo"
                                                             src="<%=basePath%>assets/avatars/manage.png"
                                                             alt="Jason's Photo"/>
                                TRIZ模板
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="green">
                    <a data-toggle="dropdown" href="#"
                       class="dropdown-toggle"> <img class="nav-user-photo"
                                                     src="<%=basePath%>assets/avatars/tool.png" alt="Jason's Photo"/>
                        工具集
                        <i class="icon-caret-down"></i>
                    </a>

                    <ul
                            class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">

                        <li>
                            <a id="href3" data-toggle="dropdown" href="#" onclick="gotoHref(this)"
                               class="dropdown-toggle"> <img class="nav-user-photo"
                                                             src="<%=basePath%>assets/avatars/manage.png"
                                                             alt="Jason's Photo"/>
                                创新管理工具
                            </a>
                        </li>
                        <li>
                            <a id="href4" data-toggle="dropdown" href="#" onclick="gotoHref(this)"
                               class="dropdown-toggle"> <img class="nav-user-photo"
                                                             src="<%=basePath%>assets/avatars/knowledge.png"
                                                             alt="Jason's Photo"/>
                                创新知识服务
                            </a>
                        </li>
                        <li>
                            <a id="href5" data-toggle="dropdown" href="#" onclick="gotoHref(this)"
                               class="dropdown-toggle"> <img class="nav-user-photo"
                                                             src="<%=basePath%>assets/avatars/monitor.png"
                                                             alt="Jason's Photo"/>
                                创新方法导入与过程监控
                            </a>
                        </li>
                        <li>
                            <a id="href6" data-toggle="dropdown" href="#" onclick="gotoHref(this)"
                               class="dropdown-toggle"> <img class="nav-user-photo"
                                                             src="<%=basePath%>assets/avatars/assess.png"
                                                             alt="Jason's Photo"/>
                                创新方法评估
                            </a>
                        </li>
                        <li>
                            <a id="href7" data-toggle="dropdown" href="#" onclick="gotoHref(this)"
                               class="dropdown-toggle"> <img class="nav-user-photo"
                                                             src="<%=basePath%>assets/avatars/support.png"
                                                             alt="Jason's Photo"/>
                                产业链协同创新支持
                            </a>
                        </li>
                    </ul>
                </li>

                <%
                    }
                %>
                <li class="light-blue">
                    <a data-toggle="dropdown" href="#"
                       class="dropdown-toggle"> <img id="userAvatar" class="nav-user-photo"
                                                     src="<%=basePath%>assets/avatars/avatar2.png" alt="Jason's Photo"/>
                        <span
                                class="user-info"> <small>欢迎光临,</small>
                        <%
                            if (userName == null || userName.equals("anon")) {
                        %>
                        匿名游客
                        <%
                        } else {
                        %>
                        ${username}
                        <%
                            }
                        %>
						</span> <i class="icon-caret-down"></i>
                    </a>
                    <ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <%
                            if (userName == null || userName.equals("anon")) {
                        %>
                        <li><a href="#" onclick="gotoLogin()"> <i class="icon-key"></i>登录</a></li>
                        <li><a href="#" onclick="gotoRegister()"> <i class="icon-plus"></i>注册</a></li>
                        <%
                        } else {
                        %>
                        <li><a href="#" onclick="gotoUserInfo()"> <i class="icon-user"></i> 个人资料</a></li>
                        <li class="divider"></li>
                        <li><a onclick="logout()" style="cursor:pointer;"> <i class="icon-off"></i> 退出</a></li>
                        <%
                            }
                        %>
                    </ul>
                </li>
            </ul>
            <!-- /.ace-nav -->
        </div>
        <!-- /.navbar-header -->
    </div>
    <!-- /.container -->
</div>
<!-- END页面顶部导航栏 -->

<!-- 内容区域 -->
<div class="main-container" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.check('main-container', 'collapsed')
        } catch (e) {
        }
    </script>

    <!-- 主内容区域 -->
    <div class="main-container-inner">
        <!-- 导航栏 -->
        <!-- END导航栏 -->

        <!-- 主页面内容 -->
        <div class="main-content">
            <div class="geEditor">
                <script type="text/javascript">
                    /**
                     * Main
                     */
                    App.main();
                </script>

            </div>

        </div>
        <!-- /.main-content -->
        <!-- END主页面内容 -->
    </div>
    <!-- /.main-container-inner -->
    <!-- END主内容区域 -->
</div>
<!-- /.main-container -->
<!-- END内容区域 -->
<!-- inline scripts related to this page -->

<%--//ace-titlebar end--%>


<script>
    //var origin=document.location.origin;
    var origin = "http://innovation.xjtu.edu.cn";
    function gotoHref(node) {
        document.location = node.href;
    }
    //初始化Hrefs
    function initTemplatesAndHrefs() {
        $.ajax({
            cache: true,
            type: "GET",
            url: origin + "/InnovationToolsPlatform/API/titleBarHrefs",
            data: {"username": "${username}"},// 你的formid
            async: false,
            error: function (request) {
                //alert("Connection error");
                console.log("远程获取模板信息与Hrefs失败！");
            },
            success: function (rawData) {
                data = JSON.parse(rawData);
                switch (data.status) {
                    case 0:
                        //console.log("data="+data.data);
                        data = JSON.parse(data.data);
                        //加载模板信息
                        if (data.templates.length > 0) {
                            //console.log("loading templates...");
                            $("#templateList li").remove();
                            var templates = $("#templateList");
                            for (var i = 0; i < data.templates.length; i++) {
                                templates.append("<li> <a data-toggle=\"dropdown\" href=\"" + data.templates[i].href + "\" onclick=\"gotoHref(this)\" class=\"dropdown-toggle\"> <img class=\"nav-user-photo\" src=\"" + data.templates[i].src + "\"/>" + data.templates[i].name + "</a></li>");
                            }
                        }
                        //加载Hrefs
                        //console.log("loading hrefs...");
                        for (var i = 0; i < data.hrefs.length && i < data.hrefs_num; i++) {
                            $("#href" + i).attr("href", data.hrefs[i]);
                        }
                        //加载用户头像
                        //console.log("loading user avatar...");
                        $("#userAvatar").attr("src", data.user.avatar);
                        break;
                    case 1:
                        alert(data.message);
                        break;
                    default:
                        break;
                }
            }
        });
    }
    //用户登录
    function gotoLogin() {
        //注销匿名用户
        //刷新当前页
        var url = origin + "/InnovationToolsPlatform/logout?service=" + document.location.href;
        console.log("goto:" + url);
        document.location = url;
    }
    //用户注册
    function gotoRegister() {
        //注销匿名用户
        //前往注册页面
        var url = origin + "/InnovationToolsPlatform/logout?service=" + origin + "/InnovationToolsPlatform/user/register";
        console.log("goto:" + url);
        document.location = url;
    }
    //前往用户信息页面
    function gotoUserInfo() {
        var url = origin + "/InnovationToolsPlatform/user/userInfo";
        console.log("goto:" + url);
        document.location = url;
    }
    //用户退出
    function logout() {
        var url = origin + "/InnovationToolsPlatform/logout?service=" + origin + "/InnovationToolsPlatform/";
        console.log("goto:" + url);
        document.location = url;
    }
    initTemplatesAndHrefs();
</script>
</body>
</html>

