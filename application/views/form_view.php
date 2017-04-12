<!DOCTYPE html>
<html lang="en">
<head>
<?php $this->load->view('header'); ?>
</head>
<body>
<div id="wrapper">
	<?php $this->load->view('menu') ?>
	<div id="page-wrapper">
	<div class="a4wrapper">

	<div class="a4page">
		<div class="page-header">
	        <h1 class="centered">Movement/Disposal of Assets #<?php echo $form_id; ?></h1>
	    </div>
	    <?php if(false): //(isset($message)): ?>
	    	<div class="alert alert-<?php echo $message['type']; ?>">
	        	<strong><?php echo $message['head']; ?></strong>
	        	<p><?php echo (isset($message['body'])) ? $message['body'] : ''; ?></p>
	    	</div>
	    <?php endif ?>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
				<div><span class="data-head">From: Hotel Name:</span><?php echo $form['from_hotel']; ?></div>
				<div><span class="data-head">Owning Co:</span><?php echo $form['from_company']; ?></div>
				<div><span class="data-head">Issue Date:</span><?php echo $form['issue_date']; ?></div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
				<div><span class="data-head">To: Hotel Name:</span><?php echo $form['to_hotel']; ?></div>
				<div><span class="data-head">Owning Co:</span><?php echo $form['to_company']; ?></div>
				<div><span class="data-head">Delivered Date:</span><?php echo $form['delivery_date']; ?></div>
			</div>
		</div>

		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-container">
			<div><span class="data-head">Dep. Requested:</span><?php echo $form['department_name']; ?></div>
		</div>

		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-container">
		<table class="table table-bordered table-striped">
		 	<thead>
	        	<tr>
	          		<th>Item Name</th>
	          		<th>Description</th>
	          		<th>Quantity</th>
	          	</tr>
			</thead>
			<tbody>
				<?php if(isset($items)): ?>
					<?php foreach ($items as $item): ?>
						<tr>
							<td><?php echo $item['name']; ?></td>
							<td><?php echo $item['description']; ?></td>
							<td><?php echo $item['quantity']; ?></td>
						</tr>
					<?php endforeach; ?>
				<?php endif; ?>
			</tbody>
		</table>
		</div>

		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-container">
			<div><span class="data-head">Present Location:</span><div class="inline-text"><?php echo $form['location']; ?></div></div>
		</div>

		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-container">
			<div><span class="data-head">Reason For Movement:</span><div class="inline-text"><?php echo $form['movement_reason']; ?></div></div>
		</div>

		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-container">
			<div><span class="data-head">New Location:</span><div class="inline-text"><?php echo $form['destination']; ?></div></div>
		</div>

		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-container">
		<div class="data-head centered">Hotel Requested Approved by:</div>
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
					<div class="data-head">Dep. Head</div>
					<div class="data-content"><span class="data-label">Name:</span><span class="name-data-content"><?php echo $form['dstn_dpt_head_fullname']; ?></span></div>
					<?php if ($form['dstn_dpt_head_id']): ?>
						<div class="data-content"><span class="data-label sign-data-content">Signature:</span><img src="<?php echo $signature_path.'approved.png'; ?>" alt="<?php echo $form['dstn_dpt_head_fullname']; ?>" class="img-rounded sign-image"></div>
					<?php elseif(isset($user_signs['dstn_dpt_head'])): ?>
						<div class="data-content"><span class="data-label sign-data-content">Signature:</span><a href="/forms/sign/<?php echo $form['id']; ?>/dstn_dpt_head" class="btn btn-success">Sign here</a></div>
					<?php else: ?>
						<div class="data-content"><span class="data-label sign-data-content">Signature:</span></div>
					<?php endif; ?>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
					<div class="data-head">Hotel GM</div>
					<div class="data-content"><span class="data-label">Name:</span><span class="name-data-content"><?php echo $form['dstn_hotel_gm_fullname']; ?></span></div>
					<?php if ($form['dstn_hotel_gm_id']): ?>
						<div class="data-content"><span class="data-label sign-data-content">Signature:</span><img src="<?php echo $signature_path.'approved.png'; ?>" alt="<?php echo $form['dstn_hotel_gm_fullname']; ?>" class="img-rounded sign-image"></div>
					<?php elseif(isset($user_signs['dstn_hotel_gm'])): ?>
						<div class="data-content"><span class="data-label sign-data-content">Signature:</span><a href="/forms/sign/<?php echo $form['id']; ?>/dstn_hotel_gm" class="btn btn-success">Sign here</a></div>
					<?php else: ?>
						<div class="data-content"><span class="data-label sign-data-content">Signature:</span></div>
					<?php endif; ?>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
					<div class="data-head">Hotel FC</div>
					<div class="data-content"><span class="data-label">Name:</span><span class="name-data-content"><?php echo $form['dstn_hotel_fc_fullname']; ?></span></div>
					<?php if ($form['dstn_hotel_fc_id']): ?>
						<div class="data-content"><span class="data-label sign-data-content">Signature:</span><img src="<?php echo $signature_path.'approved.png'; ?>" alt="<?php echo $form['dstn_hotel_fc_fullname']; ?>" class="img-rounded sign-image"></div>
					<?php elseif(isset($user_signs['dstn_hotel_fc'])): ?>
						<div class="data-content"><span class="data-label sign-data-content">Signature:</span><a href="/forms/sign/<?php echo $form['id']; ?>/dstn_hotel_fc" class="btn btn-success">Sign here</a></div>
					<?php else: ?>
						<div class="data-content"><span class="data-label sign-data-content">Signature:</span></div>
					<?php endif; ?>
				</div>
			</div>
		</div>

		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-container">
		<div class="data-head centered">Hotel Movement Approved by:</div>
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
					<div class="data-head">Dep. Head</div>
					<div class="data-content"><span class="data-label">Name:</span><span class="name-data-content"><?php echo $form['src_dpt_head_fullname']; ?></span></div>
					<?php if ($form['src_dpt_head_id']): ?>
						<div class="data-content"><span class="data-label sign-data-content">Signature:</span><img src="<?php echo $signature_path.'approved.png'; ?>" alt="<?php echo $form['src_dpt_head_fullname']; ?>" class="img-rounded sign-image"></div>
					<?php elseif(isset($user_signs['src_dpt_head'])): ?>
						<div class="data-content"><span class="data-label sign-data-content">Signature:</span><a href="/forms/sign/<?php echo $form['id']; ?>/src_dpt_head" class="btn btn-success">Sign here</a></div>
					<?php else: ?>
						<div class="data-content"><span class="data-label sign-data-content">Signature:</span></div>
					<?php endif; ?>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
					<div class="data-head">Hotel GM</div>
					<div class="data-content"><span class="data-label">Name:</span><span class="name-data-content"><?php echo $form['src_hotel_gm_fullname']; ?></span></div>
					<?php if ($form['src_hotel_gm_id']): ?>
						<div class="data-content"><span class="data-label sign-data-content">Signature:</span><img src="<?php echo $signature_path.'approved.png'; ?>" alt="<?php echo $form['src_hotel_gm_fullname']; ?>" class="img-rounded sign-image"></div>
					<?php elseif(isset($user_signs['src_hotel_gm'])): ?>
						<div class="data-content"><span class="data-label sign-data-content">Signature:</span><a href="/forms/sign/<?php echo $form['id']; ?>/src_hotel_gm" class="btn btn-success">Sign here</a></div>
					<?php else: ?>
						<div class="data-content"><span class="data-label sign-data-content">Signature:</span></div>
					<?php endif; ?>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
					<div class="data-head">Hotel FC</div>
					<div class="data-content"><span class="data-label">Name:</span><span class="name-data-content"><?php echo $form['src_hotel_fc_fullname']; ?></span></div>
					<?php if ($form['src_hotel_fc_id']): ?>
						<div class="data-content"><span class="data-label sign-data-content">Signature:</span><img src="<?php echo $signature_path.'approved.png'; ?>" alt="<?php echo $form['src_hotel_fc_fullname']; ?>" class="img-rounded sign-image"></div>
					<?php elseif(isset($user_signs['src_hotel_fc'])): ?>
						<div class="data-content"><span class="data-label sign-data-content">Signature:</span><a href="/forms/sign/<?php echo $form['id']; ?>/src_hotel_fc" class="btn btn-success">Sign here</a></div>
					<?php else: ?>
						<div class="data-content"><span class="data-label sign-data-content">Signature:</span></div>
					<?php endif; ?>
				</div>
			</div>
		</div>

		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-container">
		<div class="data-head centered">Final Approval</div>
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
					<div class="data-head">Cluster FC.</div>
					<div class="data-content"><span class="data-label">Name:</span><span class="name-data-content"><?php echo $form['fin_cluster_fc_fullname']; ?></span></div>
					<?php if ($form['fin_cluster_fc_id']): ?>
						<div class="data-content"><span class="data-label sign-data-content">Signature:</span><img src="<?php echo $signature_path.'approved.png'; ?>" alt="<?php echo $form['fin_cluster_fc_fullname']; ?>" class="img-rounded sign-image"></div>
					<?php elseif(isset($user_signs['fin_cluster_fc'])): ?>
						<div class="data-content"><span class="data-label sign-data-content">Signature:</span><a href="/forms/sign/<?php echo $form['id']; ?>/fin_cluster_fc" class="btn btn-success">Sign here</a></div>
					<?php else: ?>
						<div class="data-content"><span class="data-label sign-data-content">Signature:</span></div>
					<?php endif; ?>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
					<div class="data-head">R.D.O.F</div>
					<div class="data-content"><span class="data-label">Name:</span><span class="name-data-content"><?php echo $form['fin_rdof_fullname']; ?></span></div>
					<?php if ($form['fin_rdof_id']): ?>
						<div class="data-content"><span class="data-label sign-data-content">Signature:</span><img src="<?php echo $signature_path.'approved.png'; ?>" alt="<?php echo $form['fin_rdof_fullname']; ?>" class="img-rounded sign-image"></div>
					<?php elseif(isset($user_signs['fin_rdof'])): ?>
						<div class="data-content"><span class="data-label sign-data-content">Signature:</span><a href="/forms/sign/<?php echo $form['id']; ?>/fin_rdof" class="btn btn-success">Sign here</a></div>
					<?php else: ?>
						<div class="data-content"><span class="data-label sign-data-content">Signature:</span></div>
					<?php endif; ?>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
					<div class="data-head">Chairman Office Cai</div>
					<div class="data-content"><span class="data-label">Name:</span><span class="name-data-content"><?php echo $form['fin_chrmn_cai_fullname']; ?></span></div>
					<?php if ($form['fin_chrmn_cai_id']): ?>
						<div class="data-content"><span class="data-label sign-data-content">Signature:</span><img src="<?php echo $signature_path.'approved.png'; ?>" alt="<?php echo $form['fin_chrmn_cai_fullname']; ?>" class="img-rounded sign-image"></div>
					<?php elseif(isset($user_signs['fin_chrmn_cai'])): ?>
						<div class="data-content"><span class="data-label sign-data-content">Signature:</span><a href="/forms/sign/<?php echo $form['id']; ?>/fin_chrmn_cai" class="btn btn-success">Sign here</a></div>
					<?php else: ?>
						<div class="data-content"><span class="data-label sign-data-content">Signature:</span></div>
					<?php endif; ?>
				</div>
			</div>
		</div>

		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-container">
			<div class="data-head centered">Chairman</div>
			<div class="data-head centered">Hossam El Shaer</div>
		</div>

		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-container">
			<div class="col-lg-4 col-md-4 col-sm-5 col-xs-5">
				<div class="data-head">Recieved by</div>
				<div><span class="data-head data-label">Name:</span><?php echo $form['rcv_user_fullname']; ?></div>
				<div><span class="data-head data-label">Position:</span><?php echo $form['rcv_user_role']; ?></div>
				<?php if ($form['rcv_user_id']): ?>
					<div><span class="data-head data-label sign-data-content">Signature:</span><img src="<?php echo $signature_path.'approved.png'; ?>" alt="<?php echo $form['rcv_user_fullname']; ?>" class="img-rounded sign-image"></div>
				<?php elseif(isset($user_signs['rcv_user']) && $form['form_state_id'] == 5): ?>
					<div class="data-content"><span class="data-head data-label sign-data-content">Signature:</span> <a href="/forms/sign/<?php echo $form['id']; ?>/rcv_user" class="btn btn-success">Sign here</a></div>
				<?php else: ?>
					<div class="data-content"><span class="data-head data-label sign-data-content">Signature:</span> </div>
				<?php endif; ?>
				<div><span class="data-head data-label">Date:</span><?php echo ($form['rcv_user_id']) ? $form['rcv_user_date'] : ''; ?></div>
			</div>
		</div>

		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-container">
			<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 data-head">Distribution</div>
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
				<div class="data-head">1. Hotel Acc.</div>
				<?php if ($form['rcv_hotel_acc_id']): ?>
				<div><?php echo $form['rcv_hotel_acc_fullname']; ?></div>
				<?php elseif(isset($user_signs['rcv_hotel_acc']) && $form['form_state_id'] == 6): ?>
					<div class="data-content"><a href="/forms/sign/<?php echo $form['id']; ?>/rcv_hotel_acc" class="btn btn-success">Confirm</a></div>
				<?php endif; ?>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
				<div class="data-head">2. Dep. Head</div>
				<?php if ($form['rcv_dpt_head_id']): ?>
				<div><?php echo $form['rcv_dpt_head_fullname']; ?></div>
				<?php elseif(isset($user_signs['rcv_dpt_head']) && $form['form_state_id'] == 6): ?>
					<div class="data-content"><a href="/forms/sign/<?php echo $form['id']; ?>/rcv_dpt_head" class="btn btn-success">Confirm</a></div>
				<?php endif; ?>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
				<div class="data-head">3. Chairman Office Cai</div>
				<?php if ($form['rcv_chrmn_cai_id']): ?>
				<div><?php echo $form['rcv_chrmn_cai_fullname']; ?></div>
				<?php elseif(isset($user_signs['rcv_chrmn_cai']) && $form['form_state_id'] == 6): ?>
					<div class="data-content"><a href="/forms/sign/<?php echo $form['id']; ?>/rcv_chrmn_cai" class="btn btn-success">Confirm</a></div>
				<?php endif; ?>
			</div>
		</div>
	</div>
	</div>
	</div>
</div>
</body>
</html>