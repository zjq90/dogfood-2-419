<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="找回密码 - 通过邮件重置您的密码">
    <title>找回密码</title>
    <link rel="icon" href="http://img.linzworld.cn/img/douban_favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/iDouBan/css/common.css">
    <link rel="stylesheet" href="/iDouBan/css/send_mail.css">
    <link rel="preload" href="/iDouBan/css/common.css" as="style">
</head>
<body>
    <a href="#main-content" class="skip-link">跳转到主要内容</a>
    
    <main class="main-content" id="main-content">
        <div class="password-recovery">
            <header class="password-recovery__header">
                <h1 class="password-recovery__title">找回密码</h1>
                <p class="password-recovery__subtitle">请输入您的用户名，我们将发送重置邮件</p>
            </header>
            
            <form action="/iDouBan/FindBackServlet" method="post" class="password-recovery__form" data-validate aria-labelledby="form-title">
                <h2 id="form-title" class="sr-only">找回密码表单</h2>
                
                <div class="form-group">
                    <label for="send_email" class="form-label">用户名 / 邮箱</label>
                    <input type="text" 
                           id="send_email" 
                           name="send_email" 
                           class="form-input" 
                           placeholder="请输入您的用户名或注册邮箱"
                           required
                           autocomplete="email"
                           aria-describedby="email-hint">
                    <p id="email-hint" class="password-recovery__hint">
                        我们将向您的注册邮箱发送密码重置链接
                    </p>
                </div>
                
                <button type="submit" class="password-recovery__submit">发送重置邮件</button>
            </form>
            
            <footer class="password-recovery__footer">
                <a href="/iDouBan/jsp/login.jsp" class="password-recovery__link">返回登录</a>
            </footer>
        </div>
    </main>
    
    <script src="/iDouBan/js/common.js" defer></script>
</body>
</html>
