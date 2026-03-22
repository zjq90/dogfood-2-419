<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="找回密码 - iDouBan">
    <title>找回密码</title>
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
    <main class="find-pwd-page" role="main">
        <section class="find-pwd-card" aria-labelledby="find-pwd-title">
            <h1 id="find-pwd-title" class="find-pwd-card__title">找回密码</h1>
            
            <form action="${pageContext.request.contextPath}/FindBackServlet" method="post" novalidate>
                <fieldset>
                    <legend class="sr-only">找回密码表单</legend>
                    
                    <label for="send_email" class="find-pwd-card__label">请输入您的用户名或邮箱</label>
                    <input 
                        type="text" 
                        id="send_email" 
                        name="send_email" 
                        class="find-pwd-card__input" 
                        placeholder="用户名/邮箱"
                        required
                        aria-required="true"
                    >
                    
                    <button type="submit" class="find-pwd-card__btn">发送验证邮件</button>
                </fieldset>
            </form>
            
            <nav aria-label="辅助链接">
                <a href="${pageContext.request.contextPath}/jsp/login.jsp" class="find-pwd-card__link">返回登录</a>
            </nav>
        </section>
    </main>
    
    <script src="${pageContext.request.contextPath}/js/common.js" defer></script>
</body>
</html>
