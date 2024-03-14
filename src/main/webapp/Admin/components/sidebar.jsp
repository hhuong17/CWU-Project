<%-- 
    Document   : sidebart
    Created on : Feb 27, 2024, 10:59:33 PM
    Author     : LENOVO
--%>
<link rel="stylesheet" href="https://cdn.materialdesignicons.com/5.4.55/css/materialdesignicons.min.css">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
    <ul class="nav">
        <li class="nav-item">
            <a class="nav-link" href="/CWU/admin">
                <span class="icon-bg"><i class="mdi mdi-chart-bar menu-icon"></i></span>
                <span class="menu-title">Dashboard</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
                <span class="icon-bg"><i class="mdi mdi-crosshairs-gps menu-icon"></i></span>
                <span class="menu-title">Product Management</span>
                <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"> <a class="nav-link" href="/CWU/admin/product">Products</a></li>
                    <li class="nav-item"> <a class="nav-link" href="/CWU/admin/product/add">Create product</a></li>
                </ul>
            </div>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/CWU/admin/category">
                <span class="icon-bg"><i class="mdi mdi-cube menu-icon"></i></span>
                <span class="menu-title">Category Management</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/CWU/admin/order">
                <span class="icon-bg"><i class="mdi mdi-cube menu-icon"></i></span>
                <span class="menu-title">Order Management</span>
            </a>
        </li>
<!--        <li class="nav-item">
            <a class="nav-link" href="/CWU/admin/order/confirm">
                <span class="icon-bg"><i class="mdi mdi-format-list-bulleted menu-icon"></i></span>
                <span class="menu-title">Confirm Payment</span>
            </a>
        </li>-->
        <li class="nav-item">
            <a class="nav-link"  href="/CWU/admin/user" >
                <span class="icon-bg"><i class="mdi mdi-lock menu-icon"></i></span>
                <span class="menu-title">User Account Management</span>
                <i class="menu-arrow"></i>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link"  href="/CWU/admin/blog" >
                <span class="icon-bg"><i class="mdi mdi-lock menu-icon"></i></span>
                <span class="menu-title">Blog Management</span>
                <i class="menu-arrow"></i>
            </a>
        </li>
        <li class="nav-item sidebar-user-actions">
            <div class="sidebar-user-menu">
                <a href="/CWU/admin/logout" class="nav-link" onclick="return confirm('Are  you sure to logout?')"><i class="mdi mdi-logout menu-icon"></i>
                    <span class="menu-title">Log Out</span></a>
            </div>
        </li>
        
    </ul>
</nav>
