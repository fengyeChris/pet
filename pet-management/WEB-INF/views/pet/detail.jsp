<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="pageTitle" value="${pet.name}的详情" />
<c:set var="contentPage" value="/WEB-INF/views/pet/detail.jsp" />
<jsp:include page="/WEB-INF/views/layout.jsp" />

<div class="row mt-4">
    <div class="col-md-5">
        <c:if test="${not empty pet.imageUrl}">
            <img src="${pet.imageUrl}" class="img-fluid rounded shadow" alt="${pet.name}">
        </c:if>
        <c:if test="${empty pet.imageUrl}">
            <div class="bg-secondary d-flex align-items-center justify-content-center" style="height: 300px; border-radius: 10px;">
                <i class="bi bi-image text-light" style="font-size: 6rem;"></i>
            </div>
        </c:if>
        
        <div class="mt-4">
            <div class="d-flex justify-content-between align-items-center">
                <h4 class="mb-0">领养状态</h4>
                <span class="badge bg-${pet.adoptionStatus == '待领养' ? 'success' : pet.adoptionStatus == '已领养' ? 'secondary' : 'warning'} fs-6">
                    ${pet.adoptionStatus}
                </span>
            </div>
            <hr>
            
            <c:if test="${pet.adoptionStatus == '待领养' && isLoggedIn}">
                <button class="btn btn-primary w-100">
                    <i class="bi bi-heart-fill"></i> 申请领养
                </button>
            </c:if>
            
            <c:if test="${isAdmin}">
                <div class="d-grid gap-2 mt-2">
                    <a href="/pets/edit/${pet.petId}" class="btn btn-outline-primary">
                        <i class="bi bi-pencil"></i> 编辑信息
                    </a>
                </div>
            </c:if>
        </div>
    </div>
    
    <div class="col-md-7">
        <div class="card">
            <div class="card-header bg-primary text-white">
                <h3 class="card-title mb-0">${pet.name}的详细信息</h3>
            </div>
            <div class="card-body">
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">
                        <strong><i class="bi bi-tag"></i> 宠物类型:</strong> ${pet.type}
                    </li>
                    <li class="list-group-item">
                        <strong><i class="bi bi-egg-fill"></i> 品种:</strong> ${empty pet.breed ? '未知' : pet.breed}
                    </li>
                    <li class="list-group-item">
                        <strong><i class="bi bi-calendar-event"></i> 年龄:</strong> ${pet.age} 岁
                    </li>
                    <li class="list-group-item">
                        <strong><i class="bi bi-gender-ambiguous"></i> 性别:</strong> ${pet.gender}
                    </li>
                    <li class="list-group-item">
                        <strong><i class="bi bi-heart-pulse"></i> 健康状况:</strong> ${pet.healthStatus}
                    </li>
                    <li class="list-group-item">
                        <strong><i class="bi bi-calendar"></i> 添加时间:</strong> 
                        ${pet.createTime}
                    </li>
                </ul>
                
                <div class="mt-4">
                    <h5><i class="bi bi-card-text"></i> 宠物描述</h5>
                    <p class="card-text">${empty pet.description ? '暂无详细描述' : pet.description}</p>
                </div>
            </div>
        </div>
    </div>
</div>