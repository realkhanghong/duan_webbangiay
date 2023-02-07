<?php
if(isset($_GET['id']) && $_GET['id'] > 0){
    $qry = $conn->query("SELECT  p.*, v.shop_name as vendor, c.name as `category` FROM `product_list` p inner join vendor_list v on p.vendor_id = v.id inner join category_list c on p.category_id = c.id where p.delete_flag = 0 and p.id = '{$_GET['id']}'");
    if($qry->num_rows > 0){
        foreach($qry->fetch_assoc() as $k => $v){
            $$k=$v;
        }
    }else{
        echo "<script> alert('Unkown Product ID.'); location.replace('./?page=products') </script>";
        exit;
    }
}else{
    echo "<script> alert('Product ID is required.'); location.replace('./?page=products') </script>";
    exit;
}
?>
<style>
#prod-img-holder {
        height: calc(100%) !important;
        width: calc(100%);
        overflow: hidden;
    }

#prod-img {
        object-fit: scale-down;
        height: calc(100%);
        width: calc(100%);
        transition: transform .3s ease-in;
    }
#prod-img-holder:hover #prod-img{
        transform:scale(1.2);
    }
.product_meta {
    font-size: .8em;
    margin-bottom: 1em;
}
.product_meta>span {
    display: block;
    border-top: 1px dotted #ddd;
    padding: 5px 0;
}
#bg-gradient-dark {
    border-radius: 150px;
}

</style>
<button onclick="history.back()" class="bg-gradient-dark btn-sm fas fa-solid fa-backward">
 Quay lại</button>

<div class="content py-3">
    <div class="card card-outline card-dark rounded-0">
        <div class="card-header">
            <h4 class=""><b>Chi tiết Sản phẩm</b></h4>
        </div>
        <div class="card-body">
            <div class="container-fluid">
                <div id="msg"></div>
                <div class="row">
                    <div class="col-lg-4 col-md-6 col-sm-12 text-center">
                        <div class="position-relative overflow-hidden" id="prod-img-holder">
                            <img src="<?= validate_image(isset($image_path) ? $image_path : "") ?>" alt="<?= $row['name'] ?>" id="prod-img">
                        </div>
                    </div>
                    <div class="col-lg-8 col-md-7 col-sm-12">
                        <h3><b><?= $name ?></b></h3>
                        <!--<div class="d-flex w-100">
                            <div class="col-auto px-0"><small class="text-muted">Vendor:&nbsp </small></div>
                            <div class="col-auto px-0 flex-shrink-1 flex-grow-1"><p class="m-0"><small class="text-muted"><?= $vendor ?></small></p></div>
                        </div>
                        <div class="d-flex">
                            <div class="col-auto px-0"><small class="text-muted">Thương hiệu:&nbsp </small></div>
                            <div class="col-auto px-0 flex-shrink-1 flex-grow-1"><p class="m-0"><small class="text-muted"><?= $category ?></small></p></div>
                        </div>-->
                        <div class="d-flex">
                            <div class="col-auto px-0"><small class="text-muted">Giá:&nbsp </small></div>
                            <div class="col-auto px-0 flex-shrink-1 flex-grow-1"><p class="m-0 pl-3"><small class="text-danger"><?= format_num($price) ?>&nbspđ</small></p></div>
                        </div>
                        <div class="product_meta">
                            <span class="sku_wrapper">Mã: <span class="sku">N/A</span></span>
                            <span class="posted_in">Danh mục:
                                <a href="" rel="tag">Boots</a>,
                                <a href="" rel="tag">Cao gót</a>,
                                <a href="" rel="tag">Đế bệt</a>,
                                <a href="" rel="tag">Đế gỗ</a>,
                                <a href="" rel="tag">Giày búp bê</a>,
                                <a href="" rel="tag">Sneaker</a>,
                                <a href="" rel="tag">Thể thao</a>
                            </span>
                            <span class="yith-wcbr-brands">Thương hiệu:&nbsp <?= $category ?><p>  </p>
                            </span>
                            <span class="yith-wcbr-brands-logo">
                            </span>
                        </div>
                        <div class="row align-items-end">
                            <div class="col-md-3 form-group">
                                <input type="number" min = "1" id= 'qty' value="1" class="form-control rounded-0 text-center">
                            </div>
                            <div class="col-md-4 form-group">
                                <button class="btn btn-danger" type="button" id="add_to_cart"><i class="fa fa-cart-plus"></i> Thêm vào giỏ hàng</button>
                            </div>
                        </div>
                        <div class="w-100"><?= html_entity_decode($description) ?></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function add_to_cart(){
        var pid = '<?= isset($id) ? $id : '' ?>';
        var qty = $('#qty').val();
        var el = $('<div>')
        el.addClass('alert alert-danger')
        el.hide()
        $('#msg').html('')
        start_loader()
        $.ajax({
            url:_base_url_+'classes/Master.php?f=add_to_cart',
            method:'POST',
            data:{product_id:pid,quantity:qty},
            dataType:'json',
            error:err=>{
                console.error(err)
                alert_toast('Lỗi.','error')
                end_loader()
            },
            success:function(resp){
                if(resp.status =='success'){
                    location.reload()
                }else if(!!resp.msg){
                    el.text(resp.msg)
                    $('#msg').append(el)
                    el.show('slow')
                    $('html, body').scrollTop(0)
                }else{
                    el.text("An error occurred. Please try to refresh this page.")
                    $('#msg').append(el)
                    el.show('slow')
                    $('html, body').scrollTop(0)
                }
                end_loader()
            }
        })
    }
    $(function(){
        $('#add_to_cart').click(function(){
            if('<?= $_settings->userdata('id') > 0 && $_settings->userdata('login_type') == 3 ?>'){
                add_to_cart();
            }else{
                location.href = "./login.php"
            }
        })
    })
</script>