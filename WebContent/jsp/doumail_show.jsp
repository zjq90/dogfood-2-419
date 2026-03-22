<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="与${sessionScope.nickname}的豆邮对话">
    <title>与${sessionScope.nickname}的豆邮</title>
    <link rel="icon" href="http://img.linzworld.cn/img/douban_favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/iDouBan/css/common.css">
    <link rel="stylesheet" href="/iDouBan/css/doumail_show.css">
    <link rel="preload" href="/iDouBan/css/common.css" as="style">
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js" defer></script>
    <script src="/iDouBan/js/common.js" defer></script>
</head>
<body>
    <a href="#main-content" class="skip-link">跳转到主要内容</a>
    
    <nav class="top-nav" aria-label="顶部导航">
        <ul class="top-nav__list">
            <li class="top-nav__item"><a href="/iDouBan/ArticleListServlet?method=my_collection_list" class="top-nav__link">我的收藏</a></li>
            <li class="top-nav__item"><a href="/iDouBan/ArticleListServlet?method=my_article_list" class="top-nav__link">我的文章</a></li>
            <li class="top-nav__item"><a href="/iDouBan/ArticleListServlet?method=article_list" class="top-nav__link">所有文章</a></li>
            <li class="top-nav__item"><a href="http://47.102.212.18/iDouBan/jsp/article_edit.jsp" class="top-nav__link" target="_blank">写文章</a></li>
            <li class="top-nav__item"><a href="/iDouBan/EveryoneListServlet?method=everyone_list" class="top-nav__link">所有人</a></li>
            <li class="top-nav__item"><a href="/iDouBan/FriendListServlet?method=friend_list" class="top-nav__link">我的好友</a></li>
            <li class="top-nav__item"><a href="/iDouBan/FriendListServlet?method=attention_list" class="top-nav__link">我的关注</a></li>
            <li class="top-nav__item"><a href="/iDouBan/FriendListServlet?method=blacklist_list" class="top-nav__link">黑名单</a></li>
            <li class="top-nav__item"><a href="/iDouBan/DoumailServlet?method=my_doumail_list" class="top-nav__link">豆邮</a></li>
            <li class="top-nav__item"><a href="http://47.102.212.18/iDouBan/jsp/my_page.jsp" class="top-nav__link">个人主页</a></li>
            <li class="top-nav__item"><a href="http://47.102.212.18/iDouBan/jsp/alter.jsp" class="top-nav__link">账号管理</a></li>
            <li class="top-nav__item"><a href="http://47.102.212.18/iDouBan/ClearLoginServlet" class="top-nav__link">退出登录</a></li>
        </ul>
    </nav>
    
    <header class="main-header">
        <div class="main-header__inner">
            <div class="main-header__logo">
                <a href="/iDouBan/ArticleListServlet?method=article_list">
                    <img src="http://47.102.212.18/iDouBan/image/豆瓣首页logo.jpg" alt="豆瓣Logo" width="175" height="58">
                </a>
            </div>
            <nav class="main-nav" aria-label="主导航">
                <ul class="main-nav__list">
                    <li><a href="#" class="main-nav__link">首页</a></li>
                    <li><a href="http://47.102.212.18/iDouBan/jsp/my_page.jsp" class="main-nav__link">个人主页</a></li>
                    <li><a href="/iDouBan/ArticleListServlet?method=article_list" class="main-nav__link">浏览发现</a></li>
                </ul>
            </nav>
            <form class="search-form" action="ArticleListServlet?method=search_article_list&currentPage=1" method="post" role="search">
                <input type="text" name="search_content" class="search-form__input" placeholder="搜索你感兴趣的内容和人" aria-label="搜索">
                <button type="submit" class="search-form__btn" aria-label="提交搜索"></button>
            </form>
        </div>
    </header>
    
    <main class="main-content" id="main-content">
        <div class="mail-conversation">
            <header class="mail-conversation__header">
                <h1 class="mail-conversation__title">与${sessionScope.nickname}的豆邮</h1>
            </header>
            
            <section class="mail-conversation__list" id="doumail-code" aria-live="polite" aria-label="对话列表">
            </section>
            
            <section class="mail-reply" aria-labelledby="reply-title">
                <h2 class="mail-reply__title" id="reply-title">你的回应</h2>
                <form action="/iDouBan/DoumailServlet?pre_method=doumail_content&method=doumail_show" id="onSubmit" name="doumail_form" method="post">
                    <div class="form-group">
                        <label for="doumail-textarea" class="sr-only">输入你的回复内容</label>
                        <textarea name="doumail-place" id="doumail-textarea" class="mail-reply__textarea" rows="4" cols="64" maxlength="666" required aria-describedby="char-count" onKeyUp="checkMaxInput(this)" onKeyDown="checkMaxInput(this)"></textarea>
                    </div>
                    <input type="hidden" name="content" id="content" value="">
                    <input type="hidden" name="to_user_id" id="to_user_id" value="">
                    <div class="mail-reply__footer">
                        <span class="mail-reply__char-count" id="char-count">最多可输入666个字符</span>
                        <button type="button" onclick="formSubmit()" id="submit_btn" class="mail-reply__submit">确定</button>
                    </div>
                </form>
            </section>
            
            <nav class="mail-pagination" aria-label="对话分页">
                <span class="mail-pagination__info">
                    当前第 <strong id="currentPage_num">1</strong> 页，总共 <strong id="totalPage_num">1</strong> 页
                </span>
                <button type="button" id="first_page" class="mail-pagination__btn">首页</button>
                <button type="button" id="previous_page" class="mail-pagination__btn">上一页</button>
                <button type="button" id="next_page" class="mail-pagination__btn">下一页</button>
                <button type="button" id="last_page" class="mail-pagination__btn">尾页</button>
            </nav>
        </div>
    </main>
    
    <script>
        var currentPage;
        var totalPage;
        
        function checkMaxInput(txt) {
            if (txt.value.length > 666) {
                txt.value = txt.value.substring(0, 666);
                alert("最大输入长度为666个字节!!!");
            }
            document.getElementById('char-count').textContent = '已输入 ' + txt.value.length + '/666 个字符';
        }
        
        function formSubmit() {
            var y = document.getElementById("doumail-textarea");
            
            if (y.value !== filterScript(y.value)) {
                alert("你的输入中含有不合法的字符，请重新输入！");
                return;
            }
            
            var lastContent = htmlEscape(y.value);
            
            if (isContentEmpty(lastContent)) {
                return;
            }
            
            document.getElementById("content").value = lastContent;
            document.getElementById("to_user_id").value = ${requestScope.toUserId};
            document.getElementById("onSubmit").submit();
        }
        
        function isContentEmpty(yValue) {
            var v = $.trim(yValue);
            if (v === '' || v === null) {
                alert("对话或者回复的内容不能为空");
                document.getElementById("doumail-textarea").value = "";
                return true;
            }
            return false;
        }
        
        function filterScript(htmlStr) {
            var reg = new RegExp("<.*?script[^>]*?>.*?(<\\/.*?script.*?>)*", "ig");
            if (reg.test(htmlStr)) {
                return htmlStr.replace(/<.*?script[^>]*?>.*?(<\\/.*?script.*?>)*/ig, '');
            }
            return htmlStr;
        }
        
        function htmlEscape(htmlStr) {
            return htmlStr.replace(/[<>&"]/g, function(c) {
                return {'<': '&lt;', '>': '&gt;', '&': '&amp;', '"': '&quot;'}[c];
            });
        }
        
        $(document).ready(function() {
            currentPage = 1;
            toAjax(currentPage);
        });
        
        $(document).ready(function() {
            $("#first_page").click(function(event) {
                if (currentPage === 1) {
                    alert("已经是对话的首页了！");
                    return;
                }
                currentPage = 1;
                toAjax(currentPage);
            });
        });
        
        $(document).ready(function() {
            $("#previous_page").click(function(event) {
                currentPage = currentPage === 1 ? 1 : currentPage - 1;
                toAjax(currentPage);
            });
        });
        
        $(document).ready(function() {
            $("#next_page").click(function(event) {
                currentPage = currentPage === totalPage ? totalPage : currentPage + 1;
                toAjax(currentPage);
            });
        });
        
        $(document).ready(function() {
            $("#last_page").click(function(event) {
                if (currentPage === totalPage) {
                    alert("已经是对话的尾页了！");
                    return;
                }
                if (totalPage === 0) {
                    return;
                } else {
                    toAjax(totalPage);
                }
            });
        });
        
        function showNum() {
            document.getElementById("currentPage_num").innerHTML = currentPage;
            document.getElementById("totalPage_num").innerHTML = totalPage;
            
            if (totalPage === 0) {
                document.getElementById("currentPage_num").innerHTML = 1;
                document.getElementById("totalPage_num").innerHTML = 1;
            }
        }
        
        function toAjax(c) {
            $("#doumail-code").empty();
            
            var xmlHttpRequest = new XMLHttpRequest();
            xmlHttpRequest.onreadystatechange = callback;
            xmlHttpRequest.open("post", "http://47.102.212.18/iDouBan/DoumailServlet", true);
            xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xmlHttpRequest.send("method=doumail_show_details&to_user_id=" + ${requestScope.toUserId} + "&currentPage=" + c);
        }
        
        function callback() {
            if (xmlHttpRequest.readyState === 4 && xmlHttpRequest.status === 200) {
                var obj = JSON.parse(xmlHttpRequest.responseText);
                
                for (var i = 0; i < obj.objects.length; i++) {
                    var $doumail = 
                        '<article class="mail-item" id="' + obj.objects[i].doumailId + '">' +
                        '    <img src="' + obj.objects[i].fromUserImg + '" alt="' + obj.objects[i].fromUserNick + '的头像" class="mail-item__avatar" loading="lazy">' +
                        '    <div class="mail-item__content">' +
                        '        <header class="mail-item__header">' +
                        '            <a href="#" class="mail-item__sender">' + obj.objects[i].fromUserNick + '</a>' +
                        '            <time class="mail-item__time">' + obj.objects[i].chatTime + '</time>' +
                        '        </header>' +
                        '        <p class="mail-item__message">' + obj.objects[i].chatMsg + '</p>' +
                        '    </div>' +
                        '    <input type="hidden" value="' + obj.objects[i].doumailId + '">' +
                        '</article>';
                    $("#doumail-code").prepend($doumail);
                }
                
                currentPage = obj.currentPage;
                totalPage = obj.totalPage;
                
                if (totalPage != null) {
                    if (totalPage === 0) {
                        currentPage = 1;
                        totalPage = 0;
                    }
                }
                
                showNum();
            }
        }
    </script>
</body>
</html>
