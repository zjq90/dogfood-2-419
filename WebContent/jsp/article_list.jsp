<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <%@ include file="common/head.jsp" %>
    <title>文章列表 - iDouBan</title>
</head>
<body>
    <%@ include file="common/header.jsp" %>
    
    <main class="page-container" role="main">
        <div class="page-content">
            <section class="page-content__main" aria-labelledby="page-title">
                <header>
                    <h1 id="page-title" class="page-title">文章列表</h1>
                </header>
                
                <c:choose>
                    <c:when test="${empty requestScope.p.objects}">
                        <div class="empty-state" role="status">
                            <p class="empty-state__text">暂无文章</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <ul class="article-list" role="list" aria-label="文章列表">
                            <c:forEach items="${requestScope.p.objects}" var="article">
                                <li class="article-card">
                                    <article>
                                        <header>
                                            <h2 class="article-card__title">
                                                <a href="${pageContext.request.contextPath}/ArticleServlet?method=show&articleId=${article.articleId}">
                                                    ${article.title}
                                                </a>
                                            </h2>
                                            <div class="article-card__meta">
                                                <span>作者：${article.authorName}</span>
                                                <time datetime="${article.createTime}">${article.createTime}</time>
                                            </div>
                                        </header>
                                        <p class="article-card__summary">${article.summary}</p>
                                        <footer class="article-card__footer">
                                            <a href="${pageContext.request.contextPath}/ArticleServlet?method=show&articleId=${article.articleId}" 
                                               class="btn btn--small btn--outline">
                                                阅读全文
                                            </a>
                                        </footer>
                                    </article>
                                </li>
                            </c:forEach>
                        </ul>
                        
                        <c:if test="${requestScope.p.totalPage != 0}">
                            <nav class="pagination" role="navigation" aria-label="分页导航">
                                <span class="pagination__info" aria-live="polite">
                                    当前第 ${requestScope.p.currentPage} 页，总共 ${requestScope.p.totalPage} 页
                                </span>
                                <a href="${pageContext.request.contextPath}/ArticleListServlet?method=${requestScope.method}&currentPage=1" 
                                   class="pagination__link">首页</a>
                                <a href="${pageContext.request.contextPath}/ArticleListServlet?method=${requestScope.method}&currentPage=${(requestScope.p.currentPage == 1) ? 1 : requestScope.p.currentPage - 1}" 
                                   class="pagination__link ${requestScope.p.currentPage == 1 ? 'pagination__link--disabled' : ''}"
                                   ${requestScope.p.currentPage == 1 ? 'aria-disabled="true" tabindex="-1"' : ''}>上一页</a>
                                <a href="${pageContext.request.contextPath}/ArticleListServlet?method=${requestScope.method}&currentPage=${(requestScope.p.currentPage == requestScope.p.totalPage) ? requestScope.p.totalPage : requestScope.p.currentPage + 1}" 
                                   class="pagination__link ${requestScope.p.currentPage == requestScope.p.totalPage ? 'pagination__link--disabled' : ''}"
                                   ${requestScope.p.currentPage == requestScope.p.totalPage ? 'aria-disabled="true" tabindex="-1"' : ''}>下一页</a>
                                <a href="${pageContext.request.contextPath}/ArticleListServlet?method=${requestScope.method}&currentPage=${requestScope.p.totalPage}" 
                                   class="pagination__link">尾页</a>
                            </nav>
                        </c:if>
                    </c:otherwise>
                </c:choose>
            </section>
            
            <aside class="page-content__sidebar" role="complementary" aria-label="侧边栏">
                <!-- 侧边栏内容可以在这里添加 -->
            </aside>
        </div>
    </main>
    
    <%@ include file="common/footer.jsp" %>
</body>
</html>
