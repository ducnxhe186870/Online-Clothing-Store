

<!-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Boxicons -->
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="images/favicon.png" type="image/png">

<!-- My CSS -->
<link rel="stylesheet" href="../stylesheet/AddBlog.css">

<title>Add new Blog</title>
</head>
<body>
    <!-- SIDEBAR -->
    <section id="sidebar">
        
        <a href="#" class="brand">
           
            <span class="text">Clothes Store </span>
        </a>
        <ul class="side-menu top">
            <li class="active">
                <a href="#">
                    <i class='bx bxs-dashboard' ></i>
                    <span class="text">Dashboard</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <i class='bx bxs-shopping-bag-alt' ></i>
                    <span class="text">Product</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <i class='bx bxl-blogger' ></i>
                    <span class="text">Post</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <i class='bx bx-receipt'></i>
                    <span class="text">Combo</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <i class='bx bxs-barcode' ></i>
                    <span class="text">Order</span>
                </a>
            </li>

            <li>
                <a href="#">
                    <i class='bx bxs-user' ></i>
                    <span class="text">Customer</span>
                </a>
            </li>
        </ul>
        <ul class="side-menu">
            <li>
                <a href="#">
                    <i class='bx bxs-cog' ></i>
                    <span class="text">Settings</span>
                </a>
            </li>
            <li>
                <a href="#" class="logout">
                    <i class='bx bxs-log-out-circle' ></i>
                    <span class="text">Logout</span>
                </a>
            </li>
        </ul>
    </section>
    <!-- SIDEBAR -->

    <!-- CONTENT -->
    <section id="content">
        <!-- NAVBAR -->
        <nav>
            <i class='bx bx-menu' ></i>
            <a href="#" class="nav-link">Add new Blog</a>


            <input type="checkbox" id="switch-mode" hidden>


        </nav>
        <!-- NAVBAR -->

        <!--Main-->



        <main>



            <style>
                img{
                    width: 200px;
                    height: 120px;
                }
            </style>

            <div class="container">

            </div>
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="add" method="post">
                            <div class="modal-header" >						
                                <h4 class="modal-title">Add new Blog</h4>
                            </div>
                            <div class="modal-body">

                                <div class="form-group">
                                    <label>Title</label>
                                    <input name="tittle" type="text" class="form-control" pattern=".{6,}" required/>
                                </div>
                              
                                <div class="form-group">
                                    <label>Toppic</label>
                                    <select name="toppic" class="form-control">
                                        <option value="News" ${param.toppic == 'News' ? 'selected' : ''}>News</option>
                                        <option value="Product" ${param.toppic == 'Product' ? 'selected' : ''}>Product</option>
                                        <option value="Sale" ${param.toppic == 'Sale' ? 'selected' : ''}>Sale</option>
                                    </select>

                                </div>
                                <div class="form-group">
                                    <label>Image<div style="color: red; display: inline;">*</div></label>
                                    <input name="image" type="file" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <div class="form-group">
                                        <label>Detail</label>
                                        <textarea name="detail" type="text" rows="8" cols="65"  type="text" class="form-control" required minlength="50" maxlength="1000"></textarea>
                                    </div>

                                    <label>Date</label>
                                    <input value="${param.date}" name="date" type="date" class="form-control" required>
                                </div>


                                <%-- Kiểm tra xem có thông báo thành công không --%>
                                <% if (request.getAttribute("message") != null) { %>
                                <div class="success-message" style="color: green">
                                    <%= request.getAttribute("message") %>
                                </div>
                                <script>
                                    setTimeout(function () {
                                        window.location.href = "../view/PostManage";
                                    }, 2000);
                                </script>
                                <% } else if (request.getAttribute("message-error") != null) { %>
                                <div class="error-message" style="color: red">
                                    <%= request.getAttribute("message-error") %>
                                </div>
                                <script>
                                    setTimeout(function () {
                                        document.getElementsByClassName("error-message")[0].style.display = "none";
                                    }, 3000);
                                </script>
                                <% } %>
                            </div>
                            <div class="modal-footer">
                                <a href="../view/PostManage"><button class="btn" type="button" style="color: white" >Cancel</button></a>                               
                                <button type="submit"  value="Update" class="btn" style="color: white" onclick="return confirmDelete(0)">Add</button>
                            </div>
                            <script type="text/javascript">
                                function confirmDelete(option) {
                                    if (option === 0) {
                                        if (window.confirm("Bạn có chắc muốn add sản phẩm này?")) {
                                            return true;
                                        } else {
                                            return false;
                                        }
                                    }
                                }
                            </script>
                        </form>
                    </div>
                </div>
            </div>

            </div>


            <script src="js/manager.js" type="text/javascript"></script>
            <script src="ckeditor/ckeditor.js" type="text/javascript"></script>
        </main>
    </section>
</body>
</html>
