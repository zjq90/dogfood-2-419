<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>登录豆瓣</title>
    <link rel="icon" href="../image/icon/iDouBan_favicon.ico" type="image/x-icon">
    <!-- 预加载关键CSS -->
    <link rel="preload" href="../css/reset.css" as="style">
    <link rel="preload" href="../css/common.css" as="style">
    <link rel="preload" href="../css/login.css" as="style">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/login.css">
</head>
<body>
    <c:if test="${not empty cookie.auto.value}">
        <c:redirect url="alter.jsp" />
    </c:if>

    <main class="login-page" role="main">
        <section class="login-card" aria-label="登录区域">
            <h1 class="login-card__title">登录豆瓣</h1>
            
            <form id="login-form" action="/iDouBan/LoginServlet" method="post" novalidate>
                <div class="form-group">
                    <label for="uname" class="sr-only">用户名</label>
                    <input type="text" 
                           id="uname" 
                           name="uname" 
                           class="form-input" 
                           value="${cookie.uname.value}"
                           placeholder="请输入用户名"
                           autocomplete="username"
                           required
                           aria-required="true">
                </div>
                
                <div class="form-group">
                    <label for="upwd" class="sr-only">密码</label>
                    <input type="password" 
                           id="upwd" 
                           name="upwd" 
                           class="form-input" 
                           value="${cookie.upwd.value}"
                           placeholder="请输入密码"
                           autocomplete="current-password"
                           required
                           aria-required="true">
                </div>
                
                <div class="login-form__options">
                    <label class="login-form__checkbox">
                        <input type="checkbox" name="remember" id="remember">
                        <span>记住密码</span>
                    </label>
                    <label class="login-form__checkbox">
                        <input type="checkbox" name="auto" id="auto">
                        <span>自动登录</span>
                    </label>
                </div>
                
                <div class="form-group">
                    <button type="button" class="form-btn" onclick="checkLogin()">
                        登录
                    </button>
                </div>
                
                <c:if test="${not empty requestScope.errorMsg}">
                    <div class="msg-box msg-box--error" role="alert">
                        ${requestScope.errorMsg}
                    </div>
                </c:if>
            </form>
            
            <nav class="login-card__links" aria-label="登录相关链接">
                <a href="reset_pwd.jsp" class="login-card__link">忘记密码</a>
                <a href="register.jsp" class="login-card__link">注册账号</a>
            </nav>
        </section>
    </main>

    <!-- 异步加载非关键JS -->
    <script src="../js/common.js" defer></script>
    <script src="../js/auth.js" defer></script>
</body>
</html>
