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
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top: 10px;">
              <div class="page-header">
                <h1 class="centered">Guest Amenity Request</h1>
              </div>
              <?php if(validation_errors() != false): ?>
              <div class="alert alert-danger">
                <?php echo validation_errors(); ?>
              </div>
              <?php endif ?>
              <?php if(!isset($contacts)): ?>
              <div class="alert alert-danger">
                <?php echo "No Data For Such Hotel Room!"; ?>
              </div>
              <?php endif ?>            
              </div>
            <div class="container">
              <form action="" method="POST" id="form-submit" enctype="multipart/form-data" class="form-div span12" accept-charset="utf-8">                  
                 <?php foreach($contacts as $contact):?>
                <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                  <label for="from-hotel" class="col-lg-2 col-md-2 col-sm-2 col-xs-2  control-label " style="margin-top:5px;"> Guest Name </label>
                  <p>
                    <input type="text" name="guest" class="form-control"   value="<?php echo $contact['guest_name']; ?>" style="width: 250px; height:39px;"/>
                    </p>
                  <label for="from-hotel" class="col-lg-2 col-md-2 col-sm-2 col-xs-2  control-label " style="margin-top:5px;"> Guest Nationality </label>
                  <p>
                    <input type="text" name="nationality" class="form-control" value="<?php echo $contact['nation']; ?>" style="width: 250px; height:39px;"/> 
                  </p>               
                </div>
                <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                  <label for="from-hotel" class="col-lg-2 col-md-2 col-sm-2 col-xs-2  control-label " style="margin-top:5px;"> Arrival Date </label>
                  <p>
                    <input type="text" name="arrival" class="form-control" value="<?php echo $contact['arriv']; ?>" style="width: 250px; height:39px;"/> 
                  </p>
                  <label for="from-hotel" class="col-lg-2 col-md-2 col-sm-2 col-xs-2  control-label " style="margin-top:5px;"> Departure Date </label>
                  <p>
                    <input type="text" name="departure" class="form-control" value="<?php echo $contact['depart']; ?>" style="width: 250px; height:39px;"/> 
                  </p>
                  <label for="from-hotel" class="col-lg-2 col-md-2 col-sm-2 col-xs-2  control-label " style="margin-top:5px;"> Date and Time of Delivery </label>
                <div class='input-group date' id='datetimepicker1' style=" width: 240px; margin:10px;">
                    <input type='text' class="form-control" name="date_time"/>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
                </div>
                <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                  <label for="from-hotel" class="col-lg-2 col-md-2 col-sm-2 col-xs-2  control-label " style="margin-top:5px;"> Treatment Special Request </label>
                  <input type="radio" name="treatment" value="vip1" style="margin-top:10px;">VIP 1 &nbsp; &nbsp; &nbsp;
                  <input type="radio" name="treatment" value="vip2" style="margin-top:10px;">VIP 2 &nbsp; &nbsp; &nbsp;
                  <input type="radio" name="treatment" value="vip2" style="margin-top:10px;">VIP 3
                  <br>
                  <br>
                  <p>
                    <textarea type="text" name="request" class="form-control" style=" width: 730px; height:100px;"></textarea>
                  </p>
                </div>
                <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                  <label for="from-hotel" class="col-lg-2 col-md-2 col-sm-2 col-xs-2  control-label " style="margin-top:5px;"> Reason </label>
                  <br>
                  <br>
                  <p>
                    <textarea type="text" name="reason" class="form-control" style=" width: 730px; height:100px;"></textarea>
                  </p>
                </div>
                <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                  <label for="from-hotel" class="col-lg-2 col-md-2 col-sm-2 col-xs-2  control-label " style="margin-top:5px;"> Requested by </label>
                  <input type="text" name="requested" class="form-control" style="width: 260px; height:39px;"/>
                </div>
                <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                  <label for="from-hotel" class="col-lg-2 col-md-2 col-sm-2 col-xs-2  control-label " style="margin-top:5px;"> Charged To </label>
                  <input type="text" name="charged" class="form-control" style="width: 260px; height:39px;"/>
                </div>
                <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                  <label for="from-hotel" class="col-lg-2 col-md-2 col-sm-2 col-xs-2  control-label " style="margin-top:5px;"> Message Card attached </label>
                  <input type="radio" name="attached"  style="width: 10px; height:10px; margin: 10px;" value="Yes">Yes
                  <input type="radio" name="attached"  style="width: 10px; height:10px; margin: 10px;" value="No">No
                </div>
                <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                  <label for="from-hotel" class="col-lg-2 col-md-2 col-sm-2 col-xs-2  control-label " style="margin-top:5px;"> By </label>
                  <input type="text" name="byy" class="form-control" style="width: 260px; height:39px;">
                </div>
                <?php endforeach ?>
                <div style="    margin-top: 90px;" class="form-group">
                  <div class="col-lg-offset-3 col-lg-10 col-md-10 col-md-offset-3">
                    <br>
                    <br>
                    <br>
                    <br>
                    <input name="submit" value="Submit" type="submit" class="btn btn-success" />
                    <a href="<?= base_url(); ?>amenity" class="btn btn-warning">Cancel</a>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script type="text/javascript">
            $(function () {
                $('#datetimepicker1').datetimepicker();
            });
        </script>
    </div>
  </body>
</html>
