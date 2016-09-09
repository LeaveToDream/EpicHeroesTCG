<?php
if(isset($_POST["user"]) AND isset($_POST["pass"]))
{
	$_SESSION["user"] = $_POST["user"] ;
	$_SESSION["pass"] = $_POST["pass"] ;
}
if(isset($_SESSION['user']) && isset($_SESSION['pass']) && $_SESSION['user'] == "" && $_SESSION['pass'] == "Resto")
{
	include "admin_modele.php";

	// Traitement des données en _GET / _POST
	if(array_key_exists('mod', $_GET) && $_GET['mod'] != '') { $_POST['mod']= $_GET['mod'];}
	if(array_key_exists('mod', $_POST) && $_POST['mod'] != '') { // on verifie l'existence du champ et d'un contenu
		$mod = $_POST['mod'];
		switch ($mod) {
			//DATA's MANAGEMENT
			case "update_data":
				update_data($_POST['id'], $_POST['title'],$_POST['content']);
				$retour = "Données correctement éditées";
      	$success = true ;
				break;
			//COM's MANAGEMENT
			case "set_com":
				set_com($_POST['title']);
				break;
			case "update_com":
				update_com($_POST['id'], $_POST['title']);
				break;
			case "del_com":
				del_com($_POST['id']);
				break;
			//MAILING CLIENT
			case "del_client":
				del_client($_GET['id']);
				$retour = "Client correctement supprimé";
      	$success = true ;
				break;
			case "set_client":
				set_client($_POST['mail'], $_POST['name']);
				$retour = "Client correctement ajouté";
      	$success = true ;
				break;
  		case "mail" :
				$mail_sent = 0 ;
				$sent_to = "" ;
				$client = get_data('resto_client');
  			foreach($client as $bob){
					if(array_key_exists($bob['id'], $_POST) && $_POST[$bob['id']]=="on"){
						preparedMail($bob['email'],$_POST['title'],$_POST['content'],$email);
						$mail_sent++;
						$sent_to += " - ". trim($bob);
					}
  			}
  			if($mail_sent == 0)	{
  				$retour = "Une erreur est survenue : aucun mail envoyé";
  				$success = false ;
  			}
  			else {
					$retour = "Mails correctement envoyés au(x) destinataire(s) suivants :".$sent_to;
	      	$success = true ;
  			}
  			break;
		}
	}
	$data = get_data("resto_data");
	$coms = get_data("resto_com");
	$client = get_data('resto_client');
	include('admin/admin_vue.php');
}
else {
	include('admin/admin_auth_vue.php');
}
