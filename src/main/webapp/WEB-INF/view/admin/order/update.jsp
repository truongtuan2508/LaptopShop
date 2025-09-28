<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="LaptopShop - Dự án laptopshop" />
                    <meta name="author" content="LaptopShop" />
                    <title>Update Order</title>
                    <link href="/css/styles.css" rel="stylesheet" />
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                </head>

                <body class="sb-nav-fixed">
                    <jsp:include page="../layout/header.jsp" />

                    <div id="layoutSidenav">
                        <jsp:include page="../layout/sidebar.jsp" />
                        <div id="layoutSidenav_content">
                            <main>
                                <div class="container-fluid px-4">
                                    <h1 class="mt-4">Update Order</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                        <li class="breadcrumb-item">Update Order</li>
                                    </ol>
                                    <div class="container mt-5">
                                        <div class="row">
                                            <div class="col-md-8 col-12 mx-auto">
                                                <h3>Update Order ${newOrder.id}</h3>
                                                <hr />

                                                <!-- Order Information Display -->
                                                <div class="card mb-4">
                                                    <div class="card-header">
                                                        <h5 class="mb-0">Order Information</h5>
                                                    </div>
                                                    <div class="card-body">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <p><strong>Order ID:</strong> ${newOrder.id}</p>
                                                                <p><strong>Total Price:</strong>
                                                                    <fmt:formatNumber type="number"
                                                                        value="${newOrder.totalPrice}" />đ
                                                                </p>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <p><strong>Customer:</strong> ${newOrder.user.fullName}
                                                                </p>
                                                                <p><strong>Current Status:</strong>
                                                                    <span
                                                                        class="badge bg-${newOrder.status == 'PENDING' ? 'warning' : 
                                                                                    newOrder.status == 'CONFIRMED' ? 'info' : 
                                                                                    newOrder.status == 'SHIPPING' ? 'primary' : 
                                                                                    newOrder.status == 'DELIVERED' ? 'success' : 'danger'}">
                                                                        ${newOrder.status}
                                                                    </span>
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- Update Form -->
                                                <div class="card">
                                                    <div class="card-header">
                                                        <h5 class="mb-0">Update Order Details</h5>
                                                    </div>
                                                    <div class="card-body">
                                                        <form:form method="post" action="/admin/order/update"
                                                            modelAttribute="newOrder">
                                                            <div class="mb-3" style="display: none">
                                                                <form:input type="text" class="form-control"
                                                                    path="id" />
                                                            </div>

                                                            <div class="row">

                                                                <div class="col-md-6">
                                                                    <div class="mb-3">
                                                                        <label class="form-label">Status</label>
                                                                        <form:select class="form-control" path="status">
                                                                            <form:option value="PENDING">Pending
                                                                            </form:option>
                                                                            <form:option value="CONFIRMED">Confirmed
                                                                            </form:option>
                                                                            <form:option value="SHIPPING">Shipping
                                                                            </form:option>
                                                                            <form:option value="DELIVERED">Delivered
                                                                            </form:option>
                                                                            <form:option value="CANCELLED">Cancelled
                                                                            </form:option>
                                                                        </form:select>
                                                                    </div>
                                                                </div>
                                                            </div>



                                                            <div class="d-flex justify-content-between">
                                                                <a href="/admin/order"
                                                                    class="btn btn-secondary">Cancel</a>
                                                                <button type="submit" class="btn btn-warning">Update
                                                                    Order</button>
                                                            </div>
                                                        </form:form>
                                                    </div>
                                                </div>
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