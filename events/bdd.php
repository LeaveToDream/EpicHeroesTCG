<?php
	// (re)connexion à la base de données spéciale pour pouvoir passer simplement l'objet bdd a des fonction sans passé par des paramètres.
	require_once('pdo2.lib.php');

	try {
		//Identifiants pour la base de données.
		/*define('SQL_DSN','mysql:host=johnklv.klvhouse.org;dbname=johnklv;charset=utf8');
        define('SQL_USERNAME', 'johnklv');
        define('SQL_PASSWORD', 'kikoulol'); /**/
		/**/define('SQL_DSN', 'mysql:host=localhost;dbname=epicheroestcg;charset=utf8');
		define('SQL_USERNAME', 'root');
		define('SQL_PASSWORD', '');/**/

		$bdd = new PDO(SQL_DSN, SQL_USERNAME, SQL_PASSWORD);
	}
	catch(Exception $e) {
		exit('Impossible de se connecter à la base de données.');
	}

	$sql = $bdd -> query('SET NAMES utf8') or die (print_r($bdd->errorInfo()));;
	$sql -> closeCursor();

	// On met la connection a la base de donnée en utf8 dans un effort futile pour ne pas etre embeter par l'encodage ...
	function set_msql_utf8 (){
		$req ='SET NAMES utf8';
		$bdd = PDO2::getInstance();
		$sql = $bdd -> query($req) or die (print_r($bdd->errorInfo()));;
		$sql -> closeCursor();
	}
