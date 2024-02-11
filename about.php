<?php include('header.php');
$qry2 = mysqli_query($eve, "select * from tbl_events where event_id='" . $_GET['id'] . "'");
$event = mysqli_fetch_array($qry2);
?>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script>
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
					<?php $s = mysqli_query($eve, "select DISTINCT stage_id from tbl_shows where event_id='" . $event['event_id'] . "'");
					if (mysqli_num_rows($s)) { ?>
						<table class="table table-hover table-bordered text-center">
							<?php
							while ($shw = mysqli_fetch_array($s)) {
								$t = mysqli_query($eve, "select * from tbl_stage where stage_id='" . $shw['stage_id'] . "'");
								$theatre = mysqli_fetch_array($t);
							?>
								<tr>
									<td>
										<?php echo $theatre['name'] . ", " . $theatre['province']; ?>
									</td>
									<td>
										<?php $tr = mysqli_query($eve, "select * from tbl_shows where event_id='" . $event['event_id'] . "' and stage_id='" . $shw['stage_id'] . "'");
										while ($shh = mysqli_fetch_array($tr)) {
											$ttm = mysqli_query($eve, "select  * from tbl_show_time where st_id='" . $shh['st_id'] . "'");
											$ttme = mysqli_fetch_array($ttm);
										?>
											<a href="check_login.php?show=<?php echo $shh['s_id']; ?>&event=<?php echo $shh['event_id']; ?>&stage=<?php echo $shw['stage_id']; ?>"><button class="btn btn-default"><?php echo date('h:i A', strtotime($ttme['start_time'])); ?></button></a>
										<?php
										}
										?>
									</td>
								</tr>
							<?php
							}
							?>
						</table>
					<?php
					} else {
					?>
						<h3>No Show Available</h3>
					<?php
					}
					?>
				</div>
				<?php include('concert_sidebar.php'); ?>
			</div>
		</div>
	</div>
	<div class="clear"></div>
</div>
</div>
</div>
<?php include('footer.php'); ?>