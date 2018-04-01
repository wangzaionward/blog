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
    }
    .btn{
        margin-right: 20px;
    }
</style>

<div class="container">
    <div class="col-xs-3">
        <div class="thumbnail">
            <img src="/image/desc_1.png" alt="icon" style="border-radius: 100px;width: 100px; height: 100px;">
            <div class="caption" style="text-align: center">
                <h3>${Session["user"].username}</h3>
            </div>
            <div style="text-align: center">
                <label class="label label-success">博客狂人</label>
                <label class="label label-success">未来之星</label>
            </div>
            <hr style="width: 80%">
            <ul class="list-inline" style="text-align: center">
                <li><a href="#"><p>文章</p><p>261</p></a></li>
                <li><a href="#"><p>喜欢</p><p>817</p></a></li>
                <li><a href="#"><p>评论</p><p>261</p></a></li>
                <li><a href="#"><p>新消息</p><p>261</p></a></li>
            </ul>
        </div>
    </div>
    <div class="col-xs-8">
        <ul id="myTab" class="nav nav-tabs" style="margin-bottom: 20px;">
            <li class="active">
                <a href="#basicInfo" data-toggle="tab">基本资料</a>
            </li>
            <li><a href="#bindingPhone" data-toggle="tab">绑定手机</a></li>
            <li><a href="#bindingEmail" data-toggle="tab">绑定邮箱</a></li>
            <li><a href="#modifyPwd" data-toggle="tab">修改密码</a></li>
            <li><a href="#other" data-toggle="tab">其他</a></li>
        </ul>
        <div id="myTabContent" class="tab-content">
            <div class="tab-pane fade in active" id="basicInfo">
                <div class="media">
                    <div class="media-left">
                        <a href="#">
                            <img class="media-object" src="/image/desc_1.png" alt="..." style="width: 50px; height: 50px; border-radius: 100px">
                        </a>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">用户名</h4>
                        ${Session["user"].username}
                        <hr>
                    </div>
                    <div class="media-right">
                        <label class="label label-success" style="margin-right: 20px">不可修改</label>
                    </div>
                </div>
                <div class="media">
                    <div class="media-left">
                        <a href="#">
                            <img class="media-object" src="/image/desc_1.png" alt="..." style="width: 50px; height: 50px; border-radius: 100px">
                        </a>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">昵称</h4>
                        ${Session["user"].nickname!"未设置"}
                        <hr>
                    </div>
                    <div class="media-right">
                        <button class="btn btn-primary">修改</button>
                    </div>
                </div>
                <div class="media">
                    <div class="media-left">
                        <a href="#">
                            <img class="media-object" src="/image/desc_1.png" alt="..." style="width: 50px; height: 50px; border-radius: 100px">
                        </a>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">手机号</h4>
                        ${Session["user"].phone}
                        <hr>
                    </div>
                    <div class="media-right">
                        <button class="btn btn-primary">绑定手机号</button>
                    </div>
                </div>
                <div class="media">
                    <div class="media-left">
                        <a href="#">
                            <img class="media-object" src="/image/desc_1.png" alt="..." style="width: 50px; height: 50px; border-radius: 100px">
                        </a>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">邮箱</h4>
                        ${Session["user"].email}
                        <hr>
                    </div>
                    <div class="media-right">
                        <button class="btn btn-primary">更换邮箱</button>
                    </div>
                </div>
                <div class="media">
                    <div class="media-left">
                        <a href="#">
                            <img class="media-object" src="/image/desc_1.png" alt="..." style="width: 50px; height: 50px; border-radius: 100px">
                        </a>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">个性签名</h4>
                        ${Session["user"].motto!"未设置"}
                        <hr>
                    </div>
                    <div class="media-right">
                        <button class="btn btn-primary">修改</button>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="bindingPhone">
                <label>请输入手机号</label>
                <div class="input-group" style="width: 50%">
                    <input type="text" class="form-control" placeholder="手机号">
                    <span class="input-group-addon" id="basic-addon2">获取验证码</span>
                </div>
                <br>
                <div class="form-group" style="width: 50%">
                    <label for="exampleInputEmail1">请输入验证码</label>
                    <input type="email" class="form-control" placeholder="验证码">
                </div>
                <button class="btn btn-primary">确定</button>
            </div>
            <div class="tab-pane fade" id="bindingEmail">
                <label>请输入邮箱</label>
                <div class="input-group" style="width: 50%">
                    <input type="text" class="form-control" placeholder="邮箱">
                    <span class="input-group-addon" id="basic-addon2">获取验证码</span>
                </div>
                <br>
                <div class="form-group" style="width: 50%">
                    <label for="exampleInputEmail1">请输入验证码</label>
                    <input type="email" class="form-control" placeholder="验证码">
                </div>
                <button class="btn btn-primary">确定</button>
            </div>
            <div class="tab-pane fade" id="modifyPwd">
                <div class="form-group" style="width: 50%">
                    <label for="exampleInputEmail1">请输入原密码</label>
                    <input type="email" class="form-control" placeholder="原密码">
                </div>
                <div class="form-group" style="width: 50%">
                    <label for="exampleInputEmail1">请输入新密码</label>
                    <input type="email" class="form-control" placeholder="新密码">
                </div>
                <button class="btn btn-primary">确定</button>
            </div>
            <div class="tab-pane fade" id="other">
                暂无
            </div>
        </div>
    </div>
</div>
</@myLayout.myLayout>