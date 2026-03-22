<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>账号管理</title>
    <link rel="icon" href="../image/icon/iDouBan_favicon.ico" type="image/x-icon">
    <!-- 预加载关键CSS -->
    <link rel="preload" href="../css/reset.css" as="style">
    <link rel="preload" href="../css/common.css" as="style">
    <link rel="preload" href="../css/settings.css" as="style">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/settings.css">
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
    <header class="site-header site-header--simple" role="banner">
        <div class="site-header__container">
            <div class="logo">
                <a href="/iDouBan" aria-label="返回首页">
                    <img src="../image/豆瓣首页logo.jpg" alt="豆瓣logo" class="logo__img" width="175" height="58">
                </a>
            </div>
        </div>
    </header>

    <!-- 主内容区域 -->
    <main class="settings-container" role="main">
        <div class="settings-main">
            <header class="settings-header">
                <h1 class="settings-title">账号管理</h1>
                <p class="settings-welcome">欢迎您：${sessionScope.uname}</p>
            </header>

            <!-- 头像上传区域 -->
            <section class="settings-avatar" aria-label="头像设置">
                <div class="settings-avatar__preview">
                    <img src="${sessionScope.userInfo.portrait}" alt="我的头像" class="settings-avatar__img">
                </div>
                <form action="/iDouBan/UploadServlet" method="post" enctype="multipart/form-data" class="settings-avatar__upload">
                    <label for="avatar-input" class="settings-avatar__label">
                        选择头像文件
                    </label>
                    <input type="file" id="avatar-input" name="photo" class="settings-avatar__input" accept="image/*">
                    <button type="submit" class="settings-avatar__btn">上传头像</button>
                </form>
            </section>

            <!-- 个人信息表单 -->
            <section class="settings-form" aria-label="个人信息设置">
                <form action="/iDouBan/MyPageServlet" method="post">
                    <div class="settings-form__group">
                        <label for="nickname" class="settings-form__label">昵称：</label>
                        <input type="text" id="nickname" name="nickname" class="settings-form__input" 
                               placeholder="请输入您的昵称" value="${sessionScope.userInfo.nickname}">
                    </div>

                    <div class="settings-form__group">
                        <label for="signature" class="settings-form__label">个性签名：</label>
                        <input type="text" id="signature" name="signature" class="settings-form__input" 
                               placeholder="请输入您的个性签名" value="${sessionScope.userInfo.signature}">
                    </div>

                    <div class="settings-form__group">
                        <label for="selfIntroduc" class="settings-form__label">自我介绍：</label>
                        <textarea id="selfIntroduc" name="selfIntroduc" class="settings-form__input settings-form__input--textarea" 
                                  placeholder="请介绍一下您自己">${sessionScope.userInfo.selfIntroduc}</textarea>
                    </div>

                    <div class="settings-form__group">
                        <label for="address" class="settings-form__label">地址：</label>
                        <input type="text" id="address" name="address" class="settings-form__input" 
                               placeholder="请输入您的地址" value="${sessionScope.userInfo.address}">
                    </div>

                    <div class="settings-form__submit">
                        <button type="submit" class="settings-form__btn">保存修改</button>
                    </div>
                </form>
            </section>
        </div>
    </main>
</body>
</html>
