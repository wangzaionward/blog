<#import "layout/myLayout.ftl" as myLayout>
<@myLayout.myLayout>
<style>
    .label{
        display: inline-block;
    }
    .media{
        padding-top:20px;
        padding-left: 20px;
        padding-right: 20px;
        border-radius: 5px;
    }
    .media:hover{
        box-shadow: 0px 0px 16px 0px rgba(0,0,0,0.2);
    }
    .sidebar{
        background-color: #ddddff;
        font-weight: bold;
    }
</style>

<div class="container-fluid">
    <div class="col-xs-2">
        <div class="list-group">
            <a href="#" class="list-group-item active">文章分类</a>
            <#if categoryList ? size <= 0>
                <div class="alert alert-info">这里空空如也</div>
            <#else>
                <#list categoryList as item>
                    <a href="/blog/article/query/${item.id}" class="list-group-item left">${item.name!''}</a>
                </#list>
            </#if>
        </div>
    </div>
    <div class="col-xs-8">
        <ul id="myTab" class="nav nav-tabs" style="margin-bottom: 20px;">
            <li class="active"><a href="#new" data-toggle="tab" value="1">最新发布</a></li>
            <li><a href="#hot" data-toggle="tab" value="2">热门</a></li>
            <li><a href="#top" data-toggle="tab" value="3">精品</a></li>
            <li><a href="#comments" data-toggle="tab" value="4">评论最多</a></li>
        </ul>
        <div id="myTabContent" class="tab-content">
            <div class="tab-pane fade in active" id="new">
            <#if articleList2 ? size <= 0>
                <div class="alert alert-info">这里空空如也</div>
            <#else>
                <#list articleList2 as item>
                    <div class="media">
                        <div class="media-left">
                            <a href="#">
                                <img src="/image/desc_1.png" style="border-radius: 10px">
                            </a>
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">
                                <strong><a href="/blog/article/detail/${item.id!''}">${item.title!''}</a></strong> &emsp;
                                <small><a href="#"><span class="glyphicon glyphicon-th-list"></span> ${item.categoryName}</a></small>
                                <small style="float: right;"><span class="glyphicon glyphicon-time">${item.createTime}</span></small>
                            </h4>
                            <p style="padding-top: 10px; padding-bottom: 20px">${item.description}</p>
                            <p style="float: right">
                                <span class="glyphicon glyphicon-pencil">${item.author!''}</span>&emsp;
                                <span class="glyphicon glyphicon-eye-open">${item.hits!'0'}</span>&emsp;
                                <span class="glyphicon glyphicon-thumbs-up">${item.hits!'0'}</span>&emsp;
                                <span class="glyphicon glyphicon-comment">${item.hits!'0'}</span>
                            </p>
                        </div>
                        <hr>
                    </div>
                </#list>
            </#if>
            </div>
            <div class="tab-pane fade" id="hot">
            <#if articleList3 ? size <= 0>
                <div class="alert alert-info">这里空空如也</div>
            <#else>
                <#list articleList3 as item>
                    <div class="media">
                        <div class="media-left">
                            <a href="#">
                                <img src="/image/desc_1.png" style="border-radius: 10px">
                            </a>
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">
                                <strong><a href="/blog/article/detail/${item.id!''}">${item.title!''}</a></strong> &emsp;
                                <small><a href="#"><span class="glyphicon glyphicon-th-list"></span> ${item.categoryName}</a></small>
                                <small style="float: right;"><span class="glyphicon glyphicon-time">${item.createTime}</span></small>
                            </h4>
                            <p style="padding-top: 10px; padding-bottom: 20px">${item.description}</p>
                            <p style="float: right">
                                <span class="glyphicon glyphicon-pencil">${item.author!''}</span>&emsp;
                                <span class="glyphicon glyphicon-eye-open">${item.hits!'0'}</span>&emsp;
                                <span class="glyphicon glyphicon-thumbs-up">${item.hits!'0'}</span>&emsp;
                                <span class="glyphicon glyphicon-comment">${item.hits!'0'}</span>
                            </p>
                        </div>
                        <hr>
                    </div>
                </#list>
            </#if>
            </div>
            <div class="tab-pane fade" id="top">
            <#if articleList4 ? size <= 0>
                <div class="alert alert-info">这里空空如也</div>
            <#else>
                <#list articleList4 as item>
                    <div class="media">
                        <div class="media-left">
                            <a href="#">
                                <img src="/image/desc_1.png" style="border-radius: 10px">
                            </a>
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">
                                <strong><a href="/blog/article/detail/${item.id!''}">${item.title!''}</a></strong> &emsp;
                                <small><a href="#"><span class="glyphicon glyphicon-th-list"></span> ${item.categoryName}</a></small>
                                <small style="float: right;"><span class="glyphicon glyphicon-time">${item.createTime}</span></small>
                            </h4>
                            <p style="padding-top: 10px; padding-bottom: 20px">${item.description}</p>
                            <p style="float: right">
                                <span class="glyphicon glyphicon-pencil">${item.author!''}</span>&emsp;
                                <span class="glyphicon glyphicon-eye-open">${item.hits!'0'}</span>&emsp;
                                <span class="glyphicon glyphicon-thumbs-up">${item.hits!'0'}</span>&emsp;
                                <span class="glyphicon glyphicon-comment">${item.hits!'0'}</span>
                            </p>
                        </div>
                        <hr>
                    </div>
                </#list>
            </#if>
            </div>
            <div class="tab-pane fade" id="comments">
            <#if articleList5 ? size <= 0>
                <div class="alert alert-info">这里空空如也</div>
            <#else>
                <#list articleList5 as item>
                    <div class="media">
                        <div class="media-left">
                            <a href="#">
                                <img src="/image/desc_1.png" style="border-radius: 10px">
                            </a>
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">
                                <strong><a href="/blog/article/detail/${item.id!''}">${item.title!''}</a></strong> &emsp;
                                <small><a href="#"><span class="glyphicon glyphicon-th-list"></span> ${item.categoryName}</a></small>
                                <small style="float: right;"><span class="glyphicon glyphicon-time">${item.createTime}</span></small>
                            </h4>
                            <p style="padding-top: 10px; padding-bottom: 20px">${item.description}</p>
                            <p style="float: right">
                                <span class="glyphicon glyphicon-pencil">${item.author!''}</span>&emsp;
                                <span class="glyphicon glyphicon-eye-open">${item.hits!'0'}</span>&emsp;
                                <span class="glyphicon glyphicon-thumbs-up">${item.hits!'0'}</span>&emsp;
                                <span class="glyphicon glyphicon-comment">${item.hits!'0'}</span>
                            </p>
                        </div>
                        <hr>
                    </div>
                </#list>
            </#if>
            </div>
        </div>
    </div>
</div>

<script>
    $(function () {

        $(".left").click(function () {
            $(this).addClass("sidebar");
            $(this).siblings().removeClass("sidebar");
        });
    });
</script>
</@myLayout.myLayout>