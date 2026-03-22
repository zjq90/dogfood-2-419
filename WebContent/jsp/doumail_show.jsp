<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>与${param.nickname}的豆邮对话</title>
    <link rel="icon" href="../image/icon/iDouBan_favicon.ico" type="image/x-icon">
    <!-- 预加载关键CSS -->
    <link rel="preload" href="../css/reset.css" as="style">
    <link rel="preload" href="../css/common.css" as="style">
    <link rel="preload" href="../css/doumail.css" as="style">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/doumail.css">
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
    <main class="doumail-container" role="main">
        <div class="doumail-main">
            <header class="doumail-header">
                <h1 class="doumail-title">
                    与 <a href="#" class="doumail-header__link">${param.nickname}</a> 的对话
                </h1>
            </header>

            <!-- 对话内容 -->
            <section class="doumail-conversation" aria-label="豆邮对话">
                <c:forEach items="${requestScope.p.objects}" var="d">
                    <c:choose>
                        <c:when test="${d.toUserId == sessionScope.userInfo.userId}">
                            <!-- 收到的消息 -->
                            <article class="message-item message-item--received">
                                <div class="message-item__avatar">
                                    <img src="${d.fromUserImg}" alt="${d.fromUserNick}的头像" class="message-item__avatar-img">
                                </div>
                                <div class="message-item__content">
                                    <div class="message-item__bubble">
                                        <p class="message-item__text">${d.content}</p>
                                    </div>
                                    <time class="message-item__time">${d.createdTime}</time>
                                </div>
                            </article>
                        </c:when>
                        <c:otherwise>
                            <!-- 发送的消息 -->
                            <article class="message-item message-item--sent">
                                <div class="message-item__avatar">
                                    <img src="${sessionScope.userInfo.portrait}" alt="我的头像" class="message-item__avatar-img">
                                </div>
                                <div class="message-item__content">
                                    <div class="message-item__bubble">
                                        <p class="message-item__text">${d.content}</p>
                                    </div>
                                    <time class="message-item__time">${d.createdTime}</time>
                                </div>
                            </article>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <!-- 空状态 -->
                <c:if test="${empty requestScope.p.objects}">
                    <div class="doumail-empty">
                        <div class="doumail-empty__icon">💬</div>
                        <p class="doumail-empty__text">暂无对话记录，开始发送第一条豆邮吧</p>
                    </div>
                </c:if>
            </section>

            <!-- 分页 -->
            <c:if test="${requestScope.p.totalPage!=0}">
                <nav class="doumail-pagination" aria-label="对话分页">
                    <span class="doumail-pagination__info">
                        当前第 ${requestScope.p.currentPage} 页，总共 ${requestScope.p.totalPage} 页
                    </span>
                    <div class="doumail-pagination__links">
                        <a href="DoumailServlet?method=${requestScope.method}&currentPage=1&to_user_id=${param.to_user_id}&nickname=${param.nickname}" class="doumail-pagination__link">首页</a>
                        <a href="DoumailServlet?method=${requestScope.method}&currentPage=${(requestScope.p.currentPage==1)?1:requestScope.p.currentPage-1}&to_user_id=${param.to_user_id}&nickname=${param.nickname}" class="doumail-pagination__link">上一页</a>
                        <a href="DoumailServlet?method=${requestScope.method}&currentPage=${(requestScope.p.currentPage==requestScope.p.totalPage)?requestScope.p.totalPage:requestScope.p.currentPage+1}&to_user_id=${param.to_user_id}&nickname=${param.nickname}" class="doumail-pagination__link">下一页</a>
                        <a href="DoumailServlet?method=${requestScope.method}&currentPage=${requestScope.p.totalPage}&to_user_id=${param.to_user_id}&nickname=${param.nickname}" class="doumail-pagination__link">尾页</a>
                    </div>
                </nav>
            </c:if>

            <!-- 发送豆邮表单 -->
            <form action="/iDouBan/DoumailServlet?pre_method=send_doumail&method=doumail_show&to_user_id=${param.to_user_id}&nickname=${param.nickname}" 
                  method="post" class="doumail-form" aria-label="发送豆邮">
                <div class="doumail-form__group">
                    <label for="doumail-content" class="doumail-form__label">回复豆邮：</label>
                    <textarea name="content" 
                              id="doumail-content" 
                              class="doumail-form__textarea" 
                              placeholder="写下你想说的话..."
                              required></textarea>
                </div>
                <div class="doumail-form__submit">
                    <button type="submit" class="doumail-form__btn">发送</button>
                </div>
            </form>
        </div>
    </main>
</body>
</html>
