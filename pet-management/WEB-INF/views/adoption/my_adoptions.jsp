<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="pageTitle" value="我的领养申请" />
<c:set var="contentPage" value="/WEB-INF/views/adoption/my_adoptions.jsp" />
<jsp:include page="/WEB-INF/views/layout.jsp" />

<div class="container mt-4">
    <h2 class="mb-4">我的领养申请</h2>
    
    <c:choose>
        <c:when test="${not empty adoptions}">
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead class="table-light">
                        <tr>
                            <th>宠物名称</th>
                            <th>申请时间</th>
                            <th>状态</th>
                            <th>处理时间</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${adoptions}" var="adoption">
                            <tr>
                                <td>${adoption.pet.name}</td>
                                <td>${adoption.applyTime}</td>
                                <td>
                                    <span class="badge ${adoption.status == '申请中' ? 'bg-warning' : 
                                                      adoption.status == '已通过' ? 'bg-success' : 'bg-danger'}">
                                        ${adoption.status}
                                    </span>
                                </td>
                                <td>${adoption.processTime != null ? adoption.processTime : '-'}</td>
                                <td>
                                    <a href="/pets/${adoption.pet.petId}" class="btn btn-sm btn-outline-primary">
                                        查看宠物
                                    </a>
                                    <c:if test="${adoption.status == '申请中'}">
                                        <button class="btn btn-sm btn-outline-danger" 
                                            onclick="cancelAdoption(${adoption.adoptId})">
                                            取消申请
                                        </button>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:when>
        <c:otherwise>
            <div class="alert alert-info">
                <i class="bi bi-info-circle"></i> 您还没有提交任何领养申请
            </div>
            <div class="text-center mt-4">
                <a href="/pets" class="btn btn-primary">浏览可领养宠物</a>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<script>
function cancelAdoption(adoptId) {
    if (confirm('确定要取消此领养申请吗？')) {
        fetch('/adoptions/cancel/' + adoptId, {
            method: 'POST'
        })
        .then(response => {
            if (response.ok) {
                location.reload();
            } else {
                alert('取消失败，请重试');
            }
        });
    }
}
</script>