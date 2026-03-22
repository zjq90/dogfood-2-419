<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <%@ include file="common/head.jsp" %>
    <title>所有人 - iDouBan</title>
</head>
<body>
    <%@ include file="common/header.jsp" %>
    
    <main class="page-container" role="main">
        <div class="page-content">
            <section class="page-content__main" aria-labelledby="page-title">
                <header>
                    <h1 id="page-title" class="page-title">所有人的列表</h1>
                </header>
                
                <c:choose>
                    <c:when test="${empty requestScope.p.objects}">
                        <div class="empty-state" role="status">
                            <p class="empty-state__text">暂无用户数据</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <ul class="user-list" role="list" aria-label="用户列表">
                            <c:forEach items="${requestScope.p.objects}" var="u">
                                <li class="user-card">
                                    <figure class="user-card__avatar-wrapper">
                                        <img src="${u.portrait}" alt="${u.nickname}的头像" class="user-card__avatar" width="60" height="60">
                                    </figure>
                                    
                                    <div class="user-card__info">
                                        <h2 class="user-card__name">${u.nickname}</h2>
                                        <p class="user-card__signature">${u.signature}</p>
                                    </div>
                                    
                                    <div class="user-card__actions">
                                        <a href="${pageContext.request.contextPath}/DoumailServlet?method=doumail_show&to_user_id=${u.userId}&nickname=${u.nickname}" 
                                           class="btn btn--small btn--outline" 
                                           target="_blank"
                                           aria-label="给${u.nickname}发豆邮">
                                            发豆邮
                                        </a>
                                        
                                        <c:set var="s" value="${u.status}" scope="session"/>
                                        
                                        <c:choose>
                                            <c:when test="${sessionScope.s == 0}">
                                                <a href="${pageContext.request.contextPath}/EveryoneListServlet?pre_method=attention&method=everyone_list&toUserId=${u.userId}&currentPage=1" 
                                                   class="btn btn--small btn--primary"
                                                   aria-label="关注${u.nickname}">
                                                    关注
                                                </a>
                                                <a href="${pageContext.request.contextPath}/EveryoneListServlet?pre_method=black_without_record&method=everyone_list&toUserId=${u.userId}&currentPage=${requestScope.p.currentPage}" 
                                                   class="btn btn--small btn--secondary"
                                                   aria-label="拉黑${u.nickname}">
                                                    拉黑
                                                </a>
                                            </c:when>
                                            <c:when test="${sessionScope.s == 1 || sessionScope.s == 2}">
                                                <a href="${pageContext.request.contextPath}/EveryoneListServlet?pre_method=unfollow&method=everyone_list&toUserId=${u.userId}&currentPage=1" 
                                                   class="btn btn--small btn--secondary"
                                                   aria-label="取消关注${u.nickname}">
                                                    取消关注
                                                </a>
                                                <a href="${pageContext.request.contextPath}/EveryoneListServlet?pre_method=black_on_record&method=everyone_list&toUserId=${u.userId}&currentPage=${requestScope.p.currentPage}" 
                                                   class="btn btn--small btn--secondary"
                                                   aria-label="拉黑${u.nickname}">
                                                    拉黑
                                                </a>
                                            </c:when>
                                            <c:when test="${sessionScope.s == 3}">
                                                <span class="btn btn--small btn--disabled">黑名单</span>
                                                <a href="${pageContext.request.contextPath}/EveryoneListServlet?pre_method=cancel_black&method=everyone_list&toUserId=${u.userId}&currentPage=${requestScope.p.currentPage}" 
                                                   class="btn btn--small btn--outline"
                                                   aria-label="取消拉黑${u.nickname}">
                                                    取消拉黑
                                                </a>
                                            </c:when>
                                        </c:choose>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                        
                        <c:if test="${requestScope.p.totalPage != 0}">
                            <nav class="pagination" role="navigation" aria-label="分页导航">
                                <span class="pagination__info" aria-live="polite">
                                    当前第 ${requestScope.p.currentPage} 页，总共 ${requestScope.p.totalPage} 页
                                </span>
                                <a href="${pageContext.request.contextPath}/EveryoneListServlet?method=${requestScope.method}&currentPage=1" 
                                   class="pagination__link"
                                   aria-label="首页">
                                    首页
                                </a>
                                <a href="${pageContext.request.contextPath}/EveryoneListServlet?method=${requestScope.method}&currentPage=${(requestScope.p.currentPage == 1) ? 1 : requestScope.p.currentPage - 1}" 
                                   class="pagination__link ${requestScope.p.currentPage == 1 ? 'pagination__link--disabled' : ''}"
                                   aria-label="上一页"
                                   ${requestScope.p.currentPage == 1 ? 'aria-disabled="true" tabindex="-1"' : ''}>
                                    上一页
                                </a>
                                <a href="${pageContext.request.contextPath}/EveryoneListServlet?method=${requestScope.method}&currentPage=${(requestScope.p.currentPage == requestScope.p.totalPage) ? requestScope.p.totalPage : requestScope.p.currentPage + 1}" 
                                   class="pagination__link ${requestScope.p.currentPage == requestScope.p.totalPage ? 'pagination__link--disabled' : ''}"
                                   aria-label="下一页"
                                   ${requestScope.p.currentPage == requestScope.p.totalPage ? 'aria-disabled="true" tabindex="-1"' : ''}>
                                    下一页
                                </a>
                                <a href="${pageContext.request.contextPath}/EveryoneListServlet?method=${requestScope.method}&currentPage=${requestScope.p.totalPage}" 
                                   class="pagination__link"
                                   aria-label="尾页">
                                    尾页
                                </a>
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
