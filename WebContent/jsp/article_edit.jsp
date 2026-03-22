<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="编辑文章 - iDouBan">
    <title>写文章 - iDouBan</title>
    <link rel="icon" href="http://img.linzworld.cn/img/douban_favicon.ico" type="image/x-icon">
    <!-- 预加载关键CSS -->
    <link rel="preload" href="${pageContext.request.contextPath}/css/common.css" as="style">
    <link rel="preload" href="${pageContext.request.contextPath}/css/components.css" as="style">
    <!-- 样式文件 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/components.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pages.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">
</head>
<body class="editor-page">
    <nav class="editor-nav" aria-label="编辑器导航">
        <div class="editor-nav__inner">
            <span class="editor-nav__logo">文章编辑器</span>
            <button type="submit" form="article-form" class="editor-nav__btn">发布</button>
        </div>
    </nav>
    
    <main class="editor-container" role="main">
        <form id="article-form" action="${pageContext.request.contextPath}/ArticleServlet" method="post">
            <input type="hidden" name="method" value="${empty article ? 'create' : 'update'}">
            <c:if test="${not empty article}">
                <input type="hidden" name="articleId" value="${article.articleId}">
            </c:if>
            
            <div class="editor-form__group">
                <label for="title" class="sr-only">文章标题</label>
                <input 
                    type="text" 
                    id="title" 
                    name="title" 
                    class="editor-form__input" 
                    placeholder="请输入文章标题"
                    value="${article.title}"
                    required
                    aria-required="true"
                >
            </div>
            
            <div class="editor-form__group">
                <label for="category" class="sr-only">文章分类</label>
                <select id="category" name="category" class="editor-form__select" aria-label="选择文章分类">
                    <option value="">选择分类</option>
                    <option value="life" ${article.category == 'life' ? 'selected' : ''}>生活</option>
                    <option value="tech" ${article.category == 'tech' ? 'selected' : ''}>技术</option>
                    <option value="reading" ${article.category == 'reading' ? 'selected' : ''}>读书</option>
                    <option value="movie" ${article.category == 'movie' ? 'selected' : ''}>电影</option>
                    <option value="music" ${article.category == 'music' ? 'selected' : ''}>音乐</option>
                    <option value="other" ${article.category == 'other' ? 'selected' : ''}>其他</option>
                </select>
            </div>
            
            <div class="editor-form__group">
                <label for="content" class="sr-only">文章内容</label>
                <textarea 
                    id="content" 
                    name="content" 
                    class="editor-form__textarea" 
                    placeholder="开始写作..."
                    required
                    aria-required="true"
                >${article.content}</textarea>
            </div>
        </form>
    </main>
    
    <script src="${pageContext.request.contextPath}/js/common.js" defer></script>
</body>
</html>
