<div id="adminPanel" class="container">
	<div class="row title-row">
		<div class="col-12 font-thin">Administration</div>
	</div><!-- /row -->
	<?php if(isset($retour)) {?>

		<div class='row' style="text-align:center; margin-bottom:3em; ">
			<h3><span class="well alert alert-<?php echo ($success)?('success'):('danger'); ?>"><i class="fa fa-check-circle-o fa-lg" style="color:green;"></i>  <?php echo($retour);?></span></h3>
		</div>
		<br/>
		<?php
	}?>
</div>
<div>
	<div id="adminData" class="bloc" style="background-color:lightblue;">
		<div class="adminBloc container" >
			<div class="row title-row">
				<div class="col-12 font-thin">Textes modifiables :</div>
			</div><!-- /row -->
			<div class="row line-row">
				<div class="hr">&nbsp;</div>
			</div><!-- /row -->
			<br/>
			<div class="col-12 col-sm-8 col-sm-offset-2">
				<div class="list-group">
					<?php
					foreach($data as $d) { ?>
					<div class="list-group-item data-list-item">
							<span class="adminText">
								<?php echo($d['title']); ?>
							</span>
							<span class="adminButton">
								<button type="button" data-toggle="collapse" data-target="#NewsEdit<?php echo($d['id']); ?>" aria-expanded="false" aria-controls="NewsEdit<?php echo($d['id']); ?>" class="btn btn-default btn-md collapsed"> <span class="fa fa-pencil adminNewsEdit" aria-hidden="true"></span> Editer</button>
							</span>
						</div>
						<div class="collapse" id="NewsEdit<?php echo($d['id']); ?>" aria-expanded="false">
							<div class="list-group-item">
								<form action="admin.php" method="post">
									<div class="form-group">
											<input type="text" name="title" class="form-control" placeholder="Titre" value="<?php echo($d['title']); ?>">
									</div>
									<div class="form-group" id ="editor" style="width:100%;">
										<textarea rows=8 name="content" placeholder="Contenu" class="form-control conctact_area edit"><?php echo($d['content']); ?></textarea>
									</div><!--/*.form-group-->
									<div class="form-group row ">
										<button type="submit" class="btn btn-success pull-right" style="margin-right:15px;">Modifier</button>
									</div>
									<input type="hidden" name="mod" value="update_data"/>
									<input type="hidden" name="id" value="<?php echo($d['id']); ?>">
								</form>
							</div>
						</div>
						<?php
					}?>
				</div>
			</div><!-- /.col-12 -->
		</div><!-- /.adminBloc-->
	</div><!-- /#adminData-->
	<div id="adminClient" class="bloc" style="background-color:white;">
		<div class="adminBloc container" >
			<div class="row title-row">
				<div class="col-12 font-thin">Ajouter un clients :</div>
			</div><!-- /row -->
			<div class="row line-row">
				<div class="hr">&nbsp;</div>
			</div><!-- /row -->
			<br/>
			<div class="col-12 col-sm-8 col-sm-offset-2">
				<form action="admin.php" method="post">
					<div class="input-group">
						<span class="input-group-addon" id="for-name">Nom</span>
						<input name="name" type="text" placeholder="Le nom" class="form-control" aria-describedby="for-name">
					</div>
					<br/>
					<div class="input-group">
						<span class="input-group-addon" id="for-mail">Mail</span>
						<input name="mail" type="text" placeholder="L'adresse mail" class="form-control" aria-describedby="for-mail">
					</div>
					<br/>
					<div class="form-group row ">
						<button type="submit" class="btn btn-success pull-right" style="margin-right:15px;">Envoyer</button>
					</div>
					<input type="hidden" name="mod" value="set_client"/>
				</form>
			</div>
		</div>
		<div id="adminMail" class="bloc" style="background-color:lightblue;">
			<div class="adminBloc container" >
				<div class="row title-row">
					<div class="col-12 font-thin">Envoyer un mail :</div>
				</div><!-- /row -->
				<div class="row line-row">
					<div class="hr">&nbsp;</div>
				</div><!-- /row -->
				<br/>
				<div class="col-12 col-sm-8 col-sm-offset-2">
					<div class="table-responsive well">
						<form action="admin.php" method="post">
							<table id="user-signups" class="table table-striped">
								<thead>
									<tr>
										<th>
										  <label style="margin-bottom:0px;"><input type="checkbox" onclick="toggle(this)" value="all-checked"> Tout choisir</label>
										</th>
										<th>Nom</th>
										<th>E-mail</th>
										<th class="text-right">Suppresion</th>
									</tr>
								</thead>
								<tbody>
									<?php
									foreach($client as $c){?>
										<tr>
											<td><input class="checkbox clientCheckbox" value="on" type="checkbox" name="<?php echo $c['id'];?>" id="<?php echo $c['id'];?>"/></td>
											<td> <?php echo $c['name']?> </td><td> <?php echo $c['email']?> </td>
											<td class="text-right"><a href="?mod=del_client&id=<?php echo $c['id'];?>" class="btn btn-default btn-md"> <span class="fa fa-remove adminBtnDelete" aria-hidden="true"></span></a></td>
										</tr>
										<?php
									}?>
								</tbody>
							</table>
							<div class="form-group">
								<input type="subject" name="subject" class="form-control" placeholder="Sujet du message" >
							</div>
							<div class="form-group">
								<textarea name="content" placeholder="Contenu" class="form-control conctact_area"></textarea>
							</div><!--/*.form-group-->
							<div class="form-group row ">
								<button type="submit" class="btn btn-success pull-right" style="margin-right:15px;">Envoyer</button>
							</div>
							<input type="hidden" name="mod" value="mail">
						</form>
					</div>
				</div>
			</div><!-- /.adminBloc-->
		</div>
	</div>
</div><!-- / -->
