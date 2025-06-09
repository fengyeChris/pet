<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="pageTitle" value="个人中心" />
<c:set var="contentPage" value="/WEB-INF/views/user/profile.jsp" />
<jsp:include page="/WEB-INF/views/layout.jsp" />

<div class="row mt-4">
    <div class="col-md-4">
        <div class="card mb-4">
            <div class="card-body text-center">
                <div class="mb-3">
                    <div class="avatar-placeholder bg-primary text-white rounded-circle d-flex align-items-center justify-content-center" 
                         style="width: 120px; height: 120px; margin: 0 auto; font-size: 3rem;">
                        <i class="bi bi-person"></i>
                    </div>
                </div>
                <h4>${user.username}</h4>
                <span class="badge bg-${user.role == '管理员' ? 'danger' : 'info'}">
                    ${user.role}
                </span>
                <p class="text-muted mt-2">注册时间: ${user.createTime}</p>
            </div>
        </div>
        
        <div class="card">
            <div class="card-header bg-primary text-white">
                <h5 class="card-title mb-0">修改密码</h5>
            </div>
            <div class="card-body">
                <form action="/updatePassword" method="post">
                    <div class="mb-3">
                        <label class="form-label">当前密码</label>
                        <input type="password" name="currentPassword" class="form-control" required>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">新密码</label>
                        <input type="password" name="newPassword" class="form-control" required>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">确认新密码</label>
                        <input type="password" name="confirmNewPassword" class="form-control" required>
                    </div>
                    
                    <button type="submit" class="btn btn-primary w-100">更新密码</button>
                </form>
            </div>
        </div>
    </div>
    
    <div class="col-md-8">
        <div class="card">
            <div class="card-header bg-primary text-white">
                <h5 class="card-title mb-0">个人信息</h5>
            </div>
            <div class="card-body">
                <form action="/updateProfile" method="post">
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label">用户名</label>
                            <input type="text" class="form-control" value="${user.username}" disabled>
                        </div>
                        
                        <div class="col-md-6 mb-3">
                            <label class="form-label">用户角色</label>
                            <input type="text" class="form-control" value="${user.role}" disabled>
                        </div>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">真实姓名</label>
                        <input type="text" name="realName" class="form-control" value="${user.realName}">
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">联系电话</label>
                        <input type="tel" name="phone" class="form-control" value="${user.phone}">
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">电子邮箱</label>
                        <input type="email" name="email" class="form-control" value="${user.email}">
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">联系地址</label>
                        <textarea name="address" class="form-control" rows="3">${user.address}</textarea>
                    </div>
                    
                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary">更新个人信息</button>
                    </div>
                </form>
            </div>
        </div>
        
        <div class="card mt-4">
            <div class="card-header bg-primary text-white">
                <h5 class="card-title mb-0">我的领养记录</h5>
            </div>
            <div class="card-body">
                <c:choose>
                    <c:when test="${not empty adoptions}">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>宠物名称</th>
                                        <th>申请时间</th>
                                        <th>状态</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${adoptions}" var="adoption">
                                        <tr>
                                            <td>${adoption.pet.name}</td>
                                            <td>${adoption.applyTime}</td>
                                            <td>
                                                <span class="badge bg-${adoption.status == '申请中' ? 'warning' : adoption.status == '已通过' ? 'success' : 'danger'}">
                                                    ${adoption.status}
                                                </span>
                                            </td>
                                            <td>
                                                <a href="/pets/${adoption.pet.petId}" class="btn btn-sm btn-outline-primary">
                                                    查看详情
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="alert alert-info text-center">
                            <i class="bi bi-info-circle"></i> 您还没有领养记录
                        </div>
                        <div class="text-center mt-3">
                            <a href="/pets" class="btn btn-primary">浏览可领养宠物</a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>