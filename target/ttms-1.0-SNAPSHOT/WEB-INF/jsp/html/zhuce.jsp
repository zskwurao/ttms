<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head lang="en">
    <meta charset="UTF-8">
    <title>注册</title>
    <style>
        body {
            background: url("${pageContext.request.contextPath}/img/timg.gif")
        }
        
        .success {
            background-image: url("${pageContext.request.contextPath}/img/li_ok.gif");
            background-color: #E6FEE4;
            border-color: #01BE00;
            background-repeat: no-repeat;
            background-position: left 2px;
            padding: 0 18px;
        }
        
        .danger {
            background-image: url("${pageContext.request.contextPath}/img/li_err.gif");
            background-color: #FFF2E5;
            border-color: #FF3300;
            background-repeat: no-repeat;
            background-position: left 2px;
            padding: 0 18px;
        }
        
        .nav {
            width: 650px;
            margin: 50px auto;
        }
        
        .nav1 {
            border: 1px solid #666666;
            border-radius: 5px;
        }
        
        i {
            font-size: 12px;
            color: #999999;
        }
        
        label {
            width: 150px;
            height: 30px;
            line-height: 30px;
            text-align: right;
            font-size: 14px;
            display: inline-block;
            color: white;
        }
        
        span {
            background-color: #FFFFDA;
            border: 1px solid #FFCD00;
            font-size: 12px;
            height: 20px;
            line-height: 20px;
            display: inline-block;
            margin-left: 40px;
        }
        
        button {
            margin-left: 159px;
            border: dashed 1px transparent;
            background-color: transparent;
            cursor: pointer;
        }
    </style>
    <script>
        window.onload = function(e) {
            var form = document.querySelector('form');
            var userName = document.querySelector('#userName');
            var passWord = document.querySelector('#passWord');
            var rePassWord = document.querySelector('#rePassWord');
            var name = document.querySelector('#name');
            var tel = document.querySelector('#tel');
            var email = document.querySelector('#email');
            var span = document.querySelectorAll('span');

            //onsubmit事件
            form.onsubmit = function(e) {
                var username = checkUserName();
                if (!username) {
                    return false;
                }
                var password = checkPassWord();
                if (!password) {
                    return false;
                }
                var rePassWord = checkRePassWord();
                if (!rePassWord) {
                    return false;
                }
                var name = checkName();
                if (!name) {
                    return false;
                }
                var tel = checkTel();
                if (!tel) {
                    return false;
                }
                var email = checkEmail();
                if (!email) {
                    return false;
                }
                return true;
            };



            //onblur失去焦点事件
            userName.onblur = function(e) {
                checkUserName();
            };
            passWord.onblur = function(e) {
                checkPassWord();
            };
            rePassWord.onblur = function(e) {
                checkRePassWord();
            };
            name.onblur = function(e) {
                checkName();
            };
            tel.onblur = function(e) {

                checkTel();
            };
            email.onblur = function(e) {
                checkEmail();
            };



            //---------------------------------函数封装-------------------------------------------------------------
            //通行证用户名
            function checkUserName(e) {
                if (userName.value.length == 0) {
                    span[0].innerText = '通行证用户名不能为空';
                    span[0].className = 'danger';
                    return false;
                }
                var pattern = /^[A-Za-z][A-Za-z0-9]{3,11}$/;
                if (!pattern.test(userName.value)) {
                    span[0].innerText = '通行证用户名格式错误，请重新输入';
                    span[0].className = 'danger';
                    return false;
                }
                span[0].innerText = '通行证用户名输入正确';
                span[0].className = 'success';
                return true;
            }



            //登录密码
            function checkPassWord(e) {
                if (passWord.value.length == 0) {
                    span[1].innerText = '密码不能为空';
                    span[1].className = 'danger';
                    return false;
                }
                var pattern = /^[A-Za-z0-9]{6,16}$/;
                if (!pattern.test(passWord.value)) {
                    span[1].innerText = '密码不符合格式，请重新输入';
                    span[1].className = 'danger';
                    return false;
                }
                span[1].innerText = '密码输入正确';
                span[1].className = 'success';
                return true;
            }


            //重复登录密码
            function checkRePassWord(e) {
                if (rePassWord.value.length == 0) {
                    span[2].innerText = '重复密码不能为空';
                    span[2].className = 'danger';
                    return false;
                }
                if (rePassWord.value != passWord.value) {
                    span[2].innerText = '两次输入的密码不一致，请重新输入';
                    span[2].className = 'danger';
                    return false;
                }
                span[2].innerText = '两次密码一致';
                span[2].className = 'success';
                return true;
            }


            //真实姓名（2-4位汉字）
            function checkName(e) {
                if (name.value.length == 0) {
                    span[3].innerText = '真实姓名不能为空';
                    span[3].className = 'danger';
                    return false;
                }
                var pattern = /^[\u4e00-\u9fa5]{2,4}$/;
                if (!pattern.test(name.value)) {
                    span[3].innerText = '真实姓名格式错误，请重新输入';
                    span[3].className = 'danger';
                    return false;
                }
                span[3].innerText = '真实姓名输入正确';
                span[3].className = 'success';
                return true;
            }








            //手机号（）
            function checkTel(e) {
                if (tel.value.length == 0) {
                    span[4].innerText = '手机号不能为空';
                    span[4].className = 'danger';
                    return false;
                }
                var pattern = /^1[34578]\d{9}$/;
                if (!pattern.test(tel.value)) {
                    span[4].innerText = '手机号码格式错误，请重新输入';
                    span[4].className = 'danger';
                    return false;
                }
                span[4].innerText = '手机号输入正确';
                span[4].className = 'success';
                return true;
            }



            //邮箱
            function checkEmail(e) {
                if (email.value.length == 0) {
                    span[5].innerText = '邮箱不能为空';
                    span[5].className = 'danger';
                    return false;
                }
                var pattern = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
                if (!pattern.test(email.value)) {
                    span[5].innerText = '邮箱格式错误，请重新输入';
                    span[5].className = 'danger';
                    return false;
                }
                span[5].innerText = '邮箱输入正确';
                span[5].className = 'success';
                return true;
            }
        }
    </script>
</head>

<body>

    <div id="box">

        <div class="nav">
            <div class="nav1">
                <form action="${pageContext.request.contextPath}/user/register.action" method="post">
                    <p>
                        <label for="userName">通行证用户名：</label>
                        <input type="text" id="userName" name="user_code" size="13px"><span style="margin-left:19px">请输入4-12位用户名（首位为字母）</span>
                    </p>
                    <p>
                        <label for="passWord">登录密码：</label>
                        <input type="password" id="passWord" name="user_password"><span>密码为6-16位</span>
                    </p>
                    <p>
                        <label for="rePassWord">重复登录密码：</label>
                        <input type="password" id="rePassWord" name="password"><span>请再次输入密码</span>
                    </p>
                    <!-- <p>
                        <label>性别：</label>
                        <input type="radio" name="sex" checked style="color: white">男
                        <input type="radio" name="sex">女
                    </p> -->
                    <p>
                        <label for="name">真实姓名：</label>
                        <input type="text" id="name" name="user_name"><span>请输入您的真实姓名</span>
                    </p>
                    <%--<p>
                        <label for="NC">昵称：</label>
                        <input type="text" id="NC"><span>请输入昵称</span>
                    </p>--%>
                    <p>
                        <label for="tel">关联手机号:</label>
                        <input type="text" id="tel" name="user_telephone"><span>请输入关联手机号</span>
                    </p>
                    <p>
                        <label for="email">保密邮箱：</label>
                        <input type="text" id="email" name="user_email"><span>请输入保密邮箱</span>
                    </p>
                    <button>
                <img src="${pageContext.request.contextPath}/img/button.gif">
            </button>
                </form>
            </div>
        </div>

    </div>

</body>

</html>