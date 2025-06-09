<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>宠物管理系统 - 首页</title>
    <style>
        /* 基础样式 */
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        
        .login-container {
            display: flex;
            width: 800px;
            box-shadow: 0 5px 25px rgba(0,0,0,0.2);
            border-radius: 15px;
            overflow: hidden;
        }
        
        /* 左侧欢迎区域 */
        .welcome-section {
            flex: 1;
            background: url('${pageContext.request.contextPath}/static/img/pet-bg.jpg') center/cover;
            color: white;
            padding: 40px;
            position: relative;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        
        .welcome-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.5);
            z-index: 1;
        }
        
        .welcome-content {
            position: relative;
            z-index: 2;
        }
        
        /* 右侧登录区域 */
        .login-section {
            flex: 1;
            background: white;
            padding: 40px;
        }
        
        .login-tabs {
            display: flex;
            margin-bottom: 25px;
            border-bottom: 2px solid #eee;
        }
        
        .tab-btn {
            padding: 12px 25px;
            background: none;
            border: none;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .tab-btn.active {
            border-bottom: 3px solid #4e73df;
            color: #4e73df;
            font-weight: bold;
        }
        
        .login-form {
            display: none;
        }
        
        .login-form.active {
            display: block;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
        }
        
        .form-control {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 15px;
        }
        
        .remember-me {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        
        .remember-me input {
            margin-right: 8px;
        }
        
        .btn-login {
            width: 100%;
            padding: 12px;
            background: #4e73df;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s;
        }
        
        .btn-login:hover {
            background: #2e59d9;
        }
        
        .system-info {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #eee;
            font-size: 14px;
            color: #6c757d;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <!-- 左侧欢迎区域 -->
        <div class="welcome-section">
            <div class="welcome-content">
                <h1>欢迎使用宠物管理系统</h1>
                <p>一站式管理您的宠物信息、领养流程和用户数据</p>
                <ul>
                    <li>🐾 宠物信息管理</li>
                    <li>🏠 领养流程追踪</li>
                    <li>👥 用户权限控制</li>
                    <li>📊 数据统计分析</li>
                </ul>
            </div>
        </div>
        
        <!-- 右侧登录区域 -->
        <div class="login-section">
            <!-- 登录选项卡 -->
            <div class="login-tabs">
                <button class="tab-btn active" onclick="switchTab('user')">用户登录</button>
                <button class="tab-btn" onclick="switchTab('admin')">管理员登录</button>
            </div>
            
            <!-- 用户登录表单 -->
            <form id="user-login" class="login-form active" action="${pageContext.request.contextPath}/user/login" method="POST">
                <div class="form-group">
                    <label for="user-username">用户名</label>
                    <input type="text" id="user-username" name="username" class="form-control" required>
                </div>
                
                <div class="form-group">
                    <label for="user-password">密码</label>
                    <input type="password" id="user-password" name="password" class="form-control" required>
                </div>
                
                <div class="remember-me">
                    <input type="checkbox" id="user-remember" name="rememberMe" value="true">
                    <label for="user-remember">自动登录</label>
                </div>
                
                <button type="submit" class="btn-login">用户登录</button>
            </form>
            
            <!-- 管理员登录表单 -->
            <form id="admin-login" class="login-form" action="${pageContext.request.contextPath}/admin/login" method="POST">
                <div class="form-group">
                    <label for="admin-username">管理员账号</label>
                    <input type="text" id="admin-username" name="username" class="form-control" required>
                </div>
                
                <div class="form-group">
                    <label for="admin-password">管理员密码</label>
                    <input type="password" id="admin-password" name="password" class="form-control" required>
                </div>
                
                <div class="remember-me">
                    <input type="checkbox" id="admin-remember" name="rememberMe" value="true">
                    <label for="admin-remember">自动登录</label>
                </div>
                
                <button type="submit" class="btn-login">管理员登录</button>
            </form>
            
            <!-- 系统信息 -->
            <div class="system-info">
                <p>首次使用？<a href="${pageContext.request.contextPath}/user/register">注册新账号</a></p>
                <p>忘记密码？<a href="${pageContext.request.contextPath}/user/reset-password">重置密码</a></p>
            </div>
        </div>
    </div>

    <script>
        // 切换登录选项卡
        function switchTab(tab) {
            // 隐藏所有表单
            document.querySelectorAll('.login-form').forEach(form => {
                form.classList.remove('active');
            });
            
            // 移除所有按钮激活状态
            document.querySelectorAll('.tab-btn').forEach(btn => {
                btn.classList.remove('active');
            });
            
            // 显示选中表单
            document.getElementById(tab + '-login').classList.add('active');
            
            // 激活选中按钮
            event.currentTarget.classList.add('active');
        }
        
        // 自动登录功能处理（需结合后端AutoLoginFilter）
        document.addEventListener('DOMContentLoaded', function() {
            const rememberCheckboxes = document.querySelectorAll('input[name="rememberMe"]');
            rememberCheckboxes.forEach(checkbox => {
                checkbox.addEventListener('change', function() {
                    if(this.checked) {
                        console.log("自动登录已启用，将设置长期有效的Cookie");
                    }
                });
            });
        });
    </script>
</body>
</html>
