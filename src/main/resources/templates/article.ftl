<#import "layout/myLayout.ftl" as myLayout>
<@myLayout.myLayout>
<style>
    .label{
        display: inline-block;
    }
</style>

<div class="container-fluid">
    <div class="col-xs-3">
        <div class="thumbnail">
            <img src="/image/desc_1.png" alt="icon" style="border-radius: 100px;width: 100px; height: 100px;">
            <h3>${article.title}</h3>
            <p>${article.author}</p>
            <p>${article.createTime}</p>
            <p><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> : ${article.hits!'0'} 浏览量</p>
        </div>
    </div>
    <div class="col-xs-8">
        <h1>${article.title}</h1>
        <hr>
        <p>${article.content}</p>
    </div>
    <div class="col-xs-2"></div>
</div>
</@myLayout.myLayout>