<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <%@ include file="common/head.jsp" %>
    <title>${article.title} - iDouBan</title>
</head>
<body>
    <%@ include file="common/header.jsp" %>
    
    <main class="page-container" role="main">
        <div class="page-content">
            <article class="page-content__main" aria-labelledby="article-title">
                <div class="article-detail">
                    <header class="article-detail__header">
                        <h1 id="article-title" class="article-detail__title">${article.title}</h1>
                        <div class="article-detail__meta">
                            <span>作者：${article.authorName}</span>
                            <time datetime="${article.createTime}">${article.createTime}</time>
                            <span>阅读：${article.readCount}</span>
                        </div>
                    </header>
                    
                    <div class="article-detail__content">
                        ${article.content}
                    </div>
                    
                    <footer class="article-actions">
                        <c:if test="${sessionScope.userInfo.userId == article.authorId}">
                            <a href="${pageContext.request.contextPath}/ArticleServlet?method=edit&articleId=${article.articleId}" class="btn btn--outline">编辑文章</a>
                            <a href="${pageContext.request.contextPath}/ArticleServlet?method=delete&articleId=${article.articleId}" 
                               class="btn btn--danger"
                               data-confirm="确定要删除这篇文章吗？">删除文章</a>
                        </c:if>
                        <a href="${pageContext.request.contextPath}/ArticleListServlet?method=article_list" class="btn btn--secondary">返回列表</a>
                    </footer>
                </div>
            </article>
            
            <aside class="page-content__sidebar" role="complementary" aria-label="侧边栏">
                <!-- 侧边栏内容可以在这里添加 -->
            </aside>
        </div>
    </main>
    
    <%@ include file="common/footer.jsp" %>
</body>
</html>
