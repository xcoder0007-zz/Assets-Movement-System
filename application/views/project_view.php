<!DOCTYPE html>
<html lang="en">
<head>
<?php $this->load->view('header'); ?>
</head>
<body>
<div id="wrapper">
	<?php $this->load->view('menu') ?>
	<div id="page-wrapper">
       	<button onclick="window.print()" class="non-printable form-actions btn btn-success printer" href="" >Print</button><br /><br />
	<div class="a4wrapper">

	<div class="a4page">
		<div class="page-header">
	        <h1 class="centered">Project #<?php echo $project_code; ?> &nbsp;&nbsp;#<?php echo $project['id']; ?> &nbsp;&nbsp; ( <?php echo $project['origin_name']; ?> )
	        <?php if ($purchasing): ?>
	        	<a class="form-actions btn btn-info non-printable" href="/projects/purchasing/<?php echo $project['code'] ?>" >Edit Project </a>
	        <?php elseif($is_editor): ?>
	        	<a class="form-actions btn btn-info non-printable" href="/projects/edit/<?php echo $project['code'] ?>" >Edit Project </a>
	        <?php endif ?>
	        </h1>
	    </div>
	    <?php if(false): //(isset($message)): ?>
	    	<div class="alert alert-<?php echo $message['type']; ?>">
	        	<strong><?php echo $message['head']; ?></strong>
	        	<p><?php echo (isset($message['body'])) ? $message['body'] : ''; ?></p>
	    	</div>
	    <?php endif ?>
		<table class="table table-striped table-bordered table-condensed">
			<tbody>
				<tr class="item-row">
					<td class="align-right table-label">Hotel:</td><td><?php echo $project['hotel_name']; ?></td>
				</tr>
				<tr class="item-row">
					<td class="align-right table-label">Project Type:</td><td><?php echo $project['type_name']; ?></td>
				</tr>
				<tr class="item-row">
					<td class="align-right table-label">Department:</td><td><?php echo $project['department_name']; ?></td>
				</tr>
				<tr class="item-row">
					<td class="align-right table-label">Project Name:</td><td><?php echo $project['project_name']; ?></td>
				</tr>
				<tr class="item-row">
					<td class="align-right table-label">Project Year:</td><td><?php echo $project['year']; ?></td>
				</tr>
				<tr class="item-row">
					<td class="align-right table-label">Reasons:</td><td><?php echo $project['reasons']; ?></td>
				</tr>
				<tr class="item-row">
					<td class="align-right table-label">Scope:</td><td><?php echo $project['scope']; ?></td>
				</tr>
				<tr class="item-row">
					<td class="align-right table-label">Create Date:</td><td><?php echo $project['timestamp']; ?></td>
				</tr>


			</tbody>
		</table>

		<?php if ($project['origin_id'] == 2): ?>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-catcher data-indention">

			<table class="table table-striped table-bordered table-condensed">
				<thead>
					<tr>
						<th>Item</th>
						<th>Quantity</th>
						<th>Total Value</th>
					</tr>
				</thead>
				<tbody>
					<?php foreach ($items as $item): ?>
						<tr class="item-row">
							<td><?php echo $item['name'] ?></td>
							<td><?php echo $item['quantity'] ?></td>
							<td class="item-value" data-value="<?php echo $item['value']; ?>" class="align-right"><?php echo $item['quantity']*$item['value']; ?> EGP</td>
						</tr>
					<?php endforeach ?>
				</tbody>
			</table>
		</div>
		<?php endif ?>


		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-catcher data-indention">
			<div><span class="data-head">Suppliers:</span>
			<table class="table table-striped table-bordered table-condensed">
			<tbody>
			<?php foreach ($suppliers as $supplier): ?>
				<tr class="item-row"><td><?php echo $supplier['name']; ?></td></tr>
			<?php endforeach ?>
			</tbody>
			</table>
			</div>
		</div>

		<div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12 data-catcher">
			<label for="supplier[]" class="col-lg-2 col-md-3 col-sm-5 col-xs-5 control-label">Offers:</label>
			<div class="form-group col-lg-9 col-md-8 col-sm-7 col-xs-7">
		    <?php foreach($offers as $offer): ?>
				<a href='/assets/uploads/files/<?php echo $offer['name'] ?>'><?php echo $offer['name'] ?></a><br />
			<?php endforeach ?>
			</div>
		</div>
		<div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12 data-catcher">
		</div>

		<table class="table table-striped table-bordered table-condensed">
			<tbody>
				<tr class="item-row">
					<td id="hidden-cell"></td>
					<td class="align-right table-label">Exchange Rate</td>
					<td class="align-right table-label-small">USD:</td>
					<td><?php echo $project['USD_EX']; ?></td>
					<td class="align-right table-label-small">EUR:</td>
					<td><?php echo $project['EUR_EX']; ?></td>
				</tr>
				<tr>
					<td class="align-right table-label">Budget Cost</td>
					<td colspan="7"><?php echo number_format($project['budget'],2,".",","); ?>&nbsp;&nbsp;&nbsp;LE</td>
				</tr>
				<tr class="item-row">
					<td id="hidden-cell"></td>
					<td class="align-right table-label-small">EGP:</td>
					<td><?php echo number_format($project['budget_EGP'],2,".",","); ?></td>
					<td class="align-right table-label-small">USD:</td>
					<td><?php echo number_format($project['budget_USD'],2,".",","); ?></td>
					<td class="align-right table-label-small">EUR:</td>
					<td><?php echo number_format($project['budget_EUR'],2,".",","); ?></td>
				</tr>
				
				<tr>
					<td class="align-right table-label">Final Cost</td>
					<td colspan="7"><?php echo number_format($project['cost'],2,".",","); ?>&nbsp;&nbsp;&nbsp;LE</td>
				</tr>
				<tr class="item-row">
					<td id="hidden-cell"></td>
					<td class="align-right table-label-small">EGP:</td>
					<td><?php echo number_format($project['cost_EGP'],2,".",","); ?></td>
					<td class="align-right table-label-small">USD:</td>
					<td><?php echo number_format($project['cost_USD'],2,".",","); ?></td>
					<td class="align-right table-label-small">EUR:</td>
					<td><?php echo number_format($project['cost_EUR'],2,".",","); ?></td>
				</tr>
			</tbody>
		</table>

		<br />
		<br />
		<br />
		
		<table class="table table-striped table-bordered table-condensed">
			<tbody>
				<tr>
					<td colspan="4">Time Schedule:</td>
				</tr>
				<tr class="item-row">
					<td>Start</td>
					<td><?php echo $project['start'] ?></td>
					<td>End</td>
					<td><?php echo $project['end'] ?></td>
				</tr>
			</tbody>
		</table>

		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-catcher data-indention">
			<div><span class="data-head">Remarks:</span><div class="inline-text"><?php echo $project['remarks']; ?></div></div>
		</div>

		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-catcher">
		<?php $sign_enabled = TRUE; ?>
		<?php foreach ($signers as $signe_id => $signer): ?>
			<div class="signature-wrapper">
				<div class="data-head relative"><?php echo (strlen($signer['role']) == 0)? "Project Owner" : $signer['role'] ?>
					<span class="expander-container"><i class='glyphicon glyphicon-envelope'></i></span>
					<div class="expander-wrapper">
					<span class="expander-remover"><i class='glyphicon glyphicon-remove'></i></span>
						<div class="expander">
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-holder">
								<div class="row">
									<form action="/projects/mailto/<?php echo $project['code']; ?>" method="POST" id="form-submit" class="form-div span12" accept-charset="utf-8">
										<?php if (isset($signer['sign'])): ?>
										<?php $i=1; ?>
										<input checked="checked" type="radio" name="mail" value="<?php echo $signer['sign']['mail'] ?>" /><label>To: <?php echo $signer['sign']['name'] ?></label>
										<?php else: ?>
											<?php $i=0; foreach ($signer['queue'] as $id => $signe): ?>
												<input <?php echo (++$i == 1)? 'checked="checked"' : '' ?> type="radio" name="mail" value="<?php echo $signe['mail'] ?>" id="u<?php echo $id ?>" /><label for="u<?php echo $id ?>">To: <?php echo $signe['name'] ?></label><br />
											<?php endforeach ?>
										<?php endif; ?>
										<?php if (isset($i) && $i == 0): ?>
											<span>No users availaable</span>
										<?php else: ?>
										<textarea class="form-control" name="message" id="message"></textarea>
										<input name="submit" value="Send" type="submit" class="inverse-offset btn btn-success" />
										<?php endif; ?>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<?php if (isset($signer['sign'])): ?>
					<div class="data-content"><img src="<?php echo isset($signer['sign']['reject'])? $signature_path.'rejected.png' : $signature_path.'approved.png'; ?>" alt="<?php echo $signer['sign']['name']; ?>" class="img-rounded sign-image">
						<?php if (($signer['sign']['id'] == $user_id && $unsign_enable) || $is_admin): ?>
							<a href="/projects/unsign/<?php echo $signe_id; ?>" class="btn btn-primary unsign">Cancel</a>
						<?php endif ?>
					</div>
					<div class="data-content"><span class="name-data-content"><?php echo $signer['sign']['name']; ?></span>
					<br /><span class="timestamp-data-content"><?php echo $signer['sign']['timestamp']; ?></span></div>
				<?php elseif (array_key_exists($user_id, $signer['queue']) && $project['state_id'] != 11 && $sign_enabled): ?>
					<div class="data-content non-printable"><span class="data-label sign-data-content"></span><a href="/projects/sign/<?php echo $signe_id; ?>/reject" class="btn btn-danger">Reject</a><a href="/projects/sign/<?php echo $signe_id; ?>" class="btn btn-success">sign</a></div>
				<?php else: ?>
					<?php $sign_enabled = FALSE; ?>
				<?php endif ?>
			</div>
		
		<?php endforeach ?>
		<script type="text/javascript">
		$(".expander-container").on("click", function(){
			$(".expander-wrapper").hide();
			$(this).parent().find(".expander-wrapper").toggle("fast");
		});

		$(".expander-remover").on("click", function(){
			$(this).parent().hide("fast");
		});
		</script>
		</div>

		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-catcher non-printable">
			<div class="row">
				<form action="/projects/comment/<?php echo $project['id']; ?>/<?php echo $project['code']; ?>" method="POST" id="form-submit" class="form-div span12" accept-charset="utf-8">
				<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
					<textarea class="form-control" name="comment" id="comment"></textarea>
				</div>
				<input name="submit" value="Comment" type="submit" class="inverse-offset btn btn-success" />
				</form>
			</div>
		</div>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-holder">
			<div class="row">
				<div class="data-head centered">Comments </div>
				<div class="data-holder">
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