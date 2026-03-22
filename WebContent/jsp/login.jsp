<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="登录iDouBan社交分享平台">
    <title>登录豆瓣</title>
    <link rel="icon" href="http://img.linzworld.cn/img/douban_favicon.ico" type="image/x-icon">
    <!-- 预加载关键CSS -->
    <link rel="preload" href="${pageContext.request.contextPath}/css/common.css" as="style">
    <link rel="preload" href="${pageContext.request.contextPath}/css/components.css" as="style">
    <!-- 样式文件 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/components.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pages.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">
</head>
<body>
    <main class="login-page" role="main">
        <section class="auth-card" aria-labelledby="login-title">
            <h1 id="login-title" class="auth-card__title">登录豆瓣</h1>
            
            <form action="${pageContext.request.contextPath}/LoginServlet" method="post" id="login-form" novalidate>
                <fieldset>
                    <legend class="sr-only">登录表单</legend>
                    
                    <div class="form-group">
                        <label for="uname" class="sr-only">用户名</label>
                        <input 
                            type="text" 
                            id="uname" 
                            name="uname" 
                            class="auth-card__input" 
                            value="${cookie.uname.value}" 
                            placeholder="请输入用户名"
                            required
                            autocomplete="username"
                            aria-required="true"
                            aria-describedby="uname-error"
                        >
                    </div>
                    
                    <div class="form-group">
                        <label for="upwd" class="sr-only">密码</label>
                        <input 
                            type="password" 
                            id="upwd" 
                            name="upwd" 
                            class="auth-card__input" 
                            value="${cookie.upwd.value}" 
                            placeholder="请输入密码"
                            required
                            autocomplete="current-password"
                            aria-required="true"
                            aria-describedby="upwd-error"
                        >
                    </div>
                    
                    <div class="form-group">
                        <div class="form-check">
                            <input type="checkbox" name="auto" id="auto" class="form-check__input">
                            <label for="auto" class="form-check__label">自动登录</label>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" name="remember" id="remember" class="form-check__input">
                            <label for="remember" class="form-check__label">记住密码</label>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <button type="submit" class="auth-card__btn" id="login-btn">登录</button>
                    </div>
                    
                    <c:if test="${not empty requestScope.errorMsg}">
                        <div class="alert alert--danger" role="alert" aria-live="polite">
                            ${requestScope.errorMsg}
                        </div>
                    </c:if>
                </fieldset>
            </form>
            
            <nav class="auth-card__links" aria-label="辅助链接">
                <a href="${pageContext.request.contextPath}/jsp/send_mail.jsp" class="auth-card__link">忘记密码</a>
                <a href="${pageContext.request.contextPath}/jsp/register.jsp" class="auth-card__link">注册账号</a>
            </nav>
        </section>
    </main>
    
    <!-- 公共JS -->
    <script src="${pageContext.request.contextPath}/js/common.js" defer></script>
</body>
</html>
