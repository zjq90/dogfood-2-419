<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="豆瓣用户列表">
    <title>所有人 - 豆瓣</title>
    <link rel="icon" href="http://img.linzworld.cn/img/douban_favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/iDouBan/css/common.css">
    <link rel="stylesheet" href="/iDouBan/css/user_list.css">
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
            <form class="search-form" action="EveryoneListServlet?method=search_users&currentPage=1" method="post" role="search">
                <label for="search-content" class="sr-only">搜索用户</label>
                <input type="text" id="search-content" name="search_content" class="search-form__input" placeholder="搜索你感兴趣的内容和人">
                <button type="submit" class="search-form__btn" aria-label="搜索"></button>
            </form>
        </div>
    </header>
    
    <main id="main-content" class="main-content">
        <div class="main-content__wrapper">
            <section class="main-content__primary">
                <h1 class="page-title">所有人的列表</h1>
                
                <c:if test="${not empty requestScope.p.objects}">
                    <ul class="user-list" aria-label="用户列表">
                        <c:forEach items="${requestScope.p.objects}" var="u">
                            <li class="user-card">
                                <img src="${u.portrait}" alt="${u.nickname}的头像" class="user-card__avatar" loading="lazy">
                                
                                <div class="user-card__info">
                                    <h2 class="user-card__name">${u.nickname}</h2>
                                    <p class="user-card__signature">${u.signature}</p>
                                </div>
                                
                                <div class="user-card__actions">
                                    <a href="/iDouBan/DoumailServlet?method=doumail_show&to_user_id=${u.userId}&nickname=${u.nickname}" 
                                       class="btn btn--small btn--outline" 
                                       target="_blank">
                                        发豆邮
                                    </a>
                                    
                                    <c:set var="s" value="${u.status}" scope="page"/>
                                    
                                    <c:choose>
                                        <c:when test="${s == 0}">
                                            <a href="EveryoneListServlet?pre_method=attention&method=everyone_list&toUserId=${u.userId}&currentPage=1" 
                                               class="btn btn--small btn--secondary">关注</a>
                                        </c:when>
                                        <c:when test="${s == 1 || s == 2}">
                                            <a href="EveryoneListServlet?pre_method=unfollow&method=everyone_list&toUserId=${u.userId}&currentPage=1" 
                                               class="btn btn--small btn--outline">取消关注</a>
                                        </c:when>
                                        <c:when test="${s == 3}">
                                            <span class="btn btn--small" aria-disabled="true">黑名单</span>
                                        </c:when>
                                    </c:choose>
                                    
                                    <c:choose>
                                        <c:when test="${s == 0}">
                                            <a href="EveryoneListServlet?pre_method=black_without_record&method=everyone_list&toUserId=${u.userId}&currentPage=${requestScope.p.currentPage}" 
                                               class="btn btn--small btn--outline">拉黑</a>
                                        </c:when>
                                        <c:when test="${s == 1 || s == 2}">
                                            <a href="EveryoneListServlet?pre_method=black_on_record&method=everyone_list&toUserId=${u.userId}&currentPage=${requestScope.p.currentPage}" 
                                               class="btn btn--small btn--outline">拉黑</a>
                                        </c:when>
                                        <c:when test="${s == 3}">
                                            <a href="EveryoneListServlet?pre_method=cancel_black&method=everyone_list&toUserId=${u.userId}&currentPage=${requestScope.p.currentPage}" 
                                               class="btn btn--small btn--secondary">取消拉黑</a>
                                        </c:when>
                                    </c:choose>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </c:if>
                
                <c:if test="${requestScope.p.totalPage != 0}">
                    <nav class="pagination" aria-label="分页导航">
                        <span class="pagination__info">当前第 ${requestScope.p.currentPage} 页，总共 ${requestScope.p.totalPage} 页</span>
                        <a href="EveryoneListServlet?method=${requestScope.method}&currentPage=1" class="pagination__link">首页</a>
                        <a href="EveryoneListServlet?method=${requestScope.method}&currentPage=${(requestScope.p.currentPage == 1) ? 1 : requestScope.p.currentPage - 1}" class="pagination__link">上一页</a>
                        <a href="EveryoneListServlet?method=${requestScope.method}&currentPage=${(requestScope.p.currentPage == requestScope.p.totalPage) ? requestScope.p.totalPage : requestScope.p.currentPage + 1}" class="pagination__link">下一页</a>
                        <a href="EveryoneListServlet?method=${requestScope.method}&currentPage=${requestScope.p.totalPage}" class="pagination__link">尾页</a>
                    </nav>
                </c:if>
            </section>
            
            <aside class="main-content__secondary">
                <h2 class="section-title">快捷操作</h2>
                <nav aria-label="快捷操作">
                    <ul>
                        <li><a href="http://47.102.212.18/iDouBan/jsp/my_page.jsp" class="btn btn--outline">返回主页</a></li>
                    </ul>
                </nav>
            </aside>
        </div>
    </main>

    <script src="/iDouBan/js/common.js" defer></script>
</body>
</html>
