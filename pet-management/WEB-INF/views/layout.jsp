<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>宠物管理系统 - ${pageTitle}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        body {
            background-color: #f8f9fa;
            padding-top: 70px;
        }
        .navbar-brand {
            font-weight: bold;
        }
        .card {
            transition: transform 0.2s;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        .pet-image {
            height: 200px;
            object-fit: cover;
        }
        .status-badge {
            position: absolute;
            top: 10px;
            right: 10px;
            z-index: 1;
        }
        .footer {
            background-color: #f8f9fa;
            padding: 20px 0;
            margin-top: 40px;
        }
    </style>
</head>
<body>
    <!-- 导航栏 -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
        <div class="container">
            <a class="navbar-brand" href="/">🐾 宠物之家</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/pets">宠物列表</a>
                    </li>
                    <c:if test="${isAdmin}">
                        <li class="nav-item">
                            <a class="nav-link" href="/pets/add">添加宠物</a>
                        </li>
                    </c:if>
                </ul>
                <ul class="navbar-nav">
                    <c:choose>
                        <c:when test="${isLoggedIn}">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown">
                                    <i class="bi bi-person-circle"></i> ${currentUser.username}
                                </a>
                                <ul class="dropdown-menu dropdown-menu-end">
                                    <li><a class="dropdown-item" href="/profile"><i class="bi bi-person"></i> 个人中心</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="/logout"><i class="bi bi-box-arrow-right"></i> 退出</a></li>
                                </ul>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="nav-item">
                                <a class="nav-link" href="/register"><i class="bi bi-person-plus"></i> 注册</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/login"><i class="bi bi-box-arrow-in-right"></i> 登录</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </nav>

    <!-- 页面内容 -->
    <div class="container">
        <c:if test="${not empty success}">
            <div class="alert alert-success alert-dismissible fade show mt-4" role="alert">
                ${success}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-danger alert-dismissible fade show mt-4" role="alert">
                ${error}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </c:if>
        
        <jsp:include page="${contentPage}" />
    </div>

    <!-- 页脚 -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h5>关于我们</h5>
                    <p>宠物之家致力于为流浪宠物寻找温暖的家，提供专业的宠物领养服务。</p>
                </div>
                <div class="col-md-3">
                    <h5>快速链接</h5>
                    <ul class="list-unstyled">
                        <li><a href="/pets">宠物列表</a></li>
                        <li><a href="#">领养指南</a></li>
                        <li><a href="#">联系我们</a></li>
                    </ul>
                </div>
                <div class="col-md-3">
                    <h5>联系我们</h5>
                    <address>
                        <strong>宠物之家</strong><br>
                        北京市海淀区中关村大街1号<br>
                        电话: (010) 1234-5678<br>
                        邮箱: contact@pet-home.com
                    </address>
                </div>
            </div>
            <hr>
            <div class="text-center">
                <p>&copy; 2023 宠物之家管理系统. 保留所有权利.</p>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // 激活当前页面的导航链接
        document.addEventListener('DOMContentLoaded', function() {
            const currentPath = window.location.pathname;
            document.querySelectorAll('.nav-link').forEach(link => {
                if (link.getAttribute('href') === currentPath) {
                    link.classList.add('active');
                }
            });
        });
    </script>
</body>
</html>