<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>重置密码</title>
    <link rel="icon" href="../image/icon/iDouBan_favicon.ico" type="image/x-icon">
    <link rel="preload" href="../css/reset.css" as="style">
    <link rel="preload" href="../css/login.css" as="style">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/login.css">
</head>
<body>
    <main class="login-page" role="main">
        <section class="login-card" aria-label="重置密码区域">
            <h1 class="login-card__title">重置密码</h1>
            
            <form id="reset-form" action="/iDouBan/ResetPwdServlet" method="post" novalidate>
                <div class="form-group">
                    <label for="email" class="sr-only">邮箱</label>
                    <input type="email" 
                           id="email" 
                           name="email" 
                           class="form-input" 
                           placeholder="请输入注册邮箱"
                           autocomplete="email"
                           required
                           aria-required="true">
                </div>
                
                <div class="form-group">
                    <label for="new-pwd" class="sr-only">新密码</label>
                    <input type="password" 
                           id="new-pwd" 
                           name="new_pwd" 
                           class="form-input" 
                           placeholder="请输入新密码"
                           autocomplete="new-password"
                           required
                           aria-required="true">
                </div>
                
                <div class="form-group">
                    <label for="confirm-pwd" class="sr-only">确认密码</label>
                    <input type="password" 
                           id="confirm-pwd" 
                           name="confirm_pwd" 
                           class="form-input" 
                           placeholder="请再次输入新密码"
                           autocomplete="new-password"
                           required
                           aria-required="true">
                </div>
                
                <div class="form-group">
                    <button type="submit" class="form-btn">
                        确认重置
                    </button>
                </div>
            </form>
            
            <nav class="login-card__links">
                <a href="login.jsp" class="login-card__link">返回登录</a>
            </nav>
        </section>
    </main>

    <script src="../js/common.js" defer></script>
</body>
</html>
