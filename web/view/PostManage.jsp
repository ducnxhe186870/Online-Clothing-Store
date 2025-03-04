

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Boxicons -->
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- My CSS -->
        <link rel="stylesheet" href="../stylesheet/PostManage.css">

        <title>Post Manage</title>
    </head>
    <body>
        <!-- SIDEBAR -->
        <jsp:include page="../components/MenuBar_Manage.jsp">
            <jsp:param name="active2" value="active"/>
            <jsp:param name="hrefMarketing" value="../view/marketingDashboard?table=product"/>
        </jsp:include>
        <!-- SIDEBAR -->

        <!-- CONTENT -->
        <section id="content">
            <!-- NAVBAR -->
            <nav>
                <i class='bx bx-menu' ></i>
                <a href="#" class="nav-link">Categories</a>

                <input type="checkbox" id="switch-mode" hidden>


            </nav>
            <!-- NAVBAR -->
            <!-- MAIN -->

            <style>
                .form button {
                    border: none;
                    background: none;
                    color: #8b8ba7;
                }
                /* styling of whole input container */
                .form {
                    --timing: 0.3s;
                    --width-of-input: 200px;
                    --height-of-input: 40px;
                    --border-height: 2px;
                    --input-bg: #fff;
                    --border-color: #2f2ee9;
                    --border-radius: 30px;
                    --after-border-radius: 1px;
                    position: relative;
                    width: var(--width-of-input);
                    height: var(--height-of-input);
                    display: flex;
                    align-items: center;
                    padding-inline: 0.8em;
                    border-radius: var(--border-radius);
                    transition: border-radius 0.5s ease;
                    background: var(--input-bg,#fff);
                }
                /* styling of Input */
                .input {
                    font-size: 0.9rem;
                    background-color: transparent;
                    width: 100%;
                    height: 100%;
                    padding-inline: 0.5em;
                    padding-block: 0.7em;
                    border: none;
                }
                /* styling of animated border */
                .form:before {
                    content: "";
                    position: absolute;
                    background: var(--border-color);
                    transform: scaleX(0);
                    transform-origin: center;
                    width: 100%;
                    height: var(--border-height);
                    left: 0;
                    bottom: 0;
                    border-radius: 1px;
                    transition: transform var(--timing) ease;
                }
                /* Hover on Input */
                .form:focus-within {
                    border-radius: var(--after-border-radius);
                }

                input:focus {
                    outline: none;
                }
                /* here is code of animated border */
                .form:focus-within:before {
                    transform: scale(1);
                }
                /* styling of close button */
                /* == you can click the close button to remove text == */
                .reset {
                    border: none;
                    background: none;
                    opacity: 0;
                    visibility: hidden;
                }
                /* close button shown when typing */
                input:not(:placeholder-shown) ~ .reset {
                    opacity: 1;
                    visibility: visible;
                }
                /* sizing svg icons */
                .form svg {
                    width: 17px;
                    margin-top: 3px;
                }
            </style>
            <main>

                <div class="head-title">
                    <div class="left">
                        <a href="../view/PostManage"><h1>Post Managemet</h1></a>
                    </div>
                </div>

                <ul class="box-info">
                    <li>

                        <a href="../view/AddBlog.jsp" style="font-size: 25px ; color: black; padding-left: 85px">Add new Blog</a>

                    </li>
                    <li><a href="../view/PostCate?Ptoppic=News" style="font-size: 25px ; color: black; padding-left: 130px">News</a></li>
                    <li><a href="../view/PostCate?Ptoppic=Product" style="font-size: 25px ; color: black; padding-left: 130px">Product</a></li>
                    <li><a href="../view/PostCate?Ptoppic=Sale" style="font-size: 25px ; color: black; padding-left: 140px">Sale</a></li>

                </ul>


                <div class="table-data">
                    <div class="order">
                        <div class="head">
                            <h3>Recent feedback</h3>
                            <form class="form" action="../view/SearchBlog" method="get">
                                <button>
                                    <svg width="17" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" role="img" aria-labelledby="search">
                                    <path d="M7.667 12.667A5.333 5.333 0 107.667 2a5.333 5.333 0 000 10.667zM14.334 14l-2.9-2.9" stroke="currentColor" stroke-width="1.333" stroke-linecap="round" stroke-linejoin="round"></path>
                                    </svg>
                                </button>
                                <input class="input" placeholder="Type your text" required="" type="text" name="txt">
                                <button class="reset" type="reset">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12"></path>
                                    </svg>
                                </button>
                            </form>

                            <i class='bx bx-filter' ></i>
                        </div> 

                        <table  style="width: 100%; ">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Title</th>
                                    <th>Gmail</th>
                                    <th>Toppic</th>
                                    <th>Image</th>
                                    <th>Date</th>

                                    <th>Delete</th>
                                    <th>Update</th>

                                </tr>
                            </thead>
                            <style>
                                a{
                                    color: black;
                                }
                            </style>
                            <c:forEach items="${listP}" var="p" varStatus="index" begin="0"> 
                                <tbody>
                                    <tr>
                                        <td style="width: 40px">${index.index}</td>
                                        <td style="width: 300px"><a href="../view/blogdeatil?ptittle=${p.tittle}">${p.tittle}</a></td>
                                        <td>${p.gmail}</td>
                                        <td>${p.toppic}</td>
                                        <td><img src="../${p.img}" alt="alt"/></td>                                                                
                                        <td>${p.dob}</td>

                                        <td><a href="../view/delete?dtittle=${p.tittle}"><button class="status completed" onclick="return confirmDelete(0)">Delete</button></a></td>
                                        <td><a href="../view/update?ptittle=${p.tittle}"><button class="status completed">Update</button> </a></td>
                                    </tr>

                                </tbody>
                            </c:forEach>
                        </table>
                    </div>

                    <script type="text/javascript">
                        function confirmDelete(option) {
                            if (option === 0) {
                                if (window.confirm("Bạn có chắc muốn xóa sản phẩm này?")) {
                                    return true;
                                } else {
                                    return false;
                                }
                            }
                        }
                    </script>

            </main>
            <div class="pagination" style="margin-right: 200px; float: right;  ">
                <c:forEach begin="1" end="${endP}" var="e">
                    <a class="" href="../view/PostManage?index=${e}">${e}</a> 
                </c:forEach>
            </div>
            <!-- MAIN -->
        </section>

        <!-- CONTENT -->
        <script src="../js/MaketingPage.js"></script>
    </body>




</html>