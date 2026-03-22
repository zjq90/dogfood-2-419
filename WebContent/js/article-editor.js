/**
 * 文章编辑器JavaScript
 */

// 全局变量
let selectArray = [];
let selectChoice = null;

// DOM加载完成后执行
$(document).ready(function() {
    // 初始化分组选项数组
    initGroupOptions();
    
    // 绑定分组选择事件
    bindGroupSelectEvent();
});

/**
 * 初始化分组选项数组
 */
function initGroupOptions() {
    $("#groups-selectbox option").each(function() {
        const txt = $(this).val();
        if (txt !== '') {
            selectArray.push(txt);
        }
    });
}

/**
 * 绑定分组选择事件
 */
function bindGroupSelectEvent() {
    $("#groups-selectbox").click(function() {
        selectChoice = $('select#groups-selectbox').find('option:selected').val();
        document.getElementById("selectS").value = selectChoice;
    });
}

/**
 * 文章编辑器按钮功能
 * @param {Object} data - 命令数据对象
 */
const changeStyle = data => {
    data.value ? 
        document.execCommand(data.command, false, data.value) : 
        document.execCommand(data.command, false, null);
};

/**
 * 验证文章是否可以提交
 * @returns {boolean} - 是否可以提交
 */
function isCan() {
    const title = $("#edit-textarea").val();
    const content = $("#edit-area").html();

    if (!title || title.trim() === '') {
        alert("文章标题不能为空");
        return false;
    }
    if (!content || content.trim() === '') {
        alert("文章内容不能为空");
        return false;
    }
    return true;
}

/**
 * 切换弹窗显示状态
 */
function transform() {
    const ic = isCan();
    if (ic === false) {
        return;
    }
    
    const groupWindow = document.getElementById('groups-wrapper');
    groupWindow.style.display = (groupWindow.style.display === 'none') ? 'block' : 'none';
    
    const groupContent = document.getElementById('groups-content');
    groupContent.style.display = (groupContent.style.display === 'none') ? 'block' : 'none';
}

/**
 * 提交文章表单
 */
function formSubmit() {
    // 获取文章内容
    const editArea = document.getElementById("edit-area");
    document.getElementById("transfer").value = editArea.innerHTML;
    
    // 获取文章标题
    const titleArea = document.getElementById("edit-textarea");
    document.getElementById("edit-title").value = titleArea.value;
    
    // 获取分组输入框的值
    const inputA = document.getElementById("input-place-A");
    const inputB = document.getElementById("input-place-B");
    const inputC = document.getElementById("input-place-C");
    
    document.getElementById("inputA").value = inputA.value;
    document.getElementById("inputB").value = inputB.value;
    document.getElementById("inputC").value = inputC.value;
    
    // 提交表单
    document.getElementById('onSubmit').submit();
}

/**
 * 上传图片
 */
function uploadUrl() {
    const formElement = document.getElementById("Upload_form");
    const formData = new FormData(formElement);
    formData.append('method', 'getUrl');
    
    const xmlHttpRequest = new XMLHttpRequest();
    xmlHttpRequest.onreadystatechange = function() {
        if (xmlHttpRequest.readyState === 4 && xmlHttpRequest.status === 200) {
            const url = xmlHttpRequest.responseText;
            const imgHtml = `
                <div class="article-editor__image" style="display: table; margin: 15px auto;">
                    <br><br>
                    <img src="${url}" style="max-width: 590px;" alt="上传的图片">
                </div>
                <br><br>
            `;
            document.getElementById("edit-area").innerHTML += imgHtml;
        }
    };
    
    xmlHttpRequest.open("post", "/iDouBan/UploadServlet", true);
    xmlHttpRequest.send(formData);
}

/**
 * 检查分组名称是否重复
 * @param {string} inputId - 输入框ID
 */
function isRepeat(inputId) {
    const a = document.getElementById("input-place-A").value;
    const b = document.getElementById("input-place-B").value;
    const c = document.getElementById("input-place-C").value;
    const currentValue = document.getElementById(inputId).value;
    
    // 检查与已有分组是否重复
    for (let i = 0; i < selectArray.length; i++) {
        if (currentValue === selectArray[i]) {
            document.getElementById(inputId).value = "";
            alert("分组名重复!!!");
            return;
        }
    }
    
    // 检查三个输入框之间是否重复
    const hasDuplicate = (a && b && a === b) || 
                         (a && c && a === c) || 
                         (b && c && b === c);
    
    if (hasDuplicate) {
        alert("分组名重复!!");
        document.getElementById(inputId).value = "";
    }
}
