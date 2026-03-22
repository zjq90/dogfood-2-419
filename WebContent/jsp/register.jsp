<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="豆瓣注册页面">
    <title>注册豆瓣</title>
    <link rel="icon" href="http://img.linzworld.cn/img/douban_favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/iDouBan/css/common.css">
    <link rel="stylesheet" href="/iDouBan/css/register.css">
    <link rel="preload" href="/iDouBan/css/common.css" as="style">
</head>
<body>
    <a href="#main-content" class="skip-link">跳转到主要内容</a>
    
    <main id="main-content" class="register-page">
        <article class="register-card">
            <h1 class="register-card__title">注册账号</h1>
            
            <form action="/iDouBan/RegisterServlet" method="post" id="register_form" class="register-form" data-validate>
                <div class="register-form__group">
                    <label for="uname" class="sr-only">邮箱</label>
                    <input 
                        type="email" 
                        id="uname" 
                        name="uname" 
                        class="register-form__input" 
                        placeholder="请输入邮箱"
                        required
                        autocomplete="email"
                        onblur="isEmail(this.value)"
                    >
                </div>
                
                <div class="register-form__group">
                    <label for="upwd" class="sr-only">密码</label>
                    <input 
                        type="password" 
                        id="upwd" 
                        name="upwd" 
                        class="register-form__input" 
                        placeholder="请输入密码"
                        pattern="^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$"
                        title="请输入6-20个字母、数字、下划线作为密码"
                        required
                        autocomplete="new-password"
                        onblur="isPassword(this.value)"
                    >
                    <p class="register-form__hint">密码需6-16位，包含字母和数字</p>
                </div>
                
                <div class="register-form__group">
                    <label for="upwd1" class="sr-only">确认密码</label>
                    <input 
                        type="password" 
                        id="upwd1" 
                        name="upwd1" 
                        class="register-form__input" 
                        placeholder="请再次输入密码"
                        required
                        autocomplete="new-password"
                        onblur="isRepeat('upwd', 'upwd1')"
                    >
                </div>
                
                <div class="register-form__group">
                    <button type="button" onclick="checkRegisterForm()" class="register-form__submit">注册</button>
                </div>
                
                <div class="register-form__footer">
                    <a href="http://47.102.212.18/iDouBan/jsp/login.jsp" class="register-form__link">已有账号？登录</a>
                </div>
                
                <c:if test="${not empty requestScope.errorMsg}">
                    <div class="register-form__error" role="alert">
                        ${requestScope.errorMsg}
                    </div>
                </c:if>
            </form>
        </article>
    </main>

    <script src="/iDouBan/js/common.js" defer></script>
</body>
</html>
