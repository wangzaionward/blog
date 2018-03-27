<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>首页</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <style>
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            padding: 12px 16px;
        }

        .ww:hover .dropdown-content {
            display: block;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="http://localhost:8080/blog/index">Brand</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
            <#if Session.user ? exists>
                <li class="ww"><a href="#">${Session["user"].username}</a>
                    <div class="dropdown-content" style="z-index: 1">
                        <p><a href="/blog/article/articleManage">
                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>&nbsp;&nbsp;写文章
                        </a></p>
                        <p><a href="/blog/user/userManage">
                            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;&nbsp;个人中心
                        </a></p>
                    </div>
                </li>
                <li id="logout"><a href="/blog/logout">退出</a></li>
            <#else>
                <li id="login"><a href="/blog/login">登录</a></li>
                <li id="register"><a href="/blog/register">注册</a></li>
            </#if>
            </ul>
            <form class="navbar-form navbar-right">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="搜搜看~">
                </div>
                <button type="submit" class="btn btn-default">搜索</button>
            </form>
        </div>
    </div>
</nav>
<div class="container-fluid">
    <div class="col-xs-2">

    </div>
    <div class="col-xs-8">
    </div>
    <div class="col-xs-2"></div>
</div>
</body>
</html>