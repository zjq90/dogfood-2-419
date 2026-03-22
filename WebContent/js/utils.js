/**
 * 实用工具函数库
 * 包含各种辅助函数
 */

const Utils = {
    /**
     * Cookie操作
     */
    Cookie: {
        /**
         * 设置Cookie
         * @param {string} name - Cookie名称
         * @param {string} value - Cookie值
         * @param {number} days - 过期天数
         */
        set: function(name, value, days) {
            let expires = '';
            if (days) {
                const date = new Date();
                date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
                expires = '; expires=' + date.toUTCString();
            }
            document.cookie = name + '=' + encodeURIComponent(value) + expires + '; path=/';
        },

        /**
         * 获取Cookie
         * @param {string} name - Cookie名称
         * @returns {string|null} - Cookie值
         */
        get: function(name) {
            const nameEQ = name + '=';
            const ca = document.cookie.split(';');
            for (let i = 0; i < ca.length; i++) {
                let c = ca[i];
                while (c.charAt(0) === ' ') c = c.substring(1, c.length);
                if (c.indexOf(nameEQ) === 0) {
                    return decodeURIComponent(c.substring(nameEQ.length, c.length));
                }
            }
            return null;
        },

        /**
         * 删除Cookie
         * @param {string} name - Cookie名称
         */
        delete: function(name) {
            this.set(name, '', -1);
        }
    },

    /**
     * 本地存储操作
     */
    Storage: {
        /**
         * 设置本地存储
         * @param {string} key - 键名
         * @param {*} value - 值
         */
        set: function(key, value) {
            try {
                localStorage.setItem(key, JSON.stringify(value));
            } catch (e) {
                console.warn('LocalStorage not available');
            }
        },

        /**
         * 获取本地存储
         * @param {string} key - 键名
         * @returns {*} - 值
         */
        get: function(key) {
            try {
                const item = localStorage.getItem(key);
                return item ? JSON.parse(item) : null;
            } catch (e) {
                console.warn('LocalStorage not available');
                return null;
            }
        },

        /**
         * 删除本地存储
         * @param {string} key - 键名
         */
        delete: function(key) {
            try {
                localStorage.removeItem(key);
            } catch (e) {
                console.warn('LocalStorage not available');
            }
        }
    },

    /**
     * AJAX请求封装
     */
    Ajax: {
        /**
         * 发送GET请求
         * @param {string} url - 请求地址
         * @returns {Promise} - 请求Promise
         */
        get: function(url) {
            return fetch(url, {
                method: 'GET',
                credentials: 'same-origin'
            }).then(response => {
                if (!response.ok) throw new Error('Network response was not ok');
                return response.json();
            });
        },

        /**
         * 发送POST请求
         * @param {string} url - 请求地址
         * @param {Object} data - 请求数据
         * @returns {Promise} - 请求Promise
         */
        post: function(url, data) {
            return fetch(url, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                credentials: 'same-origin',
                body: JSON.stringify(data)
            }).then(response => {
                if (!response.ok) throw new Error('Network response was not ok');
                return response.json();
            });
        }
    },

    /**
     * 格式化日期
     * @param {Date|string} date - 日期对象或字符串
     * @param {string} format - 格式字符串
     * @returns {string} - 格式化后的日期
     */
    formatDate: function(date, format = 'yyyy-MM-dd') {
        const d = new Date(date);
        const year = d.getFullYear();
        const month = String(d.getMonth() + 1).padStart(2, '0');
        const day = String(d.getDate()).padStart(2, '0');
        const hours = String(d.getHours()).padStart(2, '0');
        const minutes = String(d.getMinutes()).padStart(2, '0');
        const seconds = String(d.getSeconds()).padStart(2, '0');

        return format
            .replace('yyyy', year)
            .replace('MM', month)
            .replace('dd', day)
            .replace('HH', hours)
            .replace('mm', minutes)
            .replace('ss', seconds);
    },

    /**
     * 截断文本
     * @param {string} text - 原文本
     * @param {number} length - 最大长度
     * @param {string} suffix - 后缀
     * @returns {string} - 截断后的文本
     */
    truncate: function(text, length = 100, suffix = '...') {
        if (!text || text.length <= length) return text;
        return text.substring(0, length) + suffix;
    },

    /**
     * 转义HTML特殊字符
     * @param {string} text - 原文本
     * @returns {string} - 转义后的文本
     */
    escapeHtml: function(text) {
        const div = document.createElement('div');
        div.textContent = text;
        return div.innerHTML;
    },

    /**
     * 复制文本到剪贴板
     * @param {string} text - 要复制的文本
     * @returns {Promise} - 复制Promise
     */
    copyToClipboard: function(text) {
        if (navigator.clipboard) {
            return navigator.clipboard.writeText(text);
        } else {
            return new Promise((resolve, reject) => {
                const textarea = document.createElement('textarea');
                textarea.value = text;
                textarea.style.position = 'fixed';
                textarea.style.opacity = '0';
                document.body.appendChild(textarea);
                textarea.select();
                try {
                    document.execCommand('copy');
                    resolve();
                } catch (err) {
                    reject(err);
                }
                document.body.removeChild(textarea);
            });
        }
    },

    /**
     * 检测浏览器类型
     * @returns {Object} - 浏览器信息
     */
    detectBrowser: function() {
        const ua = navigator.userAgent;
        return {
            isChrome: /Chrome/.test(ua) && /Google Inc/.test(navigator.vendor),
            isFirefox: /Firefox/.test(ua),
            isSafari: /Safari/.test(ua) && /Apple Computer/.test(navigator.vendor),
            isEdge: /Edge/.test(ua),
            isIE: /MSIE|Trident/.test(ua),
            isMobile: /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(ua)
        };
    },

    /**
     * 懒加载图片
     * @param {string} selector - 图片选择器
     */
    lazyLoadImages: function(selector = 'img[data-src]') {
        if ('IntersectionObserver' in window) {
            const imageObserver = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        const img = entry.target;
                        img.src = img.dataset.src;
                        img.removeAttribute('data-src');
                        imageObserver.unobserve(img);
                    }
                });
            });

            document.querySelectorAll(selector).forEach(img => {
                imageObserver.observe(img);
            });
        } else {
            // 降级处理
            document.querySelectorAll(selector).forEach(img => {
                img.src = img.dataset.src;
                img.removeAttribute('data-src');
            });
        }
    },

    /**
     * 平滑滚动到指定元素
     * @param {string|Element} target - 目标元素或选择器
     * @param {number} offset - 偏移量
     */
    scrollTo: function(target, offset = 0) {
        const element = typeof target === 'string' ? document.querySelector(target) : target;
        if (element) {
            const top = element.getBoundingClientRect().top + window.pageYOffset - offset;
            window.scrollTo({
                top: top,
                behavior: 'smooth'
            });
        }
    }
};

// 导出模块
if (typeof module !== 'undefined' && module.exports) {
    module.exports = Utils;
}
