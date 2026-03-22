<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="重置密码 - 设置您的新密码">
    <title>重置密码</title>
    <link rel="icon" href="http://img.linzworld.cn/img/douban_favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/iDouBan/css/common.css">
    <link rel="stylesheet" href="/iDouBan/css/reset_pwd.css">
    <link rel="preload" href="/iDouBan/css/common.css" as="style">
</head>
<body>
    <a href="#main-content" class="skip-link">跳转到主要内容</a>
    
    <main class="main-content" id="main-content">
        <div class="password-reset">
            <header class="password-reset__header">
                <h1 class="password-reset__title">重置密码</h1>
                <p class="password-reset__subtitle">请设置您的新密码</p>
            </header>
            
            <form action="/iDouBan/ResetPwdServlet" method="post" class="password-reset__form" data-validate aria-labelledby="form-title">
                <h2 id="form-title" class="sr-only">重置密码表单</h2>
                
                <div class="form-group">
                    <label for="new_password" class="form-label">新密码</label>
                    <input type="password" 
                           id="new_password" 
                           name="new_password" 
                           class="form-input" 
                           placeholder="请输入新密码"
                           required
                           autocomplete="new-password"
                           minlength="6"
                           maxlength="20"
                           aria-describedby="password-hint">
                    <p id="password-hint" class="password-reset__hint">
                        密码长度6-20位，建议包含字母和数字
                    </p>
                </div>
                
                <div class="form-group">
                    <label for="confirm_password" class="form-label">确认密码</label>
                    <input type="password" 
                           id="confirm_password" 
                           name="confirm_password" 
                           class="form-input" 
                           placeholder="请再次输入新密码"
                           required
                           autocomplete="new-password"
                           minlength="6"
                           maxlength="20">
                </div>
                
                <button type="submit" class="password-reset__submit">确认重置</button>
            </form>
            
            <footer class="password-reset__footer">
                <a href="/iDouBan/jsp/login.jsp" class="password-reset__link">返回登录</a>
            </footer>
        </div>
    </main>
    
    <script src="/iDouBan/js/common.js" defer></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var form = document.querySelector('.password-reset__form');
            var newPassword = document.getElementById('new_password');
            var confirmPassword = document.getElementById('confirm_password');
            
            form.addEventListener('submit', function(e) {
                if (newPassword.value !== confirmPassword.value) {
                    e.preventDefault();
                    alert('两次输入的密码不一致，请重新输入！');
                    confirmPassword.value = '';
                    confirmPassword.focus();
                }
            });
        });
    </script>
</body>
</html>
