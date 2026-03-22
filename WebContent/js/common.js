(function() {
    'use strict';

    var DoubanApp = {
        init: function() {
            this.setupFormValidation();
            this.setupAccessibility();
            this.setupLazyLoading();
        },

        setupFormValidation: function() {
            var forms = document.querySelectorAll('form[data-validate]');
            forms.forEach(function(form) {
                form.addEventListener('submit', function(e) {
                    var isValid = DoubanApp.validateForm(form);
                    if (!isValid) {
                        e.preventDefault();
                    }
                });
            });
        },

        validateForm: function(form) {
            var inputs = form.querySelectorAll('input[required], textarea[required]');
            var isValid = true;

            inputs.forEach(function(input) {
                if (!input.value.trim()) {
                    isValid = false;
                    DoubanApp.showError(input, '此字段为必填项');
                } else {
                    DoubanApp.clearError(input);
                }
            });

            return isValid;
        },

        showError: function(input, message) {
            var errorEl = input.parentNode.querySelector('.form-error');
            if (!errorEl) {
                errorEl = document.createElement('span');
                errorEl.className = 'form-error';
                errorEl.setAttribute('role', 'alert');
                input.parentNode.appendChild(errorEl);
            }
            errorEl.textContent = message;
            input.setAttribute('aria-invalid', 'true');
        },

        clearError: function(input) {
            var errorEl = input.parentNode.querySelector('.form-error');
            if (errorEl) {
                errorEl.remove();
            }
            input.removeAttribute('aria-invalid');
        },

        setupAccessibility: function() {
            var skipLink = document.querySelector('.skip-link');
            if (skipLink) {
                skipLink.addEventListener('click', function(e) {
                    e.preventDefault();
                    var target = document.querySelector(this.getAttribute('href'));
                    if (target) {
                        target.setAttribute('tabindex', '-1');
                        target.focus();
                    }
                });
            }
        },

        setupLazyLoading: function() {
            if ('IntersectionObserver' in window) {
                var lazyImages = document.querySelectorAll('img[data-src]');
                var imageObserver = new IntersectionObserver(function(entries) {
                    entries.forEach(function(entry) {
                        if (entry.isIntersecting) {
                            var img = entry.target;
                            img.src = img.dataset.src;
                            img.removeAttribute('data-src');
                            imageObserver.unobserve(img);
                        }
                    });
                });

                lazyImages.forEach(function(img) {
                    imageObserver.observe(img);
                });
            }
        }
    };

    window.DoubanApp = DoubanApp;

    document.addEventListener('DOMContentLoaded', function() {
        DoubanApp.init();
    });
})();

function isEmail(strEmail) {
    var reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
    if (strEmail && strEmail.search(reg) !== -1) {
        return true;
    } else {
        alert('请输入正确的邮箱格式');
        return false;
    }
}

function isPassword(strPwd) {
    var passwordReg = /^(?![\d]+$)(?![a-zA-Z]+$)(?![^\da-zA-Z]+$).{6,20}$/;
    if (strPwd && strPwd.search(passwordReg) !== -1) {
        return true;
    } else {
        alert('密码6-20位，只允许字母、数字、下划线其中两项!');
        return false;
    }
}

function isRepeat(pwd1Id, pwd2Id) {
    var pwd1 = document.getElementById(pwd1Id);
    var pwd2 = document.getElementById(pwd2Id);
    if (pwd1 && pwd2 && pwd1.value !== pwd2.value) {
        alert('两次输入密码不一致！');
        pwd1.value = '';
        pwd2.value = '';
        return false;
    }
    return true;
}

function checkLoginForm() {
    var uname = document.getElementById('uname');
    var upwd = document.getElementById('upwd');

    if (!uname || !upwd) return false;

    if (!uname.value.trim()) {
        alert('请输入用户名');
        uname.focus();
        return false;
    }

    if (!upwd.value.trim()) {
        alert('请输入密码');
        upwd.focus();
        return false;
    }

    document.getElementById('login_form').submit();
    return true;
}

function checkRegisterForm() {
    var uname = document.getElementById('uname');
    var upwd = document.getElementById('upwd');
    var upwd1 = document.getElementById('upwd1');

    if (!uname || !upwd || !upwd1) return false;

    if (!uname.value.trim()) {
        alert('请输入用户名');
        uname.focus();
        return false;
    }

    if (!isEmail(uname.value)) {
        uname.focus();
        return false;
    }

    if (!upwd.value.trim()) {
        alert('请输入密码');
        upwd.focus();
        return false;
    }

    if (!isPassword(upwd.value)) {
        upwd.focus();
        return false;
    }

    if (!upwd1.value.trim()) {
        alert('请再次输入密码');
        upwd1.focus();
        return false;
    }

    if (!isRepeat('upwd', 'upwd1')) {
        return false;
    }

    document.getElementById('register_form').submit();
    return true;
}
