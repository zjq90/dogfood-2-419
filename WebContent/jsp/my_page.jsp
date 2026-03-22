<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="我的豆瓣主页">
    <title>我的主页 - 豆瓣</title>
    <link rel="icon" href="http://img.linzworld.cn/img/douban_favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/iDouBan/css/common.css">
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
            <form class="search-form" action="" method="get" role="search">
                <label for="search-input" class="sr-only">搜索</label>
                <input type="text" id="search-input" name="q" class="search-form__input" placeholder="搜索你感兴趣的内容和人">
                <button type="submit" class="search-form__btn" aria-label="搜索"></button>
            </form>
        </div>
    </header>
    
    <main id="main-content" class="main-content">
        <div class="main-content__wrapper">
            <section class="main-content__primary">
                <article class="user-profile">
                    <h1 class="page-title">个人主页</h1>
                    
                    <p class="user-profile__welcome">欢迎您：${sessionScope.userInfo.username}</p>
                    
                    <figure class="user-profile__figure">
                        <img 
                            src="${sessionScope.userInfo.portrait}" 
                            alt="${sessionScope.userInfo.nickname}的头像" 
                            class="user-profile__avatar"
                            loading="lazy"
                        >
                    </figure>
                    
                    <section class="user-profile__info" aria-labelledby="info-title">
                        <h2 id="info-title" class="section-title">个人信息</h2>
                        <dl class="user-profile__info-list">
                            <div class="user-profile__info-item">
                                <dt class="user-profile__info-label">昵称：</dt>
                                <dd>${sessionScope.userInfo.nickname}</dd>
                            </div>
                            <div class="user-profile__info-item">
                                <dt class="user-profile__info-label">个性签名：</dt>
                                <dd>${sessionScope.userInfo.signature}</dd>
                            </div>
                            <div class="user-profile__info-item">
                                <dt class="user-profile__info-label">自我介绍：</dt>
                                <dd>${sessionScope.userInfo.selfIntroduc}</dd>
                            </div>
                            <div class="user-profile__info-item">
                                <dt class="user-profile__info-label">地址：</dt>
                                <dd>${sessionScope.userInfo.address}</dd>
                            </div>
                        </dl>
                    </section>
                </article>
            </section>
            
            <aside class="main-content__secondary">
                <h2 class="section-title">快捷操作</h2>
                <nav aria-label="快捷操作">
                    <ul>
                        <li><a href="http://47.102.212.18/iDouBan/jsp/alter.jsp" class="btn btn--outline">编辑资料</a></li>
                    </ul>
                </nav>
            </aside>
        </div>
    </main>

    <script src="/iDouBan/js/common.js" defer></script>
</body>
</html>
