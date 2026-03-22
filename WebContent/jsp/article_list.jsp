<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="豆瓣文章列表">
    <title>文章列表 - 豆瓣</title>
    <link rel="icon" href="http://img.linzworld.cn/img/douban_favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/iDouBan/css/common.css">
    <link rel="stylesheet" href="/iDouBan/css/article_list.css">
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
                <c:choose>
                    <c:when test="${requestScope.msg == '我的文章'}">
                        <h1 class="page-title">我的文章</h1>
                    </c:when>
                    <c:when test="${requestScope.msg == '所有文章'}">
                        <h1 class="page-title">文章列表</h1>
                    </c:when>
                    <c:when test="${requestScope.msg == '我的收藏'}">
                        <h1 class="page-title">我的收藏</h1>
                    </c:when>
                    <c:when test="${requestScope.msg == '在所有文章中的搜索结果'}">
                        <h1 class="page-title">所有文章<span class="page-subtitle">(搜索结果)</span></h1>
                    </c:when>
                    <c:when test="${requestScope.msg == '在我的文章中的搜索结果'}">
                        <h1 class="page-title">我的文章<span class="page-subtitle">(搜索结果)</span></h1>
                    </c:when>
                    <c:otherwise>
                        <h1 class="page-title">文章列表</h1>
                    </c:otherwise>
                </c:choose>
                
                <c:if test="${not empty requestScope.p.objects}">
                    <ul class="article-list" aria-label="文章列表">
                        <c:forEach items="${requestScope.p.objects}" var="a" varStatus="status">
                            <li>
                                <article class="article-card">
                                    <header class="article-card__header">
                                        <img src="${a.authorImg}" alt="${a.authorNick}的头像" class="article-card__author-img" loading="lazy">
                                        <a href="/iDouBan/ArticleShowServlet?method=article_show&article_id=${a.articleId}" class="article-card__author-name" target="_blank">${a.authorNick}</a>
                                    </header>
                                    
                                    <h2 class="article-card__title">
                                        <a href="/iDouBan/ArticleShowServlet?method=article_show&article_id=${a.articleId}" target="_blank">${a.title}</a>
                                    </h2>
                                    
                                    <div class="article-card__content">
                                        ${a.content}
                                    </div>
                                    
                                    <footer class="article-card__footer">
                                        <div class="article-card__stats">
                                            <span>${a.commentNum} 回应</span>
                                            <span>${a.starNum} 赞</span>
                                            <span>${a.shareNum} 转发</span>
                                            <time class="article-card__time">${a.publishedTime}</time>
                                        </div>
                                        
                                        <c:if test="${requestScope.msg == '我的文章'}">
                                            <div class="article-card__actions">
                                                <a href="/iDouBan/ArticleListServlet?pre_method=delete_article&method=my_article_list&article_id=${a.articleId}" 
                                                   class="article-card__action"
                                                   onclick="return confirm('你确定要删除这篇文章吗？删除之后将会永久删除，请慎重操作！')">
                                                    删除
                                                </a>
                                                <a href="#" class="article-card__action" onclick="return confirm('你确定要修改这篇文章吗？')">
                                                    修改
                                                </a>
                                            </div>
                                        </c:if>
                                    </footer>
                                </article>
                            </li>
                        </c:forEach>
                    </ul>
                </c:if>
                
                <c:if test="${requestScope.p.totalPage != 0}">
                    <nav class="pagination" aria-label="分页导航">
                        <span class="pagination__info">当前第 ${requestScope.p.currentPage} 页，总共 ${requestScope.p.totalPage} 页</span>
                        <a href="ArticleListServlet?method=${requestScope.method}&currentPage=1" class="pagination__link">首页</a>
                        <a href="ArticleListServlet?method=${requestScope.method}&currentPage=${(requestScope.p.currentPage == 1) ? 1 : requestScope.p.currentPage - 1}" class="pagination__link">上一页</a>
                        <a href="ArticleListServlet?method=${requestScope.method}&currentPage=${(requestScope.p.currentPage == requestScope.p.totalPage) ? requestScope.p.totalPage : requestScope.p.currentPage + 1}" class="pagination__link">下一页</a>
                        <a href="ArticleListServlet?method=${requestScope.method}&currentPage=${requestScope.p.totalPage}" class="pagination__link">尾页</a>
                    </nav>
                </c:if>
            </section>
            
            <aside class="main-content__secondary">
                <h2 class="section-title">快捷操作</h2>
                <nav aria-label="快捷操作">
                    <ul>
                        <li style="margin-bottom: 0.5rem;"><a href="http://47.102.212.18/iDouBan/jsp/article_edit.jsp" class="btn btn--primary" target="_blank">写文章</a></li>
                        <li style="margin-bottom: 0.5rem;"><a href="/iDouBan/ArticleListServlet?method=my_article_list" class="btn btn--outline">我的文章</a></li>
                        <li><a href="/iDouBan/ArticleListServlet?method=my_collection_list" class="btn btn--outline">我的收藏</a></li>
                    </ul>
                </nav>
            </aside>
        </div>
    </main>

    <script src="/iDouBan/js/common.js" defer></script>
</body>
</html>
