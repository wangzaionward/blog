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
        .well:hover{
            box-shadow: 0 0 10px lightgray; border:1px solid lightgray;
        }

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
        <#list categoryList as item>
            <div class="well" style="margin-bottom: 10px;">
                <a href="/blog/findAllByCategoryId?categoryId=${item.id}">${item.name!''}</a>
            </div>
        </#list>
    </div>
    <div class="col-xs-8">
        <ul id="myTab" class="nav nav-tabs" style="margin-bottom: 20px;">
            <li class="active">
                <a href="#new" data-toggle="tab">最新</a>
            </li>
            <li><a href="#hot" data-toggle="tab">热门</a></li>
            <li><a href="#top" data-toggle="tab">精品</a></li>
            <li><a href="#note" data-toggle="tab">笔记</a></li>
            <li><a href="#other" data-toggle="tab">其他</a></li>
        </ul>
        <div id="myTabContent" class="tab-content">
            <div class="tab-pane fade in active" id="new">
                <#if articleList ? size <= 0>
                    <div class='alert alert-info' role='alert'>
                        <h4>这里空空如也~</h4>
                    </div>
                <#else>
                    <#list articleList as item>
                        <div class="well well-lg container-fluid">
                            <div class="col-xs-2">
                                <img src="/image/desc_1.png" style="height: 100px; height: 100px;">
                            </div>
                            <div class="col-xs-10 col-xs">
                                <a href="/blog/article/detail?articleId=${item.id}" style="font-size: 20px">${item.title!''}</a>
                                <h5>${item.description}</h5>
                                <h5>作者:${item.author!''}&emsp;发布时间:${item.createTime}&emsp;<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> : ${item.hits!'0'} 浏览量</h5>
                            </div>
                        </div>
                    </#list>
                </#if>
            </div>
            <div class="tab-pane fade" id="hot">
                <#list articleList as item>
                    <div class="well well-lg">${item.title!''}</div>
                </#list>
            </div>
            <div class="tab-pane fade" id="top">
                <#list articleList as item>
                    <div class="well well-lg">${item.title!''}</div>
                </#list>
            </div>
            <div class="tab-pane fade" id="note">
                <#list articleList as item>
                    <div class="well well-lg">${item.title!''}</div>
                </#list>
            </div>
            <div class="tab-pane fade" id="other">
                <#list articleList as item>
                    <div class="well well-lg">${item.title!''}</div>
                </#list>
            </div>
        </div>
    </div>
    <div class="col-xs-2">
        <ul class="nav nav-pills nav-stacked">
            <li role="presentation" class="active"><a href="#">资讯</a></li>
            <li role="presentation"><a href="#">Profile</a></li>
            <li role="presentation"><a href="#">Messages</a></li>
            <li role="presentation"><a href="#">Profile</a></li>
            <li role="presentation"><a href="#">Messages</a></li>
        </ul>
    </div>
</div>
</body>
</html>