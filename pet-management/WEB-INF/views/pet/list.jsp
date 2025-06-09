<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="pageTitle" value="宠物列表" />
<c:set var="contentPage" value="/WEB-INF/views/pet/list.jsp" />
<jsp:include page="/WEB-INF/views/layout.jsp" />

<div class="row mt-4">
    <div class="col-md-3">
        <div class="card mb-4">
            <div class="card-header bg-primary text-white">
                <h5 class="card-title mb-0">搜索筛选</h5>
            </div>
            <div class="card-body">
                <form>
                    <div class="mb-3">
                        <label class="form-label">宠物名称</label>
                        <input type="text" name="name" value="${param.name}" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">宠物类型</label>
                        <select name="type" class="form-select">
                            <option value="">全部</option>
                            <option value="狗" ${param.type == '狗' ? 'selected' : ''}>狗</option>
                            <option value="猫" ${param.type == '猫' ? 'selected' : ''}>猫</option>
                            <option value="鸟" ${param.type == '鸟' ? 'selected' : ''}>鸟</option>
                            <option value="其他" ${param.type == '其他' ? 'selected' : ''}>其他</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">领养状态</label>
                        <select name="status" class="form-select">
                            <option value="">全部</option>
                            <option value="待领养" ${param.status == '待领养' ? 'selected' : ''}>待领养</option>
                            <option value="已领养" ${param.status == '已领养' ? 'selected' : ''}>已领养</option>
                            <option value="医疗中" ${param.status == '医疗中' ? 'selected' : ''}>医疗中</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">搜索</button>
                </form>
            </div>
        </div>
    </div>
    
    <div class="col-md-9">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2>宠物列表</h2>
            <c:if test="${isAdmin}">
                <a href="/pets/add" class="btn btn-success">
                    <i class="bi bi-plus-circle"></i> 添加新宠物
                </a>
            </c:if>
        </div>
        
        <c:choose>
            <c:when test="${not empty pets}">
                <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
                    <c:forEach items="${pets}" var="pet">
                        <div class="col">
                            <div class="card h-100">
                                <c:if test="${not empty pet.imageUrl}">
                                    <img src="${pet.imageUrl}" class="card-img-top pet-image" alt="${pet.name}">
                                </c:if>
                                <c:if test="${empty pet.imageUrl}">
                                    <div class="bg-secondary d-flex align-items-center justify-content-center" style="height: 200px;">
                                        <i class="bi bi-image text-light" style="font-size: 4rem;"></i>
                                    </div>
                                </c:if>
                                <span class="badge bg-${pet.adoptionStatus == '待领养' ? 'success' : pet.adoptionStatus == '已领养' ? 'secondary' : 'warning'} status-badge">
                                    ${pet.adoptionStatus}
                                </span>
                                <div class="card-body">
                                    <h5 class="card-title">${pet.name}</h5>
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item">
                                            <strong>品种:</strong> ${empty pet.breed ? '未知' : pet.breed}
                                        </li>
                                        <li class="list-group-item">
                                            <strong>年龄:</strong> ${pet.age} 岁
                                        </li>
                                        <li class="list-group-item">
                                            <strong>性别:</strong> ${pet.gender}
                                        </li>
                                        <li class="list-group-item">
                                            <strong>健康状态:</strong> ${pet.healthStatus}
                                        </li>
                                    </ul>
                                </div>
                                <div class="card-footer d-flex justify-content-between">
                                    <a href="/pets/${pet.petId}" class="btn btn-primary btn-sm">
                                        <i class="bi bi-info-circle"></i> 查看详情
                                    </a>
                                    <c:if test="${isAdmin}">
                                        <div>
                                            <a href="/pets/edit/${pet.petId}" class="btn btn-outline-secondary btn-sm">
                                                <i class="bi bi-pencil"></i>
                                            </a>
                                            <a href="/pets/delete/${pet.petId}" class="btn btn-outline-danger btn-sm" 
                                               onclick="return confirm('确定要删除这只宠物吗？')">
                                                <i class="bi bi-trash"></i>
                                            </a>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <div class="alert alert-info text-center">
                    <i class="bi bi-info-circle-fill"></i> 没有找到符合条件的宠物
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>