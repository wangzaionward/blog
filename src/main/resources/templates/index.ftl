<#import "layout/myLayout.ftl" as myLayout>
<@myLayout.myLayout>
<style>
    .label{
        display: inline-block;
    }
</style>

<div class="container-fluid">
    <div class="col-xs-2">
        <div class="list-group">
            <a href="#" class="list-group-item active">文章分类</a>
            <#list categoryList as item>
                <a href="/blog/findAllByCategoryId?categoryId=${item.id}" class="list-group-item">${item.name!''}</a>
            </#list>
        </div>
    </div>
    <div class="col-xs-8">
        <ul id="myTab" class="nav nav-tabs" style="margin-bottom: 20px;">
            <li class="active">
                <a href="#new" data-toggle="tab">最新发布</a>
            </li>
            <li><a href="#hot" data-toggle="tab">热门</a></li>
            <li><a href="#top" data-toggle="tab">精品</a></li>
            <li><a href="#note" data-toggle="tab">笔记</a></li>
            <li><a href="#other" data-toggle="tab">其他</a></li>
        </ul>
        <div id="myTabContent" class="tab-content">
            <div class="tab-pane fade in active" id="new">
            <#if articleList ? size <= 0>
                <div class="alert alert-info">这里空空如也</div>
            <#else>
                <#list articleList as item>
                    <div class="media">
                        <div class="media-left">
                            <a href="#">
                                <img src="/image/desc_1.png" style="border-radius: 10px">
                            </a>
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">
                                <strong><a href="/blog/article/detail?articleId=${item.id}">${item.title!''}</a></strong> &emsp;
                                <small><a href="#"><span class="glyphicon glyphicon-th-list"></span> ${item.categoryName}</a></small>
                                <small style="float: right;"><span class="glyphicon glyphicon-time">${item.createTime}</span></small>
                            </h4>
                            <p>${item.description}</small></p>
                            <span class="glyphicon glyphicon-pencil">${item.author!''}</span>&emsp;
                            <span class="glyphicon glyphicon-eye-open">${item.hits!'0'}</span>&emsp;
                            <span class="glyphicon glyphicon-thumbs-up">${item.hits!'0'}</span>&emsp;
                            <span class="glyphicon glyphicon-comment">${item.hits!'0'}</span>
                        </div>
                        <hr>
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
        <div class="panel panel-primary">
            <div class="panel-heading">标签栏</div>
            <div class="panel-body">
                <span class="label label-primary">python</span>
                <span class="label label-success">java</span>
                <span class="label label-info">机器学习</span>
                <span class="label label-warning">人工智能</span>
                <span class="label label-danger">大数据</span>
                <span class="label label-primary">分布式</span>
                <span class="label label-success">操作系统</span>
                <span class="label label-info">面试</span>
                <span class="label label-warning">职场</span>
                <span class="label label-danger">数据库</span>
            </div>
        </div>
        <ul class="nav nav-pills nav-stacked">
            <li role="presentation" class="active"><a href="#">联系我</a></li>
            <li role="presentation"><a href="">QQ : 188888888</a></li>
            <li role="presentation"><a href="#">微信 : 18888888888</a></li>
            <li role="presentation"><a href="#">github : 18888888888</a></li>
        </ul>
    </div>
</div>
</@myLayout.myLayout>