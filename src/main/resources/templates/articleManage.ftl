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
        .list-group-item:hover{
            box-shadow: 0 0 10px lightgray; border:1px solid lightgray;
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
        <ul class="nav nav-pills nav-stacked">
            <li role="presentation" class="active"><a href="javascript:void(0);">文章</a></li>
            <li role="presentation"><a href="javascript:void(0);"  id="categoryLeft">所有文章</a></li>
            <li role="presentation"><a href="javascript:void(0);"  id="categoryLeft">新建分类</a></li>
            <li role="presentation"><a href="javascript:void(0);" id="articleLeft">写文章</a></li>
        </ul>
    </div>
    <div class="col-xs-8">
        <div id="categoryRight" style="display: block">
            <h4>新增分类</h4>
            <input id="categoryName" type="text" class="form-control" placeholder="分类名称" style="width: 50%;">
            <br>
            <button class="btn btn-primary" id="createCategoryBtn">确定</button>
            <button class="btn" onclick="history.go(-1)">返回</button>
            <br><br>
            <h4>已有分类</h4>
            <ul class="list-group">
                <#list categoryList as item>
                    <li class="list-group-item" style="width: 50%;">
                        <a href="/blog/findAllByCategoryId?categoryId=${item.id}">${item.name!''}</span></a>
                        <a href="#" style="float: right"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a>
                    </li>
                </#list>
            </ul>
        </div>
        <div id="articleRight" style="display: none">
            <h4>请输入文章标题</h4>
            <input type="text" class="form-control" placeholder="标题" style="width: 50%;">
            <h4>请输入简介</h4>
            <input type="text" class="form-control" placeholder="简介">
            <h4>请输入正文</h4>
            <input type="text" class="form-control" placeholder="正文">
            <h4>请输入文章分类</h4>
            <select class="form-control" style="width: 30%;">
                <#list categoryList as item>
                    <option>${item.name}</option>
                </#list>
            </select>
            <br><br>
            <button class="btn btn-primary" id="submitBtn2">确定</button>
        </div>
    </div>
    <div class="col-xs-2"></div>
</div>

<script>
    $("#categoryLeft").click(function () {
        $("#articleRight").css("display", "none");
        $("#categoryRight").css("display", "block");
    });
    $("#articleLeft").click(function () {
        $("#categoryRight").css("display", "none");
        $("#articleRight").css("display", "block");
    });

    $("#createCategoryBtn").click(function () {
        var categoryName = $("#categoryName").val();
        if(null == categoryName || categoryName == ""){
            alert("分类名不能为空");
            return;
        }
        $.ajax({
            type: "post",
            url: "/blog/article/createCategory",
            dataType:"json",
            data: {categoryName: categoryName},
            success:function (data) {
                if(data == true){
                    alert("添加成功");
                    location.reload();
                }else{
                    alert("添加失败,请稍候再试");
                }
            }
        });
    });
</script>
</body>
</html>