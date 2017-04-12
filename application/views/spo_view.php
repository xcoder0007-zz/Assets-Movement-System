<!DOCTYPE html>
<html lang="en">
  <head>
    <?php $this->load->view('header');?>
  </head>
  <body>
    <div id="container">
      <?php $this->load->view('menu'); ?>
        <div id="page-wrapper">
          <div  class="a4wrapper">
            <div>
              <div>
                <input class="non-printable form-actions btn btn-success" type="button" value="Print this page" onClick="window.print()">
                <div class="page-header">
                  <div class="header-logo"><img src="/assets/uploads/logos/<?php echo $spo_contents['logo'] ?>" />
                  <h3 class="centered"><?php echo $spo_contents['hotel_name']?></h3>
                  <br>
                  <table class="table table-striped table-bordered table-condensed">
                    <tr>
                      <td>Date </td>  
                      <td><?php echo $spo_contents['date']?> </td>
                    </tr>
                    <tr>
                      <td>Season </td> 
                      <td><?php echo $spo_contents['season']?> </td>
                    </tr>
                    <tr>
                      <td>Travel Period  </td>  
                      <td><?php echo $spo_contents['Travel_Date']?> </td>
                    </tr>
                    <tr>
                      <td>Booking Window </td>  
                      <td><?php echo $spo_contents['Booking_Window']?> </td>
                    </tr>
                    <tr>
                      <td>Arrival Date </td>  
                      <td><?php echo $spo_contents['arrival_date']?> </td>
                    </tr>
                    <tr>
                      <td>To </td>  
                      <td><?php echo $spo_contents['to']?> </td>
                    </tr>
                    <tr>
                      <td>Hotel </td>  
                      <td><?php echo $spo_contents['hotel_name']?> </td>
                    </tr>
                  </table>
                  <br>
                  <br>
                  <table class="centerd table table-striped table-bordered table-condensed" style = "font-size:14;">
                    <tr>
                      <td colspan="2" class="centered">Period</td>
                      <td colspan="2" class="centered">Occupancy MTD </td>
                      <td colspan="1" class="centered">contracted  <br />Rate </td>
                      <td colspan="1" class="centered" style = "width:10px">SPO </td>
                      <td colspan="1" class="centered">Discount <br />Persantage <br /> %</td>
                      <td colspan="1" class="centered" style = "width:10px">Room Nights </td>
                      <td colspan="2" class="centered">Matreialization </td>
                      <td colspan="1" class="centered" style = "width:10px">Empty seats </td>
                      <td colspan="1" class="centered">Expected   <br />Occupancy </td>
                      <td colspan="1" class="centered" style = "width:10px">Currency</td>
                    </tr>
                    <?php foreach ($get_spo_items as $item) { ?>
                    <tr>
                      <td class="centered">
                        <span class="td_span">From </span> <hr/>
                        <?php echo $item['peroid_from']?> 
                      </td>  
                      <td class="centered"> 
                        <span class="td_span">To </span><hr />
                        <?php echo $item['peroid_to']?>  
                      </td>
                      <td class="centered"> 
                        <span class="td_span">Occ%</span> <hr /> 
                        <?php echo $item['MTD_OCC']?> 
                      </td>  
                      <td class="centered">
                        <span class="td_span">Month </span><hr /> 
                        <?php echo $item['MTD_month']?>  
                      </td>
                      <td class="centered"><?php echo $item['Contracted_prices'] ?> </td>
                      <td class="centered"><?php echo $item['spo'] ?> </td>
                      <td class="centered"><?php echo $item['Discount_percentage']?>  </td>
                      <td class="centered"><?php echo $item['room_nights'] ?> </td>
                      <td class="centered">
                        <span class="td_span">Occ%</span> <hr /> 
                        <?php echo $item['Materialization_occ']?> 
                      </td>  
                      <td class="centered"> 
                        <span class="td_span">Month</span> <hr /> 
                        <?php echo $item['Materialization_month']?>  
                      </td>
                      <td class="centered"><?php echo $item['Empty_seats'] ?> </td>
                      <td class="centered"><?php echo $item['Expected_occupancy']  ?> </td>
                      <td class="centered"><?php echo $item['currency']  ?> </td>
                    </tr>
                    <?php $_SESSTION['currency'] = $item['currency']; } ?>
                  </table>
                  <br>
                  <br>
                  <table class="table table-striped table-bordered table-condensed">
                    <tr>
                      <td colspan="7">Competition Survey</td>
                    </tr>
                    <tr>
                      <td>Hotel</td>
                      <td colspan="2">Peroid</td>   
                      <td>Price</td>
                      <td colspan="2">Peroid</td>
                      <td>Price</td>
                    </tr>
                    <?php foreach ($get_spo_Competition as $item) { ?>
                    <tr>
                      <td>
                        <span> <?php echo $item['hotel']?> </span> 
                      </td>
                      <td colspan="2">
                        <span><?php echo $item['from']?>  </span> TO <span> <?php echo $item['to']?> </span>
                      </td>
                      <td>
                        <span><?php echo $item['price'].$_SESSTION['currency']?></span> 
                      </td>
                      <td colspan="2">
                        <span><?=$item['from2']?></span> TO <span><?=$item['to2']?></span>
                      </td>
                      <td >
                        <span><?php echo $item['price2'].$_SESSTION['currency']?> </span>
                      </td>
                    </tr>
                    <?php }
                      unset($_SESSTION['currency']); ?>
                  </table>
                  <br>
                 </div>
                </div>
              </div>
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-catcher centered">
                <?php $queue_first = TRUE; ?>
                <?php foreach ($signers as $signe_id => $signer): ?>
                <div class="signature-wrapper">
                  <div class="data-head relative"><?php echo (strlen($signer['role']) == 0)? "Spo Owner" : $signer['role'] ?>
                    <span class="expander-container"><i class='glyphicon glyphicon-envelope'></i></span>
                    <div class="expander-wrapper">
                      <span class="expander-remover"><i class='glyphicon glyphicon-remove'></i></span>
                      <div class="expander">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-holder">
                          <div class="row">
                            <form action="/spo/mailto/<?php echo $spo_contents['id']; ?>" method="POST" id="form-submit" class="form-div span12" accept-charset="utf-8">
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
                    <a href="/spo/unsign/<?php echo $signe_id; ?>" class="non-printable btn btn-primary unsign">Cancel</a>
                    <?php endif ?>
                  </div>
                  <div class="data-content"><span class="name-data-content"><?php echo $signer['sign']['name']; ?></span>
                  <br /><span class="timestamp-data-content"><?php echo $signer['sign']['timestamp']; ?></span></div>
                  <?php elseif (array_key_exists($user_id, $signer['queue']) && $queue_first): ?>
                  <?php $queue_first = FALSE; ?>
                  <div class="data-content non-printable"><span class="data-label sign-data-content"></span><a href="/spo/sign/<?php echo $signe_id; ?>/reject" class="btn btn-danger">Reject</a><a href="/spo/sign/<?php echo $signe_id; ?>" class="btn btn-success">sign</a></div>
                  <?php else: ?>
                  <?php $queue_first = FALSE; ?>
                  <?php endif ?>
                </div>
                <?php if (isset($signer['sign']['reject'])){break;}?>
                <?php endforeach ?>
              </div>
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-catcher non-printable">
                <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                  <form action="/spo/comment/<?php echo $spo_contents['id']?>" method="POST" id="form-submit" class="form-div span12" accept-charset="utf-8">
                    <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                     <textarea class="form-control" name="comment" id="comment"></textarea>
                    </div>
                    <input name="spo_id" value="<?php echo $spo_contents['id']?>" type="hidden" />
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
                    <?php foreach($GetComment as $qury ){ ?>
                    <div class="data-holder">
                      <span class="data-head"><?php echo $qury['fullname']; ?> :- </span><?php echo $qury['comment']; ?>
                      <span class="timestamp-data-content"><?php echo $qury['created'];?></span>
                    </div>
                    <?php } ?>
                  </div>
                </div>  
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
