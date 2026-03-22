<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="重置密码 - iDouBan">
    <title>重置密码</title>
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
    <main class="reset-pwd-page" role="main">
        <section class="reset-pwd-card" aria-labelledby="reset-pwd-title">
            <h1 id="reset-pwd-title" class="reset-pwd-card__title">重置密码</h1>
            <p class="reset-pwd-card__text">密码重置功能即将推出，敬请期待。</p>
            <nav aria-label="辅助链接">
                <a href="${pageContext.request.contextPath}/jsp/login.jsp" class="reset-pwd-card__link">返回登录</a>
            </nav>
        </section>
    </main>
    
    <script src="${pageContext.request.contextPath}/js/common.js" defer></script>
</body>
</html>
