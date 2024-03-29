<form action="" method="POST" id="form-submit" class="form-div span12" accept-charset="utf-8" enctype="multipart/form-data">

	<div class="dates form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">

		<div class="day-picker form-group col-lg-10 col-md-10 col-sm-10 col-xs-10">
			<label for="from" class="date-lbl col-lg-1 col-md-1 col-sm-1 col-xs-1  control-label">From:</label>
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
				<input type="text" class="form-control date" name="from" id="from" data-date-format="YYYY-MM-DD" value="<?php echo set_value('from'); ?>" />
			</div>

			<label for="to" class="date-lbl col-xs-offset-0 col-lg-1 col-md-1 col-sm-1 col-xs-1  control-label">To:</label>
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
				<input type="text" class="form-control date" name="to" id="to" data-date-format="YYYY-MM-DD" value="<?php echo set_value('to'); ?>" />
			</div>
		</div>

			<div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
				<select class="form-control" name="state" id="state">
					<option <?php echo set_select('state', 55); ?> value="55">All</option>
					<option <?php echo set_select('state', 1); ?> value="1">Done</option>
					<option <?php echo set_select('state', 0); ?> value="0">Not Done</option>
				</select>
			</div>

		<script type="text/javascript">
		$(function () {
				$('.date').datepicker({
					autoclose: true,
					format: "yyyy-mm",
					viewMode: "months", 
					minViewMode: "months"

				});
				
		});
		</script>
	</div>
	
	<div class="noprint form-group">
	    <div class="col-lg-offset-3 col-lg-3 col-md-3 col-md-offset-3 col-sm-3 col-sm-offset-3 col-xs-3 col-xs-offset-3">
	    	<input name="submit" value="Submit" type="submit" class="btn btn-success" />
	    </div>
	</div>

</form>