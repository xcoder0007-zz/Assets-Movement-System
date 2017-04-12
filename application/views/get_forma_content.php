
<!DOCTYPE html>
<html lang="en">
<head>
<?php $this->load->view('header');?>
<style type="text/css">
@page {
    margin: 0;
}
  .signer{
    text-align: center;
  }

  .border_frame{
    border: 1px solid #DCD;
    padding: 5px 20px;
    margin: 0 10px 10px 10px;
    width: 240px;
    display: inline-block;
    height: 96px;
    vertical-align: top;
  }

</style>

<style>
@media print {

.a4page .table>tbody>tr>td.table-label {
  font-weight: normal;

}
.print_button{
  display: none;
}
}
</style>
</head>
<body>
  <div id="container">
<?php $this->load->view('menu'); ?>


        <div id="page-wrapper">
<div class="a4wrapper">

  <div class="a4page">
     <?php foreach($get_forma_content as $forma ){ ?>
    <div class="page-header">
        <input class="print_button" type="button" value="Print this page" onClick="window.print()">
        <h1 class="centered">Reservation discount / Comp. Request #<?=$forma['id'];?></h1>
        <h4 class="centered">Date :  <?=$forma['date'];?></h4>
        <h4 class="centered">Requested by : <?=$forma['recived_by'];?></h4>
    </div>

    <table class="table table-striped table-bordered table-condensed">
      <tbody>
        <tr class="item-row">
          <td class="align-right table-label">Hotel:</td><td><?=$forma['hotel_name'];?></td>
          <td class="align-left table-label"> Guest Name:</td><td><?=$forma['name'];?></td>
        </tr>

        <tr class="item-row">
          <td class="align-right table-label">Arrival:</td><td><?=$forma['arrival'];?></td>
          <td class="align-left table-label">Departure:</td><td><?=$forma['departure'];?></td>
        </tr>

        <tr class="item-row">
          <td class="align-right table-label">Adults:</td><td><?=$forma['adult'];?></td>
          <td class="align-left table-label">Children:</td><td><?=$forma['child'];?></td>
        </tr>
        
        <tr class="item-row">
          <td class="align-right table-label">N. of Rooms:</td><td><?=$forma['rooms'];?></td>
          <td class="align-left table-label">Agent/Company:</td><td><?=$forma['c_name'];?></td>
        </tr>


        <tr class="item-row">
          <td class="align-right table-label">Discount:</td><td><?=$forma['discount'] .'%';?></td>
          <td class="align-left table-label">Board Type:</td><td><?=$forma['board_type'];?></td>
        </tr>

        <tr class="item-row">
          <td class="align-right table-label">Reservation Type:</td><td><?=$forma['type'];?></td>
          <td class="align-left table-label">Reservation Sources:</td><td><?=$forma['res_type'];?></td>
        </tr>

        <tr class="item-row">
          <td  class="align-right table-label">Room Type:</td><td><?=$forma['room_type'];?></td>
          <td  class="table-label">Rate After Discount:</td><td><?=$forma['rate'];?>  <?=$forma['currency'];?></td>
        </tr>

        <tr class="item-row">
          <td  class="align-right table-label">Remarks:</td><td colspan="3"><?=$forma['remarks'];?></td>
        </tr>
    </tbody>
  </table>


<br /><br /><br />

<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-container">
      <div class="row">
        <div class="border_frame col-lg-4 col-md-4 col-sm-4 col-xs-4">
          <div class="data-head relative data-head">Dep. Head</div>




<div class="data-head relative">
<span class="expander-container"><i class='glyphicon glyphicon-envelope'></i></span>
          <div class="expander-wrapper">
          <span class="expander-remover"><i class='glyphicon glyphicon-remove'></i></span>
            <div class="expander">
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-holder">
                <div class="row">
                  <form action="/reservation/mailto/<?php echo $forma['id']; ?>" method="POST" id="form-submit" class="form-div span12" accept-charset="utf-8">
                  <input checked="checked" type="radio" name="mail" value="<?php echo $forma['email'] ?>" id="u<?php echo $forma['userid'] ?>" /><label for="u<?php echo $forma['username'] ?>">To: <?php echo $forma['username'] ?></label><br />
                    <textarea class="form-control" name="message" id="message"></textarea>
                    <input name="submit" value="Send" type="submit" class="inverse-offset btn btn-success" />
                  </form>
                </div>
              </div>
            </div>
          </div>
</div>




          <div class="data-content"><span class="data-label">Name:</span><span class="name-data-content"><?=$forma['username'];?></span>

          <div class="data-content"><span class="data-label sign-data-content">Signature:</span><img style="width: 106px;" src="/assets/uploads/signatures/approved.png" alt="<?=$forma['username'];?>" class="img-rounded sign-image"></div>
          <span class="timestamp-data-content"><?=$forma['timestamp'];?></span>


          </div>

    </div>




 <?php foreach($GET_Users_Who_Sign as $who ){?>

<?php
if ($who->forma_res_id != $forma['id']){

}


// PENDING

elseif ($who->forma_res_id == $forma['id'] && $who->reject == 0 && $who->user_id == 0) {
?>




        <div class="border_frame col-lg-4 col-md-4 col-sm-4 col-xs-4">
          <div class="data-head relative data-head"><?=$who->role;?></div>



<?php

$sql ="SELECT users.fullname,users.email,users.id FROM users
INNER JOIN roles ON roles.id=users.role_id
-- INNER JOIN forma_res ON forma_res.hotel=10
INNER JOIN employees_hotels ON employees_hotels.employee_id=users.id
WHERE employees_hotels.hotel_id IN($who->hotel_id) AND roles.id=$who->role_user";
$query = $this->db->query($sql);
if ($query->num_rows() > 0) {
  foreach ($query->result() as $row) { ?>
<div class="data-head relative">
<span class="expander-container"><i class='glyphicon glyphicon-envelope'></i></span>
          <div class="expander-wrapper">
          <span class="expander-remover"><i class='glyphicon glyphicon-remove'></i></span>
            <div class="expander">
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-holder">
                <div class="row">
                  <form action="/reservation/mailto/<?php echo $forma['id']; ?>" method="POST" id="form-submit" class="form-div span12" accept-charset="utf-8">
                  <input checked="checked" type="radio" name="mail" value="<?=$row->email ?>" id="u<?= $row->id?> " /><label for="u<?= $row->fullname ?>"> To: <?= $row->fullname ?></label><br />
                    <textarea class="form-control" name="message" id="message"></textarea>
                    <input name="submit" value="Send" type="submit" class="inverse-offset btn btn-success" />
                  </form>
                </div>
              </div>
            </div>
          </div>
</div>

<?php }
}

?>



<?php
foreach($get_role_user as $role ){
  if(empty($Get_last_sign_user->rank)){
  if($role['role_id'] ==  $who->role_user &&  $who->rank  == '1'){
?>

<a href="/reservation/approve/<?=$role['id']?>/<?=$forma['id']?>/<?=$role['role_id']?>/<?=$forma['hotel_id'];?>" class="btn btn-success">Approve</a>
<a href="/reservation/reject/<?=$role['id']?>/<?=$forma['id']?>/<?=$role['role_id']?>" class="btn btn-danger">Reject</a>
<?php
  }
}
elseif($role['role_id'] ==  $who->role_user && $who->rank-1 == $Get_last_sign_user->rank){


?>
    <a href="/reservation/approve/<?=$role['id']?>/<?=$forma['id']?>/<?=$role['role_id']?>/<?=$forma['hotel_id'];?>" class="btn btn-success">Approve</a>
    <a href="/reservation/reject/<?=$role['id']?>/<?=$forma['id']?>/<?=$role['role_id']?>" class="btn btn-danger">Reject</a>

<?php
}
}
?>




          <div class="data-content"><span class="data-label">Name:</span><span class="name-data-content"><?=$who->fullname;?></span>



          </div>

    </div>




   <?php
      }




elseif ($who->forma_res_id == $forma['id'] && $who->reject == 0 && $who->user_id >= 1) {



?>

        <div class="border_frame col-lg-4 col-md-4 col-sm-4 col-xs-4">

        <span class="expander-container"><i class='glyphicon glyphicon-envelope'></i></span>
          <div class="expander-wrapper">
          <span class="expander-remover"><i class='glyphicon glyphicon-remove'></i></span>
            <div class="expander">
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-holder">
                <div class="row">
                  <form action="/reservation/mailto/<?php echo $forma['id'] ?>" method="POST" id="form-submit" class="form-div span12" accept-charset="utf-8">
                  <input checked="checked" type="radio" name="mail" value="<?php echo $forma['email'] ?>" id="u<?php echo $forma['userid'] ?>" /><label for="u<?php echo $forma['username'] ?>">To: <?php echo $forma['username'] ?></label><br />
                    <textarea class="form-control" name="message" id="message"></textarea>
                    <input name="submit" value="Send" type="submit" class="inverse-offset btn btn-success" />
                  </form>
                </div>
              </div>
            </div>
          </div>

          <div class="data-head relative data-head"><?=$who->role;?></div>
          <div class="data-content"><span class="data-label">Name:</span><span class="name-data-content"><?=$who->fullname;?></span>
    <div class="data-content"><span class="data-label sign-data-content">Signature:</span><img style="width: 106px;" src="/assets/uploads/signatures/<?=($who->fullname == 'Hossam El Shaer')? '9f3a8-mr.-hossam.jpg' : 'approved.png';?>" alt="<?=$forma['username'];?>" class="img-rounded sign-image"></div>
          <span class="timestamp-data-content"><?php echo $who->dt; ?></span>

          </div>

    </div>



   <?php
      }


 elseif ($who->forma_res_id == $forma['id'] && $who->reject == 1 && $who->user_id >= 1) {
?>

        <div class="border_frame col-lg-4 col-md-4 col-sm-4 col-xs-4">
          <div class="data-head relative data-head"><?=$who->role;?></div>



<?php

$sql ="SELECT users.fullname,users.email FROM users
INNER JOIN roles ON roles.id=users.role_id
-- INNER JOIN forma_res ON forma_res.hotel=10
INNER JOIN employees_hotels ON employees_hotels.employee_id=users.id
WHERE employees_hotels.hotel_id IN(2) AND roles.id=6";
$query = $this->db->query($sql);
if ($query->num_rows() > 0) {
  foreach ($query->result() as $row) {?>
<div class="data-head relative">
<span class="expander-container"><i class='glyphicon glyphicon-envelope'></i></span>
          <div class="expander-wrapper">
          <span class="expander-remover"><i class='glyphicon glyphicon-remove'></i></span>
            <div class="expander">
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-holder">
                <div class="row">
                  <form action="/reservation/mailto/<?php echo $forma['id'] ?>" method="POST" id="form-submit" class="form-div span12" accept-charset="utf-8">
                  <input checked="checked" type="radio" name="mail" value="<?php echo $forma['email'] ?>" id="u<?php echo $forma['userid'] ?>" /><label for="u<?php echo $forma['username'] ?>">To: <?php echo $forma['username'] ?></label><br />
                    <textarea class="form-control" name="message" id="message"></textarea>
                    <input name="submit" value="Send" type="submit" class="inverse-offset btn btn-success" />
                  </form>
                </div>
              </div>
            </div>
          </div>
</div>

<?php }
}

?>




          <div class="data-content"><span class="data-label">Name:</span><span class="name-data-content"><?=$who->fullname;?></span>

          </div>
        <div class="data-content"><span class="data-label sign-data-content">Signature:</span><img style="    width: 106px;" src="/assets/uploads/signatures/rejected.png" alt="<?=$forma['username'];?>" class="img-rounded sign-image"></div>
        <span class="timestamp-data-content"><?php echo $who->dt; ?></span>
          </div>


<?php
      }







  }

   ?>

    </div>


<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-catcher non-printable">
<div class="row">
  <?php
foreach ($get_attached_files as $file) {

  ?>
<a href="/assets/uploads/files/<?=$file['name']?>"><?=$file['name']?></a><br />
  <?php
}
  ?>
</div>
</div>
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-catcher non-printable">
      <div class="row">
        <form action="/reservation/comment" method="POST" id="form-submit" class="form-div span12" accept-charset="utf-8">
        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
          <textarea class="form-control" name="comment" id="comment"></textarea>
        </div>
        <input name="form_id" value="<?=$forma['id']?>" type="hidden" />
        <input name="submit" value="Comment" type="submit" class="inverse-offset btn btn-success" />
        </form>
      </div>
    </div>
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 data-holder">
      <div class="row">
        <div class="data-head centered">Comments </div>
        <div class="data-holder">
          <?php foreach ($comments as $comment): ?>
            <div><span class="data-head"><?php echo $comment['fullname']; ?> :- </span><?php echo $comment['comment']; ?>

<span style="margin-left:10px;text-align: left;display: inline;    top: 0px;" class="timestamp-data-content"><?=$comment['created'];?></span>
            </div>

          <?php endforeach; ?>
        </div>
      </div>
    </div>
    </div>
    </div>
    </div>

<?php }?>

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
        </body>
</html>
