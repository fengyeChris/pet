<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="pageTitle" value="用户注册" />
<c:set var="contentPage" value="/WEB-INF/views/user/register.jsp" />
<jsp:include page="/WEB-INF/views/layout.jsp" />

<div class="row justify-content-center mt-5">
    <div class="col-md-6">
        <div class="card">
            <div class="card-header bg-primary text-white">
                <h4 class="card-title mb-0">创建新账户</h4>
            </div>
            <div class="card-body">
                <form action="/register" method="post">
                    <div class="mb-3">
                        <label for="username" class="form-label">用户名 <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" id="username" name="username" 
                               value="${user.username}" required>
                        <div class="form-text">请使用字母、数字或下划线组合</div>
                    </div>
                    
                    <div class="mb-3">
                        <label for="password" class="form-label">密码 <span class="text-danger">*</span></label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="confirmPassword" class="form-label">确认密码 <span class="text-danger">*</span></label>
                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="realName" class="form-label">真实姓名</label>
                        <input type="text" class="form-control" id="realName" name="realName" 
                               value="${user.realName}">
                    </div>
                    
                    <div class="mb-3">
                        <label for="phone" class="form-label">联系电话</label>
                        <input type="tel" class="form-control" id="phone" name="phone" 
                               value="${user.phone}">
                    </div>
                    
                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary btn-lg">注册</button>
                    </div>
                    
                    <div class="mt-3 text-center">
                        <p>已有账户? <a href="/login">立即登录</a></p>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    // 客户端密码验证
    document.querySelector('form').addEventListener('submit', function(event) {
        const password = document.getElementById('password').value;
        const confirmPassword = document.getElementById('confirmPassword').value;
        
        if (password !== confirmPassword) {
            event.preventDefault();
            alert('两次输入的密码不一致，请重新输入');
            document.getElementById('password').value = '';
            document.getElementById('confirmPassword').value = '';
            document.getElementById('password').focus();
        }
    });
</script>