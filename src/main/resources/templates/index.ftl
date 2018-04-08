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
            <#--<#if categoryMap ?? || (categoryMap ? size <= 0)>-->
                <#--<div class="alert alert-info">这里空空如也</div>-->
            <#--<#else>-->
                <#list categoryMap ? keys as key>
                    <a href="/blog/query/${key.id}" class="list-group-item left" id="${key.id}">${key.name!''} <span class="badge badge-info">${categoryMap[key]!'0'}</span></a>
                </#list>
            <#--</#if>-->
        </div>
    </div>
    <div class="col-xs-8">
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

<script>
    $(function () {
        <#if categoryId??>
            $("#" + ${categoryId}).addClass("sidebar");
        </#if>
    });
</script>
</@myLayout.myLayout>