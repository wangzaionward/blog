<#import "layout/myLayout.ftl" as myLayout>
<@myLayout.myLayout>
<style>
    .list-inline li{
        text-align: center
    }
    .media:hover{
        box-shadow: 0px 0px 16px 0px rgba(0,0,0,0.2);
    }
    .media{
        padding-top:20px;
        padding-left: 20px;
    }
    .btn{
        margin-right: 20px;
    }
    .sidebar{
        background-color: #ddddff;
        font-weight: bold;
    }
</style>

<div class="container-fluid">
    <div class="col-xs-2">
        <ul class="nav nav-pills nav-stacked">
            <li class="active"><a href="javascript:void(0);">文章</a></li>
            <li class="sidebar left"><a href="javascript:void(0);" id="left_1">所有文章</a></li>
            <li class="left"><a href="javascript:void(0);" id="left_2">新建分类</a></li>
            <li class="left"><a href="javascript:void(0);" id="left_3">写文章</a></li>
            <li class="left"><a href="javascript:void(0);" id="left_4">我的收藏</a></li>
        </ul>
    </div>
    <div class="col-xs-9">
        <div id="right_1">
            <#if articleList ? size <= 0>
                <div class="alert alert-success">您还没有写过文章</div>
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
                                <small style="float: right;margin-right: 20px"><span class="glyphicon glyphicon-time">${item.createTime}</span></small>
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
        <div id="right_2" style="display: none">
            <h4>新增分类</h4>
            <input id="categoryName" type="text" class="form-control" placeholder="分类名称" style="width: 50%;">
            <div class="alert alert-warning hide" id="a">
                <strong style="width: 50%">不能为空</strong>
            </div>
            <div class="alert alert-danger hide" id="adderrmsg">is must be not null</div>
            <br>
            <button class="btn btn-primary" id="createCategoryBtn">确定</button>
            <button class="btn" onclick="history.go(-1)">返回</button>
            <br><br>
            <h4>已有分类</h4>
            <ul class="list-group">
                <#list categoryList as item>
                    <li class="list-group-item" style="width: 50%;">
                        <a href="/blog/findAllByCategoryId?categoryId=${item.id}">${item.name!''}</span></a>
                        <a href="#" style="float: right" class="close"><span>&times;</span></a>
                    </li>
                </#list>
            </ul>
        </div>
        <div id="right_3" style="display: none">
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
        <div id="right_4" style="display: none">
            <div class="alert alert-info">收藏夹空空如也</div>
        </div>
    </div>
</div>

<script>
    $(function () {
        $("#createCategoryBtn").click(function () {
            var categoryName = $("#categoryName").val();
            if(null == categoryName || categoryName == ""){
                $("#a").removeClass("hide");
                return;
            }
            $("#a").addClass("hide");
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

        $(".left").click(function () {
            $(this).addClass("sidebar");
            $(this).siblings().removeClass("sidebar");
        });

        var display = "none";
        $("#left_1").click(function () {
            showRight(1);
        });
        $("#left_2").click(function () {
            showRight(2);
        });
        $("#left_3").click(function () {
            showRight(3);
        });
        $("#left_4").click(function () {
            showRight(4);
        });
        function showRight(index) {
            for(var i=1; i<5; i++){
                if(i == index){
                    display = "block";
                }else{
                    display = "none";
                }
                $("#right_" + i).css("display", display);
            }
        }
    });
</script>
</div>
</@myLayout.myLayout>