<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <%@ include file="common/head.jsp" %>
    <title>账号管理 - iDouBan</title>
</head>
<body>
    <%@ include file="common/header.jsp" %>
    
    <main class="page-container" role="main">
        <div class="page-content">
            <section class="page-content__main" aria-labelledby="page-title">
                <h1 id="page-title" class="sr-only">账号管理</h1>
                
                <!-- 头像上传 -->
                <article class="account-section">
                    <h2 class="account-section__title">更换头像</h2>
                    <div class="avatar-upload">
                        <figure>
                            <img src="${sessionScope.userInfo.portrait}" alt="当前头像" class="avatar-upload__preview">
                        </figure>
                        <div class="avatar-upload__controls">
                            <form action="${pageContext.request.contextPath}/UploadServlet" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="photo" class="form-label">选择新头像</label>
                                    <input type="file" name="photo" id="photo" accept="image/*" required aria-required="true">
                                </div>
                                <button type="submit" class="btn btn--primary">上传头像</button>
                            </form>
                        </div>
                    </div>
                </article>
                
                <!-- 个人信息修改 -->
                <article class="account-section">
                    <h2 class="account-section__title">修改个人信息</h2>
                    <form class="info-form" action="${pageContext.request.contextPath}/MyPageServlet" method="post">
                        <div class="info-form__group">
                            <label for="nickname" class="info-form__label">昵称</label>
                            <input type="text" id="nickname" name="nickname" class="info-form__input" placeholder="请输入昵称" value="${sessionScope.userInfo.nickname}">
                        </div>
                        <div class="info-form__group">
                            <label for="signature" class="info-form__label">个性签名</label>
                            <input type="text" id="signature" name="signature" class="info-form__input" placeholder="请输入个性签名" value="${sessionScope.userInfo.signature}">
                        </div>
                        <div class="info-form__group">
                            <label for="selfIntroduc" class="info-form__label">自我介绍</label>
                            <textarea id="selfIntroduc" name="selfIntroduc" class="info-form__input" rows="4" placeholder="请输入自我介绍">${sessionScope.userInfo.selfIntroduc}</textarea>
                        </div>
                        <div class="info-form__group">
                            <label for="address" class="info-form__label">地址</label>
                            <input type="text" id="address" name="address" class="info-form__input" placeholder="请输入地址" value="${sessionScope.userInfo.address}">
                        </div>
                        <button type="submit" class="info-form__btn">保存修改</button>
                    </form>
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
