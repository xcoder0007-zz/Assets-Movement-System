<!DOCTYPE html>
<html lang="en">
<head>
<?php $this->load->view('header'); ?>
</head>
<body>
<div id="wrapper">
	<?php $this->load->view('menu') ?>
	<div id="page-wrapper" lang="ar" dir="rtl">
	<div class="a4wrapper">

	<div class="a4page">
		<div class="page-header">
	        <h1 class="centered">Movement / Disposal Of Assets<br>طلب نقل بضائع / أصول </h1>
	    </div>
	    <?php if (isset($message)): ?>
	    	<div class="alert alert-<?php echo $message['type']; ?>">
	        	<strong><?php echo $message['head']; ?></strong>
	        	<p><?php echo (isset($message['body'])) ? $message['body'] : ''; ?></p>
	    	</div>
	    <?php endif ?>
		
		<div class="group col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="rtl col-lg-6 col-md-6 col-sm-6 col-xs-6">
				<div><span class="data-head">من :- </span><?php echo $form['from_hotel']; ?></div>
				<div><span class="data-head">المملوك ل :- </span><?php echo $form['from_company']; ?></div>
				
			</div>
		</div>

		<div class="group col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="rtl col-lg-6 col-md-6 col-sm-6 col-xs-6">
				<div><span class="data-head">الى :- </span><?php echo $form['to_hotel']; ?></div>
				<div><span class="data-head">المملوك ل :- </span><?php echo $form['to_company']; ?></div>
				
			</div>
		</div>


		<div class="group col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="rtl col-lg-6 col-md-6 col-sm-6 col-xs-6">
				<div><span class="data-head">تاريخ الطلب :- </span><?php echo $form['issue_date']; ?></div>
				<div><span class="data-head">تاريخ الوصول المتوقع :- </span><?php echo $form['delivery_date']; ?></div>
			</div>
		</div>

		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-container">
		<table class="rtl table table-bordered table-striped">
		 	<thead>
	        	<tr>
	          		<th class="align-right">البضاعة المطلوبة </th>
	          		<th class="align-right">العدد</th>
	          	</tr>
			</thead>
			<tbody>
				<?php if(isset($items)): ?>
					<?php foreach ($items as $item): ?>
						<tr>
							<td><?php echo $item['name']; ?></td>
							<td><?php echo $item['quantity']; ?></td>
						</tr>
					<?php endforeach; ?>
				<?php endif; ?>
			</tbody>
		</table>
		</div>

		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-container">
			<div><span class="data-head">المكان الموجة الية البضاعة : - </span><div class="inline-text"><?php echo $form['destination']; ?></div></div>
		</div>

		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-container">
		<div class="data-head centered"></div>
			
			<div class="row rtl">

				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 stamper">
					<div class="data-head">مدير ادارة الاستثمار </div>
					<div class="data-content"><span class="name-data-content"><?php echo $form['inv_dpt_mgr_fullname']; ?></span></div>
					<?php if ($form['inv_dpt_mgr_id']): ?>
						<div class="data-content"><img src="<?php echo $signature_path.$form['inv_dpt_mgr_signature']; ?>" alt="<?php echo $form['inv_dpt_mgr_fullname']; ?>" class="img-rounded sign-image"></div>
					<?php elseif(isset($user_signs['inv_dpt_mgr'])): ?>
						<div class="data-content"><a href="/forms/sign_owning/<?php echo $form['id']; ?>/inv_dpt_mgr" class="btn btn-success">Sign here</a></div>
					<?php else: ?>
						<div class="data-content"></div>
					<?php endif; ?>
				</div>

				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 stamper">
					<div class="data-head">مدير حسابات </div>
					<div class="data-content"><span class="name-data-content"><?php echo $form['acc_mgr_fullname']; ?></span></div>
					<?php if ($form['acc_mgr_id']): ?>
						<div class="data-content"><img src="<?php echo $signature_path.$form['acc_mgr_signature']; ?>" alt="<?php echo $form['acc_mgr_fullname']; ?>" class="img-rounded sign-image"></div>
					<?php elseif(isset($user_signs['acc_mgr'])): ?>
						<div class="data-content"><a href="/forms/sign_owning/<?php echo $form['id']; ?>/acc_mgr" class="btn btn-success">Sign here</a></div>
					<?php else: ?>
						<div class="data-content"></div>
					<?php endif; ?>
				</div>

				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 stamper">
					<div class="data-head">مدير ادارة المشتريات </div>
					<div class="data-content"><span class="name-data-content"><?php echo $form['pur_dpt_mgr_fullname']; ?></span></div>
					<?php if ($form['pur_dpt_mgr_id']): ?>
						<div class="data-content"><img src="<?php echo $signature_path.$form['pur_dpt_mgr_signature']; ?>" alt="<?php echo $form['pur_dpt_mgr_fullname']; ?>" class="img-rounded sign-image"></div>
					<?php elseif(isset($user_signs['pur_dpt_mgr'])): ?>
						<div class="data-content"><a href="/forms/sign_owning/<?php echo $form['id']; ?>/pur_dpt_mgr" class="btn btn-success">Sign here</a></div>
					<?php else: ?>
						<div class="data-content"></div>
					<?php endif; ?>
				</div>

				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 stamper">
					<div class="data-head">رئيس قسم المشتريات </div>
					<div class="data-content"><span class="name-data-content"><?php echo $form['pur_sec_mgr_fullname']; ?></span></div>
					<?php if ($form['pur_sec_mgr_id']): ?>
						<div class="data-content"><img src="<?php echo $signature_path.$form['pur_sec_mgr_signature']; ?>" alt="<?php echo $form['pur_sec_mgr_fullname']; ?>" class="img-rounded sign-image"></div>
					<?php elseif(isset($user_signs['pur_sec_mgr'])): ?>
						<div class="data-content"><a href="/forms/sign_owning/<?php echo $form['id']; ?>/pur_sec_mgr" class="btn btn-success">Sign here</a></div>
					<?php else: ?>
						<div class="data-content"></div>
					<?php endif; ?>
				</div>

				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 stamper">
					<div class="data-head">مدير المالي للقطاع</div>
					<div class="data-content"><span class="name-data-content"><?php echo $form['con_acc_mgr_fullname']; ?></span></div>
					<?php if ($form['con_acc_mgr_id']): ?>
						<div class="data-content"><img src="<?php echo $signature_path.$form['con_acc_mgr_signature']; ?>" alt="<?php echo $form['con_acc_mgr_fullname']; ?>" class="img-rounded sign-image"></div>
					<?php elseif(isset($user_signs['con_acc_mgr'])): ?>
						<div class="data-content"><a href="/forms/sign_owning/<?php echo $form['id']; ?>/con_acc_mgr" class="btn btn-success">Sign here</a></div>
					<?php else: ?>
						<div class="data-content"></div>
					<?php endif; ?>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 stamper">
					<div class="data-head">العضو المنتدب </div>
					<div class="data-content"><span class="name-data-content"><?php echo $form['cpo_fullname']; ?></span></div>
					<?php if ($form['cpo_id']): ?>
						<div class="data-content"><img src="<?php echo $signature_path.$form['cpo_signature']; ?>" alt="<?php echo $form['cpo_fullname']; ?>" class="img-rounded sign-image"></div>
					<?php elseif(isset($user_signs['cpo'])): ?>
						<div class="data-content"><a href="/forms/sign_owning/<?php echo $form['id']; ?>/cpo" class="btn btn-success">Sign here</a></div>
					<?php else: ?>
						<div class="data-content"></div>
					<?php endif; ?>
				</div>
			</div>
		</div>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-container">
			<div class="row">
				<form action="/forms/comment/<?php echo $form['id']; ?>" method="POST" id="form-submit" class="form-div span12" accept-charset="utf-8">
				<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
					<textarea class="form-control" name="comment" id="comment"></textarea>
				</div>
				<input name="submit" value="اضف تعليق" type="submit" class="inverse-offset btn btn-success"></input>
				</form>
			</div>
		</div>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-container">
			<div class="row">
				<div class="data-head centered">تعليقات </div>
				<div class="data-container">
					<?php foreach ($comments as $comment): ?>
						<div><span class="data-head"><?php echo $comment['fullname']; ?> :- </span><?php echo $comment['comment']; ?></div>
					<?php endforeach; ?>
				</div>
			</div>
		</div>

	</div>

	</div>
	</div>
</div>
</body>
</html>