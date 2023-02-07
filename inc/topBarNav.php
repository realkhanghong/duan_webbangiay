<?php error_reporting(0); ?>
<style>
  .user-img{
        position: absolute;
        height: 27px;
        width: 27px;
        object-fit: cover;
        left: -7%;
        top: -12%;
  }
  .btn-rounded{
        border-radius: 50px;
  }
  .dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}
.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}
.dropdown-content a:hover {background-color: #ddd;}
.dropdown:hover .dropdown-content {display: block;}
</style>

<!-- Navbar -->
<!-- Thanh điều hướng đầu tiên -->
      <style>
        #login-nav {
          position: fixed !important;
          top: 0 !important;
          z-index: 1038;
          padding: 0.3em 2.5em !important;
        }
        #top-Nav{
          top: 2.3em;
        }
        .text-sm .layout-navbar-fixed .wrapper .main-header ~ .content-wrapper, .layout-navbar-fixed .wrapper .main-header.text-sm ~ .content-wrapper {
          margin-top: calc(3.6) !important;
          padding-top: calc(3.2em) !important
      }
      </style>
      <nav class="w-100 px-2 py-1 position-fixed top-0 bg-dark text-light" id="login-nav">
        <div class="d-flex justify-content-between w-100">
          <div>
            <p class="m-0 truncate-1"><small><?= $_settings->info('name') ?></small></p>
          </div>
          <div>
            <?php if($_settings->userdata('id') > 0 && $_settings->userdata('login_type') ==3) {
             ?>
              <!-- <span class="mx-2">Xin chào, <?= !empty($_settings->userdata('username')) ? $_settings->userdata('username') : $_settings->userdata('email') ?></span>
              <span class="mx-1"><a href="<?= base_url.'classes/Login.php?f=logout_client' ?>"><i class="fa fa-power-off"></i></a></span> -->
              <div class="dropdown">
                <a href="javascript:void(0)" class="dropdown-toggle text-reset text-decoration-none" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mx-2"><img src="<?= validate_image($_settings->userdata('avatar')) ?>" class="img-thumbnail rounded-circle" alt="User Avatar" id="client-img-avatar">  <span class="mx-2">Xin chào, <?= !empty($_settings->userdata('username')) ? $_settings->userdata('username') : $_settings->userdata('email') ?></span>
                </a>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                  <a class="dropdown-item" href="./?page=manage_account"><span class="fa fa-user"></span> Quản lý tài khoản</a>
                  <a class="dropdown-item" href="<?= base_url.'classes/Login.php?f=logout_client' ?>"<?php unset($_SESSION['login_type']) ?>><span class="fas fa-sign-out-alt"></span> Đăng xuất</a>
                </div>
              </div>
            <?php } else if($_SESSION["login_type"] == 2) {
                          $currentUser = $_SESSION['current_user'];
            ?>
              <div class="dropdown">
                <a href="javascript:void(0)" class="dropdown-toggle text-reset text-decoration-none" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <b class="mx-2">Xin chào, <?= $currentUser['fullname'] ?></b>
                </a>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                  <a class="dropdown-item" href="./login.php"><span class="fas fa-sign-out-alt"></span> Đăng xuất</a>
                </div>
              </div>
            <?php } else { 
            ?>
              <a href="./login.php" class="mx-2 text-light text-decoration-none font-weight-bolder">Đăng nhập khách hàng</a> | 
              <a href="./sales_agent/login.php" class="mx-2 text-light text-decoration-none font-weight-bolder">Đăng nhập nhân viên bán hàng</a> | 
              <a href="./admin/login.php" class="mx-2 text-light text-decoration-none font-weight-bolder">Đăng nhập quản trị viên</a>
            <?php } ?>
          </div>
        </div>
      </nav>
<!-- /.Thanh điều hướng đầu tiên -->

<!-- Thanh điều hướng thứ 2 -->
      <nav class="main-header navbar navbar-expand-md navbar-light border-0 text-sm bg-gradient-light shadow" id='top-Nav'>
        <div class="container">
          <a href="./" class="navbar-brand">
            <img src="<?php echo validate_image($_settings->info('logo'))?>" alt="Site Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
            <span><?= $_settings->info('short_name') ?></span>
          </a>

         

          <div class="collapse navbar-collapse order-3" id="navbarCollapse">

      <!-- Liên kết thanh điều hướng bên trái -->
            <ul class="navbar-nav">
              <li class="nav-item">
                <a href="./" class="nav-link <?= isset($page) && $page =='home' ? "active" : "" ?>">Trang chủ</a>
              </li>
              <li class="nav-item dropdown">
                <a href="./?page=products" class="nav-link <?= isset($page) && $page =='products' ? "active" : "" ?>"> Sản phẩm </a>
              <!--<div class="dropdown-content">
                  <a href="./?page=#" class="">Giày thể thao</a>
                  <a href="./?page=#" class="">Giày nam</a>
                  <a href="./?page=#" class="">Giày nữ</a>
                </div>
              -->
              </li> 
              <li class="nav-item">
                <a href="./?page=lien-he" class="nav-link <?= isset($page) && $page =='lien-he' ? "active" : "" ?>">Liên hệ</a>
              </li>
              <!-- if($_settings->userdata('id') > 0 && $_settings->userdata('login_type') == 3): -->
              <li class="nav-item">
                <?php 
                $cart_count = $conn->query("SELECT sum(quantity) FROM `cart_list` where client_id = '{$_settings->userdata('id')}'")->fetch_array()[0];
                $cart_count = $cart_count > 0 ? $cart_count : 0;
                ?>
                <a href="./?page=orders/cart" class="nav-link <?= isset($page) && $page =='orders/cart' ? "active" : "" ?>" ><span class="badge badge-secondary rounded-cirlce "><?= format_num($cart_count) ?></span> Giỏ hàng</a>
              </li>
              <li class="nav-item">
                <a href="./?page=orders/my_orders" class="nav-link <?= isset($page) && $page =='orders/my_orders' ? "active" : "" ?>">Đơn đặt hàng của tôi</a>
              </li>
              <!-- endif; -->
            </ul>
          </div>

      <!-- Liên kết thanh điều hướng bên phải -->
          <div class="order-1 order-md-3 navbar-nav navbar-no-expand ml-auto">
            <button class="navbar-toggler order-1 border-0 text-sm" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
          </div>
        </div>
      </nav>
<!-- /.Thanh điều hướng đầu tiên -->

<!-- /.Navbar -->

      <script>
        $(function(){
          
        })
      </script>