<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="pageTitle" value="${pet.petId == null ? '添加新宠物' : '编辑宠物信息'}" />
<c:set var="contentPage" value="/WEB-INF/views/pet/form.jsp" />
<jsp:include page="/WEB-INF/views/layout.jsp" />

<div class="row justify-content-center mt-4">
    <div class="col-md-8">
        <div class="card">
            <div class="card-header bg-primary text-white">
                <h4 class="card-title mb-0">${pageTitle}</h4>
            </div>
            <div class="card-body">
                <form method="post" action="${pet.petId == null ? '/pets/add' : '/pets/edit/'}${pet.petId}">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">宠物名称 <span class="text-danger">*</span></label>
                                <input type="text" name="name" value="${pet.name}" class="form-control" required>
                            </div>
                            
                            <div class="mb-3">
                                <label class="form-label">宠物类型 <span class="text-danger">*</span></label>
                                <select name="type" class="form-select" required>
                                    <option value="狗" ${pet.type == '狗' ? 'selected' : ''}>狗</option>
                                    <option value="猫" ${pet.type == '猫' ? 'selected' : ''}>猫</option>
                                    <option value="鸟" ${pet.type == '鸟' ? 'selected' : ''}>鸟</option>
                                    <option value="其他" ${pet.type == '其他' ? 'selected' : ''}>其他</option>
                                </select>
                            </div>
                            
                            <div class="mb-3">
                                <label class="form-label">品种</label>
                                <input type="text" name="breed" value="${pet.breed}" class="form-control">
                            </div>
                            
                            <div class="mb-3">
                                <label class="form-label">年龄</label>
                                <input type="number" name="age" value="${pet.age}" min="0" max="30" class="form-control">
                            </div>
                        </div>
                        
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">性别</label>
                                <select name="gender" class="form-select">
                                    <option value="公" ${pet.gender == '公' ? 'selected' : ''}>公</option>
                                    <option value="母" ${pet.gender == '母' ? 'selected' : ''}>母</option>
                                    <option value="未知" ${pet.gender == '未知' ? 'selected' : ''}>未知</option>
                                </select>
                            </div>
                            
                            <div class="mb-3">
                                <label class="form-label">健康状况</label>
                                <input type="text" name="healthStatus" value="${pet.healthStatus}" class="form-control">
                            </div>
                            
                            <div class="mb-3">
                                <label class="form-label">领养状态 <span class="text-danger">*</span></label>
                                <select name="adoptionStatus" class="form-select" required>
                                    <option value="待领养" ${pet.adoptionStatus == '待领养' ? 'selected' : ''}>待领养</option>
                                    <option value="已领养" ${pet.adoptionStatus == '已领养' ? 'selected' : ''}>已领养</option>
                                    <option value="医疗中" ${pet.adoptionStatus == '医疗中' ? 'selected' : ''}>医疗中</option>
                                </select>
                            </div>
                            
                            <div class="mb-3">
                                <label class="form-label">图片URL</label>
                                <input type="text" name="imageUrl" value="${pet.imageUrl}" class="form-control">
                            </div>
                        </div>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">宠物描述</label>
                        <textarea name="description" class="form-control" rows="4">${pet.description}</textarea>
                    </div>
                    
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                        <a href="/pets" class="btn btn-secondary me-md-2">取消</a>
                        <button type="submit" class="btn btn-primary">${pet.petId == null ? '添加宠物' : '更新信息'}</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>