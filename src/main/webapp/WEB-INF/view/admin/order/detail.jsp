<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="LaptopShop - Dự án laptopshop" />
                <meta name="author" content="LaptopShop" />
                <title>Order Detail with ID ${id}</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />

                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Order Detail with ID ${id}</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item">Order Detail with ID ${id}</li>
                                </ol>
                                <div class="container mt-5">
                                    <div class="row">
                                        <div class="col-12 mx-auto">
                                            <div class="d-flex justify-content-between">
                                                <h3>Order Detail with ID ${id}</h3>
                                            </div>
                                            <hr />
                                            <div class="table-responsive">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">Sản phẩm</th>
                                                            <th scope="col">Tên</th>
                                                            <th scope="col">Giá</th>
                                                            <th scope="col">Số lượng</th>
                                                            <th scope="col">Thành tiền</th>

                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="cartDetail" items="${cartDetails}"
                                                            varStatus="status">
                                                            <tr>
                                                                <th scope="row">
                                                                    <div class="d-flex align-items-center">
                                                                        <img src="images/product/${cartDetail.product.image}"
                                                                            class="img-fluid me-5 rounded-circle"
                                                                            style="width: 80px; height: 80px;" alt="">
                                                                    </div>
                                                                </th>
                                                                <td>
                                                                    <p class="mb-0 mt-4">
                                                                        <a href="/product/${cartDetail.product.id}"
                                                                            target="_blank">${cartDetail.product.name}</a>
                                                                    </p>
                                                                </td>
                                                                <td>
                                                                    <p class="mb-0 mt-4">
                                                                        <fmt:formatNumber type="number"
                                                                            value="${cartDetail.product.price}" />
                                                                        đ
                                                                    </p>
                                                                </td>
                                                                <td>
                                                                    <div class="input-group quantity mt-4"
                                                                        style="width: 100px;">
                                                                        <div class="input-group-btn">
                                                                            <button
                                                                                class="btn btn-sm btn-minus rounded-circle bg-light border">
                                                                                <i class="fa fa-minus"></i>
                                                                            </button>
                                                                        </div>
                                                                        <input type="text"
                                                                            class="form-control form-control-sm text-center border-0"
                                                                            value="${cartDetail.quantity}"
                                                                            data-cart-detail-id="${cartDetail.id}"
                                                                            data-cart-detail-price="${cartDetail.price}"
                                                                            data-cart-detail-index="${status.index}">

                                                                        <div class="input-group-btn">
                                                                            <button
                                                                                class="btn btn-sm btn-plus rounded-circle bg-light border">
                                                                                <i class="fa fa-plus"></i>
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <p class="mb-0 mt-4"
                                                                        data-cart-detail-id="${cartDetail.id}">
                                                                        <fmt:formatNumber type="number"
                                                                            value="${cartDetail.price * cartDetail.quantity}" />
                                                                        đ
                                                                    </p>
                                                                </td>


                                                            </tr>
                                                        </c:forEach>



                                                    </tbody>
                                                </table>
                                            </div>
                                            <a href="/admin/user" class="btn btn-success mt-3">Back</a>


                                        </div>

                                    </div>
                                </div>
                            </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>

            </body>

            </html>