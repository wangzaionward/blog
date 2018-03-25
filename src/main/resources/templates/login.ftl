<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
    <title>登录</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <style>
	body{color:#fff; font-family:"微软雅黑"; font-size:14px;}
	.wrap1{position:absolute; top:0; right:0; bottom:0; left:0; margin:auto }/*把整个屏幕真正撑开--而且能自己实现居中*/
	.main_content{background:url(/image/login_box_bg.png) repeat; margin-left:auto; margin-right:auto; text-align:left; float:none; border-radius:8px;}
	.form-group{position:relative;}
	.login_btn{display:block; background:#3872f6; color:#fff; font-size:15px; width:100%; line-height:50px; border-radius:3px; border:none; }
	.login_input{width:100%; border:1px solid #3872f6; border-radius:3px; line-height:40px; padding:2px 5px 2px 30px; background:none;}
	.icon_font{position:absolute; bottom:15px; left:10px; font-size:18px; color:#3872f6;}
	.font16{font-size:16px;}
	.mg-t20{margin-top:20px;}
	@media (min-width:200px){.pd-xs-20{padding:20px;}}
	@media (min-width:768px){.pd-sm-50{padding:50px;}}
	#grad {
	  background: -webkit-linear-gradient(#4990c1, #52a3d2, #6186a3); /* Safari 5.1 - 6.0 */
	  background: -o-linear-gradient(#4990c1, #52a3d2, #6186a3); /* Opera 11.1 - 12.0 */
	  background: -moz-linear-gradient(#4990c1, #52a3d2, #6186a3); /* Firefox 3.6 - 15 */
	  background: linear-gradient(#4990c1, #52a3d2, #6186a3); /* 标准的语法 */
	}
</style>

</head>

<body style="background:url(/image/login_bg.jpg) no-repeat;">
    
    <div class="container wrap1" style="height:450px;">
            <div class="col-sm-8 col-md-5 center-auto pd-sm-50 pd-xs-20 main_content">
                <h2 class="mg-b20 text-center">登 录</h2>
                <p id="info" style='color: red;font-size: 15px;display: none;text-align: center;'>用户名或密码错误</p>
                <form id="form">
                    <div class="form-group mg-t20">
                        <i class="icon-user icon_font"></i>
                        <input name="username" type="text" class="login_input" placeholder="请输入用户名" />
                    </div>
                    <div class="form-group mg-t20">
                        <i class="icon-lock icon_font"></i>
                        <input name="password" type="password" class="login_input" placeholder="请输入密码" />
                    </div>
                    <div class="checkbox mg-b25">
                        <label>
                            <input type="checkbox" id="remember"/>记住密码
                        </label>
                    </div>
                    <input id="login_btn" class="login_btn" value="登 录" style="text-align: center"/>
               </form>
        </div>
    </div>

    <script>
        $("#login_btn").click(function () {
            $.ajax({
                type:"post",
                dataType:"json",
                url:"/blog/loginSubmit",
                data:$("#form").serialize(),
                success:function (data) {
                    if(data == true){
                        location.href = "/blog/index";
                    }else{
                        $("#info").css("display", "block");
                    }
                }
            });
        });
    </script>
</body>
</html>
