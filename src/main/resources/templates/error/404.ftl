<#import "../layout/myLayout.ftl" as myLayout>
<@myLayout.myLayout>
<style>
    .navbar-inverse{
        margin-bottom: 0px!important;
    }
    body {
        width:100%;
        height:100%;
        background-image: url('/image/404.jpg');
        background-size: cover;
        margin-bottom: 0px;
    }
    .panel-footer{
        border-top: 0px;
    }
    .info{
        width: 400px;
        height: 100px;
        margin: 280px 250px auto auto;
        line-height: 100px;
        overflow: hidden;
    }
</style>
<div class="info">
    <p style="color: yellow; font-size: 50px">页面不存在
        <a href="javascript:history.back(-1)">返回</a>
    </p>
</div>
</@myLayout.myLayout>