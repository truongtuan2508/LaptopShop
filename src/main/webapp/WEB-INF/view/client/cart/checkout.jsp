<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <title>Thanh Toán - LaptopShop</title>
                    <meta content="width=device-width, initial-scale=1.0" name="viewport">
                    <meta content="" name="keywords">
                    <meta content="" name="description">

                    <!-- Google Web Fonts -->
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                        rel="stylesheet">

                    <!-- Icon Font Stylesheet -->
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                        rel="stylesheet">

                    <!-- Libraries Stylesheet -->
                    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                    <!-- Customized Bootstrap Stylesheet -->
                    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                    <!-- Template Stylesheet -->
                    <link href="/client/css/style.css" rel="stylesheet">
                </head>

                <body>

                    <!-- Spinner Start -->
                    <div id="spinner"
                        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                        <div class="spinner-grow text-primary" role="status"></div>
                    </div>
                    <!-- Spinner End -->


                    <jsp:include page="../layout/header.jsp" />



                    <!-- Cart Page Start -->
                    <div class="container-fluid py-5">
                        <div class="container py-5">
                            <div>
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Chi tiết giỏ hàng</li>
                                    </ol>
                                </nav>
                            </div>
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">Sản phẩm</th>
                                            <th scope="col">Tên</th>
                                            <th scope="col">Giá</th>
                                            <th scope="col">Số lượng</th>
                                            <th scope="col">Tổng giá</th>
                                            <th scope="col">Xử lý</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="cartDetail" items="${cartDetails}">
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
                                                    <div class="input-group quantity mt-4" style="width: 100px;">
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
                                                    <p class="mb-0 mt-4" data-cart-detail-id="${cartDetail.id}">
                                                        <fmt:formatNumber type="number"
                                                            value="${cartDetail.price * cartDetail.quantity}" />
                                                        đ
                                                    </p>
                                                </td>
                                                <td>
                                                    <form method="post" action="/delete-cart-product/${cartDetail.id}">

                                                        <input type="hidden" name="${_csrf.parameterName}"
                                                            value="${_csrf.token}" />
                                                        <button class="btn btn-md rounded-circle bg-light border mt-4">
                                                            <i class="fa fa-times text-danger"></i>
                                                        </button>
                                                    </form>

                                                </td>

                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                            <c:if test="${not empty cartDetails}">
                                <form:form action="/place-order" method="post" modelAttribute="cart">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    <div class="mt-5 row g-4">
                                        <!-- Thông tin người nhận -->
                                        <div class="col-12 col-md-6">
                                            <div class="p-4">
                                                <h5>Thông tin người nhận</h5>
                                                <div class="row">
                                                    <div class="col-12 form-group mb-3">
                                                        <label>Tên người nhận</label>
                                                        <input type="text" class="form-control" name="receiverName"
                                                            required />
                                                    </div>
                                                    <div class="col-12 form-group mb-3">
                                                        <label>Địa chỉ người nhận</label>
                                                        <input type="text" class="form-control" name="receiverAddress"
                                                            required />
                                                    </div>
                                                    <div class="col-12 form-group mb-3">
                                                        <label>Số điện thoại người nhận</label>
                                                        <input type="number" class="form-control" name="receiverPhone"
                                                            required />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Thông tin đơn hàng -->
                                        <div class="col-12 col-md-6">
                                            <div class="bg-light rounded">
                                                <div class="p-4">
                                                    <h1 class="display-6 mb-4">Thông tin <span class="fw-normal">đơn
                                                            hàng</span>
                                                    </h1>
                                                    <div class="d-flex justify-content-between mb-4">
                                                        <h5 class="mb-0 me-4">Tạm tính :</h5>
                                                        <p class="mb-0" data-cart-total-price="${totalPrice}">
                                                            <fmt:formatNumber type="number" value="${totalPrice}" />đ
                                                        </p>
                                                    </div>
                                                    <div class="d-flex justify-content-between">
                                                        <h5 class="mb-0 me-4">Phí vận chuyển: </h5>
                                                        <div class="">
                                                            <p class="mb-0">0đ</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div
                                                    class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                                                    <h5 class="mb-0 ps-4 me-4">Tổng số tiền: </h5>
                                                    <p class="mb-0 pe-4" data-cart-total-price="${totalPrice}">
                                                        <fmt:formatNumber type="number" value="${totalPrice}" />đ
                                                    </p>
                                                </div>

                                                <!-- <form:form action="/confirm-checkout" method="post" modelAttribute="cart">
                                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                    <div style="display: block;">
                                                        <c:forEach var="cartDetail" items="${cart.cartDetails}"
                                                            varStatus="status">
                                                            <div class="mb-3">
                                                                <div class="form-group">
                                                                    <label>ID: </label>
                                                                    <form:input class="form-control" type="text"
                                                                        value="${cartDetail.id}"
                                                                        path="cartDetails[${status.index}].id" />
                                                                </div>
                                                                <div class="form-group">
                                                                    <label>Quantity: </label>
                                                                    <form:input class="form-control" type="text"
                                                                        value="${cartDetail.quantity}"
                                                                        path="cartDetails[${status.index}].quantity" />
                                                                </div>
                                                            </div>
                                                        </c:forEach>

                                                    </div>

                                                </form:form> -->


                                                <button
                                                    class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4"
                                                    type="submit">Xác nhận đặt hàng
                                                </button>
                                            </div>
                                        </div>
                                    </div>

                                </form:form>
                            </c:if>

                        </div>
                    </div>
                    <!-- Cart Page End -->


                    <jsp:include page="../layout/footer.jsp" />



                    <!-- Back to Top -->
                    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                            class="fa fa-arrow-up"></i></a>


                    <!-- JavaScript Libraries -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/client/lib/easing/easing.min.js"></script>
                    <script src="/client/lib/waypoints/waypoints.min.js"></script>
                    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                    <!-- Template Javascript -->
                    <script src="/client/js/main.js"></script>

                    <!-- Checkout Quantity Update Script -->
                    <script>
                        $(document).ready(function () {
                            // Handle quantity update buttons
                            $('.btn-plus').click(function (e) {
                                e.preventDefault();
                                var input = $(this).siblings('input');
                                var currentVal = parseInt(input.val());
                                input.val(currentVal + 1);
                                updateCartDetail(input);
                            });

                            $('.btn-minus').click(function (e) {
                                e.preventDefault();
                                var input = $(this).siblings('input');
                                var currentVal = parseInt(input.val());
                                if (currentVal > 1) {
                                    input.val(currentVal - 1);
                                    updateCartDetail(input);
                                }
                            });

                            // Handle direct input change
                            $('input[data-cart-detail-id]').on('change', function () {
                                var quantity = parseInt($(this).val());
                                if (quantity < 1) {
                                    $(this).val(1);
                                    quantity = 1;
                                }
                                updateCartDetail($(this));
                            });

                            function updateCartDetail(input) {
                                var cartDetailId = input.data('cart-detail-id');
                                var quantity = parseInt(input.val());
                                var price = parseFloat(input.data('cart-detail-price'));

                                // Update total price for this item
                                var totalPrice = price * quantity;
                                $('p[data-cart-detail-id="' + cartDetailId + '"]').text(
                                    new Intl.NumberFormat('vi-VN').format(totalPrice) + 'đ'
                                );

                                // Update overall total
                                updateOverallTotal();

                                // Send update to server
                                $.post('/update-cart-quantity/' + cartDetailId, {
                                    quantity: quantity,
                                    _token: $('input[name="_token"]').val()
                                });
                            }

                            function updateOverallTotal() {
                                var total = 0;
                                $('p[data-cart-detail-id]').each(function () {
                                    var priceText = $(this).text().replace('đ', '').replace(/\./g, '');
                                    total += parseFloat(priceText);
                                });

                                $('p[data-cart-total-price]').text(
                                    new Intl.NumberFormat('vi-VN').format(total) + 'đ'
                                );
                            }
                        });
                    </script>
                </body>

                </html>