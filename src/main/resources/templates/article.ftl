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
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">Brand</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
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
        <img src="${article.imgUrl}" style="height: 100px; height: 100px;">
        <h3>${article.title}</h3>
        <p>${article.author}</p>
        <p>${article.createTime}</p>
        <p><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> : ${article.hits!'0'} 浏览量</p>
    </div>
    <div class="col-xs-8">
        <h1>${article.title}</h1>
        <hr>
        <p>${article.content}</p>
    </div>
    <div class="col-xs-2"></div>
</div>
</body>
</html>