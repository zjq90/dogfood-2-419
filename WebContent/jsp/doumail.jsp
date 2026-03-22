<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>我的豆邮</title>
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
                <h1 class="doumail-title">我的豆邮</h1>
            </header>

            <section class="doumail-list" aria-label="豆邮列表">
                <h2 class="doumail-list__title">收到的豆邮</h2>
                
                <c:forEach items="${requestScope.p.objects}" var="d">
                    <article class="doumail-item ${d.status == 1 ? 'doumail-item--unread' : ''}">
                        <div class="doumail-item__avatar">
                            <img src="${d.fromUserImg}" alt="${d.fromUserNick}的头像" class="doumail-item__avatar-img">
                        </div>
                        <div class="doumail-item__content">
                            <div class="doumail-item__header">
                                <a href="/iDouBan/DoumailServlet?method=doumail_show&to_user_id=${d.fromUserId}&nickname=${d.fromUserNick}" 
                                   class="doumail-item__sender">
                                    ${d.fromUserNick}
                                </a>
                                <time class="doumail-item__time">${d.createdTime}</time>
                            </div>
                            <p class="doumail-item__preview">${d.content}</p>
                            <div class="doumail-item__actions">
                                <a href="/iDouBan/DoumailServlet?method=doumail_show&to_user_id=${d.fromUserId}&nickname=${d.fromUserNick}" 
                                   class="doumail-item__action">
                                    查看对话
                                </a>
                                <a href="/iDouBan/DoumailServlet?pre_method=delete_doumail&method=my_doumail_list&doumail_id=${d.doumailId}&currentPage=${requestScope.p.currentPage}" 
                                   class="doumail-item__action doumail-item__action--delete"
                                   onclick="return confirm('确定要删除这封豆邮吗？')">
                                    删除
                                </a>
                            </div>
                        </div>
                    </article>
                </c:forEach>

                <!-- 空状态 -->
                <c:if test="${empty requestScope.p.objects}">
                    <div class="doumail-empty">
                        <div class="doumail-empty__icon">📭</div>
                        <p class="doumail-empty__text">暂无豆邮</p>
                    </div>
                </c:if>
            </section>

            <!-- 分页 -->
            <c:if test="${requestScope.p.totalPage!=0}">
                <nav class="doumail-pagination" aria-label="豆邮分页">
                    <span class="doumail-pagination__info">
                        当前第 ${requestScope.p.currentPage} 页，总共 ${requestScope.p.totalPage} 页
                    </span>
                    <div class="doumail-pagination__links">
                        <a href="DoumailServlet?method=${requestScope.method}&currentPage=1" class="doumail-pagination__link">首页</a>
                        <a href="DoumailServlet?method=${requestScope.method}&currentPage=${(requestScope.p.currentPage==1)?1:requestScope.p.currentPage-1}" class="doumail-pagination__link">上一页</a>
                        <a href="DoumailServlet?method=${requestScope.method}&currentPage=${(requestScope.p.currentPage==requestScope.p.totalPage)?requestScope.p.totalPage:requestScope.p.currentPage+1}" class="doumail-pagination__link">下一页</a>
                        <a href="DoumailServlet?method=${requestScope.method}&currentPage=${requestScope.p.totalPage}" class="doumail-pagination__link">尾页</a>
                    </div>
                </nav>
            </c:if>
        </div>
    </main>
</body>
</html>
