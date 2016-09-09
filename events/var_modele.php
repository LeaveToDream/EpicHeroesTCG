<?php
  // Common func
  function secu($v) { return htmlspecialchars($v); }

  function get_data($table)
  {
      $table = htmlspecialchars($table);
      set_msql_utf8 ();
      $req = 'SELECT * FROM '.$table ;
      $bdd = PDO2::getInstance();
      $sql = $bdd -> query($req) or die (print_r($bdd->errorInfo()));;
      $data = $sql -> fetchAll();
      $sql -> closeCursor();
      return $data ;
  }

  function img_exist($link, $d){
    return (file_exists("assets/images/heroes/full/".$link.".png")?$link:"000_".$d);
  }

  function get_hero_img($id,$type,$taille=0,$spe=false,$title=false){
    /* Alors, on a quoi comme image ?
    On a pour :
    $type: hero(0/1/2), -weapon, -item.
    Les items osef. En plus, ils sont rangé ailleurs.
    $taille: - little, -big, -big+
    $spe : 1|a, 2|b, 3|c.
    Il faut donc renvoyer un truc du style
    <img src="$link" class="$class"/>
    */
    $dir = array("<span class='","'> <img src='assets/images/heroes/full/",".png' alt='' title='","'/> </span>") ;
    $link="";
    $class="";
    if ($id<1000) {
      if ($id<100) {
        if ($id<10) {
          $id="0".$id;
        }
        $id="0".$id;
      }
    }
    if ($type=="weapon") {
      $link = $id."_weapon" ;
      $link = img_exist($link,"weapon");
      $class="card_weapon";
      return $dir[0].$class.$dir[1].$link.$dir[2].$title.$dir[3];
    }
    if ($id>=100) { // Les boss sont toujours en mode 0, sauf Illidan qui a un 2nd skin. On verra plus tard xD
      $type = "0" ;
    }
    if ($spe===false) {
      $link = $id."_".$type."_".$taille ;
    } else {
      if(is_int($spe)){
        $table = array('a','b','c');
        $spe = $table[$spe];
      }
      $link = $id."_".$type."_".$spe."_".$taille ;
    }
    $link = img_exist($link,$taille);
    $class = "card_".(($taille=="big+")?"big":$taille) ;
    return $dir[0].$class.$dir[1].$link.$dir[2].$title.$dir[3];
  }

  function get_balance_bar($balance,$type_id){
      /*Le principe : une barre de remplissage vert pour la vie et une rouge ou bleu
      pour les dégats (physique ou magique). Faut just voir si on laisse sur la meme ligne ou pas
      Balance : % de vie dans la balance vie/atk
      Type : 1 = magic, 2 = physic, 3 = heal, 4 = mixed */
      $types = array(1 => "magic", 2 => "physic", 3 => "heal", 4 => "mixed" );
      $type = $types[$type_id];
      $balance = 50 ; /* A enlevé, quand les balances seront mises */
      $life = $balance ;
      $atk = 100 - $balance ;
      $bar = '
      <dl class="balance">
      <dt>Life</dt><dd>
        <div class="progress" title="Life">
          <div class="progress-bar lifeBar" role="progressbar" aria-valuenow="'.$life.'" aria-valuemin="0" aria-valuemax="100" style="width: '.$life.'%;">
            <span class="sr-only"></span>
          </div>
        </div></dd>
        <dt>Attack</dt><dd>
        <div class="progress" title="'.(($type_id==3)?'Heal':'Damage : '.$type).'">
          <div class="progress-bar '.$type.'Bar" role="progressbar" aria-valuenow="'.$atk.'" aria-valuemin="0" aria-valuemax="100" style="width: '.$atk.'%; cursor: help;">
            <span class="sr-only"></span>
          </div>
        </div></dd>
      </dl>';
      return $bar ;
  }
  function get_type_icon($type){
    return false;
  }

  function for_modal($data){
    $data = addcslashes ($data,"'");
    $data = addcslashes ($data, '"');
    return $data ;
  }

  // Home slide
	// Type slide
	// Classe slide
  function get_preset($classe_id){
    set_msql_utf8 ();

    $req = "SELECT classe.name_en AS classe_name, atk.name AS atk_name,
    classe_preset.spell_name AS spell_name, type.name AS type_name,
    classe_preset.id AS id
    FROM  classe, classe_preset, type, atk
    WHERE classe_preset.classe_id = classe.id AND classe_preset.type=type.id
    AND classe_preset.atk_id = atk.id AND classe.id = :id; ";

    $bdd = PDO2::getInstance();
    $sql = $bdd -> prepare($req) or die (print_r($bdd->errorInfo()));;
    $sql -> execute(array('id'=>$classe_id));
    $data = $sql -> fetchAll();
    $sql -> closeCursor();
    return $data ;
  }
  function get_hero($preset_id){
    set_msql_utf8 ();

    $req = "SELECT hero.name as hero_name
    FROM classe_preset, hero
    WHERE hero.preset_id = classe_preset.id
    AND classe_preset.id =  :id ; ";

    $bdd = PDO2::getInstance();
    $sql = $bdd -> prepare($req) or die (print_r($bdd->errorInfo()));;
    $sql -> execute(array('id'=>$preset_id));
    $data = $sql -> fetchAll();
    $sql -> closeCursor();
    $b = "" ;
    foreach ($data as $d) {
      $b .= ($b=="")?"":", ";
      $b .=  $d['hero_name'];
    }
    return $b ;
  }

	// Heroe slide
  function get_heroes_info($id) {
    set_msql_utf8 ();

    $req = "SELECT hero.id AS id, hero.name AS name, hero.balance AS balance,
    classe_preset.damage_type AS damage_type, classe.name_en AS classe_name, atk.name AS atk_name,
    atk.effect AS atk_effect, atk.effect_legacy AS atk_effect_legacy,
    classe_preset.spell_name AS spell_name, classe_preset.spell_effect AS spell_effect,
    classe_preset.spell_effect_legacy AS spell_effect_legacy,
    type.name AS type_name, hero_weapon.name AS weapon_name
    FROM hero,hero_weapon,classe,classe_preset,type, atk
    WHERE hero.classe_id=classe.id AND hero.preset_id=classe_preset.id AND classe_preset.atk_id = atk.id
    AND classe_preset.type=type.id AND hero_weapon.hero_id = hero.id AND hero.id = :id ; ";

    $bdd = PDO2::getInstance();
    $sql = $bdd -> prepare($req) or die (print_r($bdd->errorInfo()));;
    $sql -> execute(array('id'=>$id));
    $data = $sql -> fetchAll();
    $sql -> closeCursor();
    return (array_key_exists(0, $data))?$data[0]:false ;
  }

  function get_heroes_spe($id) {
    set_msql_utf8 ();

    $req = "SELECT *, type.name AS type_name, hero_spe.name AS name,
    atk.name AS atk_name, atk.effect AS atk_effect, atk.effect_legacy AS atk_effect_legacy
    FROM hero_spe, type, atk
    WHERE hero_spe.type = type.id AND hero_spe.atk_id = atk.id AND hero_spe.hero_id = :id ; ";

    $bdd = PDO2::getInstance();
    $sql = $bdd -> prepare($req) or die (print_r($bdd->errorInfo()));;
    $sql -> execute(array('id'=>$id));
    $data = $sql -> fetchAll();
    $sql -> closeCursor();
    $id=0;
    foreach($data as $d){
      $talents = array();
      $talent1 = explode(" - ", $d['talent_1_legacy']);
      $talents[0]["name"] = $talent1[0];
      $talents[0]["desc"] = (array_key_exists(1,$talent1))?$talent1[1]:'';
      $talent2 = explode(" - ", $d['talent_2_legacy']);
      $talents[1]["name"] = $talent2[0];
      $talents[1]["desc"] = (array_key_exists(1,$talent2))?$talent2[1]:'';
      $talent3 = explode(" - ", $d['talent_3_legacy']);
      $talents[2]["name"] = $talent3[0];
      $talents[2]["desc"] = (array_key_exists(1,$talent3))?$talent3[1]:'';
      $talente = explode("\n", $d['talent_e_legacy']);
      $talenteq = explode(" - ", $talente[0]);
      $talents[3]["name"] = $talenteq[0];
      $talents[3]["desc"] = (array_key_exists(1,$talenteq))?$talenteq[1]:'';
      if(array_key_exists(1,$talente)){
        $talenteq = explode(" - ", $talente[1]);
        $talents[4]["name"] = $talenteq[0];
        $talents[4]["desc"] = (array_key_exists(1,$talenteq))?$talenteq[1]:'';
      }
      $data[$id]["talents"]["leg"] = $talents;
      $data[$id]["talents"]["live"] = $d["weapon_effect"] ;
      $id++;
    }

    return $data ;
  }
	// Item slide
  function get_weapons(){
    set_msql_utf8 ();
    $req = "SELECT hero_weapon.id AS id, hero_weapon.name AS name, hero_weapon.cat AS cat,
    hero.name AS hero_name, hero_weapon.description AS description
    FROM hero_weapon, hero WHERE hero.id = hero_weapon.id ;";

    $bdd = PDO2::getInstance();
    $sql = $bdd -> query($req) or die (print_r($bdd->errorInfo()));;
    $data = $sql -> fetchAll();
    $sql -> closeCursor();
    $id=0;
    foreach($data as $d){
      $data[$id]['effect'] = get_weapon_effect($d['id']);
      $id++;
    }

    return $data;
  }
  function get_weapon_effect($id) {
    set_msql_utf8 ();
    $req = "SELECT hero_spe.weapon_effect AS weapon_effect,
    hero_spe.talent_e_legacy AS talent_e_legacy, hero_spe.name AS spe_name
    FROM hero_spe, hero WHERE hero.id = hero_spe.hero_id AND hero.id = :id;";

    $bdd = PDO2::getInstance();
    $sql = $bdd -> prepare($req) or die (print_r($bdd->errorInfo()));;
    $sql -> execute(array('id'=>$id));
    $data = $sql -> fetchAll();
    $sql -> closeCursor();
    $effect = array() ;
    $id = 0 ;
    foreach($data as $d) {
      $effect[$id]["name"] = $d["spe_name"] ;
      $effect[$id]["weapon_effect"] = $d["weapon_effect"] ;
      $talents = array();
      if ($d['talent_e_legacy']=="") {
        $effect[1] = "" ;
      }
      else {
        $talente = explode("\n", $d['talent_e_legacy']);
        $talenteq = explode(" - ", $talente[0]);
        $talents[strtolower($talenteq[0])] = (array_key_exists(1,$talenteq))?$talenteq[1]:'';
        if(array_key_exists(1,$talente)) {
          $talenteq = explode(" - ", $talente[1]);
          $talents[strtolower($talenteq[0])] = $talenteq[1];
        }
        $effect[$id]["weapon_effect_legacy"] = $talents['weapon'] ;
      }
      $id++;
    }
    return $effect ;
  }

	// Deck slide
