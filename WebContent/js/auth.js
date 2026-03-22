/**
 * 认证相关JavaScript（登录/注册）
 */

/**
 * 登录表单验证
 */
function checkLogin() {
    // 检查用户名
    if (!FormValidator.isNotEmpty('uname', '请输入用户名')) {
        return false;
    }
    
    // 检查密码
    if (!FormValidator.isNotEmpty('upwd', '请输入密码')) {
        return false;
    }
    
    // 提交表单
    document.getElementById('login-form').submit();
}

/**
 * 注册表单验证
 */
function checkRegister() {
    // 检查邮箱
    if (!FormValidator.isNotEmpty('uname', '请输入邮箱')) {
        return false;
    }
    
    // 验证邮箱格式
    const email = document.getElementById('uname').value;
    if (!FormValidator.isEmail(email)) {
        alert('请输入正确的邮箱格式');
        document.getElementById('uname').value = '';
        document.getElementById('uname').focus();
        return false;
    }
    
    // 检查密码
    if (!FormValidator.isNotEmpty('upwd', '请输入密码')) {
        return false;
    }
    
    // 验证密码格式
    const password = document.getElementById('upwd').value;
    if (!FormValidator.isPassword(password)) {
        alert('密码6-20位，只允许字母、数字、下划线其中两项!!!');
        return false;
    }
    
    // 检查确认密码
    if (!FormValidator.isNotEmpty('upwd1', '请再次输入密码')) {
        return false;
    }
    
    // 验证两次密码是否一致
    if (!FormValidator.isPasswordMatch('upwd', 'upwd1')) {
        return false;
    }
    
    // 提交表单
    document.getElementById('register-form').submit();
}

/**
 * 邮箱格式验证（失去焦点时触发
 */
function isEmail(emailValue) {
    if (emailValue && FormValidator.isEmail(emailValue)) {
        // 邮箱格式正确
        return true;
    } else if (emailValue) {
        // 邮箱格式错误
        alert('请输入正确的邮箱格式');
        const emailInput = document.getElementById('uname');
        if (emailInput) {
            emailInput.value = '';
            emailInput.focus();
        }
        return false;
    }
}

/**
 * 密码格式验证（失去焦点时触发
 */
function isPassword(passwordValue) {
    if (passwordValue && FormValidator.isPassword(passwordValue)) {
        // 密码格式正确
        return true;
    } else if (passwordValue) {
        // 密码格式错误
        alert('密码6-20位，只允许字母、数字、下划线其中两项!!!');
        return false;
    }
}

/**
 * 密码重复验证（失去焦点时触发
 */
function isRepeat() {
    const pwd = document.getElementById('upwd');
    const pwd1 = document.getElementById('upwd1');
    
    if (pwd.value && pwd1.value && pwd.value !== pwd1.value) {
        alert('两次输入密码不一致！');
        pwd.value = '';
        pwd1.value = '';
        pwd.focus();
    }
}
