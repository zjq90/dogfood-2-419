<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>文章列表</title>
    <link rel="icon" href="../image/icon/iDouBan_favicon.ico" type="image/x-icon">
    <!-- 预加载关键CSS -->
    <link rel="preload" href="../css/reset.css" as="style">
    <link rel="preload" href="../css/common.css" as="style">
    <link rel="preload" href="../css/article-list.css" as="style">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/article-list.css">
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js" defer></script>
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
            <!-- Logo -->
            <div class="logo">
                <a href="/iDouBan" aria-label="返回首页">
                    <img src="../image/豆瓣首页logo.jpg" alt="豆瓣logo" class="logo__img" width="175" height="58">
                </a>
            </div>

            <!-- 主导航 -->
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

            <!-- 搜索框 -->
            <form class="search-form" action="ArticleListServlet?method=search_article_list&currentPage=1" id="search_action" method="post" role="search">
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
    <main class="article-container" role="main">
        <div class="article-main">
            <!-- 页面标题 -->
            <header class="page-header">
                <c:choose>
                    <c:when test="${requestScope.msg=='我的文章'}">
                        <h1 class="page-title">我的文章</h1>
                    </c:when>
                    <c:when test="${requestScope.msg=='所有文章'}">
                        <h1 class="page-title">文章列表</h1>
                    </c:when>
                    <c:when test="${requestScope.msg=='我的收藏'}">
                        <h1 class="page-title">我的收藏</h1>
                    </c:when>
                    <c:when test="${requestScope.msg=='在所有文章中的搜索结果'}">
                        <h1 class="page-title">所有文章</h1>
                        <p class="page-subtitle">(搜索结果)</p>
                    </c:when>
                    <c:when test="${requestScope.msg=='在我的文章中的搜索结果'}">
                        <h1 class="page-title">我的文章</h1>
                        <p class="page-subtitle">(搜索结果)</p>
                    </c:when>
                </c:choose>
            </header>

            <!-- 文章列表 -->
            <section class="article-list" aria-label="文章列表">
                <c:forEach items="${requestScope.p.objects}" var="a" varStatus="status">
                    <article class="article-item">
                        <!-- 文章头部 - 作者信息 -->
                        <header class="article-header">
                            <div class="author-avatar">
                                <a href="/iDouBan/ArticleShowServlet?method=article_show&article_id=${a.articleId}" target="_blank">
                                    <img src="${a.authorImg}" alt="${a.authorNick}的头像" class="author-avatar__img">
                                </a>
                            </div>
                            <a href="/iDouBan/ArticleShowServlet?method=article_show&article_id=${a.articleId}" target="_blank" class="author-name">
                                ${a.authorNick}
                            </a>
                        </header>

                        <!-- 文章内容 -->
                        <div class="article-content-wrapper">
                            <div class="article-cover">
                                <a href="/iDouBan/ArticleShowServlet?method=article_show&article_id=${a.articleId}" target="_blank" class="article-cover__link">
                                    <!-- 文章封面图（如果有） -->
                                </a>
                            </div>
                            <div class="article-text">
                                <h2 class="article-title">
                                    <a href="/iDouBan/ArticleShowServlet?method=article_show&article_id=${a.articleId}" target="_blank" class="article-title__link">
                                        ${a.title}
                                    </a>
                                </h2>
                                <div class="article-summary" id="container${status.count}">
                                    ${a.content}
                                </div>
                                <time class="article-time">${a.publishedTime}</time>
                            </div>
                        </div>

                        <!-- 文章底部 - 统计信息 -->
                        <footer class="article-footer">
                            <span class="article-footer__item">${a.commentNum}回应</span>
                            <span class="article-footer__item">${a.starNum}赞</span>
                            <span class="article-footer__item">${a.shareNum}转发</span>
                        </footer>

                        <!-- 文章操作 -->
                        <c:if test="${requestScope.msg=='我的文章'}">
                            <div class="article-actions">
                                <a href="/iDouBan/ArticleListServlet?pre_method=delete_article&method=my_article_list&article_id=${a.articleId}" 
                                   class="article-action__btn" 
                                   onclick="return confirm('你确定要删除这篇文章吗？删除之后将会永久删除，请慎重操作！！！')">
                                    删除
                                </a>
                                <a href="#" class="article-action__btn" onclick="return confirm('你确定要修改这篇文章吗？')">
                                    修改
                                </a>
                            </div>
                        </c:if>
                    </article>
                </c:forEach>
            </section>

            <!-- 分页 -->
            <c:if test="${requestScope.p.totalPage!=0}">
                <nav class="pagination" aria-label="分页导航">
                    <span class="pagination__info">
                        当前第 ${requestScope.p.currentPage} 页，总共 ${requestScope.p.totalPage} 页
                    </span>
                    <div class="pagination__links">
                        <a href="ArticleListServlet?method=${requestScope.method}&currentPage=1" class="pagination__link">首页</a>
                        <a href="ArticleListServlet?method=${requestScope.method}&currentPage=${(requestScope.p.currentPage==1)?1:requestScope.p.currentPage-1}" class="pagination__link">上一页</a>
                        <a href="ArticleListServlet?method=${requestScope.method}&currentPage=${(requestScope.p.currentPage==requestScope.p.totalPage)?requestScope.p.totalPage:requestScope.p.currentPage+1}" class="pagination__link">下一页</a>
                        <a href="ArticleListServlet?method=${requestScope.method}&currentPage=${requestScope.p.totalPage}" class="pagination__link">尾页</a>
                    </div>
                </nav>
            </c:if>
        </div>
    </main>
</body>
</html>
