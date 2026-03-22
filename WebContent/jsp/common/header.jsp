<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 顶部导航栏 -->
<nav class="top-nav" aria-label="用户导航">
    <div class="top-nav__menu">
        <a href="${pageContext.request.contextPath}/ClearLoginServlet" class="top-nav__link">退出登录</a>
        <a href="${pageContext.request.contextPath}/jsp/alter.jsp" class="top-nav__link">账号管理</a>
        <a href="${pageContext.request.contextPath}/jsp/my_page.jsp" class="top-nav__link">个人主页</a>
        <a href="${pageContext.request.contextPath}/DoumailServlet?method=my_doumail_list" class="top-nav__link">豆邮</a>
        <a href="${pageContext.request.contextPath}/FriendListServlet?method=blacklist_list" class="top-nav__link">黑名单</a>
        <a href="${pageContext.request.contextPath}/FriendListServlet?method=attention_list" class="top-nav__link">我的关注</a>
        <a href="${pageContext.request.contextPath}/FriendListServlet?method=friend_list" class="top-nav__link">我的好友</a>
        <a href="${pageContext.request.contextPath}/EveryoneListServlet?method=everyone_list" class="top-nav__link">所有人</a>
        <a href="${pageContext.request.contextPath}/jsp/article_edit.jsp" class="top-nav__link" target="_blank">写文章</a>
        <a href="${pageContext.request.contextPath}/ArticleListServlet?method=article_list" class="top-nav__link">所有文章</a>
        <a href="${pageContext.request.contextPath}/ArticleListServlet?method=my_article_list" class="top-nav__link">我的文章</a>
        <a href="${pageContext.request.contextPath}/ArticleListServlet?method=my_collection_list" class="top-nav__link">我的收藏</a>
    </div>
</nav>

<!-- 主导航栏 -->
<header class="main-header">
    <div class="main-header__inner">
        <!-- Logo -->
        <div class="logo">
            <a href="${pageContext.request.contextPath}/jsp/my_page.jsp" aria-label="返回首页">
                <img src="${pageContext.request.contextPath}/image/豆瓣首页logo.jpg" alt="iDouBan Logo" class="logo__img" width="175" height="58">
            </a>
        </div>
        
        <!-- 导航菜单 -->
        <nav class="navbar" aria-label="主导航">
            <ul class="navbar__list">
                <li class="navbar__item">
                    <a href="${pageContext.request.contextPath}/jsp/my_page.jsp" class="navbar__link">首页</a>
                </li>
                <li class="navbar__item">
                    <a href="${pageContext.request.contextPath}/jsp/my_page.jsp" class="navbar__link">个人主页</a>
                </li>
                <li class="navbar__item">
                    <a href="${pageContext.request.contextPath}/ArticleListServlet?method=article_list" class="navbar__link">浏览发现</a>
                </li>
            </ul>
        </nav>
        
        <!-- 搜索框 -->
        <form class="search-form" action="${pageContext.request.contextPath}/EveryoneListServlet" method="post" role="search" aria-label="搜索用户">
            <input type="hidden" name="method" value="search_users">
            <input type="hidden" name="currentPage" value="1">
            <input type="text" name="search_content" class="search-form__input" placeholder="搜索你感兴趣的内容和人" aria-label="搜索内容">
            <button type="submit" class="search-form__btn" aria-label="搜索">
                <span class="sr-only">搜索</span>
            </button>
        </form>
    </div>
</header>
