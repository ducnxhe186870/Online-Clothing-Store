
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Boxicons -->
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- My CSS -->

        <link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheet/maketing.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <link rel=”stylesheet” href=”https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css”> <script
        src=”https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js”></script> <script
        src=”https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js”></script> <script
        src=”https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js”></script> 
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheet/stockManage.css">
        <!-- Boxicons -->
        <title>User</title>

        <style>
            .pagination a {
                color: black;
                float: left;
                padding: 4px 9px;
                text-decoration: none;
                transition: background-color .3s;
                border-radius: 10px;
            }
            .pagination a.active {
                background-color: black;
                color: white;
                border-radius: 10px;
                font-weight: bold;
            }
            .pagination a:hover:not(.active) {
                background-color: #b0b0b0;
                border-radius: 10px;
                font-weight: bolder;
            }

            .container {
                position: relative;
                --size-button: 30px;
            }

            .input {
                padding-left: var(--size-button);
                height: var(--size-button);
                font-size: 13px;
                border: none;
                color: black;
                outline: none;
                width: var(--size-button);
                transition: all ease 0.3s;
                background-color: #EFEFEF;

                border-radius: 50px;
                cursor: pointer;
            }

            .input:focus,
            .input:not(:invalid) {
                width: 200px;
                cursor: text;

            }

            .input:focus + .icon,
            .input:not(:invalid) + .icon {
                pointer-events: all;
                cursor: pointer;
            }

            .container .icon {
                color: black;
                position: absolute;
                width: var(--size-button);
                height: var(--size-button);
                top: 0;
                left: 0;
                padding: 7px;
                pointer-events: none;
            }

            .container .icon svg {
                width: 100%;
                height: 100%;
            }

            .ca a{
                font-size: 13px;
                color: black;
                border-bottom: 2px solid black;
                border-radius:10px;
                padding:0 5px;
                font-weight: 600;
                margin: 0 5px
            }
            .caName:hover{
                font-weight: 600;
                font-size:large;
            }

            .popup-overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;

                display: none;
                justify-content: center;
                align-items: center;

            }

            .popup-content {
                background-color: #FFF;
                padding: 20px;
                max-width: 400px;
                border-radius: 5px;
                border: 2px dotted black;
            }

            .close-button {
                position: absolute;
                top: 10px;
                right: 10px;
                cursor: pointer;
            }

            .button {
                background-color: white; /* Green */
                border: 1px solid black;
                color: black;
                padding: 15px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 13px;
                margin-bottom: 5px;
            }

            * {
                box-sizing: border-box;
            }

            .row {
                padding: 10px;
                border: 20px;
                display: flex;
                margin-left:-5px;
                margin-right:-5px;
            }

            .column {

                width: 100%;
                padding: 5px;
            }

            /* Clearfix (clear floats) */
            .row::after {
                content: "";
                clear: both;
                display: table;
            }

            table {
                border: 20px;
                border-collapse: collapse;
                border-spacing: 0;
                width: 100%;
                border: 1px solid #ddd;
            }
            th{
                color: #008bff;
                font-weight: 700;
            }
            th, td {
                text-align: left;
                padding-left: 5px;
                padding: 10px 10px;
            }

            tr:nth-child(even) {
                background-color: #FFFFFF;
            }
        </style>
    </head>
    <body>
        <!-- SIDEBAR -->    
        <jsp:include page="../components/MenuBar_Manage.jsp">
            <jsp:param name="activeUser" value="active"/>
            <jsp:param name="hrefAdmin" value="../view/AdminDashboard?table=product"/>
        </jsp:include>
        <!-- SIDEBAR -->

        <!-- CONTENT -->
        <section id="content">
            <!-- NAVBAR -->
            <nav>
                <i class='bx bx-menu' ></i>
                <form action="../view/user" method="get" onsubmit="event.preventDefault(); submitForm();" style="display: ">
                    <div class="container">
                        <input hidden value="${role}" name="role">
                        <input hidden value="1" name="page">
                        <input placeholder="Type to search..."  class="input" name="txt" type="text" value="${requestScope.txt}" >
                        <div class="icon">
                            <svg viewBox="0 0 512 512" class="ionicon" xmlns="http://www.w3.org/2000/type="submit"svg">
                            <title>Search</title>
                            <path stroke-width="32" stroke-miterlimit="10" stroke="currentColor" fill="none" d="M221.09 64a157.09 157.09 0 10157.09 157.09A157.1 157.1 0 00221.09 64z"></path>
                            <path d="M338.29 338.29L448 448" stroke-width="32" stroke-miterlimit="10" stroke-linecap="round" stroke="currentColor" fill="none"></path>
                            </svg>
                        </div>
                    </div>
                    <input type="submit" hidden="">
                </form>
            </nav>


            <script>
                function submitForm() {
                    // Xử lý logic của việc submit form ở đây
                    // Ví dụ: Gửi dữ liệu form đến server bằng Ajax hoặc refresh trang
                    document.forms[0].submit(); // Submit form
                }
            </script>
            <!-- NAVBAR -->
            <!-- MAIN -->
            <main>

                <c:if test="${sessionScope.account.roleID == 1}">
                    <form action="AddUser" method="get">
                        <input style="margin-top: 30px; padding: 10px 50px; border-radius: 20px" class="button" type="submit" value="AddUser">
                    </form>
                </c:if>
                
                <div class="col-1 text-center" style="margin: auto">
                                <div class="dropdown ">
                                    <button  class=" dropdown-toggle px-3" data-bs-toggle="dropdown" aria-expanded="false" style="border-radius: 4px;box-shadow: 0 2px 6px rgba(0, 0, 0, 0.15);">
                                        <span class="p-3" >Role</span>
                                    </button>
                                    <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="user?txt=${requestScope.txt}&role=All&page=1">All</a></li>
                                            <li><a class="dropdown-item" href="user?txt=${requestScope.txt}&role=Customer&page=1">Customer</a></li>
                                            <li><a class="dropdown-item" href="user?txt=${requestScope.txt}&role=Marketing&page=1">Marketing</a></li>
                                            <li><a class="dropdown-item" href="user?txt=${requestScope.txt}&role=Sale&page=1">Sale</a></li>
                                    </ul>
                                </div>

                            </div>
                
                

                <div style="margin: auto;">
                    <div class="row" >
                        <div class="column">
                            <table>
                                <tr style="" >
                                    <th>Gmail</th>
                                    <th>Name</th>
                                    <th>Gender</th>
                                    <th>Role</th>
                                    <th>Status</th>
                                </tr><c:forEach items="${listAcc}" var="o">
                                    <tr style="padding: 0">
                                        <td><a style="color:black" href='userDetail?gmail=${o.gmail}'>${o.gmail}</a></td>
                                        <td style="margin-bottom: 5px">${o.name}</td>
                                        <td>${o.gender?"Male":"Female"}</td>
                                        <c:if test="${o.roleID ==1}">
                                            <td>Admin</td>
                                        </c:if>
                                        <c:if test="${o.roleID ==2}">
                                            <td>Marketing</td>
                                        </c:if>
                                        <c:if test="${o.roleID ==3}">
                                            <td>Sale</td>
                                        </c:if>
                                        <c:if test="${o.roleID ==4}">
                                            <td>Customer</td>
                                        </c:if>
                                        <td>${o.accStatus?"On":"Off"}</td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>

                
                 <div class="check" style="float:  right; text-align: center">
                    <div class="pagination" style="margin: auto">
                        
                        <a href="user?txt=${requestScope.txt}&role=${role}&page=${page-1}">&laquo;</a>
                        <c:forEach begin="1" end="${endPage}" var="o">
                            <a class="${page == o? "active" : ""}" href="user?txt=${requestScope.txt}&role=${role}&page=${o}">${o}</a>
                        </c:forEach>
                        <a href="user?txt=${requestScope.txt}&role=${role}&page=${page+1}">&raquo;</a>
                    </div>
                </div> 
                    
                    
            </main>
            <!-- MAIN -->
        </section>
        <!-- CONTENT -->
        <script src="../js/MaketingPage.js"></script>
    </body>
</html>
