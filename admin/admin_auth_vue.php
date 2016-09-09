	<div id="admin_auth" class="container">
		<div class="row title-row">
			<h1><div class="font-thin well">Administration</div></h1>
		</div><!-- /row -->
		<div class="row line-row">
			<div class="hr">&nbsp;</div>
		</div><!-- /row -->
		<div class="row content-row">
			<div class="col-12 col-lg-offset-4 col-lg-4 col-sm-offset-3 col-sm-6">
				<form method="post" id="go_gestion" action="admin.php" >
					<div class="control-group">
						<div class="input-group conctact_input"> <!-- Object -->
							<span class="input-group-addon" id="inputUser">@</span>
							<input type="text" name="user" class="form-control" placeholder="Username" aria-describedby="inputUser" >
						</div><!--/*.input-group-->
					</div>
					<br/>
					<div class="control-group">
						<div class="input-group conctact_input"> <!-- Object -->
							<span class="input-group-addon" id="inputPass">@</span>
							<input required type="text" name="pass" class="form-control" placeholder="Password" aria-describedby="inputPass" >
						</div><!--/*.input-group-->
					</div>
					<br/>
					<input name="go" type="submit" class="btn btn-default" value="Authentification" >
				</form>

			</div>
	  </div>
    </div>
