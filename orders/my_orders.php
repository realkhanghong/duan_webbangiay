<div class="content py-3">
    <div class="card card-outline card-dark rounded-0 shadow">
        <div class="card-header">
            <h5 class=""><b>Đơn đặt hàng của tôi</b></h5>
        </div>
        <div class="card-body">
            <div class="w-100 overflow-auto">
            <table class="table table-bordered table-striped">
                <colgroup>
                    <col width="5%">
                    <col width="15%">
                    <col width="20%">
                    <col width="20%">
                    <col width="20%">
                    <col width="20%">
                </colgroup>
                <thead>
                    <tr>
                        <th class="p1 text-center">STT</th>
                        <th class="p1 text-center">Ngày đặt hàng</th>
                        <th class="p1 text-center">Mã đơn hàng</th>
                        <th class="p1 text-center">Tổng số tiền</th>
                        <th class="p1 text-center">Trạng thái</th>
                        <th class="p1 text-center">Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <?php 
                    $i = 1;
                    $orders = $conn->query("SELECT * FROM `order_list` where client_id = '{$_settings->userdata('id')}' order by `status` asc,unix_timestamp(date_created) desc ");
                    while($row = $orders->fetch_assoc()):
                    ?>
                    <tr>
                        <td class="px-2 py-1 align-middle text-center"><?= $i++; ?></td>
                        <td class="px-2 py-1 align-middle"><?= date("Y-m-d H:i", strtotime($row['date_created'])) ?></td>
                        <td class="px-2 py-1 align-middle"><?= $row['code'] ?></td>
                        <td class="px-2 py-1 align-middle text-right"><?= format_num($row['total_amount']) ?></td>
                        <td class="px-2 py-1 align-middle text-center">
                            <?php 
                                switch($row['status']){
                                    case 0:
                                        echo '<span class="badge badge-secondary bg-gradient-secondary px-3 rounded-pill">Chờ xác nhận</span>';
                                        break;
                                    case 1:
                                        echo '<span class="badge badge-primary bg-gradient-primary px-3 rounded-pill">Đã xác nhận</span>';
                                        break;
                                    case 2:
                                        echo '<span class="badge badge-info bg-gradient-info px-3 rounded-pill">Đã đóng gói</span>';
                                        break;
                                    case 3:
                                        echo '<span class="badge badge-warning bg-gradient-warning px-3 rounded-pill">Đang giao hàng</span>';
                                        break;
                                    case 4:
                                        echo '<span class="badge badge-success bg-gradient-success px-3 rounded-pill">Đã giao hàng</span>';
                                        break;
                                    case 5:
                                        echo '<span class="badge badge-danger bg-gradient-danger px-3 rounded-pill">Bị hủy bỏ</span>';
                                        break;
                                    default:
                                        echo '<span class="badge badge-light bg-gradient-light border px-3 rounded-pill">N/A</span>';
                                        break;
                                }
                            ?>
                        </td>
                        <td class="px-2 py-1 align-middle text-center">
                            <button type="button" class="btn btn-flat border btn-light btn-sm dropdown-toggle dropdown-icon" data-toggle="dropdown">
                                Hành động
                            <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <div class="dropdown-menu" role="menu">
                                <a class="dropdown-item view_data" href="javascript:void(0)" data-id="<?= $row['id'] ?>" data-code="<?= $row['code'] ?>"><span class="fa fa-eye text-dark"></span> Xem</a>
                            </div>
                        </td>
                    </tr>
                    <?php endwhile; ?>
                </tbody>
            </table>
            </div>
        </div>
    </div>
</div>
<script>
    $(function(){
        $('.view_data').click(function(){
            uni_modal("Xem chi tiết đơn hàng - <b>"+($(this).attr('data-code'))+"</b>","orders/view_order.php?id="+$(this).attr('data-id'),'mid-large')
        })
        $('table').dataTable();
    })
</script>