<#macro myLayout>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
    <title></title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <style>
        html {
            position: relative;
            min-height: 100%;
        }

        body {
            margin-bottom: 100px;
        }

        footer {
            position: absolute;
            bottom: 0;
            width: 100%;
        }
        .glyphicon{
            color: #3872f6;
        }

    </style>
</head>
<body>
    <#include "header.ftl">
    <#nested>
    <#include "footer.ftl">
</body>
</html>
</#macro>