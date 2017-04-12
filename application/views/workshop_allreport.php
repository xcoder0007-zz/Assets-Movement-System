<!DOCTYPE html>
<html lang="en">
<head>
<?php $this->load->view('header'); ?>
<style type="text/css">
	@media print{.noprint{display: none;}}
	
	@media print{
		.higher{
			background-color:#ff0000 !important;
			color:#fff !important;
			-webkit-print-color-adjust: exact;
		}
		.lower{
			background-color:#5cb85c !important;
			color:#fff !important;
			-webkit-print-color-adjust: exact;
		}
		.same{
			background-color:#2400ff !important;
			color:#fff !important;
			-webkit-print-color-adjust: exact;
		}
		.accepted{
			background-color:#9ae191 !important;
			-webkit-print-color-adjust: exact;
		}
	}
</style>
</head>
<body>
<div id="wrapper">
	<?php $this->load->view('menu') ?>
	<div id="page-wrapper">
	<div class="container">

		<div class="rest-selector col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<fieldset>
			<legend class="title-table">Workshop Requests</legend>
				<?php $this->load->view('workshop_request_simple_report_form'); ?>
			
			</fieldset>
		</div>
		
		</div>
		<?php if (isset($posting)): ?>
			
			<div class="title-table"></div>
			<table class="report-view-large" style="width:100%;">
			<thead>
				<tr>
					<td style="text-align:center;">Order No</td>
					<td style="text-align:center;">Items</td>
					<td style="text-align:center;">Hotel</td>
					<td style="text-align:center;">Date</td>
					<td style="text-align:center;">Delivery Date</td>
					<td style="text-align:center;">Cost</td>
					<td style="text-align:center;">Done</td>
					<td style="width: 10%;">Remarks</td>
				</tr>
			</thead>
			<tbody>
			<?php foreach ($workshop_requests as $request): ?>
				<tr>
					<td style="text-align:center;"><?php echo $request['id'] ?></td>
			          <td style="text-align:center;">
			            <?php foreach ($request['request_items'] as $request_items): ?>
			                <div><?php echo $request_items['unit']; ?></div>
			            <?php endforeach; ?>
			          </td>


					 <td style="text-align:center; display: none;">
			          <?php if(!empty($request['items'])): ?>
			          	<?php $total_price = 0; ?>
			            <?php foreach ($request['items'] as $item): ?>
			                <div><?php echo $item['unit']; ?></div>
					 		<?php $total_price += $item['price']; ?>
			            <?php endforeach; ?>
			          <?php endif ?>
			          </td>
			          
					<td style="text-align:center;"><?php echo $request['from_hotel'] ?></td>
					<td style="text-align:center;"><?php echo substr($request['timestamp'], 0, 10) ?></td>
					<td style="text-align:center;"><?php echo $request['delivery_date'] ?></td>
					<td style="text-align:center;"><?php echo $total_price; ?></td>
					
					<td style="text-align:center;"><?php if ($request['done'] == 0): ?><div style="background-color:#ff0000;color:#fff"><?php echo 'Not Done' ?></div>
						<?php elseif ($request['done'] == 1): ?><div style="background-color:#5cb85c;color:#fff"><?php echo 'Done' ?></div>
						<?php endif ?>
					</td>
					
					<td style="text-align:center;"><?php echo $request['remarks'] ?></td>

				</tr>
			<?php endforeach; ?>
			</tbody>
			</table>

		<?php endif; ?>

	</div>
</div>
</body>
</html>
