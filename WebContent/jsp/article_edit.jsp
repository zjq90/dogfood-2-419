<!-- 文本编辑页面--生成文章以及编辑已完成的文章 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>写文章</title>
    <link rel="icon" href="../image/icon/iDouBan_favicon.ico" type="image/x-icon">
    <!-- 预加载关键CSS -->
    <link rel="preload" href="../css/reset.css" as="style">
    <link rel="preload" href="../css/article-editor.css" as="style">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/article-editor.css">
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js" defer></script>
    <script src="../js/article-editor.js" defer></script>
</head>
<body>
    <!-- 编辑器头部 -->
    <header class="editor-header">
        <div class="editor-header__inner">
            <a href="/iDouBan" class="editor-header__logo" aria-label="返回首页">
                <img src="../image/nav_logo.png" alt="豆瓣logo">
            </a>
            <h1 class="editor-header__title">写文章</h1>
            <div class="editor-header__actions">
                <button type="button" class="editor-header__btn" id="publish-btn">发布文章</button>
            </div>
        </div>
    </header>

    <!-- 主编辑区域 -->
    <main class="editor-main">
        <div class="editor-container">
            <!-- 文章标题 -->
            <div class="article-title">
                <label for="article-title" class="sr-only">文章标题</label>
                <input type="text" 
                       id="article-title" 
                       class="article-title__input" 
                       placeholder="给你的文章起个标题"
                       value="${requestScope.article.title}"
                       aria-label="文章标题输入框">
            </div>

            <!-- 编辑工具栏 -->
            <div class="editor-toolbar" role="toolbar" aria-label="编辑工具栏">
                <button type="button" class="editor-toolbar__btn" data-action="bold" aria-label="加粗">
                    <strong>B</strong>
                </button>
                <button type="button" class="editor-toolbar__btn" data-action="italic" aria-label="斜体">
                    <em>I</em>
                </button>
                <button type="button" class="editor-toolbar__btn" data-action="underline" aria-label="下划线">
                    <u>U</u>
                </button>
                <button type="button" class="editor-toolbar__btn" data-action="strikethrough" aria-label="删除线">
                    <s>S</s>
                </button>
                <span class="editor-toolbar__separator"></span>
                <button type="button" class="editor-toolbar__btn" data-action="h1" aria-label="一级标题">
                    H1
                </button>
                <button type="button" class="editor-toolbar__btn" data-action="h2" aria-label="二级标题">
                    H2
                </button>
                <button type="button" class="editor-toolbar__btn" data-action="h3" aria-label="三级标题">
                    H3
                </button>
                <span class="editor-toolbar__separator"></span>
                <button type="button" class="editor-toolbar__btn" data-action="ul" aria-label="无序列表">
                    列表
                </button>
                <button type="button" class="editor-toolbar__btn" data-action="ol" aria-label="有序列表">
                    序号
                </button>
                <span class="editor-toolbar__separator"></span>
                <button type="button" class="editor-toolbar__btn" data-action="link" aria-label="插入链接">
                    链接
                </button>
                <button type="button" class="editor-toolbar__btn" data-action="image" aria-label="插入图片">
                    图片
                </button>
                <button type="button" class="editor-toolbar__btn" data-action="code" aria-label="插入代码">
                    代码
                </button>
                <button type="button" class="editor-toolbar__btn" data-action="quote" aria-label="引用">
                    引用
                </button>
            </div>

            <!-- 文章内容编辑区 -->
            <label for="article-content" class="sr-only">文章内容</label>
            <div id="article-content" 
                 class="editor-content" 
                 contenteditable="true" 
                 role="textbox" 
                 aria-multiline="true"
                 aria-label="文章内容编辑区">${requestScope.article.content}</div>

            <!-- 隐藏的表单 - 用于提交数据 -->
            <form action="/iDouBan/ArticleEditServlet?method=article_submit" method="post" id="submit-form" class="hidden-form">
                <input type="hidden" name="title" id="form-title">
                <input type="hidden" name="content" id="form-content">
                <input type="hidden" name="article_id" value="${requestScope.article.articleId}">
                <input type="hidden" name="group_id" id="form-group-id" value="${requestScope.article.groupId}">
            </form>

            <!-- 图片上传表单 -->
            <form action="/iDouBan/ArticleEditServlet?method=upload_img" method="post" enctype="multipart/form-data" id="upload-form" class="hidden-form">
                <input type="file" name="img" id="file-input" class="file-input" accept="image/*">
            </form>
        </div>
    </main>

    <!-- 分组选择弹窗 -->
    <div class="modal-overlay" id="group-modal" role="dialog" aria-modal="true" aria-labelledby="modal-title">
        <div class="modal">
            <header class="modal__header">
                <h2 class="modal__title" id="modal-title">选择或创建分组</h2>
                <button type="button" class="modal__close" id="close-modal" aria-label="关闭弹窗">×</button>
            </header>
            <div class="modal__body">
                <div class="group-inputs">
                    <input type="text" class="group-input" id="new-group-name" placeholder="创建新分组...">
                    <button type="button" class="modal__btn" id="create-group-btn">创建</button>
                </div>
                <label for="group-select" class="sr-only">选择分组</label>
                <select id="group-select" class="group-select" size="10" aria-label="分组列表">
                    <c:forEach items="${sessionScope.groups}" var="g">
                        <option value="${g.groupId}">${g.groupName}</option>
                    </c:forEach>
                </select>
            </div>
            <footer class="modal__footer">
                <button type="button" class="modal__btn" id="cancel-btn">取消</button>
                <button type="button" class="modal__btn modal__btn--primary" id="confirm-btn">确定</button>
            </footer>
        </div>
    </div>
</body>
</html>
