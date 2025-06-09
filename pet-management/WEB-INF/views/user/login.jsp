<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="pageTitle" value="用户登录" />
<c:set var="contentPage" value="/WEB-INF/views/user/login.jsp" />
<jsp:include page="/WEB-INF/views/layout.jsp" />

<div class="row justify-content-center mt-5">
    <div class="col-md-5">
        <div class="card">
            <div class="card-header bg-primary text-white">
                <h4 class="card-title mb-0">欢迎回来</h4>
            </div>
            <div class="card-body">
                <form action="/login" method="post">
                    <div class="mb-3">
                        <label for="username" class="form-label">用户名 <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" id="username" name="username" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="password" class="form-label">密码 <span class="text-danger">*</span></label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                    
                    <div class="mb-3 form-check">
                        <input type="checkbox" class="form-check-input" id="rememberMe" name="rememberMe">
                        <label class="form-check-label" for="rememberMe">记住我</label>
                    </div>
                    
                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary btn-lg">登录</button>
                    </div>
                    
                    <div class="mt-3 text-center">
                        <p>还没有账户? <a href="/register">立即注册</a></p>
                        <p><a href="#">忘记密码?</a></p>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <div class="col-md-5 d-flex align-items-center">
        <div class="text-center">
            <img src="https://via.placeholder.com/300" class="img-fluid mb-4" alt="宠物之家">
            <h3>加入宠物之家</h3>
            <p class="lead">领养宠物，给它们一个温暖的家</p>
        </div>
    </div>
    
	    <!-- login.jsp 中添加记住我选项 -->
	<div class="mb-3 form-check">
	    <input type="checkbox" class="form-check-input" id="rememberMe" name="rememberMe">
	    <label class="form-check-label" for="rememberMe">记住我（自动登录）</label>
	</div>
</div>