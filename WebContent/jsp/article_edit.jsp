<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="豆瓣文章编辑器">
    <title>写文章 - 豆瓣</title>
    <link rel="icon" href="http://img.linzworld.cn/img/douban_favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/iDouBan/css/common.css">
    <link rel="stylesheet" href="/iDouBan/css/article_edit.css">
    <link rel="preload" href="/iDouBan/css/common.css" as="style">
</head>
<body class="editor-page">
    <header class="editor-nav">
        <div class="editor-nav__inner">
            <div class="editor-nav__logo">
                <img src="http://47.102.212.18/iDouBan/image/文章编辑器_豆瓣LOGO.jpg" alt="豆瓣文章编辑器">
                <h1 class="editor-nav__title">写文章</h1>
            </div>
            <a href="javascript:void(0);" class="editor-nav__action" onclick="showModal()">下一步</a>
        </div>
    </header>

    <main class="editor-container">
        <textarea class="editor-title-input" id="edit-textarea" placeholder="添加标题" maxlength="100" rows="1" aria-label="文章标题"></textarea>
        
        <div class="editor-toolbar" role="toolbar" aria-label="编辑工具">
            <button type="button" class="editor-toolbar__btn" data-command="undo" onclick="changeStyle(this.dataset)">撤销</button>
            <button type="button" class="editor-toolbar__btn" data-command="redo" onclick="changeStyle(this.dataset)">重做</button>
            <button type="button" class="editor-toolbar__btn" data-command="bold" onclick="changeStyle(this.dataset)">加粗</button>
            <button type="button" class="editor-toolbar__btn" data-command="underline" onclick="changeStyle(this.dataset)">下划线</button>
            <button type="button" class="editor-toolbar__btn" data-command="italic" onclick="changeStyle(this.dataset)">斜体</button>
            <button type="button" class="editor-toolbar__btn" data-command="strikeThrough" onclick="changeStyle(this.dataset)">删除线</button>
            <button type="button" class="editor-toolbar__btn" data-command="fontSize" data-value="4" onclick="changeStyle(this.dataset)">小标题</button>
            <button type="button" class="editor-toolbar__btn" data-command="insertHorizontalRule" onclick="changeStyle(this.dataset)">分割线</button>
            <button type="button" class="editor-toolbar__btn" onclick="document.getElementById('photo').click()">图片</button>
        </div>
        
        <article class="editor-content" id="edit-area" contenteditable="true" role="textbox" aria-label="文章内容" aria-multiline="true"></article>

        <form id="upload-form" method="post" enctype="multipart/form-data" style="display: none;">
            <input type="file" id="photo" name="photo" accept="image/*" onchange="uploadImage()">
        </form>

        <form action="http://47.102.212.18/iDouBan/ArticleEditServlet?method=edit_article" method="post" id="article-form" style="display: none;">
            <input type="hidden" name="title" id="edit-title" value="">
            <input type="hidden" name="transfer" id="transfer" value="">
            <input type="hidden" name="groups" id="groups" value="">
            <input type="hidden" name="a" id="inputA" value="">
            <input type="hidden" name="b" id="inputB" value="">
            <input type="hidden" name="c" id="inputC" value="">
            <input type="hidden" name="s" id="selectS" value="">
            <input type="hidden" name="article-id" class="article-id" value="">
        </form>
    </main>

    <div class="modal-overlay" id="modal-overlay" onclick="hideModal()"></div>
    
    <div class="modal" id="modal" role="dialog" aria-labelledby="modal-title" aria-modal="true">
        <header class="modal__header">
            <h2 class="modal__title" id="modal-title">给你的文章添加分组</h2>
            <button type="button" class="modal__close" onclick="hideModal()" aria-label="关闭">×</button>
        </header>
        
        <div class="modal__body">
            <div class="group-inputs">
                <div class="group-input">
                    <input type="text" class="group-input__field" id="input-place-A" placeholder="添加分组" onchange="checkRepeat('input-place-A')" onkeyup="this.value=this.value.replace(/\s+/g,'')">
                </div>
                <div class="group-input">
                    <input type="text" class="group-input__field" id="input-place-B" placeholder="添加分组" onchange="checkRepeat('input-place-B')" onkeyup="this.value=this.value.replace(/\s+/g,'')">
                </div>
                <div class="group-input">
                    <input type="text" class="group-input__field" id="input-place-C" placeholder="添加分组" onchange="checkRepeat('input-place-C')" onkeyup="this.value=this.value.replace(/\s+/g,'')">
                </div>
            </div>
            
            <label for="category-select" class="sr-only">选择文章分类</label>
            <select size="10" id="category-select" class="group-select" id="groups-selectbox">
                <option value="天文">天文</option>
                <option value="读书">读书</option>
                <option value="美食">美食</option>
                <option value="NBA">NBA</option>
                <option value="社会热点">社会热点</option>
                <option value="科技">科技</option>
                <option value="情感">情感</option>
                <option value="电影">电影</option>
                <option value="音乐">音乐</option>
                <option value="其他">其他</option>
            </select>
        </div>
        
        <footer class="modal__footer">
            <a href="javascript:void(0);" class="modal__btn modal__btn--secondary" onclick="hideModal()">返回</a>
            <a href="javascript:void(0);" class="modal__btn modal__btn--primary" onclick="submitArticle()">提交</a>
        </footer>
    </div>

    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script>
        var selectArray = [];
        var selectChoice = null;

        $(document).ready(function() {
            $('#groups-selectbox option').each(function() {
                var txt = $(this).val();
                if (txt !== '') {
                    selectArray.push(txt);
                }
            });

            $('#groups-selectbox').click(function() {
                selectChoice = $('select#groups-selectbox').find('option:selected').val();
                document.getElementById('selectS').value = selectChoice;
            });
        });

        function changeStyle(data) {
            if (data.value) {
                document.execCommand(data.command, false, data.value);
            } else {
                document.execCommand(data.command, false, null);
            }
        }

        function showModal() {
            if (!validateContent()) return;
            document.getElementById('modal-overlay').classList.add('modal-overlay--active');
            document.getElementById('modal').classList.add('modal--active');
        }

        function hideModal() {
            document.getElementById('modal-overlay').classList.remove('modal-overlay--active');
            document.getElementById('modal').classList.remove('modal--active');
        }

        function validateContent() {
            var title = $('#edit-textarea').val();
            var content = $('#edit-area').html();
            
            if (!title || title.trim() === '') {
                alert('文章标题不能为空');
                return false;
            }
            if (!content || content.trim() === '') {
                alert('文章内容不能为空');
                return false;
            }
            return true;
        }

        function submitArticle() {
            var content = document.getElementById('edit-area').innerHTML;
            document.getElementById('transfer').value = content;
            
            var title = document.getElementById('edit-textarea').value;
            document.getElementById('edit-title').value = title;
            
            document.getElementById('inputA').value = document.getElementById('input-place-A').value;
            document.getElementById('inputB').value = document.getElementById('input-place-B').value;
            document.getElementById('inputC').value = document.getElementById('input-place-C').value;
            
            document.getElementById('article-form').submit();
        }

        function uploadImage() {
            var formElement = document.getElementById('upload-form');
            var formData = new FormData(formElement);
            formData.append('method', 'getUrl');
            
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    var url = xhr.responseText;
                    var imgHtml = '<div style="text-align: center; margin: 1rem 0;"><img src="' + url + '" style="max-width: 100%; height: auto;"></div>';
                    document.getElementById('edit-area').innerHTML += imgHtml;
                }
            };
            xhr.open('POST', 'http://47.102.212.18/iDouBan/UploadServlet', true);
            xhr.send(formData);
        }

        function checkRepeat(inputId) {
            var a = document.getElementById('input-place-A').value;
            var b = document.getElementById('input-place-B').value;
            var c = document.getElementById('input-place-C').value;
            
            for (var i = 0; i < selectArray.length; i++) {
                if (document.getElementById(inputId).value === selectArray[i]) {
                    document.getElementById(inputId).value = '';
                    alert('分组名重复!');
                    return;
                }
            }
            
            if ((a === b && a !== '' && b !== '') || 
                (a === c && a !== '' && c !== '') || 
                (b === c && b !== '' && c !== '')) {
                alert('分组名重复!');
                document.getElementById(inputId).value = '';
            }
        }
    </script>
</body>
</html>
