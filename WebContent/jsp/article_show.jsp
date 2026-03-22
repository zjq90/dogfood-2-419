<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="豆瓣文章详情">
    <title>${requestScope.article.title} - 豆瓣</title>
    <link rel="icon" href="http://img.linzworld.cn/img/douban_favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/iDouBan/css/common.css">
    <link rel="stylesheet" href="/iDouBan/css/article_show.css">
    <link rel="preload" href="/iDouBan/css/common.css" as="style">
</head>
<body>
    <a href="#main-content" class="skip-link">跳转到主要内容</a>
    
    <nav class="top-nav" aria-label="用户导航">
        <ul class="top-nav__list">
            <li class="top-nav__item"><a href="http://47.102.212.18/iDouBan/ClearLoginServlet" class="top-nav__link">退出登录</a></li>
            <li class="top-nav__item"><a href="http://47.102.212.18/iDouBan/jsp/alter.jsp" class="top-nav__link">账号管理</a></li>
            <li class="top-nav__item"><a href="http://47.102.212.18/iDouBan/jsp/my_page.jsp" class="top-nav__link">个人主页</a></li>
            <li class="top-nav__item"><a href="/iDouBan/DoumailServlet?method=my_doumail_list" class="top-nav__link">豆邮</a></li>
            <li class="top-nav__item"><a href="/iDouBan/FriendListServlet?method=blacklist_list" class="top-nav__link">黑名单</a></li>
            <li class="top-nav__item"><a href="/iDouBan/FriendListServlet?method=attention_list" class="top-nav__link">我的关注</a></li>
            <li class="top-nav__item"><a href="/iDouBan/FriendListServlet?method=friend_list" class="top-nav__link">我的好友</a></li>
            <li class="top-nav__item"><a href="/iDouBan/EveryoneListServlet?method=everyone_list" class="top-nav__link">所有人</a></li>
            <li class="top-nav__item"><a href="http://47.102.212.18/iDouBan/jsp/article_edit.jsp" class="top-nav__link" target="_blank">写文章</a></li>
            <li class="top-nav__item"><a href="/iDouBan/ArticleListServlet?method=article_list" class="top-nav__link">所有文章</a></li>
            <li class="top-nav__item"><a href="/iDouBan/ArticleListServlet?method=my_article_list" class="top-nav__link">我的文章</a></li>
            <li class="top-nav__item"><a href="/iDouBan/ArticleListServlet?method=my_collection_list" class="top-nav__link">我的收藏</a></li>
        </ul>
    </nav>
    
    <header class="main-header">
        <div class="main-header__inner">
            <div class="main-header__logo">
                <a href="http://47.102.212.18/iDouBan/jsp/my_page.jsp">
                    <img src="http://47.102.212.18/iDouBan/image/豆瓣首页logo.jpg" alt="豆瓣logo" width="175" height="58">
                </a>
            </div>
            <nav class="main-nav" aria-label="主导航">
                <ul class="main-nav__list">
                    <li><a href="#" class="main-nav__link">首页</a></li>
                    <li><a href="http://47.102.212.18/iDouBan/jsp/my_page.jsp" class="main-nav__link">个人主页</a></li>
                    <li><a href="/iDouBan/ArticleListServlet?method=article_list" class="main-nav__link">浏览发现</a></li>
                </ul>
            </nav>
            <form class="search-form" action="ArticleListServlet?method=search_article_list&currentPage=1" method="post" role="search">
                <label for="search-content" class="sr-only">搜索文章</label>
                <input type="text" id="search-content" name="search_content" class="search-form__input" placeholder="搜索你感兴趣的内容和人">
                <button type="submit" class="search-form__btn" aria-label="搜索"></button>
            </form>
        </div>
    </header>
    
    <main id="main-content" class="main-content">
        <div class="main-content__wrapper">
            <section class="main-content__primary">
                <article class="article-detail">
                    <header class="article-detail__header">
                        <h1 class="article-detail__title">${requestScope.article.title}</h1>
                        <div class="article-detail__meta">
                            <img src="${requestScope.article.authorImg}" alt="${requestScope.article.authorNick}的头像" class="article-detail__author-img" loading="lazy">
                            <a href="#" class="article-detail__author-name">${requestScope.article.authorNick}</a>
                            <time class="article-detail__time">${requestScope.article.publishedTime}</time>
                        </div>
                    </header>
                    
                    <div class="article-detail__content">
                        ${requestScope.article.content}
                    </div>
                    
                    <footer class="article-detail__actions">
                        <c:choose>
                            <c:when test="${requestScope.starStatus == '已点赞文章'}">
                                <a href="/iDouBan/ArticleShowServlet?pre_method=article_star_cancel&method=article_show&article_id=${requestScope.article.articleId}" class="article-action article-action--active">
                                    ${requestScope.article.starNum} 取消点赞
                                </a>
                            </c:when>
                            <c:otherwise>
                                <a href="/iDouBan/ArticleShowServlet?pre_method=article_star&method=article_show&article_id=${requestScope.article.articleId}" class="article-action">
                                    ${requestScope.article.starNum} 点赞
                                </a>
                            </c:otherwise>
                        </c:choose>
                        
                        <c:choose>
                            <c:when test="${requestScope.collectionStatus == '已收藏文章'}">
                                <a href="/iDouBan/ArticleShowServlet?pre_method=article_collection_cancel&method=article_show&article_id=${requestScope.article.articleId}" class="article-action article-action--active">
                                    ${requestScope.article.collectionNum} 取消收藏
                                </a>
                            </c:when>
                            <c:otherwise>
                                <a href="/iDouBan/ArticleShowServlet?pre_method=article_collection&method=article_show&article_id=${requestScope.article.articleId}" class="article-action">
                                    ${requestScope.article.collectionNum} 收藏
                                </a>
                            </c:otherwise>
                        </c:choose>
                        
                        <c:choose>
                            <c:when test="${requestScope.shareStatus == '已转发文章'}">
                                <a href="/iDouBan/ArticleShowServlet?pre_method=article_share_cancel&method=article_show&article_id=${requestScope.article.articleId}" class="article-action article-action--active">
                                    ${requestScope.article.shareNum} 取消转发
                                </a>
                            </c:when>
                            <c:otherwise>
                                <a href="/iDouBan/ArticleShowServlet?pre_method=article_share&method=article_show&article_id=${requestScope.article.articleId}" class="article-action">
                                    ${requestScope.article.shareNum} 转发
                                </a>
                            </c:otherwise>
                        </c:choose>
                        
                        <span class="article-action">${requestScope.article.commentNum} 回应</span>
                    </footer>
                </article>
                
                <section class="comment-section" aria-labelledby="comment-title">
                    <h2 id="comment-title" class="comment-section__title">评论区</h2>
                    
                    <div class="comment-form">
                        <form action="/iDouBan/ArticleShowServlet?pre_method=comment_content&method=article_show&article_id=${requestScope.article.articleId}" id="commentForm" method="post">
                            <textarea name="content" id="comment-textarea" class="comment-form__textarea" placeholder="写下你的评论..." required></textarea>
                            <div class="comment-form__actions">
                                <div id="reply-info" class="comment-form__reply-info" style="display: none;">
                                    <span id="reply-to-user"></span>
                                    <span id="cancel-reply" class="comment-form__cancel">取消回复</span>
                                </div>
                                <button type="submit" class="btn btn--primary">发表评论</button>
                            </div>
                            <input type="hidden" name="comment_id" id="reply-comment-id" value="">
                            <input type="hidden" name="reply_to_use_id" id="reply-to-user-id" value="">
                        </form>
                    </div>
                    
                    <div id="comment-list" aria-label="评论列表">
                    </div>
                    
                    <nav id="comment-pagination" class="pagination" aria-label="评论分页">
                    </nav>
                </section>
            </section>
            
            <aside class="main-content__secondary">
                <h2 class="section-title">快捷操作</h2>
                <nav aria-label="快捷操作">
                    <ul>
                        <li style="margin-bottom: 0.5rem;"><a href="/iDouBan/ArticleListServlet?method=article_list" class="btn btn--outline">返回文章列表</a></li>
                    </ul>
                </nav>
            </aside>
        </div>
    </main>

    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="/iDouBan/js/common.js" defer></script>
    <script>
        var currentPage = 1;
        var totalPage = 1;
        var isReply = "no";
        var toCommentId = 0;

        function loadComments(page) {
            $.ajax({
                url: 'http://47.102.212.18/iDouBan/ArticleShowServlet',
                type: 'POST',
                data: {
                    method: 'comment_show',
                    article_id: ${requestScope.article.articleId},
                    currentPage: page
                },
                success: function(response) {
                    var data = typeof response === 'string' ? JSON.parse(response) : response;
                    renderComments(data);
                    currentPage = data.currentPage || page;
                    totalPage = data.totalPage || 1;
                    renderPagination();
                }
            });
        }

        function renderComments(data) {
            var html = '';
            if (data.objects && data.objects.length > 0) {
                data.objects.forEach(function(comment) {
                    html += '<div class="comment-item" id="comment-' + comment.commentId + '">';
                    html += '<img src="' + comment.userComImg + '" alt="评论者头像" class="comment-item__avatar" loading="lazy">';
                    html += '<div class="comment-item__content">';
                    html += '<div class="comment-item__header">';
                    html += '<span class="comment-item__author">' + comment.userComNick + '</span>';
                    html += '<span class="comment-item__time">' + comment.comTime + '</span>';
                    html += '</div>';
                    html += '<p class="comment-item__text">' + comment.comMsg + '</p>';
                    html += '<div class="comment-item__actions">';
                    html += '<a href="#" class="comment-item__action reply-btn" data-id="' + comment.commentId + '" data-nick="' + comment.userComNick + '">回复</a>';
                    if (comment.starStatus == 0) {
                        html += '<a href="/iDouBan/ArticleShowServlet?pre_method=comment_star&method=article_show&comment_id=' + comment.commentId + '&article_id=${requestScope.article.articleId}" class="comment-item__action">' + comment.comStar + ' 点赞</a>';
                    } else {
                        html += '<a href="/iDouBan/ArticleShowServlet?pre_method=comment_star_cancel&method=article_show&comment_id=' + comment.commentId + '&article_id=${requestScope.article.articleId}" class="comment-item__action">取消点赞(' + comment.comStar + ')</a>';
                    }
                    html += '</div></div></div>';
                });
            } else {
                html = '<p style="text-align: center; color: #999; padding: 2rem;">暂无评论，快来发表第一条评论吧！</p>';
            }
            $('#comment-list').html(html);
        }

        function renderPagination() {
            var html = '<span class="pagination__info">当前第 ' + currentPage + ' 页，总共 ' + totalPage + ' 页</span>';
            html += '<a href="javascript:void(0);" class="pagination__link" onclick="loadComments(1)">首页</a>';
            html += '<a href="javascript:void(0);" class="pagination__link" onclick="loadComments(' + (currentPage > 1 ? currentPage - 1 : 1) + ')">上一页</a>';
            html += '<a href="javascript:void(0);" class="pagination__link" onclick="loadComments(' + (currentPage < totalPage ? currentPage + 1 : totalPage) + ')">下一页</a>';
            html += '<a href="javascript:void(0);" class="pagination__link" onclick="loadComments(' + totalPage + ')">尾页</a>';
            $('#comment-pagination').html(html);
        }

        $(document).ready(function() {
            loadComments(1);

            $(document).on('click', '.reply-btn', function(e) {
                e.preventDefault();
                toCommentId = $(this).data('id');
                var nick = $(this).data('nick');
                $('#reply-to-user').text('回复: ' + nick);
                $('#reply-info').show();
                $('#reply-comment-id').val(toCommentId);
                isReply = "yes";
                $('#comment-textarea').focus();
            });

            $('#cancel-reply').click(function() {
                $('#reply-info').hide();
                $('#reply-comment-id').val('');
                toCommentId = 0;
                isReply = "no";
            });

            $('#commentForm').submit(function() {
                var content = $('#comment-textarea').val().trim();
                if (!content) {
                    alert('评论内容不能为空');
                    return false;
                }
                content = content.replace(/[<>&"]/g, function(c) {
                    return {'<': '&lt;', '>': '&gt;', '&': '&amp;', '"': '&quot;'}[c];
                });
                $('input[name="content"]').val(content);
            });
        });
    </script>
</body>
</html>
