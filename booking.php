<?php include('header.php');
if (!isset($_SESSION['user'])) {
	header('location:login.php');
}
$qry2 = mysqli_query($eve, "select * from tbl_events where event_id='" . $_SESSION['event'] . "'");
$event = mysqli_fetch_array($qry2);
?>
<div class="content">
	<div class="wrap">
		<div class="content-top">
			<div class="section group">
				<div class="about span_1_of_2">
					<h3><?php echo $event['event_name']; ?></h3>
					<div class="about-top">
						<div class="grid images_3_of_2">
							<img src="<?php echo $event['image']; ?>" alt="" />
						</div>
						<div class="desc span_3_of_2">
							<p class="p-link" style="font-size:15px">Headline : <?php echo $event['headline']; ?></p>
							<p class="p-link" style="font-size:15px">Event : <?php echo date('d-M-Y', strtotime($event['event_date'])); ?></p>
							<p style="font-size:15px"><?php echo $event['description']; ?></p>
						</div>
						<div class="clear"></div>
					</div>
					<table class="table table-hover table-bordered text-center">
						<?php
						$s = mysqli_query($eve, "select * from tbl_shows where s_id='" . $_SESSION['show'] . "'");
						$shw = mysqli_fetch_array($s);

						$t = mysqli_query($eve, "select * from tbl_stage where stage_id='" . $shw['stage_id'] . "'");
						$stage = mysqli_fetch_array($t);
						?>
						<tr>
							<td class="col-md-6">
								Stadium
							</td>
							<td>
								<?php echo $stage['name'] . ", " . $stage['province']; ?>
							</td>
						</tr>
						<tr>
							<td>
								Tier
							</td>
							<td>
								<?php
								$ttm = mysqli_query($eve, "select  * from tbl_show_time where st_id='" . $shw['st_id'] . "'");
								$ttme = mysqli_fetch_array($ttm);
								$sn = mysqli_query($eve, "select  * from tbl_screens where screen_id='" . $ttme['screen_id'] . "'");
								$screen = mysqli_fetch_array($sn);
								echo $screen['screen_name'];
								?>
							</td>
						</tr>
						<tr>
							<td>
								Date
							</td>
							<td>
								<div class="col-md-12 text-center" style="padding-bottom:20px">
									<?php
									$date = $ttme['date_show'];
									$_SESSION['dd'] = $date;
									echo date('Y-m-d', strtotime($ttme['date_show']));
									$av = mysqli_query($eve, "select sum(no_seats) from tbl_bookings where s_id='" . $_SESSION['show'] . "' and ticket_date='$date'");
									$avl = mysqli_fetch_array($av);
									?>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								Event Time
							</td>
							<td>
								<?php echo date('h:i A', strtotime($ttme['start_time'])); ?>
							</td>
						</tr>
						<tr>
							<td>
								Number of Seats
							</td>
							<td>
								<form action="process_booking.php" method="post">
									<input type="hidden" name="screen" value="<?php echo $screen['screen_id']; ?>" />
									<input type="number" required tile="Number of Seats" max="<?php echo $screen['seats'] - $avl[0]; ?>" min="1" name="seats" class="form-control" value="1" style="text-align:center" id="seats" />
									<input type="hidden" name="amount" id="hm" value="<?php echo $screen['charge']; ?>" />
									<input type="hidden" name="date" value="<?php echo $date; ?>" />
							</td>
						</tr>
						<tr>
							<td>
								Amount
							</td>
							<td id="amount" style="font-weight:bold;font-size:18px">
								₱ <?php echo $screen['charge']; ?>
							</td>
						</tr>
						<tr>
							<td colspan="2"><?php if ($avl[0] == $screen['seats']) { ?><button type="button" class="btn btn-danger" style="width:100%">House Full</button><?php } else { ?>
									<button class="btn btn-info" style="width:100%">Book Now</button>
								<?php } ?>
								</form>
							</td>
						</tr>
						<table>
							<tr>
								<td></td>
							</tr>
						</table>
				</div>
				<?php include('concert_sidebar.php'); ?>
			</div>
			<div class="clear"></div>
		</div>
	</div>
</div>
<?php include('footer.php'); ?>
<script type="text/javascript">
	$('#seats').change(function() {
		var charge = <?php echo $screen['charge']; ?>;
		amount = charge * $(this).val();
		$('#amount').html("₱ " + amount);
		$('#hm').val(amount);
	});
</script>