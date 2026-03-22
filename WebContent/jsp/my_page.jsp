<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>我的主页</title>
    <link rel="icon" href="../image/icon/iDouBan_favicon.ico" type="image/x-icon">
    <!-- 预加载关键CSS -->
    <link rel="preload" href="../css/reset.css" as="style">
    <link rel="preload" href="../css/common.css" as="style">
    <link rel="preload" href="../css/my_page.css" as="style">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/my_page.css">
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
            <form class="search-form" action="" method="get" role="search">
                <label for="search-input" class="sr-only">搜索</label>
                <input type="search" 
                       id="search-input"
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
    <main class="main-content" role="main">
        <!-- 左侧栏 - 用户信息 -->
        <aside class="sidebar-left" aria-label="用户信息侧边栏">
            <section class="user-profile">
                <h2 class="user-profile__welcome">
                    欢迎您： ${sessionScope.userInfo.username}
                </h2>
                
                <figure class="user-profile__avatar">
                    <img src="${sessionScope.userInfo.portrait}" 
                         alt="我的头像" 
                         class="user-profile__img"
                         onerror="this.src='../image/default.png'">
                    <figcaption class="sr-only">用户头像</figcaption>
                </figure>

                <div class="user-profile__info">
                    <h3 class="user-profile__info-title">个人信息</h3>
                    <p class="user-profile__info-item">
                        <span class="user-profile__info-label">昵称：</span>
                        <span>${sessionScope.userInfo.nickname}</span>
                    </p>
                    <p class="user-profile__info-item">
                        <span class="user-profile__info-label">个性签名：</span>
                        <span>${sessionScope.userInfo.signature}</span>
                    </p>
                    <p class="user-profile__info-item">
                        <span class="user-profile__info-label">自我介绍：</span>
                        <span>${sessionScope.userInfo.selfIntroduc}</span>
                    </p>
                    <p class="user-profile__info-item">
                        <span class="user-profile__info-label">地址：</span>
                        <span>${sessionScope.userInfo.address}</span>
                    </p>
                </div>
            </section>
        </aside>

        <!-- 右侧栏 - 内容区域 -->
        <section class="sidebar-right" aria-label="内容区域">
            <!-- 这里可以添加动态内容，如文章列表、动态等 -->
        </section>
    </main>

    <!-- 异步加载非关键JS -->
    <script src="../js/common.js" defer></script>
</body>
</html>
