/**
 * 文章展示页面功能模块
 * 包含评论、回复、点赞等功能
 */

const ArticleShow = {
    // 全局状态
    currentPage: 1,
    totalPage: 0,
    toCommentId: 0,
    toUseId: 0,
    toUserComNick: '',
    isReply: 'no',
    commentData: null,
    replyData: null,
    articleId: null,

    /**
     * 初始化
     */
    init: function(articleId) {
        this.articleId = articleId;
        this.bindEvents();
        this.loadComments(1);
    },

    /**
     * 绑定事件
     */
    bindEvents: function() {
        const self = this;

        // 首页按钮
        $('#first_page').on('click', function() {
            if (self.currentPage === 1) {
                alert('已经是评论的首页了！');
                return;
            }
            self.loadComments(1);
        });

        // 上一页按钮
        $('#previous_page').on('click', function() {
            const page = self.currentPage === 1 ? 1 : self.currentPage - 1;
            self.loadComments(page);
        });

        // 下一页按钮
        $('#next_page').on('click', function() {
            const page = self.currentPage === self.totalPage ? self.totalPage : self.currentPage + 1;
            self.loadComments(page);
        });

        // 尾页按钮
        $('#last_page').on('click', function() {
            if (self.currentPage === self.totalPage) {
                alert('已经是评论的尾页了！');
                return;
            }
            if (self.totalPage === 0) {
                return;
            }
            self.loadComments(self.totalPage);
        });

        // 提交评论/回复按钮
        $('#submit_btn').on('click', function() {
            self.formSubmit();
        });

        // 取消回复按钮
        $('#cancel_reply').on('click', function() {
            self.cancelReply();
        });

        // 委托事件 - 回复评论
        $(document).on('click', '.reply_a', function() {
            const id = $(this).attr('id');
            self.handleReply(id);
        });

        // 委托事件 - 回复的回复
        $(document).on('click', '.reply_reply_a', function() {
            const idInfo = $(this).attr('id');
            self.handleReplyReply(idInfo);
        });
    },

    /**
     * 处理回复点击
     */
    handleReply: function(commentId) {
        this.toCommentId = commentId;
        this.getUserNickname(commentId);
    },

    /**
     * 处理回复的回复点击
     */
    handleReplyReply: function(idInfo) {
        const commentId = idInfo.match(/commentId&(\S*)&userReplyToId/)[1];
        const userReplyToId = idInfo.match(/userReplyToId&(\S*)&userReplyFromNick/)[1];
        const userReplyToNick = idInfo.match(/userReplyFromNick&(\S*)&/)[1];

        this.toCommentId = commentId;
        this.toUseId = userReplyToId;
        this.toUserComNick = userReplyToNick;
        $('#reply_to_use_id').val(userReplyToId);
        this.showReplyNickname();
    },

    /**
     * 获取用户昵称
     */
    getUserNickname: function(commentId) {
        if (!this.commentData) return;

        for (let i = 0; i < this.commentData.objects.length; i++) {
            if (commentId == this.commentData.objects[i].commentId) {
                this.toUserComNick = this.commentData.objects[i].userComNick;
                this.showReplyNickname();
                break;
            }
        }
    },

    /**
     * 显示回复对象昵称
     */
    showReplyNickname: function() {
        $('#reply_to_user_com_nick').parent().show();
        $('#reply_to_user_com_nick').html('回复: ' + this.toUserComNick);
        this.isReply = 'yes';
    },

    /**
     * 取消回复
     */
    cancelReply: function() {
        $('#reply_to_user_com_nick').parent().hide();
        this.toCommentId = '';
        this.isReply = 'no';
    },

    /**
     * 提交评论/回复
     */
    formSubmit: function() {
        const textarea = $('#comment-textarea');
        let content = textarea.val();

        // 过滤script标签
        content = this.filterScript(content);
        if (content !== textarea.val()) {
            alert('你的输入中含有不合法的字符，请重新输入！');
            return;
        }

        // HTML转义
        content = this.htmlEscape(content);

        // 判空
        if (this.isContentEmpty(content)) {
            return;
        }

        // 设置隐藏表单值
        $('#content').val(content);
        $('#reply_content').val(content);

        if (this.isReply === 'no') {
            // 提交评论
            $('#onSubmit').submit();
        } else {
            // 提交回复
            $('#reply_comment_id').val(this.toCommentId);
            $('#replySubmit').submit();
        }
    },

    /**
     * 内容判空
     */
    isContentEmpty: function(content) {
        const trimmed = $.trim(content);
        if (trimmed === '' || trimmed === null) {
            alert('评论或者回复的内容不能为空');
            $('#comment-textarea').val('');
            return true;
        }
        return false;
    },

    /**
     * 过滤script标签
     */
    filterScript: function(htmlStr) {
        const reg = new RegExp("<.*?script[^>]*?>.*?(<\\/.*?script.*?>)*", "ig");
        if (reg.test(htmlStr)) {
            return htmlStr.replace(/<.*?script[^>]*?>.*?(<\/.*?script.*?>)*/ig, '');
        }
        return htmlStr;
    },

    /**
     * HTML转义
     */
    htmlEscape: function(htmlStr) {
        return htmlStr.replace(/[<>&"]/g, function(c) {
            return {'<': '&lt;', '>': '&gt;', '&': '&amp;', '"': '&quot;'}[c];
        });
    },

    /**
     * 加载评论
     */
    loadComments: function(page) {
        const self = this;
        $('#comment-code').empty();

        $.ajax({
            url: '/iDouBan/ArticleShowServlet',
            type: 'POST',
            data: {
                method: 'comment_show',
                article_id: this.articleId,
                currentPage: page
            },
            success: function(response) {
                self.commentData = typeof response === 'string' ? JSON.parse(response) : response;
                self.renderComments();
                self.loadReplies(page);
            },
            error: function() {
                console.error('加载评论失败');
            }
        });
    },

    /**
     * 渲染评论
     */
    renderComments: function() {
        if (!this.commentData || !this.commentData.objects) return;

        const data = this.commentData;
        let html = '';

        for (let i = 0; i < data.objects.length; i++) {
            const comment = data.objects[i];
            const starClass = comment.starStatus === 1 ? 'comment_star_a--active' : '';
            const starText = comment.starStatus === 1 ? '取消点赞' : '点赞';
            const starUrl = comment.starStatus === 1 ?
                `/iDouBan/ArticleShowServlet?pre_method=comment_star_cancel&method=article_show&comment_id=${comment.commentId}&article_id=${this.articleId}` :
                `/iDouBan/ArticleShowServlet?pre_method=comment_star&method=article_show&comment_id=${comment.commentId}&article_id=${this.articleId}`;

            html += `
                <div class="comment-item" id="${comment.commentId}">
                    <div class="comment__avatar">
                        <img src="${comment.userComImg}" alt="用户头像" class="comment__avatar-img">
                    </div>
                    <div class="comment__content">
                        <div class="comment__header">
                            <span class="comment__time">${comment.comTime}</span>
                            <a href="#" class="comment__author">${comment.userComNick}</a>
                        </div>
                        <div class="comment__text">
                            ${comment.comMsg}
                            <div class="comment__actions">
                                <a href="#submit-confirm" class="comment__action reply_a" id="${comment.commentId}">回复</a>
                                <a href="${starUrl}" class="comment__action ${starClass}">${starText}(${comment.comStar})</a>
                            </div>
                        </div>
                    </div>
                </div>
            `;
        }

        $('#comment-code').html(html);

        // 更新分页信息
        this.currentPage = data.currentPage;
        this.totalPage = data.totalPage;
        this.updatePagination();
    },

    /**
     * 加载回复
     */
    loadReplies: function(page) {
        const self = this;

        $.ajax({
            url: '/iDouBan/ArticleShowServlet',
            type: 'POST',
            data: {
                method: 'reply_show',
                article_id: this.articleId,
                currentPage: page
            },
            success: function(response) {
                self.replyData = typeof response === 'string' ? JSON.parse(response) : response;
                self.renderReplies();
            },
            error: function() {
                console.error('加载回复失败');
            }
        });
    },

    /**
     * 渲染回复
     */
    renderReplies: function() {
        if (!this.replyData || !this.replyData.objects || !this.commentData) return;

        const replies = this.replyData.objects;
        const comments = this.commentData.objects;

        for (let i = 0; i < comments.length; i++) {
            const commentId = comments[i].commentId;

            for (let j = 0; j < replies.length; j++) {
                const reply = replies[j];

                if (reply.commentId == commentId) {
                    const replyHtml = `
                        <div class="comment-item comment-item--reply">
                            <div class="comment__avatar">
                                <img src="${reply.userReplyImg}" alt="用户头像" class="comment__avatar-img">
                            </div>
                            <div class="comment__content">
                                <div class="comment__header">
                                    <span class="comment__time">${reply.replyTime}</span>
                                    <a href="#" class="comment__author">${reply.userReplyFromNick}</a>
                                    <span class="comment__reply-to">回复</span>
                                    <a href="#" class="comment__author">${reply.userReplyToNick}</a>
                                </div>
                                <div class="comment__text">
                                    ${reply.replyMsg}
                                    <div class="comment__actions">
                                        <a href="#submit-confirm" class="comment__action reply_reply_a"
                                           id="&commentId&${reply.commentId}&userReplyToId&${reply.userReplyFromId}&userReplyFromNick&${reply.userReplyFromNick}&">
                                            回复
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    `;

                    $(`#${commentId}`).after(replyHtml);
                }
            }
        }
    },

    /**
     * 更新分页显示
     */
    updatePagination: function() {
        let current = this.currentPage;
        let total = this.totalPage;

        if (total === 0) {
            current = 1;
            total = 1;
        }

        $('#currentPage_num').text(current);
        $('#totalPage_num').text(total);
    }
};

// 页面加载完成后初始化
$(document).ready(function() {
    // 默认隐藏回复提示
    $("#reply_to_user_com_nick").parent().hide();

    // 如果有文章ID，初始化评论功能
    if (window.articleId) {
        ArticleShow.init(window.articleId);
    }
});
