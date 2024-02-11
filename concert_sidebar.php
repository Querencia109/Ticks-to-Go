<div class="listview_1_of_3 images_1_of_3">
	<h3>Events</h3>
	<?php
	$today = date("Y-m-d");
	$qry2 = mysqli_query($eve, "select * from  tbl_events where status='0' order by rand() limit 3");

	while ($m = mysqli_fetch_array($qry2)) {
	?>
		<div class="content-left">
			<div class="listimg listimg_1_of_2">
				<a href="about.php?id=<?php echo $m['event_id']; ?>"><img src="<?php echo $m['image']; ?>"></a>
			</div>
			<div class="text list_1_of_2">
				<div class="extra-wrap1">
					<a href="booking.php?id=<?php echo $m['event_id']; ?>" class="link4"><?php echo $m['event_name']; ?></a><br>
					<span class="data">Event Date: <?php echo $m['event_date']; ?></span><br>
					Description: <span" class="color2"><?php echo $m['description']; ?></span><br>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	<?php
	}
	?>
</div>
<div class="clear"></div>