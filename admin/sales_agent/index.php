<?php if($_settings->chk_flashdata('success')): ?>
<script>
	alert_toast("<?php echo $_settings->flashdata('success') ?>",'success')
</script>
<?php endif;?>

<style>
    .img-avatar{
        width:45px;
        height:45px;
        object-fit:cover;
        object-position:center center;
        border-radius:100%;
    }
</style>
<div class="card card-outline card-primary">
	<div class="card-header">
		<h3 class="card-title"><b>Danh sách nhân viên bán hàng</b></h5>
		<div class="card-tools">
			<a href="sales_agent/create_account_salesman.php" class="btn btn-primary" id="create_new"><span class="fas fa-plus"></span> Thêm nhân viên mới</a>
		</div>
	</div>
	<div class="card-body">
		<div class="container-fluid">
        <div class="container-fluid">
			<table class="table table-bordered table-stripped">
				<colgroup>
					<col width="10%">
					<col width="10%">
					<col width="15%">
					<col width="20%">
					<col width="20%">
					<col width="15%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr class="bg-gradient-info text-center">
						<th>STT</th>
						<th>Ảnh đại diện</th>
						<th>Mã nhân viên</th>
						<!--<th>#</th>
						<th>Owner</th>-->
						<th>Trạng thái</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<?php 
					$i = 1;
						$qry = $conn->query("SELECT * from `vendor_list` where delete_flag = 0 order by shop_name asc ");
						while($row = $qry->fetch_assoc()):
					?>
						<tr>
							<td class="text-center"><?php echo $i++; ?></td>
							<td class="text-center"><img src="<?php echo validate_image($row['avatar']) ?>" class="img-avatar img-thumbnail p-0 border-2" alt="sales_agent_avatar"></td>
							<td><?php echo ($row['code']) ?></td>
							<!--<td><?php echo ucwords($row['shop_name']) ?></td>
							<td><?php echo ucwords($row['shop_owner']) ?></td>-->
							<td class="text-center">
								<?php if($row['status'] == 1): ?>
									<span class="badge badge-success bg-gradient-success px-3 rounded-pill">Kích hoạt</span>
								<?php else: ?>
									<span class="badge badge-danger bg-gradient-danger px-3 rounded-pill">Không kích hoạt</span>
								<?php endif; ?>
							</td>
							<td align="center">
								 <button type="button" class="btn btn-flat btn-default btn-sm dropdown-toggle dropdown-icon" data-toggle="dropdown">
				                  		Action
				                    <span class="sr-only">Toggle Dropdown</span>
				                  </button>
				                  <div class="dropdown-menu" role="menu">
				                    <a class="dropdown-item" href="?page=sales_agent/manage_sales_agent&id=<?php echo $row['id'] ?>"><span class="fa fa-edit text-primary"></span> Chỉnh sửa</a>
				                    <div class="dropdown-divider"></div>
				                    <a class="dropdown-item delete_data" href="javascript:void(0)" data-id="<?php echo $row['id'] ?>"><span class="fa fa-trash text-danger"></span> Xóa</a>
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
	$(document).ready(function(){
		$('.delete_data').click(function(){
			_conf("Bạn có chắc chắn xóa nhân viên này vĩnh viễn không?","delete_sales_agent",[$(this).attr('data-id')])
		})
		$('.table').dataTable();
	})
	function delete_sales_agent($id){
		start_loader();
		$.ajax({
			url:_base_url_+"classes/Users.php?f=delete_sales_agent",
			method:"POST",
			data:{id: $id},
			dataType:"json",
			error:err=>{
				console.log(err)
				alert_toast("An error occured.",'error');
				end_loader();
			},
			success:function(resp){
				if(typeof resp== 'object' && resp.status == 'success'){
					location.reload();
				}else{
					alert_toast("An error occured.",'error');
					end_loader();
				}
			}
		})
	}
</script>