<?php
include('header.php');
?>
<div class="content">
	<div class="wrap">
		<div class="content-top">
			<div class="listview_1_of_3 images_1_of_3">
				<h3>Upcoming Events</h3>
				<?php
				$qry3 = mysqli_query($eve, "select * from tbl_news order by rand() limit 3");
				while ($n = mysqli_fetch_array($qry3)) {
				?>
					<div class="content-left">
						<div class="listimg listimg_1_of_2">
							<img src="<?php echo $n['attachment']; ?>">
						</div>
						<div class="text list_1_of_2">
							<div class="extra-wrap">
								<span style="text-color:#000" class="data"><strong><?php echo $n['name']; ?></strong><br>
										<div class="data">Event Date :<?php echo $n['news_date']; ?></div>
										<span class="text-top"><?php echo $n['description']; ?></span>
							</div>
						</div>
						<div class="clear"></div>
					</div>
				<?php
				}
				?>
			</div>
			<?php include('concert_sidebar.php'); ?>
		</div>
	</div>
	<?php include('footer.php'); ?>
</div>