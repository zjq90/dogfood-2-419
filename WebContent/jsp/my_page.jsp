<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <%@ include file="common/head.jsp" %>
    <title>我的主页 - iDouBan</title>
</head>
<body>
    <%@ include file="common/header.jsp" %>
    
    <main class="page-container" role="main">
        <div class="page-content">
            <section class="page-content__main" aria-labelledby="profile-title">
                <h1 id="profile-title" class="sr-only">个人主页</h1>
                
                <article class="profile-section">
                    <header class="profile-header">
                        <figure class="profile-avatar">
                            <img src="${sessionScope.userInfo.portrait}" alt="${sessionScope.userInfo.nickname}的头像" class="profile-avatar__img">
                        </figure>
                        
                        <div class="profile-info">
                            <p class="profile-info__welcome">
                                欢迎您：<strong>${sessionScope.userInfo.username}</strong>
                            </p>
                            
                            <dl class="profile-info__list">
                                <div class="profile-info__item">
                                    <dt class="profile-info__label">昵称：</dt>
                                    <dd>${sessionScope.userInfo.nickname}</dd>
                                </div>
                                <div class="profile-info__item">
                                    <dt class="profile-info__label">个性签名：</dt>
                                    <dd>${sessionScope.userInfo.signature}</dd>
                                </div>
                                <div class="profile-info__item">
                                    <dt class="profile-info__label">自我介绍：</dt>
                                    <dd>${sessionScope.userInfo.selfIntroduc}</dd>
                                </div>
                                <div class="profile-info__item">
                                    <dt class="profile-info__label">地址：</dt>
                                    <dd>${sessionScope.userInfo.address}</dd>
                                </div>
                            </dl>
                        </div>
                    </header>
                </article>
            </section>
            
            <aside class="page-content__sidebar" role="complementary" aria-label="侧边栏">
                <!-- 侧边栏内容可以在这里添加 -->
            </aside>
        </div>
    </main>
    
    <%@ include file="common/footer.jsp" %>
</body>
</html>
