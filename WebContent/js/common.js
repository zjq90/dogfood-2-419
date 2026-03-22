/**
 * 公共JavaScript工具函数
 */

// 表单验证工具
const FormValidator = {
    /**
     * 检查表单字段是否为空
     * @param {string} fieldId - 字段ID
     * @param {string} message - 提示消息
     * @returns {boolean} - 是否通过验证
     */
    isNotEmpty: function(fieldId, message) {
        const field = document.getElementById(fieldId);
        if (!field || field.value.trim() === '') {
            alert(message);
            if (field) field.focus();
            return false;
        }
        return true;
    },

    /**
     * 验证邮箱格式
     * @param {string} email - 邮箱地址
     * @returns {boolean} - 是否通过验证
     */
    isEmail: function(email) {
        const emailReg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
        return emailReg.test(email);
    },

    /**
     * 验证密码格式
     * 密码6-20位，至少包含字母、数字、下划线中的两项
     * @param {string} password - 密码
     * @returns {boolean} - 是否通过验证
     */
    isPassword: function(password) {
        const passwordReg = /^(?![\d]+$)(?![a-zA-Z]+$)(?![^\da-zA-Z]+$).{6,20}$/;
        return passwordReg.test(password);
    },

    /**
     * 验证两次密码是否一致
     * @param {string} pwdId1 - 第一个密码字段ID
     * @param {string} pwdId2 - 第二个密码字段ID
     * @returns {boolean} - 是否通过验证
     */
    isPasswordMatch: function(pwdId1, pwdId2) {
        const pwd1 = document.getElementById(pwdId1);
        const pwd2 = document.getElementById(pwdId2);
        if (pwd1.value !== pwd2.value) {
            alert('两次输入密码不一致！');
            pwd1.value = '';
            pwd2.value = '';
            pwd1.focus();
            return false;
        }
        return true;
    }
};

// DOM操作工具
const DOMUtils = {
    /**
     * 通过ID获取元素
     * @param {string} id - 元素ID
     * @returns {HTMLElement|null} - 元素对象
     */
    $: function(id) {
        return document.getElementById(id);
    },

    /**
     * 通过选择器获取元素
     * @param {string} selector - CSS选择器
     * @returns {HTMLElement|null} - 元素对象
     */
    select: function(selector) {
        return document.querySelector(selector);
    },

    /**
     * 通过选择器获取所有匹配元素
     * @param {string} selector - CSS选择器
     * @returns {NodeList} - 元素列表
     */
    selectAll: function(selector) {
        return document.querySelectorAll(selector);
    },

    /**
     * 显示元素
     * @param {string|HTMLElement} element - 元素ID或元素对象
     */
    show: function(element) {
        const el = typeof element === 'string' ? this.$(element) : element;
        if (el) el.style.display = 'block';
    },

    /**
     * 隐藏元素
     * @param {string|HTMLElement} element - 元素ID或元素对象
     */
    hide: function(element) {
        const el = typeof element === 'string' ? this.$(element) : element;
        if (el) el.style.display = 'none';
    },

    /**
     * 设置元素文本内容
     * @param {string|HTMLElement} element - 元素ID或元素对象
     * @param {string} text - 文本内容
     */
    setText: function(element, text) {
        const el = typeof element === 'string' ? this.$(element) : element;
        if (el) el.textContent = text;
    },

    /**
     * 设置元素HTML内容
     * @param {string|HTMLElement} element - 元素ID或元素对象
     * @param {string} html - HTML内容
     */
    setHTML: function(element, html) {
        const el = typeof element === 'string' ? this.$(element) : element;
        if (el) el.innerHTML = html;
    }
};

// 页面加载完成后执行
document.addEventListener('DOMContentLoaded', function() {
    // 可以在这里添加页面加载完成后的通用操作
    console.log('Common JS loaded');
});
