<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>DrawVSM</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" type="text/css" href="styles/grapheditor.css">
</head>

<script type="text/javascript">

    var urlParams = (function(url)
    {
        var result = new Object();
        var idx = url.lastIndexOf('?');

        if (idx > 0)
        {
            var params = url.substring(idx + 1).split('&');

            for (var i = 0; i < params.length; i++)
            {
                idx = params[i].indexOf('=');

                if (idx > 0)
                {
                    result[params[i].substring(0, idx)] = params[i].substring(idx + 1);
                }
            }
        }
        return result;
    })(window.location.href);
    mxLoadResources = false;
</script>

<script type="text/javascript" src="js/mxgraph/Init.js"></script>
<script type="text/javascript" src="js/jscolor/jscolor.js"></script>
<script type="text/javascript" src="js/sanitizer/sanitizer.min.js"></script>
<script type="text/javascript" src="js/mxgraph/mxClient.js"></script>
<script type="text/javascript" src="js/mxgraph/EditorUi.js"></script>
<script type="text/javascript" src="js/mxgraph/Editor.js"></script>
<script type="text/javascript" src="js/mxgraph/Sidebar.js"></script>
<script type="text/javascript" src="js/mxgraph/Graph.js"></script>
<script type="text/javascript" src="js/mxgraph/Shapes.js"></script>
<script type="text/javascript" src="js/mxgraph/Actions.js"></script>
<script type="text/javascript" src="js/mxgraph/Menus.js"></script>
<script type="text/javascript" src="js/mxgraph/Format.js"></script>
<script type="text/javascript" src="js/mxgraph/Toolbar.js"></script>
<script type="text/javascript" src="js/mxgraph/Dialogs.js"></script>

<body class="getEditor">
<script type="text/javascript">
    // 根据后台的可用性，扩展EditorUi以更新I / O操作状态
    (function()
    {
        var editorUiInit = EditorUi.prototype.init;

        EditorUi.prototype.init = function()
        {
            editorUiInit.apply(this, arguments);
            this.actions.get('export').setEnabled(false);

            // Updates action states which require a backend
            if (!Editor.useLocalStorage)
            {
                mxUtils.post(OPEN_URL, '', mxUtils.bind(this, function(req)
                {
                    var enabled = req.getStatus() != 404;
                    this.actions.get('open').setEnabled(enabled || Graph.fileSupport);
                    this.actions.get('import').setEnabled(enabled || Graph.fileSupport);
                    this.actions.get('save').setEnabled(enabled|| Graph.fileSupport);
                    this.actions.get('saveAs').setEnabled(enabled|| Graph.fileSupport);
                    this.actions.get('export').setEnabled(enabled|| Graph.fileSupport);
                }));
            }
        };

        //添加所需的资源（禁用加载后备属性，这只能
        //在如果我们知道所有的键都在语言特定的文件中定义，
        mxResources.loadDefaultBundle = false;
        var bundle = mxResources.getDefaultBundle(RESOURCE_BASE, mxLanguage) ||
            mxResources.getSpecialBundle(RESOURCE_BASE, mxLanguage);

        // Fixes possible asynchronous requests
        mxUtils.getAll([bundle, STYLE_PATH + '/default.xml'], function(xhr)
        {
            // Adds bundle text to resources
            mxResources.parse(xhr[0].getText());

            // Configures the default graph theme
            var themes = new Object();
            themes[Graph.prototype.defaultThemeName] = xhr[1].getDocumentElement();

            // Main
            new EditorUi(new Editor(urlParams['chrome'] == '0', themes));
        }, function()
        {
            document.body.innerHTML = '<center style="margin-top:10%;">Error loading resource files. Please check browser console.</center>';
        });
    }
    )
    ();

</script>
</body>
</html>