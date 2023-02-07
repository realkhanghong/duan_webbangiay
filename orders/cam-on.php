<?php
    // if(isset($_GET['partnerCode'])){
    $partnerCode = $_GET['partnerCode'];
    $orderId = $_GET['orderId'];
    $amount = $_GET['amount'];
    $orderInfo = $_GET['orderInfo'];
    $orderType = $_GET['orderType'];
    $transId = $_GET['transId'];
    $payType = $_GET['payType'];
    $code_cart = rand(0,9999);
    $cart_payment = 'momo';

    // $code = date('Ym-').sprintf("%'.05d",1);
    // $client_id = $_SESSION['client_id'];
    // $vendor_id = $_SESSION['vendor_id'];
    // $delivery_address = $_SESSION['delivery_address'];


//Chèn dữ liệu vào db momo
    $insert_momo = "INSERT INTO momo (partner_Code,order_id,amount,order_info,order_type,trans_id,pay_type,code_cart) 
                    VALUES ('$partnerCode','$orderId','$amount','$orderInfo','$orderType','$transId','$payType','$code_cart')";
    
    if ($conn->query($insert_momo) === TRUE) {
        echo "Thanh toán MOMO ATM thành công";
        $this->conn->query("DELETE FROM `cart_list` where client_id ='{$this->settings->userdata('id')}'");
    } else {
        echo "Error: " . $insert_momo . "<br>" . $conn->error;
    }

//     $cart_query = mysqli_query($conn,$insert_momo);
// //Chèn dữ liệu vào order list
//     if($cart_query){
//         $insert_order_list = "INSERT INTO order_list(code,client_id,vendor_id,delivery_address,code_cart,cart_payment) VALUE('".$code."',
//                     '".$client_id."','".$vendor_id."','".$delivery_address."','".$code_cart."','".$cart_payment."')";
//         $cart_query = mysqli_query($conn,$insert_momo);
// //chèn vào giỏ hàng
// //Thêm chi tiết đơn hàng
//         foreach($_SESSION['cart_list'] as $key => $value){
//             $product_id = $value['product_id'];
//             $quantity = $value['quantity'];
//             $insert_order_details = "INSERT INTO order_details(product_id,quantity,code_cart) VALUE('".$product_id."','".$quantity."','".$code_cart."')";
//             mysql_query($conn,$insert_order_details);
//         }
//         echo '<h3>Giao dịch thanh toán bằng MOMO thành công</h3>';
//         echo '<p>Vui lòng vào trang <a target="blank" href="#">lịch sử đơn hàng<a/> để xem chi tiết đơn hàng của bạn</p>';

//     }else{
//         echo 'Giao dịch MOMO thất bại';
//     }
// }
?>