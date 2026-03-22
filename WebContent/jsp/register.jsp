<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>注册</title>
    <link rel="icon" href="../image/icon/iDouBan_favicon.ico" type="image/x-icon">
    <!-- 预加载关键CSS -->
    <link rel="preload" href="../css/reset.css" as="style">
    <link rel="preload" href="../css/register.css" as="style">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/register.css">
</head>
<body>
    <main class="register-page" role="main">
        <section class="register-card" aria-label="注册区域">
            <h1 class="register-card__title">注册账号</h1>
            
            <form id="register-form" action="/iDouBan/RegisterServlet" method="post" novalidate>
                <div class="form-group">
                    <label for="uname" class="sr-only">邮箱</label>
                    <input type="email" 
                           id="uname" 
                           name="uname" 
                           class="form-input" 
                           placeholder="请输入邮箱"
                           autocomplete="email"
                           onblur="isEmail(this.value)"
                           required
                           aria-required="true">
                </div>
                
                <div class="form-group">
                    <label for="upwd" class="sr-only">密码</label>
                    <input type="password" 
                           id="upwd" 
                           name="upwd" 
                           class="form-input" 
                           placeholder="请输入密码"
                           pattern="^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$"
                           title="请输入6-20个字母、数字、下划线 作为密码"
                           autocomplete="new-password"
                           onblur="isPassword(this.value)"
                           required
                           aria-required="true">
                </div>
                
                <div class="form-group">
                    <label for="upwd1" class="sr-only">确认密码</label>
                    <input type="password" 
                           id="upwd1" 
                           name="upwd1" 
                           class="form-input" 
                           placeholder="请再次输入密码"
                           autocomplete="new-password"
                           onblur="isRepeat()"
                           required
                           aria-required="true">
                </div>
                
                <div class="form-group">
                    <button type="button" class="form-btn" onclick="checkRegister()">
                        注册
                    </button>
                </div>
                
                <c:if test="${not empty requestScope.errorMsg}">
                    <div class="msg-box msg-box--error" role="alert">
                        ${requestScope.errorMsg}
                    </div>
                </c:if>
            </form>
            
            <a href="login.jsp" class="register-card__login-link">
                已有帐号？登录
            </a>
        </section>
    </main>

    <!-- 异步加载非关键JS -->
    <script src="../js/common.js" defer></script>
    <script src="../js/auth.js" defer></script>
</body>
</html>
