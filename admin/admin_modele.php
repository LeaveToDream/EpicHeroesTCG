<?php
  // SETTERS

	function set_client($email, $name){
		set_msql_utf8 ();
		$req = 'INSERT INTO resto_client (email, name) VALUES (:email, :name)' ;
		$bdd = PDO2::getInstance();
		$sql = $bdd -> prepare($req) or die (print_r($bdd->errorInfo()));;
		$sql -> execute(array('email'=>$email,'name'=>$name));
		$data = $sql -> fetchAll();
		$sql -> closeCursor();
		return $data ;
	}

  // UPDATERS

  function update_data($id, $title, $content){
    set_msql_utf8 ();
    $req = 'UPDATE resto_data SET title=:title, content=:content WHERE id=:id' ;
    $bdd = PDO2::getInstance();
    $sql = $bdd -> prepare($req) or die (print_r($bdd->errorInfo()));;
    $sql -> execute(array('title'=>$title,'content'=>$content,'id'=>$id));
    $data = $sql -> fetchAll();
    $sql -> closeCursor();
    return $data ;
  }


	function del_client($id){
    set_msql_utf8 ();
    $req = 'DELETE FROM resto_client WHERE id=:id' ;
    $bdd = PDO2::getInstance();
    $sql = $bdd -> prepare($req) or die (print_r($bdd->errorInfo()));;
    $sql -> execute(array('id'=>$id));
    $data = $sql -> fetchAll();
    $sql -> closeCursor();
    return $data ;
  }
