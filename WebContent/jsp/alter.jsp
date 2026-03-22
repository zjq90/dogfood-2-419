<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="豆瓣账号管理">
    <title>账号管理 - 豆瓣</title>
    <link rel="icon" href="http://img.linzworld.cn/img/douban_favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/iDouBan/css/common.css">
    <link rel="stylesheet" href="/iDouBan/css/alter.css">
    <link rel="preload" href="/iDouBan/css/common.css" as="style">
</head>
<body class="account-page">
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
        </div>
    </header>
    
    <main id="main-content" class="account-container">
        <div class="account-success" role="alert">
            登录成功！欢迎您，${sessionScope.uname}
        </div>
        
        <section class="account-card">
            <h1 class="account-card__title">头像设置</h1>
            <div class="account-avatar">
                <img src="${sessionScope.userInfo.portrait}" alt="我的头像" class="account-avatar__img" id="user-avatar">
                <form action="http://47.102.212.18/iDouBan/UploadServlet" method="post" enctype="multipart/form-data" class="account-avatar__upload">
                    <label for="avatar-upload" class="account-avatar__label">选择新头像</label>
                    <input type="file" id="avatar-upload" name="photo" accept="image/*" class="account-avatar__input">
                    <button type="submit" class="btn btn--primary">上传头像</button>
                </form>
            </div>
        </section>
        
        <section class="account-card">
            <h2 class="account-card__title">个人信息</h2>
            <form action="http://47.102.212.18/iDouBan/MyPageServlet" method="post" class="account-form">
                <div class="account-form__group">
                    <label for="nickname" class="account-form__label">昵称</label>
                    <input type="text" id="nickname" name="nickname" class="account-form__input" placeholder="请输入昵称">
                </div>
                <div class="account-form__group">
                    <label for="signature" class="account-form__label">个性签名</label>
                    <input type="text" id="signature" name="signature" class="account-form__input" placeholder="请输入个性签名">
                </div>
                <div class="account-form__group">
                    <label for="self-intro" class="account-form__label">自我介绍</label>
                    <input type="text" id="self-intro" name="selfIntroduc" class="account-form__input" placeholder="请输入自我介绍">
                </div>
                <div class="account-form__group">
                    <label for="address" class="account-form__label">地址</label>
                    <input type="text" id="address" name="address" class="account-form__input" placeholder="请输入地址">
                </div>
                <button type="submit" class="account-form__submit">保存修改</button>
            </form>
        </section>
    </main>

    <script src="/iDouBan/js/common.js" defer></script>
</body>
</html>
