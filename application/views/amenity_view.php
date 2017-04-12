<!DOCTYPE html>
<html lang="en">
	<head>
		<?php $this->load->view('header'); ?>
	</head>
	<body>
		<div id="wrapper">
			<?php $this->load->view('menu') ?>
			<div id="page-wrapper">
       			<button onclick="window.print()" class="non-printable form-actions btn btn-success" href="" >Print</button>
					<div class="a4wrapper">
						<div class="a4page">
							<div class="page-header">
							    <div class="header-logo"><img src="/assets/uploads/logos/<?php echo $amenity['logo']; ?>"/></div>
                  				<h1 class="centered"><?php echo $amenity['hotel_name']; ?></h1>
								<h3 class="centered">
	        						Guest Amenity Request Form No. #<?php echo $amenity['id']; ?>
	        					</h3>	    					
	        				</div>
							<table class="table table-striped table-bordered table-condensed">
								<tr class="item-row">
									<td class="align-left table-label">Room Number:</td>
									<td class="align-left table-label"><?php echo $amenity['room']; ?></td>
								</tr>
								<tr class="item-row">
									<td class="align-left table-label">Guest Name:</td>
									<td class="align-left table-label"><?php echo $amenity['guest']; ?></td>
								</tr>
								<tr class="item-row">
									<td class="align-left table-label">Guest Nationality:</td>
									<td class="align-left table-label"><?php echo $amenity['nationality']; ?></td>
								</tr>
								<tr class="item-row">
									<td class="align-left table-label">Arrival Date:</td>
									<td class="align-left table-label"><?php echo $amenity['arrival']; ?></td>
								</tr>
								<tr class="item-row">
									<td class="align-left table-label">Departure Date:</td>
									<td class="align-left table-label"><?php echo $amenity['departure']; ?></td>
								</tr>
								<tr class="item-row">
									<td class="align-left table-label">Date and Time of Delivery:</td>
									<td class="align-left table-label"><?php echo $amenity['date_time']; ?></td>
								</tr>
								<tr class="item-row">
									<td class="align-left table-label">Treatment:</td>
									<td class="align-left table-label"><?php echo $amenity['treatment']; ?></td>
								</tr>
								<tr class="item-row">
									<td class="align-left table-label">Treatment Special Request:</td>
									<td class="align-left table-label"><?php echo $amenity['request']; ?></td>
								</tr>
								<tr class="item-row">
									<td class="align-left table-label">Reason:</td>
									<td class="align-left table-label"><?php echo $amenity['reason']; ?></td>
								</tr>
								<tr class="item-row">
									<td class="align-left table-label">Requested by:</td>
									<td class="align-left table-label"><?php echo $amenity['requested']; ?></td>
								</tr>
								<tr class="item-row">
									<td class="align-left table-label">Charged To:</td>
									<td class="align-left table-label"><?php echo $amenity['charged']; ?></td>
								</tr>
								<tr class="item-row">
									<td class="align-left table-label">Message Card attached:</td>
									<td class="align-left table-label"><?php echo $amenity['attached']; ?></td>
								</tr>
								<tr class="item-row">
									<td class="align-left table-label">By:</td>
									<td class="align-left table-label"><?php echo $amenity['byy']; ?></td>
								</tr>
							</table>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-catcher centered">
			                	<?php $queue_first = TRUE; ?>
			                	<?php foreach ($signers as $signe_id => $signer): ?>
			                	<div class="signature-wrapper">
			                  		<div class="data-head relative"><?php echo (strlen($signer['role']) == 0)? "amenity Owner" : "F. O. Manager" ?>
			                    		<span class="expander-container"><i class='glyphicon glyphicon-envelope'></i></span>
			                    		<div class="expander-wrapper">
			                      			<span class="expander-remover"><i class='glyphicon glyphicon-remove'></i></span>
			                      			<div class="expander">
			                        			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-holder">
			                          				<div class="row">
			                            				<form action="/amenity/mailto/<?php echo $amenity['id']; ?>" method="POST" id="form-submit" class="form-div span12" accept-charset="utf-8">
			                              					<?php if (isset($signer['sign'])): ?>
			                              					<?php $i=1; ?>
			                              					<input checked="checked" type="radio" name="mail" value="<?php echo $signer['sign']['mail'] ?>" /><label>To: <?php echo $signer['sign']['name'] ?></label>
			                              					<?php else: ?>
			                              					<?php $i=0; foreach ($signer['queue'] as $id => $signe): ?>
			                              					<input <?php echo (++$i == 1)? 'checked="checked"' : '' ?> type="radio" name="mail" value="<?php echo $signe['mail'] ?>" id="u<?php echo $id ?>" /><label for="u<?php echo $id ?>">To: <?php echo $signe['name'] ?></label><br />
			                              					<?php endforeach ?>
			                              					<?php endif; ?>
			                              					<?php if (isset($i) && $i == 0): ?>
			                              					<span>No users available</span>
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
			                    		<a href="/amenity/unsign/<?php echo $signe_id; ?>" class="non-printable btn btn-primary unsign">Cancel</a>
			                    		<?php endif ?>
			                  		</div>
			                  		<div class="data-content">
			                  			<span class="name-data-content"><?php echo $signer['sign']['name']; ?></span>
			                  			<br />
			                  			<span class="timestamp-data-content"><?php echo $signer['sign']['timestamp']; ?></span>
			                  		</div>
			                  		<?php elseif (array_key_exists($user_id, $signer['queue']) && $queue_first): ?>
			                  		<?php $queue_first = FALSE; ?>
			                  		<div class="data-content non-printable"><span class="data-label sign-data-content"></span><a href="/amenity/sign/<?php echo $signe_id; ?>/reject" class="non-printable btn btn-danger">Reject</a><a href="/amenity/sign/<?php echo $signe_id; ?>" class="non-printable btn btn-success">sign</a></div>
			                  		<?php else: ?>
			                  		<?php $queue_first = FALSE; ?>
			                  		<?php endif ?>
			                	</div>
			                    <?php if (isset($signer['sign']['reject'])){break;}?>
			                	<?php endforeach ?>
			              	</div>
			              	<?php if ($amenity['state_id'] > 1){?>
			            		<div style="margin: 20px;">
			            			<input type="radio" name="H. K." checked> H. K. <br>
			            			<input type="radio" name="Room Service" checked> Room Service <br>
			            			<input type="radio" name="Kitchen" checked> Kitchen <br>
			            			<input type="radio" name="Cost Controller" checked> Cost Controller
			            		</div>
			                    <?} ?>
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-catcher non-printable">
                				<div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                  					<form action="/amenity/comment/<?php echo $amenity['id']?>" method="POST" id="form-submit" class="form-div span12" accept-charset="utf-8">
                    					<div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                     						<textarea class="form-control" name="comment" id="comment"></textarea>
                    					</div>
                    					<input name="set_id" value="<?php echo $amenity['id']?>" type="hidden" />
                    					<input name="submit" value="Comment" type="submit" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 form-actions btn btn-success " />
                  					</form>

                				</div>
              				</div>
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-holder">
                				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-catcher">
                  					<div class="data-head centered"> 
                    					<h3>Comments</h3> 
                  					</div>
                  					<div class="data-holder">
                    					<?php foreach($GetComment as $comment ){ ?>
                    					<div class="data-holder">
                      						<span class="data-head"><?php echo $comment['fullname']; ?> :- </span><?php echo $comment['comment']; ?>
                      						<span class="timestamp-data-content"><?php echo $comment['created'];?></span>
                    					</div>
                    					<?php } ?>
                  					</div>
                				</div>  
                			</div>
                			<div class="data-content">
    							<p class="centered">The Guest Amenity Request has been created by <?php echo $amenity['name'];?> at <?php echo $amenity['timestamp'];?></p>
    						</div>
						</div>
					</div>
				</div>
			</div>
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
    	<script type="text/javascript">
      		function printDiv(divName) {
        		var printContents = document.getElementById(divName).innerHTML;
        		var originalContents = document.body.innerHTML;
        		document.body.innerHTML = printContents;
        		window.print();
        		document.body.innerHTML = originalContents;
      		}
    	</script>
	</body>
</html>