<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <%@ include file="common/head.jsp" %>
    <title>与${sessionScope.nickname}的豆邮 - iDouBan</title>
</head>
<body>
    <%@ include file="common/header.jsp" %>
    
    <main class="page-container" role="main">
        <div class="page-content page-content--full">
            <section class="page-content__main" aria-labelledby="chat-title">
                <div class="chat-container">
                    <header class="chat-header">
                        <h1 id="chat-title">与 ${sessionScope.nickname} 的豆邮</h1>
                    </header>
                    
                    <div class="chat-messages" role="log" aria-live="polite" aria-label="聊天记录">
                        <c:forEach items="${requestScope.doumailList}" var="msg">
                            <div class="chat-message ${msg.isFromMe ? 'chat-message--sent' : 'chat-message--received'}">
                                <p>${msg.content}</p>
                                <time class="chat-message__time" datetime="${msg.createTime}">${msg.createTime}</time>
                            </div>
                        </c:forEach>
                    </div>
                    
                    <form class="chat-input" action="${pageContext.request.contextPath}/DoumailServlet" method="post">
                        <input type="hidden" name="method" value="send_doumail">
                        <input type="hidden" name="to_user_id" value="${sessionScope.toUserId}">
                        <input type="text" name="content" class="chat-input__field" placeholder="输入消息..." required aria-label="输入消息">
                        <button type="submit" class="chat-input__btn">发送</button>
                    </form>
                </div>
            </section>
        </div>
    </main>
    
    <%@ include file="common/footer.jsp" %>
</body>
</html>
