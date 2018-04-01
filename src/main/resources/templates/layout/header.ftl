<nav class="navbar navbar-inverse navbar-fixed-top" xmlns="http://www.w3.org/1999/html">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="http://localhost:8080/blog/index">Blog <small>每天进步一点点...</small></a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="#">最新资讯</a></li>
                <li><a href="#">github</a></li>
                <li><a href="#">美文</a></li>
                <li><a href="#">书籍</a></li>
                <li><a href="#">互动</a></li>
                <li><a href="#">关于本站</a></li>
            </ul>
            <#if Session.user ? exists>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        ${Session["user"].username} <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="/blog/user/userManage"><span class="glyphicon glyphicon-user"></span>&emsp;个人中心</a></li>
                            <li><a href="/blog/article/articleManage"><span class="glyphicon glyphicon-pencil"></span>&emsp;写文章</a></li>
                            <li class="divider"></li>
                            <li><a href="/blog/logout"><span class="glyphicon glyphicon-log-out"></span>&emsp;退出</a></li>
                        </ul>
                    </li>
                </ul>
            <#else>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/blog/login">登录</a></li>
                    <li><a href="/blog/register">注册</a></li>
                </ul>
            </#if>
            <form class="navbar-form navbar-right">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default">搜索</button>
            </form>
        </div>
    </div>
</nav>