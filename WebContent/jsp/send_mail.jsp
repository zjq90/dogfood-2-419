<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>找回密码</title>
    <link rel="icon" href="../image/icon/iDouBan_favicon.ico" type="image/x-icon">
    <link rel="preload" href="../css/reset.css" as="style">
    <link rel="preload" href="../css/login.css" as="style">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/login.css">
</head>
<body>
    <main class="login-page" role="main">
        <section class="login-card" aria-label="找回密码区域">
            <h1 class="login-card__title">找回密码</h1>
            
            <form id="email-form" action="/iDouBan/FindBackServlet" method="get" novalidate>
                <div class="form-group">
                    <label for="send-email" class="sr-only">用户名/邮箱</label>
                    <input type="text" 
                           id="send-email" 
                           name="send_email" 
                           class="form-input" 
                           placeholder="请输入用户名或注册邮箱"
                           required
                           aria-required="true">
                </div>
                
                <div class="form-group">
                    <button type="submit" class="form-btn">
                        发送验证邮件
                    </button>
                </div>
            </form>
            
            <nav class="login-card__links">
                <a href="login.jsp" class="login-card__link">返回登录</a>
                <a href="register.jsp" class="login-card__link">注册账号</a>
            </nav>
        </section>
    </main>

    <script src="../js/common.js" defer></script>
</body>
</html>
