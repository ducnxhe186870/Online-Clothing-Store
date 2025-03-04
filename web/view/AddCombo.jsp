<%-- 
    Document   : StockManage
    Created on : February 12, 2025, 9:02:00 AM
    Author     : ducnx
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Boxicons -->
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- My CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheet/stockManage.css">

        <title>Stock Manage</title>

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
        </style>
    </head>
    <body>
        <!-- SIDEBAR -->
        <jsp:include page="../components/MenuBar_Manage.jsp">
            <jsp:param value="active3" name="active"/> 
            <jsp:param name="hrefMarketing" value="../view/marketingDashboard?table=product"/>
        </jsp:include>
        <!-- SIDEBAR -->
        <!-- CONTENT -->
        <section id="content">
            <!-- NAVBAR -->
            <nav>
                <i class='bx bx-menu' ></i>
                <form action="../view/addCombo" method="get" onsubmit="event.preventDefault(); submitForm();" style="display: ">

                    <input hidden value="${requestScope.caID}" name="caID">
                    <input hidden value="new" name="sort">
                    <div class="container">
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

                <script>
                    function submitForm() {
                        // Xử lý logic của việc submit form ở đây
                        // Ví dụ: Gửi dữ liệu form đến server bằng Ajax hoặc refresh trang
                        document.forms[0].submit(); // Submit form
                    }
                </script>

                <div class="list">

                    <ul class="box-Choose" style="display: flex; justify-content: center; float: right">
                        <li style="margin-right: 100px;">
                        </li>
                        <li style="margin-right: 30px; ">
                            <form action="" method="">
                                <input hidden value="product" name="list">
                                <input hidden value="" name="caID">
                                <input hidden value="new" name="sort">
                                <button class="btn" style="border-bottom: 2px solid black;" type="submit"> <h4>Add Combo</h4>
                                </button>
                            </form>
                        </li>
                    </ul>
                </div>

            </nav>
            <!-- NAVBAR -->

            <!-- MAIN -->
            <main style="padding-top: 10px">
                <div style="display: flex">
                    <div style="width: 70%">
                        <c:if test="${requestScope.listP == null}">
                            <div class="table-data" style="display: ${requestScope.listP} ">
                                <div class="order">
                                    <div class="head" style="justify-content: space-between">
                                        <div style="justify-content: space-around">
                                            <a style="margin: 0 5px; color: #202425; ${requestScope.sort_list == "new"? "font-weight : 800":""};" href="../view/addCombo?caID=&sort=new&txt=${txt}"> Normal</a>
                                            <a style="margin: 0 5px; color: #202425;${requestScope.sort_list == "low"? "font-weight : 800":""};" href="../view/addCombo?caID=${requestScope.caID}&sort=low&txt=${txt}"> Low</a>
                                            <a style="margin: 0 5px; color: #202425; ${requestScope.sort_list == "high"? "font-weight : 800":""};" href="../view/addCombo?caID=${requestScope.caID}&sort=high&txt=${txt}"> High</a>
                                        </div>
                                        <div class="ca" style="">
                                            <c:forEach items="${requestScope.listCa}" var="o">
                                                <a  style=" ${requestScope.caID == o.caID? "color: orange": ""};" class="caName"
                                                    href="../view/addCombo?caID=${o.caID}&sort=new&txt=${txt}">${o.caName} </a>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <table> 
                                        <thead>
                                            <tr>
                                                <th>Id</th>
                                                <th>Name</th>
                                                <th>Detail</th>
                                                <th>Category</th>
                                                <th>Price</th>
                                                <th>Status</th>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.listProduct}" var="o">
                                                <tr>
                                                    <td>${o.proID}</td>
                                                    <td style="display: flex;">
                                                        <c:forEach items="${requestScope.list_img}" var="i">
                                                            <c:if test="${o.proID==i.proID}">  
                                                                <img src="../${i.proImg}">
                                                            </c:if>  
                                                        </c:forEach> 
                                                        <p>${o.proName}</p>
                                                    </td>
                                                    <td>
                                                        <a href="#" onclick="showPopup()" style="color: black">View Detail</a>
                                                        <div class="popup-overlay" id="popupOverlay_${o.proID}">
                                                            <div class="popup-content">
                                                                <a  style="font-weight: 800; font-size:larger ; cursor: pointer; text-align: center; color: pink" onclick="closePopup()">X</a>
                                                                <div >
                                                                    <p>${o.proDetail}</p>  
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <script>
                                                            function showPopup() {
                                                                var popupOverlay = document.getElementById('popupOverlay_${o.proID}');
                                                                popupOverlay.style.display = 'flex';
                                                            }

                                                            function closePopup() {
                                                                var popupOverlay = document.getElementById('popupOverlay_${o.proID}');
                                                                popupOverlay.style.display = 'none';
                                                            }
                                                        </script>

                                                    </td>
                                                    <c:forEach items="${requestScope.list_Category}" var="j">
                                                        <c:if test="${o.caID==j.caID}">  
                                                            <td>${j.caName}</td>
                                                        </c:if>
                                                    </c:forEach> 

                                                    <td>${o.proPrice}</td>

                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${o.proID==requestScope.pro1.proID}">
                                                                <a class="dropdown-item" href="../view/addCombo?index=${indexNow}&caID=${requestScope.caID}&sort=${requestScope.sort_list}&txt=${txt}&del=${o.proID}">selected</a>
                                                            </c:when>
                                                            <c:when test="${o.proID==requestScope.pro2.proID}">
                                                                <a class="dropdown-item" href="../view/addCombo?index=${indexNow}&caID=${requestScope.caID}&sort=${requestScope.sort_list}&txt=${txt}&del=${o.proID}">selected</a>
                                                            </c:when>
                                                            <c:when test="${o.proID==requestScope.pro3.proID}">
                                                                <a class="dropdown-item" href="../view/addCombo?index=${indexNow}&caID=${requestScope.caID}&sort=${requestScope.sort_list}&txt=${txt}&del=${o.proID}">selected</a>
                                                            </c:when>
                                                            <c:when test="${o.proID==requestScope.pro4.proID}">
                                                                <a class="dropdown-item" href="../view/addCombo?index=${indexNow}&caID=${requestScope.caID}&sort=${requestScope.sort_list}&txt=${txt}&del=${o.proID}">selected</a>
                                                            </c:when>

                                                            <c:otherwise>
                                                                <a class="dropdown-item" href="../view/addCombo?index=${indexNow}&caID=${requestScope.caID}&sort=${requestScope.sort_list}&txt=${txt}&pro=${o.proID}">select</a>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>

                                                </tr>
                                            </c:forEach>
                                        </tbody>

                                    </table>

                                </div>

                            </div>

                        </c:if>

                        <div class="check" style="display: ${requestScope.none1} ;float:  right; text-align: center">
                            <div class="pagination" style="margin: auto">
                                <a href="../view/addCombo?index=${indexNow - 1}&caID=${requestScope.caID}&sort=${requestScope.sort_list}&txt=${txt}">&laquo;</a>
                                <c:forEach begin="1" end="${endPage}" var="o">
                                    <a class="${indexNow == o? "active" : ""}" href="../view/addCombo?index=${o}&caID=${requestScope.caID}&sort=${requestScope.sort_list}&txt=${txt}">${o}</a>
                                </c:forEach>
                                <a href="../view/addCombo?index=${indexNow + 1}&caID=${requestScope.caID}&sort=${requestScope.sort_list}&txt=${txt}">&raquo;</a>
                            </div>
                        </div> 

                        <h4 style="text-align: center; margin-top: 20px; font-weight: 200">${requestScope.Message}</h4> 
                    </div>

                    <div style="width:30%; background-color: #EFEFEF; border-radius: 10px; margin-left: 10px" >
                        ${mess}
                        <form action="addCombo" method="post">
                            Name:<input style="border: none; border-radius: 10px; height: 25px; padding: 5px;margin: 5px;" type="text" name="namec" value="${namec}" required=""><br>
                            Price: ${price} VND<br>
                            <input hidden="" type="text" name="pricec" value="${requestScope.price}">
                            <div class="table-data" style="display: ${requestScope.lps} ">
                                <div class="order">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>Id</th>
                                                <th>Image</th>
                                                <th>Price</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.lps}" var="o">
                                                <tr>
                                                    <td>${o.proID}</td>
                                                    <td style="display: flex;">
                                                        <c:forEach items="${requestScope.list_img}" var="i">
                                                            <c:if test="${o.proID==i.proID}">  
                                                                <img src="../${i.proImg}">
                                                            </c:if>  
                                                        </c:forEach> 
                                                    </td>

                                                    <td>${o.proPrice}</td>

                                                    <td>
                                                        <a class="dropdown-item" href="../view/addCombo?index=${indexNow}&caID=${requestScope.caID}&sort=${requestScope.sort_list}&txt=${txt}&del=${o.proID}">Cancel</a>

                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>

                                    </table>

                                </div>
                            </div>

                            <button class="btn" style="border-bottom: 2px solid black;" type="submit"> <h4>Add Combo</h4>
                            </button>
                        </form>


                    </div>
                </div>
            </main>

            <!-- MAIN -->
        </section>

        <!-- CONTENT -->
        <script src="../js/MaketingPage.js"></script>
    </body>
</html>
