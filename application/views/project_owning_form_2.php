<?php 
function array_assoc_value_exists($arr, $index, $search) {
	foreach ($arr as $key => $value) {
		if ($value[$index] == $search) {
			return TRUE;
		}
	}
	return FALSE;
}
 ?>
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
	    <?php if(false): //(isset($message)): ?>
	    	<div class="alert alert-<?php echo $message['type']; ?>">
	        	<strong><?php echo $message['head']; ?></strong>
	        	<p><?php echo (isset($message['body'])) ? $message['body'] : ''; ?></p>
	    	</div>
	    <?php endif ?>
		<table class="table table-striped table-bordered table-condensed">
			<tbody>
				<tr class="item-row">
					<td class="align-right table-label">From:</td><td><?php echo $project['hotel_name']; ?></td>
				</tr>
				<tr class="item-row">
					<td class="align-right table-label">Project Name:</td><td><?php echo $project['project_name']; ?></td>
				</tr>
				<tr class="item-row">
					<td class="align-right table-label">Owning Company:</td><td><?php echo $project['company_name']; ?></td>
				</tr>
				<tr class="item-row">
					<td class="align-right table-label">Scope of Project:</td><td><?php echo $project['scope']; ?></td>
				</tr>
				<tr class="item-row">
					<td class="align-right table-label">Estimated Financial Cost:</td><td><?php echo $project['budget']; ?></td>
				</tr>
				<tr class="item-row">
					<td class="align-right table-label">Start Date:</td><td><?php echo $project['start']; ?></td>
				</tr>
				<tr class="item-row">
					<td class="align-right table-label">End Date:</td><td><?php echo $project['end']; ?></td>
				</tr>


			</tbody>
		</table>

				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-catcher">
				<?php foreach ($signers as $signe_id => $signer): ?>
					<div class="signature-wrapper">
						<div class="data-head relative"><?php echo (strlen($signer['role']) == 0)? "Project Owner" : $signer['role'] ?>
							<span class="expander-container"><i class='glyphicon glyphicon-envelope'></i></span>
							<div class="expander-wrapper">
							<span class="expander-remover"><i class='glyphicon glyphicon-remove'></i></span>
								<div class="expander">
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-holder">
										<div class="row">
											<form action="/project_owning/mailto/<?php echo $project['id']; ?>" method="POST" id="form-submit" class="form-div span12" accept-charset="utf-8">
												<?php if (isset($signer['sign'])): ?>
													<?php $i=1; ?>
													<input checked="checked" type="radio" name="mail" value="<?php echo $signer['sign']['mail'] ?>" /><label>To: <?php echo $signer['sign']['name'] ?></label>
												<?php else: ?>
													<?php $i=0; foreach ($signer['queue'] as $id => $approve): ?>
														<input <?php echo (++$i == 1)? 'checked="checked"' : '' ?> type="radio" name="mail" value="<?php echo $approve['mail'] ?>" id="u<?php echo $id ?>" /><label for="u<?php echo $id ?>">To: <?php echo $approve['name'] ?></label><br />
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
							<?php if ($signer['sign']['id'] == $user_id): ?>
							<a href="/project_owning/unsign/<?php echo $signe_id; ?>" class="btn btn-primary unsign">Cancel</a>
						<?php endif ?>
							</div>
							<div class="data-content"><span class="name-data-content"><?php echo $signer['sign']['name']; ?></span>
							<br /><span class="timestamp-data-content"><?php echo $signer['sign']['timestamp']; ?></span></div>
						<?php elseif (array_key_exists($user_id, $signer['queue'])): ?>
							<div class="data-content non-printable"><span class="data-label sign-data-content"></span><a href="/project_owning/reject/<?php echo $signe_id; ?>" class="btn btn-danger">Reject</a><a href="/project_owning/sign/<?php echo $signe_id; ?>" class="btn btn-success">sign</a></div>
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
						<form action="/project_owning/comment/<?php echo $project_id; ?>" method="POST" id="form-submit" class="form-div span12" accept-charset="utf-8">
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
