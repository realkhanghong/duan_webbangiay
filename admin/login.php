<?php require_once('../config.php') ?>
<!DOCTYPE html>
<html lang="en" class="" style="height: auto;">
 <?php require_once('inc/header.php') ?>
<body class="hold-transition login-page">
  <script>
    start_loader()
  </script>
  <style>
      body{
          width:calc(100%);
          height:calc(100%);
          background-image:url('<?= validate_image($_settings->info('cover')) ?>');
          background-repeat: no-repeat;
          background-size:cover;
      }
      #logo-img{
          width:15em;
          height:15em;
          object-fit:scale-down;
          object-position:center center;
      }
      #system_name{
        color:#fff;
        text-shadow: 3px 3px 3px #000;
      }
  </style>
  <center><img src="<?= validate_image($_settings->info('logo')) ?>" alt="System Logo" class="img-thumbnail rounded-circle" id="logo-img"></center>
<h1 class="text-center" id="system_name"><?= $_settings->info('name') ?></h1>
  <div class="clear-fix my-2"></div>
<div class="login-box">

  <!-- /.login-logo -->
  <div class="card card-outline card-primary">
    <div class="card-header text-center">
      <a href="./" class="h5"><b>ĐĂNG NHẬP QUẢN TRỊ VIÊN</b></a>
    </div>
    <div class="card-body">
      <p class="login-box-msg">Nhập thông tin để đăng nhập</p>

      <form id="login-frm" action="" method="post">
        <div class="input-group mb-3">
          <input type="text" class="form-control" name="username" autofocus placeholder="Tài khoản">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" class="form-control" name="password" placeholder="Mật khẩu">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>

        <div class="row align-item-end">
          <div class="col-6">
            <a href="<?= base_url ?>" class ="btn btn-block bg-gradient-dark">Quay về</a>
          </div>
          <!-- /.col -->
          <div class="col-6">
            <button type="submit" class="btn btn-block bg-gradient-danger">Đăng nhập ngay</button>
          </div>
      </form>
      <!-- /.social-auth-links -->

      <!-- <p class="mb-1">
        <a href="forgot-password.html">I forgot my password</a>
      </p> -->
      
    </div>
    <!-- /.card-body -->
  </div>
  <!-- /.card -->
</div>
<!-- /.login-box -->

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>

<script>
  $(function(){
    end_loader();
    $('#login-frm').submit(function(e){
        e.preventDefault();
        var _this = $(this)
            $('.err-msg').remove();
        var el = $('<div>')
            el.addClass("alert err-msg")
            el.hide()
        if(_this[0].checkValidity() == false){
            _this[0].reportValidity();
            return false;
            }
        start_loader();
        $.ajax({
            url:_base_url_+"classes/Login.php?f=login",
            data: new FormData($(this)[0]),
            cache: false,
            contentType: false,
            processData: false,
            method: 'POST',
            type: 'POST',
            dataType: 'json',
            error:err=>{
                console.error(err)
                el.addClass('alert-danger').text("An error occured");
                _this.prepend(el)
                el.show('.modal')
                end_loader();
            },
            success:function(resp){
                if(typeof resp =='object' && resp.status == 'success'){
                    location.href= './';
                }else if(resp.status == 'failed' && !!resp.msg){
                    el.addClass('alert-danger').text(resp.msg);
                    _this.prepend(el)
                    el.show('.modal')
                }else{
                    el.text("An error occured");
                    console.error(resp)
                }
                $("html, body").scrollTop(0);
                end_loader()

            }
        })
    })
  })
</script>
</body>
</html>