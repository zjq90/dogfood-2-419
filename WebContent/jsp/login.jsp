<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="豆瓣登录页面">
    <title>登录豆瓣</title>
    <link rel="icon" href="http://img.linzworld.cn/img/douban_favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/iDouBan/css/common.css">
    <link rel="stylesheet" href="/iDouBan/css/login.css">
    <link rel="preload" href="/iDouBan/css/common.css" as="style">
</head>
<body>
    <a href="#main-content" class="skip-link">跳转到主要内容</a>
    
    <main id="main-content" class="login-page">
        <article class="login-card">
            <h1 class="login-card__title">登录豆瓣</h1>
            
            <form action="/iDouBan/LoginServlet" method="post" id="login_form" class="login-form" data-validate>
                <div class="login-form__group">
                    <label for="uname" class="sr-only">用户名</label>
                    <input 
                        type="text" 
                        id="uname" 
                        name="uname" 
                        class="login-form__input" 
                        value="${cookie.uname.value}" 
                        placeholder="请输入用户名"
                        required
                        autocomplete="username"
                    >
                </div>
                
                <div class="login-form__group">
                    <label for="upwd" class="sr-only">密码</label>
                    <input 
                        type="password" 
                        id="upwd" 
                        name="upwd" 
                        class="login-form__input" 
                        value="${cookie.upwd.value}" 
                        placeholder="请输入密码"
                        required
                        autocomplete="current-password"
                    >
                </div>
                
                <div class="login-form__options">
                    <label class="login-form__checkbox">
                        <input type="checkbox" name="auto" id="auto">
                        <span>自动登录</span>
                    </label>
                    <label class="login-form__checkbox">
                        <input type="checkbox" name="remember" id="remember">
                        <span>记住密码</span>
                    </label>
                </div>
                
                <div class="login-form__group">
                    <button type="button" onclick="checkLoginForm()" class="login-form__submit">登录</button>
                </div>
                
                <nav class="login-form__links" aria-label="登录帮助链接">
                    <a href="http://47.102.212.18/iDouBan/jsp/send_mail.jsp" class="login-form__link">忘记密码</a>
                    <a href="http://47.102.212.18/iDouBan/jsp/register.jsp" class="login-form__link">注册账号</a>
                </nav>
                
                <c:if test="${not empty requestScope.errorMsg}">
                    <div class="login-form__error" role="alert">
                        ${requestScope.errorMsg}
                    </div>
                </c:if>
            </form>
        </article>
    </main>

    <c:if test="${not empty cookie.auto.value}">
        <c:redirect url="http://47.102.212.18/iDouBan/jsp/alter.jsp" />
    </c:if>

    <script src="/iDouBan/js/common.js" defer></script>
</body>
</html>
