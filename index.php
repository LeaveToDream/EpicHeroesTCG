<?php
	require_once('events/bdd.php'); // Connexion to database, with UTF-8 comunication
	require_once('events/var.php'); // Get common vars
?>
<!DOCTYPE html>
<html>
	<head lang="fr">
		<!-- Main Meta Tags -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

		<!-- Alt Meta Tags -->
		<meta name="description" content="">
		<meta name="author" content="">

		<!-- Title -->
		<title>EH-TCG</title>

		<!-- Links css & favicon -->
		<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css"> <!-- Bootstrap core CSS -->
		<link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="assets/fancybox/jquery.fancybox-v=2.1.5.css" media="screen"> <!-- Fancybox core CSS -->
		<link rel="stylesheet" type="text/css" href="assets/css/style.css"> <!-- Custom CSS -->
		<link rel="icon" href="images/favicon.ico"> <!-- Custom ico -->
		<style>
			.legMod {
				display : <?php echo (LEGACY_MOD)?("initial"):("none"); ?> ;
			}
			.liveMod {
				display : <?php echo (LEGACY_MOD)?("none"):("initial"); ?> ;
			}
		</style>
	</head>
	<body>

		<!-- Fixed navbar -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav row"> <!-- Do not remove icon class, even if it's useless as fuck in html/css, it's used in javascript -->
						<li data-slide="1" class="col-xs-12 col-sm-2"><a id="menu-link-1" href="#slide-1" title="Next Section"><span class="icon fa fa-home"></span> <span class="text">ACCUEIL</span></a></li>
						<li data-slide="2" class="col-xs-12 col-sm-2"><a id="menu-link-2" href="#slide-2" title="Next Section"><span class="icon fa fa-plus-circle"></span> <span class="text">ROLES</span></a></li>
						<li data-slide="3" class="col-xs-12 col-sm-2"><a id="menu-link-3" href="#slide-3" title="Next Section"><span class="icon fa fa-leaf"></span> <span class="text">CLASSES</span></a></li>
						<li data-slide="4" class="col-xs-12 col-sm-2"><a id="menu-link-4" href="#slide-4" title="Next Section"><span class="icon fa fa-shield"></span> <span class="text">HEROES</span></a></li>
						<li data-slide="5" class="col-xs-12 col-sm-2"><a id="menu-link-5" href="#slide-5" title="Next Section"><span class="icon fa fa-flask"></span> <span class="text">ITEMS</span></a></li>
						<li data-slide="6" class="col-xs-12 col-sm-2"><a id="menu-link-6" href="#slide-6" title="Next Section"><span class="icon fa fa-group"></span> <span class="text">DECKS</span></a></li>
					</ul>
					<div id="special-menu"  class="row">
						<div class="col-sm-2 active-menu"></div>
					</div>
				</div><!--/.nav-collapse -->
			</div>
		</nav><!-- /Fixed navbar -->

		<!-- === Arrows === -->
		<div id="arrows">
			<div id="arrow-up" class="disabled"></div>
			<div id="arrow-down"></div>
			<div id="arrow-left" class="disabled visible-lg"></div>
			<div id="arrow-right" class="disabled visible-lg"></div>
		</div><!-- /.arrows -->


		<!-- === Generic Modal === -->
		<div class="modal fade" id="gmodal" tabindex="-1" role="dialog" aria-labelledby="gmodalTitle">
			<div class="modal-dialog" id="gmodalWindow" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h3 class="modal-title" id="gmodalTitle">Modal title</h3>
					</div>
					<div class="modal-body" id="gmodalContent">Modal content
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<?php
		/* Pour utiliser le modal, déclarer for_modal php et live_gmodal en javascript
		Parser le titre et stocker dans des var en js. Enfin, nevoyer le contenu avec
		live_gmodal(titleID,contentID) propre.
		function for_modal($data){
			$data = addcslashes ($data,"'");
			$data = addcslashes ($data, '"');
			return $data ;
		}
		$script .= "
				function live_gmodal(title, content){
					$('#gmodalTitle').html(title);
					$('#gmodalContent').html(content);
					$('#gmodal').modal('toggle')
					return true ;
				}";
		*/?>

		<!-- === Legacy Mode Button === -->
		<div id="LegacyToggle" class="LT <?php echo (DISPLAY_MOD)?(""):("LThidden"); ?>">
			<div id="LegacyDisplayButton" class="col-sm-2">
				<span class="LegacyButtonDisplayed glyphicon glyphicon-chevron-right"></span>
				<span class="LegacyButtonHidden glyphicon glyphicon-chevron-left"></span>
			</div>
			<div id="LegacyToggleButton" class="col-sm-10">
				<p>Mod switch</p>
				<div id="LegacySwitch" class="switch <?php echo (LEGACY_MOD)?("checked"):(""); ?>">
					<div class="slider"></div>
				</div>
				<p>Current mod : <span class="liveMod">Live</span><span class="legMod">Legacy</span></p>
			</div>
		</div>

		<!-- === Legacy Mode Switch screen === -->
		<div id="LegacySwitchScreen" class="LegacySwitchScreen">
			<div id="loading">
			</div>
		</div>


		<!-- === Story Slides === -->
		<div class="story" id="slide-1" data-slide="1">
			<div class="container">
				<div class="row">
					Test
				</div>
			</div>
		</div>
		<!-- home -->

		<div class="story" id="slide-2" data-slide="2">
			<div class="container">
				<div class="row typeStart"></div>
				<div class="row typeTitle titleBordered">
					<h1>Roles</h1>
				</div>
				<div class="row typeBody">
					<div class="col-xs-4 type heal">
						<h1>Heal</h1>
						<i class="fa fa-plus-circle fa-big"></i>
						<p class="desc">The role of a healer in the group is to heal others when they are hurt or take damage, thus keeping party members alive in order to tank or kill the enemies.
							The role often requires quick reaction time and steady nerves. The healer is often credited (wrongly or correctly) with good groups and bad. </p>
					</div>
					<div class="col-xs-4 type tank">
						<h1>Tank</h1>
						<i class="fa fa-shield fa-big"></i>
						<p class="desc">The role of a tank in the group is to take damage for the group, protecting the others from being attacked.
							Tanks usually have high health, high armor, and often high Avoidance.
							Their job is to keep the monster's Threat or attention on them, preventing the monster from attacking others in the group, who are often less armored and less able to take the damage from the monsters (mobs).
							Tanks are often the leaders of the group, the first ones into a fight and the last ones out.
							Good tanks can make a very hard dungeon seem easy.</p>
					</div>
					<div class="col-xs-4 type dps">
						<h1>Dps</h1>
						<i class="fa fa-gavel fa-big"></i>
						<p class="desc"> The role of DPS is to kill the monsters.
							This may sound simplistic, but it takes skill and know-how to dish out powerful damage without overwhelming the group's tank and causing the monsters to attack you. </p>
					</div>
				</div>
				<div class="row typeEnd"></div>
			</div>
		</div>
		<!-- role -->

		<div class="story" id="slide-3" data-slide="3">
			<div class="container">
				<div class="row classeStart"></div>
				<div class="row classeBlock">
					<div class="classeTop borderedBot titleBordered">
						<h1>Classes</h1>
					</div>
					<div class="classeBody borderedBot">
						<?php
							$id=0;
							foreach($classes as $c) {
								if ($c['id'] != 10) {
									$class_name = strtolower($c['name_en'])?>
									<div class="classe <?php echo($class_name);?>">
										<a class="classeLink" data-target="#classes" data-slide-to="<?php echo($id);?>">
											<img src="assets/images/classes/icon-<?php echo($class_name);?>.png"/><br/>
											<p class="classeName"><?php echo($class_name);?></p>
										</a>
									</div>
									<?php
									$id++;
								}
							}
						?>
					</div><!-- /.classeBody -->
					<div class="classeBody">
						<div id="classes" class="carousel slide" data-ride="carousel" data-interval="false"><!--#classes-->
							<div class="carousel-inner" role="listbox">
								<?php
									$first = true ;
									foreach($classes as $c) { ?>
										<div class="item <?php echo(($first)?'active':'' );?>">
											<h2><?php echo $c['name_en']; ?></h2>
											Archetypes used by this class, sorted by spell name :
											<div class="row">
												<?php
												$presets = get_preset($c['id']);
												foreach ($presets as $p) {
													$accesHero = get_hero($p['id']) ?>
													<div class="col-xs-8 col-xs-offset-2 col-sm-6 col-sm-offset-0 col-md-3 ">
														<div class="list-group presetBlock">
															<div class="list-group-item presetName">
																<h3><?php echo $p['spell_name']; ?></h3>
															</div>
															<div class="list-group-item presetDesc">
																<dl class="dl-horizontal dl-classic">
																	<dt>Type</dt> <dd><?php echo $p['type_name']; ?></dd>
																	<dt>Attack</dt> <dd><?php echo $p['atk_name']; ?></dd>
																	<dt>Spell</dt> <dd><?php echo $p['spell_name']; ?></dd>
																	<dt><abbr title="Hero(es) using this archetype">Heroes</abbr></dt> <dd><?php echo $accesHero ?></dd>
																</dl>
															</div>
														</div>
													</div>
													<?php
												} ?>
											</div>
										</div>
										<?php
										$first = false ;
									}
								?>
							</div><!--/right-->
						</div><!--/#classes-->
					</div><!-- /.classeBody -->
				</div><!-- /.classeBlock -->
				<div class="row classeEnd"></div>
			</div>
		</div>
		<!-- classe -->

		<div class="story" id="slide-4" data-slide="4">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<div class="title">
							<h1>Heroes</h1>
						</div>
					</div>
					<div class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-3 col-md-offset-0">
						<ul class="heroeBlockList">
							<?php
								$first = true ;
								$id = 0 ;
								foreach($heroes as $d) {
									if($d['classe_id']<10 ){
										echo(($first)?'':'<hr/>' );
										?>
										<a class="heroeLink" data-target="#heroes" data-slide-to="<?php echo($id);?>">
											<li class="heroeList<?php echo (strlen($d['name'])>=14)?" heroeListLittle":""; ?>">
												<?php echo(get_hero_img($d['id'], "0", "little"));?>
												<span class="heroName"><?php echo ($d['name']); ?></span>
											</li>
										</a>
										<?php
										$id ++ ;
										$first = false ;
									}
								}
							?>
						</ul>
					</div>
					<div class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-9 col-md-offset-0">
						<hr class="hr visible-xs visible-sm" />
						<div id="heroes" class="carousel slide" data-ride="carousel" data-interval="false"><!--#heroes-->
							<div class="carousel-inner" role="listbox">
								<?php $first = true ;
									foreach($heroes as $d) {
										if($d['classe_id']<10){
											$h = get_heroes_info($d['id']);
											$heroID = "hero".$d['id']; ?>
											<div class="item <?php echo(($first)?'active':'' );?>">
												<h2><?php echo($h["name"]);?></h2>
												<div class="pre90 row">
													<div class="col-md-6">
														<h4>Summoned and Awaken caracteristics :</h4>
														<dl class="dl-horizontal dl-classic">
															<dt>Classe</dt> <dd><?php echo($h["classe_name"]);?></dd>
															<dt>Type</dt> <dd><?php echo($h["type_name"]);?></dd>
															<dt>Balance</dt> <dd><?php echo(get_balance_bar($h["balance"],$h["damage_type"]));?></dd>
															<dt>Attack</dt> <dd><?php echo($h["atk_name"]);?>,
																<span class="liveMod"><?php echo($h["atk_effect"]);?></span>
																<span class="legMod"><?php echo($h["atk_effect_legacy"]);?></span>
															</dd>
															<dt>Spell</dt> <dd><?php echo($h["spell_name"]);?>,
																<span class="liveMod"><?php echo($h["spell_effect"]);?></span>
																<span class="legMod"><?php echo($h["spell_effect_legacy"]);?></span>
															</dd>
															<dt>Weapon</dt> <dd><?php echo($h["weapon_name"]);?></dd>
														</dl>
													</div>
													<div class="col-xs-6 col-md-3 list-group card">
														<div class="list-group-item cardHead">
															<span>Summoned</span>
															<?php echo(get_hero_img($d['id'], "0", "little"));?>
														</div>
														<div class="list-group-item cardBody">
															<?php echo(get_hero_img($d['id'], "0", "big"));?>
														</div>
													</div>
													<div class="col-xs-6 col-md-3 list-group card">
														<div class="list-group-item cardHead">
															<span>Awaken</span>
															<?php echo(get_hero_img($d['id'], 1, "little"));?>
														</div>
														<div class="list-group-item cardBody">
															<?php echo(get_hero_img($d['id'], 1, "big"));?>
														</div>
													</div>
												</div>
												<hr class="hr visible-xs visible-sm" />
												<div class="post90 row"><!--#spés-->
													<div class="col-xs-12">
														<h4>Specialized caracteristics :</h4>
													</div>
													<div class="spe col-xs-12 hidden-xs">
														<?php
														$spe = get_heroes_spe($h['id']);
														$i=0;
														foreach($spe as $s){
															$speID = $heroID."spe".$i;
															?>
															<div class="col-xs-8 col-xs-offset-2 col-sm-4 col-sm-offset-0 list-group ">
																<a class="panel-title speLink" role="button" data-toggle="collapse" data-parent="#<?php echo($heroID);?>"
																	href="#<?php echo($speID);?>" aria-expanded="true" aria-controls="<?php echo($speID);?>">
																	<div class="list-group-item cardHead">
																		<h3 class="speHead"><?php echo(get_hero_img($d['id'], 2, "little",$i));?> <?php echo $s['name']; ?></h3>
																	</div>
																	<div class="list-group-item cardBody">
																		<?php echo(get_hero_img($d['id'], 2, "big", $i));?>
																	</div>
																</a>
															</div>
															<?php
															$i++;
														}
														?>
													</div>
													<div class="spe col-xs-12">
														<div class="panel-group" id="<?php echo($heroID);?>" role="tablist" aria-multiselectable="false">
															<?php
															$i=0;
															foreach($spe as $s){
																$speID = $heroID."spe".$i;
																$speIDLink = $speID."link";
																?>
																<div class="panel panel-default">
																	<div class="panel-heading" role="tab" id="<?php echo($speIDLink);?>">
																		<a class="panel-title cardHead speLink" role="button" data-toggle="collapse" data-parent="#<?php echo($heroID);?>"
																			href="#<?php echo($speID);?>" aria-expanded="true" aria-controls="<?php echo($speID);?>">
																			<h3 class="speHead"><?php echo(get_hero_img($d['id'], 2, "little",$i));?> <?php echo $s['name']; ?></h3>
																		</a>
																	</div>
																	<div id="<?php echo($speID);?>" class="panel-collapse collapse" role="tablist" aria-labelledby="<?php echo($speIDLink);?>">
																		<div class="list-group-item cardBody visible-xs">
																			<?php echo(get_hero_img($d['id'], 2, "big", $i));?>
																		</div>
																		<div class="panel-body">
																		  <div>
																				<dl class="dl-horizontal dl-classic">
																					<dt>Type</dt><dd><?php echo($s["type_name"]);?></dd>
																					<dt>Balance</dt><dd><?php echo(get_balance_bar($s["balance"],$s["damage_type"]));?></dd>
																					<dt>Attack</dt><dd><?php echo($s["atk_name"]);?>,
																						<span class="liveMod"><?php echo($s["atk_effect"]);?></span>
																						<span class="legMod"><?php echo($s["atk_effect_legacy"]);?></span>
																					</dd>
																					<dt>Spell</dt><dd><?php echo($s["spell_name"]);?>,
																						<span class="liveMod"><?php echo($s["spell_effect"]);?></span>
																						<span class="legMod"><?php echo($s["spell_effect_legacy"]);?></span>
																					</dd>
																					<dt>Talents</dt> <dd class="visible-md visible-lg">:</dd>
																				</dl>
																				<dl class="dl-horizontal dl-extended liveMod">
																					<dt class="talentName">Weapon</dt>
																					<dd class="talentEffect"><?php echo($s['talents']["live"]);?></dd>
																				</dl>
																				<dl class="dl-horizontal dl-extended legMod">
																					<?php
																			      foreach($s['talents']["leg"] as $t){
																							?>
																								<dt class="talentName"><?php echo($t["name"]);?></dt>
																								<dd class="talentEffect"><?php echo($t["desc"]);?></dd>
																							<?php
																						}?>
																				</dl>
																			</div>
																		</div>
																	</div><!-- /list-item-group -->
																</div>
															<?php
															$i++;
															}
															?>
														</div>
													</div><!-- /spés -->
												</div>
											</div><!-- /item -->
											<?php
											$first = false ;
										}
									}
								?>
							</div><!--/caroussel-inner-->
						</div><!--/#heroes-->
					</div>
				</div>
				<hr/>
				<div class="row">
					<div class="col-sm-12">
						<div class="title">
							<h1>Boss & Monsters</h1>
						</div>
					</div>
					<div id="boss">
						<?php
							foreach($heroes as $d) {
								if($d['classe_id']==10){?>
									<div class="col-xs-6 col-sm-4 col-md-3 list-group card">
										<a>
											<div class="list-group-item cardHead">
												<span><?php echo($d['name']);?></span><br/>
												<?php echo(get_hero_img($d['id'], "0", "little"));?>
											</div>
											<div class="list-group-item cardBody">
												<?php echo(get_hero_img($d['id'], "0", "big"));?>
											</div>
										</a>
									</div>
								<?php }
							}
							foreach($heroes as $d) {
								if($d['classe_id']==11){?>
									<div class="col-xs-6 col-sm-4 col-md-3 list-group reverse card">
										<a>
											<div class="list-group-item cardHead">
												<span><?php echo($d['name']);?></span><br/>
												<?php echo(get_hero_img($d['id'], "0", "little"));?>
											</div>
											<div class="list-group-item cardBody">
												<?php echo(get_hero_img($d['id'], "0", "big+"));?>
											</div>
										</a>
									</div>
								<?php }
							}
							?>
					</div>
				</div>
			</div>
		</div>
		<!-- hero -->

		<div class="story" id="slide-5" data-slide="5">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<div class="title">
							<h1>The inventory</h1>
						</div>
					</div>
					<div class="col-sm-5">
						<div id="bag">
							<div class="inventoryMenu">
								<ul class="nav nav-tabs" role="tablist"> <!-- Nav tabs -->
									<?php
										// Items part
										$ipc = 5 ; // item per column
										$ipr = 6 ; // item per row
										$ipp = $ipc * $ipr ; // ipp stands for item per page (and not intégration par partie Lol)
										$item_nb = count($items);
										$first = true ;
										$tab_nb = intval(($item_nb/$ipp)+1) ;
										?>
										<li role="presentation" class="inventoryTabNotaLink">Items</li>
										<?php
										for ($i=1; $i <= $tab_nb ; $i++) { ?>
											<li role="presentation" class="inventoryTabLink<?php echo ($first)?" active":""; ?>"><a href="#item<?php echo $i ;?>" aria-controls="item<?php echo $i ;?>" role="tab" data-toggle="tab">#<?php echo $i ;?></a></li>
											<?php
											$first = false ;
										}
										//Weapon part
										$weapon_nb = count($weapons);
										$tab_nb = intval(($weapon_nb/$ipp)+1) ;
										for ($i=$tab_nb; $i >= 1 ; $i--) { ?>
											<li role="presentation" class="float-right inventoryTabLink"><a href="#weapon<?php echo $i ;?>" aria-controls="weapon<?php echo $i ;?>" role="tab" data-toggle="tab">#<?php echo $i ;?></a></li>
											<?php
										}
										?>
										<li role="presentation" class="float-right inventoryTabNotaLink">Weapons</li>
										<?php
										/* Initial idea : if there is only 1 page, display only "Items" or "Weapons" as the tab link.
										$weapon_nb = count($weapons);
										if($weapon_nb<=$ipp){?>
											<li role="presentation" class="active"><a href="#weapon" aria-controls="weapon" role="tab" data-toggle="tab">Weapons</a></li>
											<?php
										}
										else {
											$tab_nb = intval(($weapon_nb/$ipp)+1) ;
											for ($i=$tab_nb; $i >= 1 ; $i--) { ?>
												<li role="presentation" class="float-right"><a href="#weapon<?php echo $i ;?>" aria-controls="weapon<?php echo $i ;?>" role="tab" data-toggle="tab">#<?php echo $i ;?></a></li>
												<?php
											}
											?>
											<li role="presentation" class="float-right inventoryNotaLink">Weapons</li>
											<?php
										}*/
									?>
							  </ul>
							</div>
							<!-- Tab panes -->
						  <div class="tab-content">
								<?php
								$c = 0 ; // Carousel's id, do not overwrite
								$n = 0 ; // number in the page
								$p = 1 ; // page number
								$first = true ;
								foreach ($items as $i) {
									if($n%$ipp==0){?>
										<div role="tabpanel" class="tab-pane <?php echo ($first)?" active":""; ?>" id="item<?php echo($p);?>">
											<table>
										<?php
										$first = false ;
									}
									if ($n%$ipr==0) {?>
										<tr>
									<?php } ?>
									<td>
										<a class="inventoryLink itemImgHead" data-target="#inventory" data-slide-to="<?php echo($c);?>">
											<img src="assets/images/items/item_<?php echo($i['id']); ?>.png" alt="" class="inventoryImg"/>
										</a>
									</td>
									<?php
									if ($n%$ipr==$ipr-1) {?>
										</tr>
									<?php }
									if($n%$ipp==$ipp-1){?>
											</table>
										</div>
										<?php
										$p++ ;
									}
									$c++ ;
									$n++ ;
								} // on affiche toutes les icones
								while($n%$ipp!=0) { // et on remplie les cases restantes
									if ($n%$ipr==0) {?>
										<tr>
									<?php }
									 ?>
									<td></td>
									<?php
									if ($n%$ipr==$ipr-1) {?>
										</tr>
									<?php }
									if($n%$ipp==$ipp-1){?>
											</table>
										</div>
										<?php
										$p++ ;
									}
									$n++ ;
								}
								$n = 0 ; // number in the page
								$p = 1 ; // page number
								foreach ($weapons as $w) {
									if($n%$ipp==0){?>
										<div role="tabpanel" class="tab-pane <?php echo ($first)?" active":""; ?>" id="weapon<?php echo($p);?>">
											<table>
										<?php
										$first = false ;
									}
									if ($n%$ipr==0) {?>
										<tr>
									<?php } ?>
									<td>
										<a class="inventoryLink weaponImgHead" data-target="#inventory" data-slide-to="<?php echo($c);?>">
											<?php echo(get_hero_img($w["id"],"weapon")); ?>
										</a>
									</td>
									<?php
									if ($n%$ipr==$ipr-1) {?>
										</tr>
									<?php }
									if($n%$ipp==$ipp-1){?>
											</table>
										</div>
										<?php
										$p++ ;
									}
									$c++ ;
									$n++ ;
								} // on affiche toutes les icones
								while($n%$ipp!=0) { // et on remplie les cases restantes
									if ($n%$ipr==0) {?>
										<tr>
									<?php }
									 ?>
									<td></td>
									<?php
									if ($n%$ipr==$ipr-1) {?>
										</tr>
									<?php }
									if($n%$ipp==$ipp-1){?>
											</table>
										</div>
										<?php
										$p++ ;
									}
									$n++ ;
								}
								?>
						  </div>
						</div><!-- /#bag -->
					</div><!-- /col-5 -->
					<div class="col-sm-6 col-sm-offset-1 leftAlign">
						<div id="inventory" class="carousel slide" data-ride="carousel" data-interval="false"><!--#inventory-->
							<div class="carousel-inner" role="listbox">
								<?php
									$first = true ;
									foreach($items as $d) { ?>
										<div class="item itemImgHead<?php echo(($first)?' active':'' );?>">
											<h2><img src="assets/images/items/item_<?php echo($d['id']); ?>.png" alt="" class="inventoryImg"/> <?php echo $d['name']; ?></h2>
											<div><?php echo nl2br($d['description']); ?></div>
										</div>
										<?php
										$first = false ;
									}
									foreach($weapons as $d) { ?>
										<div class="item <?php echo(($first)?'active':'' );?>">
											<h2><?php echo $d['name']; ?></h2>
											<div class="cardHead">
												<?php echo(get_hero_img($d['id'],1, "little", false, $d['hero_name']));?>
												can yield this mighty <?php echo $d['cat']; ?> to gain a special effect :
												<dl class="dl-horizontal">
												<?php foreach ($d['effect'] as $e): ?>
													<dt><?php echo($e["name"]);?></dt>
													<dd>
														<span class="liveMod"><?php echo($e["weapon_effect"]);?></span>
														<span class="legMod"><?php echo($e["weapon_effect_legacy"]);?></span>
													</dd>
												<?php endforeach; ?>
											</dl>
											</div>
											<div><?php echo $d['hero_name']; ?> : "<?php echo $d['description']; ?>"</div>
										</div>
										<?php
										$first = false ;
									}
								?>
							</div><!--/right-->
						</div><!--/#item-->
					</div><!-- /col-7 -->
				</div>
			</div>
		</div>
		<!-- item -->

		<div class="story" id="slide-6" data-slide="6">
			<div class="container">
				Decks
			</div>
		</div>
		<!-- deck -->



		<!-- Bootstrap core JavaScript
		================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script>window.jQuery || document.write('<script src="assets/js/jquery.min.js"><\/script>')</script>
		<script type="text/javascript" src="assets/js/jqueryEasing.js"></script>
		<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="assets/js/script.js"></script>
</html>
