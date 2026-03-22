/**
 * 通用JavaScript功能模块
 * 包含表单验证、工具函数、事件处理等
 */

(function() {
    'use strict';

    // ============================================
    // 工具函数
    // ============================================
    
    const Utils = {
        /**
         * 检查字符串是否为空
         * @param {string} str - 要检查的字符串
         * @returns {boolean} - 是否为空
         */
        isEmpty: function(str) {
            return !str || str.trim() === '';
        },

        /**
         * 验证邮箱格式
         * @param {string} email - 邮箱地址
         * @returns {boolean} - 是否有效
         */
        isValidEmail: function(email) {
            const reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
            return reg.test(email);
        },

        /**
         * 验证密码格式（6-20位，包含字母和数字）
         * @param {string} password - 密码
         * @returns {boolean} - 是否有效
         */
        isValidPassword: function(password) {
            const reg = /^(?![\d]+$)(?![a-zA-Z]+$)(?![^\da-zA-Z]+$).{6,20}$/;
            return reg.test(password);
        },

        /**
         * 防抖函数
         * @param {Function} func - 要执行的函数
         * @param {number} wait - 等待时间（毫秒）
         * @returns {Function} - 防抖后的函数
         */
        debounce: function(func, wait) {
            let timeout;
            return function executedFunction(...args) {
                const later = () => {
                    clearTimeout(timeout);
                    func(...args);
                };
                clearTimeout(timeout);
                timeout = setTimeout(later, wait);
            };
        },

        /**
         * 节流函数
         * @param {Function} func - 要执行的函数
         * @param {number} limit - 限制时间（毫秒）
         * @returns {Function} - 节流后的函数
         */
        throttle: function(func, limit) {
            let inThrottle;
            return function(...args) {
                if (!inThrottle) {
                    func.apply(this, args);
                    inThrottle = true;
                    setTimeout(() => inThrottle = false, limit);
                }
            };
        },

        /**
         * 显示提示消息
         * @param {string} message - 消息内容
         * @param {string} type - 消息类型 (success, error, warning, info)
         * @param {number} duration - 显示时长（毫秒）
         */
        showMessage: function(message, type = 'info', duration = 3000) {
            // 移除已存在的消息
            const existingAlert = document.querySelector('.alert-message');
            if (existingAlert) {
                existingAlert.remove();
            }

            // 创建消息元素
            const alertDiv = document.createElement('div');
            alertDiv.className = `alert-message alert-message--${type}`;
            alertDiv.setAttribute('role', 'alert');
            alertDiv.textContent = message;

            // 样式
            alertDiv.style.cssText = `
                position: fixed;
                top: 20px;
                left: 50%;
                transform: translateX(-50%);
                padding: 12px 24px;
                border-radius: 4px;
                font-size: 14px;
                z-index: 9999;
                animation: slideDown 0.3s ease;
            `;

            // 根据类型设置颜色
            const colors = {
                success: { bg: '#d4edda', color: '#155724', border: '#c3e6cb' },
                error: { bg: '#f8d7da', color: '#721c24', border: '#f5c6cb' },
                warning: { bg: '#fff3cd', color: '#856404', border: '#ffeeba' },
                info: { bg: '#d1ecf1', color: '#0c5460', border: '#bee5eb' }
            };

            const color = colors[type] || colors.info;
            alertDiv.style.backgroundColor = color.bg;
            alertDiv.style.color = color.color;
            alertDiv.style.border = `1px solid ${color.border}`;

            document.body.appendChild(alertDiv);

            // 自动移除
            setTimeout(() => {
                alertDiv.style.animation = 'slideUp 0.3s ease';
                setTimeout(() => alertDiv.remove(), 300);
            }, duration);
        },

        /**
         * 添加CSS动画
         */
        addAnimations: function() {
            const style = document.createElement('style');
            style.textContent = `
                @keyframes slideDown {
                    from { opacity: 0; transform: translate(-50%, -20px); }
                    to { opacity: 1; transform: translate(-50%, 0); }
                }
                @keyframes slideUp {
                    from { opacity: 1; transform: translate(-50%, 0); }
                    to { opacity: 0; transform: translate(-50%, -20px); }
                }
            `;
            document.head.appendChild(style);
        }
    };

    // ============================================
    // 表单验证模块
    // ============================================
    
    const FormValidator = {
        /**
         * 验证登录表单
         * @returns {boolean} - 是否通过验证
         */
        validateLogin: function() {
            const username = document.getElementById('uname');
            const password = document.getElementById('upwd');

            if (!username || !password) return false;

            if (Utils.isEmpty(username.value)) {
                Utils.showMessage('请输入用户名', 'error');
                username.focus();
                return false;
            }

            if (Utils.isEmpty(password.value)) {
                Utils.showMessage('请输入密码', 'error');
                password.focus();
                return false;
            }

            return true;
        },

        /**
         * 验证注册表单
         * @returns {boolean} - 是否通过验证
         */
        validateRegister: function() {
            const username = document.getElementById('uname');
            const password = document.getElementById('upwd');
            const passwordConfirm = document.getElementById('upwd1');

            if (!username || !password || !passwordConfirm) return false;

            // 验证用户名（邮箱）
            if (Utils.isEmpty(username.value)) {
                Utils.showMessage('请输入邮箱', 'error');
                username.focus();
                return false;
            }

            if (!Utils.isValidEmail(username.value)) {
                Utils.showMessage('请输入正确的邮箱格式', 'error');
                username.focus();
                return false;
            }

            // 验证密码
            if (Utils.isEmpty(password.value)) {
                Utils.showMessage('请输入密码', 'error');
                password.focus();
                return false;
            }

            if (!Utils.isValidPassword(password.value)) {
                Utils.showMessage('密码6-20位，需包含字母和数字', 'error');
                password.focus();
                return false;
            }

            // 验证确认密码
            if (Utils.isEmpty(passwordConfirm.value)) {
                Utils.showMessage('请再次输入密码', 'error');
                passwordConfirm.focus();
                return false;
            }

            if (password.value !== passwordConfirm.value) {
                Utils.showMessage('两次输入的密码不一致', 'error');
                passwordConfirm.focus();
                return false;
            }

            return true;
        },

        /**
         * 实时验证邮箱
         * @param {string} value - 输入值
         * @returns {boolean} - 是否有效
         */
        validateEmailRealtime: function(value) {
            if (Utils.isEmpty(value)) return true;
            return Utils.isValidEmail(value);
        },

        /**
         * 实时验证密码
         * @param {string} value - 输入值
         * @returns {boolean} - 是否有效
         */
        validatePasswordRealtime: function(value) {
            if (Utils.isEmpty(value)) return true;
            return Utils.isValidPassword(value);
        }
    };

    // ============================================
    // 事件绑定
    // ============================================
    
    function bindEvents() {
        // 为所有表单输入添加焦点样式
        document.querySelectorAll('input, textarea, select').forEach(input => {
            input.addEventListener('focus', function() {
                this.closest('.form-group')?.classList.add('form-group--focused');
            });
            
            input.addEventListener('blur', function() {
                this.closest('.form-group')?.classList.remove('form-group--focused');
            });
        });

        // 自动隐藏消息提示
        document.querySelectorAll('.alert').forEach(alert => {
            setTimeout(() => {
                alert.style.opacity = '0';
                setTimeout(() => alert.remove(), 300);
            }, 5000);
        });

        // 确认对话框
        document.querySelectorAll('[data-confirm]').forEach(link => {
            link.addEventListener('click', function(e) {
                const message = this.getAttribute('data-confirm');
                if (!confirm(message)) {
                    e.preventDefault();
                }
            });
        });
    }

    // ============================================
    // 表单自动验证绑定
    // ============================================
    
    function bindFormValidation() {
        // 登录表单验证
        const loginBtn = document.getElementById('login-btn');
        if (loginBtn) {
            loginBtn.addEventListener('click', function(e) {
                if (!FormValidator.validateLogin()) {
                    e.preventDefault();
                    return false;
                }
            });
        }
        
        // 注册表单验证
        const registerBtn = document.getElementById('register-btn');
        if (registerBtn) {
            registerBtn.addEventListener('click', function(e) {
                if (!FormValidator.validateRegister()) {
                    e.preventDefault();
                    return false;
                }
            });
        }
    }

    // ============================================
    // 初始化
    // ============================================
    
    function init() {
        Utils.addAnimations();
        bindEvents();
        bindFormValidation();
        
        // 暴露全局函数供HTML调用
        window.App = {
            Utils: Utils,
            FormValidator: FormValidator,
            checkLogin: FormValidator.validateLogin,
            checkRegister: FormValidator.validateRegister
        };
    }

    // DOM加载完成后初始化
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }

})();
