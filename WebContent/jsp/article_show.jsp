<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>文章内容 - ${requestScope.article.title}</title>
    <link rel="icon" href="../image/icon/iDouBan_favicon.ico" type="image/x-icon">
    <!-- 预加载关键CSS -->
    <link rel="preload" href="../css/reset.css" as="style">
    <link rel="preload" href="../css/common.css" as="style">
    <link rel="preload" href="../css/article-show.css" as="style">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/article-show.css">
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js" defer></script>
    <script src="../js/article-show.js" defer></script>
    <script>
        // 传递文章ID给JS模块
        window.articleId = ${requestScope.article.articleId};
    </script>
</head>
<body>
    <!-- 顶部导航 -->
    <nav class="top-nav" aria-label="顶部导航">
        <div class="top-nav__container">
            <a href="/iDouBan/ClearLoginServlet" class="top-nav__link">退出登录</a>
            <a href="alter.jsp" class="top-nav__link">账号管理</a>
            <a href="my_page.jsp" class="top-nav__link">个人主页</a>
            <a href="/iDouBan/DoumailServlet?method=my_doumail_list" class="top-nav__link">豆邮</a>
            <a href="/iDouBan/FriendListServlet?method=blacklist_list" class="top-nav__link">黑名单</a>
            <a href="/iDouBan/FriendListServlet?method=attention_list" class="top-nav__link">我的关注</a>
            <a href="/iDouBan/FriendListServlet?method=friend_list" class="top-nav__link">我的好友</a>
            <a href="/iDouBan/EveryoneListServlet?method=everyone_list" class="top-nav__link">所有人</a>
            <a href="article_edit.jsp" target="_blank" class="top-nav__link">写文章</a>
            <a href="/iDouBan/ArticleListServlet?method=article_list" class="top-nav__link">所有文章</a>
            <a href="/iDouBan/ArticleListServlet?method=my_article_list" class="top-nav__link">我的文章</a>
            <a href="/iDouBan/ArticleListServlet?method=my_collection_list" class="top-nav__link">我的收藏</a>
        </div>
    </nav>

    <!-- 头部区域 -->
    <header class="site-header" role="banner">
        <div class="site-header__container">
            <div class="logo">
                <a href="/iDouBan" aria-label="返回首页">
                    <img src="../image/豆瓣首页logo.jpg" alt="豆瓣logo" class="logo__img" width="175" height="58">
                </a>
            </div>

            <nav class="main-nav" aria-label="主导航">
                <ul class="main-nav__list">
                    <li class="main-nav__item">
                        <a href="#" class="main-nav__link">首页</a>
                    </li>
                    <li class="main-nav__item">
                        <a href="my_page.jsp" class="main-nav__link">个人主页</a>
                    </li>
                    <li class="main-nav__item">
                        <a href="/iDouBan/ArticleListServlet?method=article_list" class="main-nav__link">浏览发现</a>
                    </li>
                </ul>
            </nav>

            <form class="search-form" action="ArticleListServlet?method=search_article_list&currentPage=1" method="post" role="search">
                <label for="search_content" class="sr-only">搜索</label>
                <input type="text" 
                       id="search_content"
                       name="search_content"
                       class="search-form__input" 
                       placeholder="搜索你感兴趣的内容和人"
                       aria-label="搜索输入框">
                <button type="submit" class="search-form__submit" aria-label="搜索按钮">
                    搜索
                </button>
            </form>
        </div>
    </header>

    <!-- 主内容区域 -->
    <main class="article-show-container" role="main">
        <div class="article-show-main">
            <!-- 文章标题 -->
            <header class="article-show-header">
                <h1 class="article-show-title">${requestScope.article.title}</h1>
            </header>

            <!-- 文章作者信息 -->
            <div class="article-author">
                <div class="article-author__avatar">
                    <img src="${requestScope.article.authorImg}" alt="${requestScope.article.authorNick}的头像" class="article-author__img">
                </div>
                <div class="article-author__info">
                    <a href="#" class="article-author__name">${requestScope.article.authorNick}</a>
                    <time class="article-author__time">${requestScope.article.publishedTime}</time>
                </div>
            </div>

            <!-- 文章内容 -->
            <article class="article-show-content">
                <div class="article-show-text" id="container">
                    ${requestScope.article.content}
                </div>
            </article>

            <!-- 文章操作按钮 -->
            <div class="article-actions">
                <!-- 点赞 -->
                <c:choose>
                    <c:when test="${requestScope.starStatus == '已点赞文章'}">
                        <a href="/iDouBan/ArticleShowServlet?pre_method=article_star_cancel&method=article_show&article_id=${requestScope.article.articleId}" 
                           class="article-action-btn article-action-btn--active">
                            ${requestScope.article.starNum} 取消点赞
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="/iDouBan/ArticleShowServlet?pre_method=article_star&method=article_show&article_id=${requestScope.article.articleId}" 
                           class="article-action-btn">
                            ${requestScope.article.starNum} 点赞
                        </a>
                    </c:otherwise>
                </c:choose>

                <!-- 收藏 -->
                <c:choose>
                    <c:when test="${requestScope.collectionStatus == '已收藏文章'}">
                        <a href="/iDouBan/ArticleShowServlet?pre_method=article_collection_cancel&method=article_show&article_id=${requestScope.article.articleId}" 
                           class="article-action-btn article-action-btn--active">
                            ${requestScope.article.collectionNum} 取消收藏
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="/iDouBan/ArticleShowServlet?pre_method=article_collection&method=article_show&article_id=${requestScope.article.articleId}" 
                           class="article-action-btn">
                            ${requestScope.article.collectionNum} 收藏
                        </a>
                    </c:otherwise>
                </c:choose>

                <!-- 转发 -->
                <c:choose>
                    <c:when test="${requestScope.shareStatus == '已转发文章'}">
                        <a href="/iDouBan/ArticleShowServlet?pre_method=article_share_cancel&method=article_show&article_id=${requestScope.article.articleId}" 
                           class="article-action-btn article-action-btn--active">
                            ${requestScope.article.shareNum} 取消转发
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="/iDouBan/ArticleShowServlet?pre_method=article_share&method=article_show&article_id=${requestScope.article.articleId}" 
                           class="article-action-btn">
                            ${requestScope.article.shareNum} 转发
                        </a>
                    </c:otherwise>
                </c:choose>

                <!-- 评论数 -->
                <a href="#comment-section" class="article-action-btn">
                    ${requestScope.article.commentNum} 回应
                </a>
            </div>

            <!-- 评论区 -->
            <section class="comment-section" id="comment-section" aria-label="评论区">
                <h2 class="comment-section__title">你的回应</h2>

                <!-- 评论列表 -->
                <div class="comment-list" id="comment-code">
                    <!-- 评论内容由AJAX动态加载 -->
                </div>

                <!-- 锚点 -->
                <a id="submit-confirm"></a>

                <!-- 评论表单 -->
                <div class="comment-form">
                    <!-- 回复提示 -->
                    <div class="comment-form__reply-info" style="display: none;">
                        <span class="comment-form__reply-to">
                            回复: <span class="comment-form__reply-nick" id="reply_to_user_com_nick"></span>
                        </span>
                        <a href="javascript:void(0);" class="comment-form__cancel-reply" id="cancel_reply">取消回复</a>
                    </div>

                    <!-- 回复表单（隐藏） -->
                    <form action="/iDouBan/ArticleShowServlet?pre_method=reply_content&method=article_show&article_id=${requestScope.article.articleId}" 
                          id="replySubmit" method="post" style="display: none;">
                        <input type="hidden" name="content" id="reply_content">
                        <input type="hidden" name="comment_id" id="reply_comment_id">
                        <input type="hidden" name="reply_to_use_id" id="reply_to_use_id">
                    </form>

                    <!-- 评论表单 -->
                    <form action="/iDouBan/ArticleShowServlet?pre_method=comment_content&method=article_show&article_id=${requestScope.article.articleId}" 
                          id="onSubmit" method="post">
                        <div class="comment-form__group">
                            <label for="comment-textarea" class="sr-only">发表评论</label>
                            <textarea name="comment-place" 
                                      id="comment-textarea" 
                                      class="comment-form__textarea" 
                                      placeholder="写下你的评论..."
                                      required></textarea>
                        </div>
                        <input type="hidden" name="content" id="content">
                        <div class="comment-form__submit">
                            <button type="button" class="comment-form__btn" id="submit_btn">发布</button>
                        </div>
                    </form>
                </div>

                <!-- 评论分页 -->
                <nav class="comment-pagination" aria-label="评论分页">
                    <span class="comment-pagination__info">
                        当前第 <span class="comment-pagination__current" id="currentPage_num"></span> 页，
                        总共 <span class="comment-pagination__total" id="totalPage_num"></span> 页
                    </span>
                    <div class="comment-pagination__links">
                        <a href="javascript:void(0);" id="first_page" class="comment-pagination__link">首页</a>
                        <a href="javascript:void(0);" id="previous_page" class="comment-pagination__link">上一页</a>
                        <a href="javascript:void(0);" id="next_page" class="comment-pagination__link">下一页</a>
                        <a href="javascript:void(0);" id="last_page" class="comment-pagination__link">尾页</a>
                    </div>
                </nav>
            </section>
        </div>
    </main>
</body>
</html>
