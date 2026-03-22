<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="注册iDouBan社交分享平台账号">
    <title>注册账号</title>
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
    <main class="register-page" role="main">
        <section class="register-card" aria-labelledby="register-title">
            <h1 id="register-title" class="register-card__title">注册账号</h1>
            
            <form action="${pageContext.request.contextPath}/RegisterServlet" method="post" id="register-form" novalidate>
                <fieldset>
                    <legend class="sr-only">注册表单</legend>
                    
                    <div class="form-group">
                        <label for="uname" class="sr-only">邮箱</label>
                        <input 
                            type="email" 
                            id="uname" 
                            name="uname" 
                            class="register-card__input" 
                            placeholder="请输入邮箱"
                            required
                            autocomplete="email"
                            aria-required="true"
                            pattern="^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"
                            title="请输入有效的邮箱地址"
                        >
                    </div>
                    
                    <div class="form-group">
                        <label for="upwd" class="sr-only">密码</label>
                        <input 
                            type="password" 
                            id="upwd" 
                            name="upwd" 
                            class="register-card__input" 
                            placeholder="请输入密码（6-20位字母数字组合）"
                            required
                            autocomplete="new-password"
                            aria-required="true"
                            pattern="^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$"
                            title="密码需6-20位，包含字母和数字"
                        >
                    </div>
                    
                    <div class="form-group">
                        <label for="upwd1" class="sr-only">确认密码</label>
                        <input 
                            type="password" 
                            id="upwd1" 
                            name="upwd1" 
                            class="register-card__input" 
                            placeholder="请再次输入密码"
                            required
                            autocomplete="new-password"
                            aria-required="true"
                        >
                    </div>
                    
                    <div class="form-group">
                        <button type="submit" class="register-card__btn" id="register-btn">注册</button>
                    </div>
                    
                    <c:if test="${not empty requestScope.errorMsg}">
                        <div class="alert alert--danger" role="alert" aria-live="polite">
                            ${requestScope.errorMsg}
                        </div>
                    </c:if>
                </fieldset>
            </form>
            
            <nav aria-label="辅助链接">
                <a href="${pageContext.request.contextPath}/jsp/login.jsp" class="register-card__link">已有帐号？立即登录</a>
            </nav>
        </section>
    </main>
    
    <!-- 公共JS -->
    <script src="${pageContext.request.contextPath}/js/common.js" defer></script>
</body>
</html>
