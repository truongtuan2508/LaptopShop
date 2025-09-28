<%@page contentType="text/html" pageEncoding="UTF-8" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Cảm ơn bạn - LaptopShop</title>
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

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

        <!-- Thank You Page Start -->
        <div class="container-fluid py-5">
            <div class="container py-5">
                <div class="row justify-content-center">
                    <div class="col-lg-8 text-center">
                        <div class="bg-light rounded p-5">
                            <i class="fas fa-check-circle text-success"
                                style="font-size: 4rem; margin-bottom: 2rem;"></i>
                            <h1 class="display-4 text-success mb-4">Đặt hàng thành công!</h1>
                            <p class="lead mb-4">Cảm ơn bạn đã mua sắm tại LaptopShop. Đơn hàng của bạn đã được xác nhận
                                và sẽ được xử lý trong thời gian sớm nhất.</p>
                            <div class="row text-center">
                                <div class="col-md-4 mb-3">
                                    <i class="fas fa-shipping-fast text-primary mb-3" style="font-size: 2rem;"></i>
                                    <h5>Giao hàng nhanh</h5>
                                    <p class="text-muted">Đơn hàng sẽ được giao trong 1-2 ngày làm việc</p>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <i class="fas fa-headset text-primary mb-3" style="font-size: 2rem;"></i>
                                    <h5>Hỗ trợ 24/7</h5>
                                    <p class="text-muted">Đội ngũ chăm sóc khách hàng luôn sẵn sàng hỗ trợ</p>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <i class="fas fa-shield-alt text-primary mb-3" style="font-size: 2rem;"></i>
                                    <h5>Bảo hành chính hãng</h5>
                                    <p class="text-muted">Sản phẩm được bảo hành chính hãng đầy đủ</p>
                                </div>
                            </div>
                            <div class="mt-4">
                                <a href="/" class="btn btn-primary btn-lg me-3">Tiếp tục mua sắm</a>
                                <a href="/cart" class="btn btn-outline-primary btn-lg">Xem giỏ hàng</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Thank You Page End -->

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
    </body>

    </html>