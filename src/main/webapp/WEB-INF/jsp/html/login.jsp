<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>登录</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/animate.min.css" />
		<style type="text/css">
			* {
				margin: 0;
				padding: 0;
				list-style: none;
			}
			
			body {
				overflow: hidden;
			}
			
			.pic div {
				width: 100%;
				height: 100%;
				position: absolute;
				left: 0;
				top: 0;
				opacity: 0;
				transition: opacity 2s;
			}
			
			.pic div:nth-of-type(1) {
				opacity: 1;
			}
			
			#logn {
				width: 270px;
				height: 300px;
				margin: 200px auto;
				position: relative;
			}
			
			#logn h1 {
				font-size: 30px;
				font-weight: 700;
				text-shadow: 0 1px 4px rgba(0, 0, 0, .2);
				text-align: center;
				border-bottom: 30px;
				position: absolute;
				top: 10px;
				left: 115px;
			}
			
			.top {
				width: 400px;
				height: 60px;
				line-height: 60px;
				margin-top: 25px;
				padding: 0 15px;
				background: rgba(45, 45, 0, 0.15);
				border-radius: 6px;
				box-shadow: 0 2px 3px 0 rgba(0, 0, 0, 1) inset;
				/*margin-bottom: 25px;*/
				text-shadow: 0 2px 3px 0 rgba(0, 0, 0, .1) inset;
				text-indent: 10px;
				position: absolute;
				top: 50px;
			}
			
			.bottom {
				width: 400px;
				height: 60px;
				line-height: 42px;
				margin-top: 60px;
				padding: 0 15px;
				color: #fff;
				background: rgba(45, 45, 0, 0.15);
				border-radius: 6px;
				box-shadow: 0 2px 3px 0 rgba(0, 0, 0, 1) inset;
				/*margin-bottom: 25px;*/
				text-shadow: 0 2px 3px 0 rgba(0, 0, 0, .1) inset;
				text-indent: 10px;
				position: absolute;
				top: 120px;
			}
			
			#logn .btn {
				width: 433px;
				height: 60px;
				background: #ef4300;
				box-shadow: 0 15px 30px 0 rgba(255, 255, 255, .25) inset;
				border-radius: 6px;
				color: #ffffff;
				font-size: 14px;
				position: absolute;
				top: 270px;
				cursor: pointer;
				font-size: 16px;
				margin-top: 25px;
				padding: 0;
				background: #ef4300;
			}
			#user_name_jiaoyan{
				width: 200px;
				position: absolute;
				top: 97px;
				left: 470px;
			}
			#user_password_jiaoyan{
				width: 200px;
				position: absolute;
				top: 205px;
				left:470px;
			}
			#err{
				position: absolute;
				top:260px;
				color: red;

			}
		</style>
		<script src="${pageContext.request.contextPath}/js/jquery.js"></script>

	</head>

	<body>
		<div class="pic">

			<div><img src="${pageContext.request.contextPath}/img/1.jpg" width="100%" height="100%" /></div>
			<div><img src="${pageContext.request.contextPath}/img/2.jpg" width="100%" height="100%" /></div>
			<div><img src="${pageContext.request.contextPath}/img/3.jpg" width="100%" height="100%" /></div>
		</div>


			<div id="logn">
		<form id="form" action="${pageContext.request.contextPath}/user/login.action" method="post">
			<h1 class="animated zoomInDown" style="animation-delay: 0s;">User login</h1>

			<input type="text" placeholder="user_name" class="top animated zoomInLeft " id="user_name" name="user_code"   style="animation-delay: 1s;"/>
			<span id ="user_name_jiaoyan"></span>
			<input type="password" placeholder="user_password" class="bottom animated zoomInRight" id="user_password" name="user_password"   style="animation-delay: 1.5s;"/>
			<span id ="user_password_jiaoyan"></span>
			
			<br />
			<span id="err">${error}</span>
			<input type="button" onclick="dianji()" class="btn animated zoomInUp"    value="Sign on" style="animation-delay: 2s;"/>
		</form>
		</div>

		<script type="text/javascript">
			var pic=document.querySelectorAll(".pic div");
			var max_top=document.querySelectorAll(".max_top");
			var len=pic.length;
			var index=0;
			 function randomColor(){
            var r = Math.floor(Math.random()*256);
            var g = Math.floor(Math.random()*256);
            var b = Math.floor(Math.random()*256);
            return "rgb("+r+","+g+","+b+")";
        	}
			setInterval(function(){
				
				pic[index].style.opacity=0;
				index++;
				index%=len;
				pic[index].style.opacity=1;
			},3000);


		</script>

	</body>
	<script type="text/javascript">
        $(function() {
            var userflag =false;
            $("#user_name").blur(function () {

                var name = $("#user_name").val();
                if (name.length < 2 || name.length > 12) {
                    $("#user_name_jiaoyan").html("账户大于2位且小于12位").css("color", "red");
                    userflag=flase;

                } else {
                    $("#user_name_jiaoyan").html("账户可用").css("color", "green");
                    userflag=true;
                }
            });

            $("#user_name").focus(function () {
                $("#user_name_jiaoyan").html("");
            });


            var passwordflag=false;
            $("#user_password").blur(function () {
                var name = $("#user_password").val();
                if (name.length < 2 || name.length > 12) {
                    $("#user_password_jiaoyan").html("密码大于2位且小于12位").css("color", "red");
                    passwordflag=false;
                } else {
                    $("#user_password_jiaoyan").html("密码可用").css("color", "green");
                    passwordflag=true;
                }
            });

            $("#user_password").focus(function () {
                $("#user_password_jiaoyan").html("");
            });


        });
        function dianji() {
			if($("#user_name").val()==''){
                $("#user_name_jiaoyan").html("用户名不能为空！").css("color", "red");
			}else if($("#user_password").val()==''){
                $("#user_password_jiaoyan").html("密码不能为空！").css("color", "red");
			}
			else{
			    $("#form").submit();
			}
        }



	</script>
</html>