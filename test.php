<?php /*
$var = "Ring - Increases injury free by 10 000.
Weapon - Enable Siphon Life to also reduces enemies' Magic Defense by 10% for 2 rounds.";
$talents = array() ;
$talente = explode("\n",$var );
$talenteq = explode(" - ", $talente[0]);
$talents[strtolower($talenteq[0])] = (array_key_exists(1,$talenteq))?$talenteq[1]:'';
if(array_key_exists(1,$talente)) {
  $talenteq = explode(" - ", $talente[1]);
  $talents[strtolower($talenteq[0])] = $talenteq[1];
}
echo(print_r($talente));
//Test d'existence (pour mettre une image par défaut)
$bool = file_exist("/path/to/file.txt");
//json management
  //Ecriture
  file_put_contents('data.json', json_encode($p));*/
  //Lecture (sinon, extract(.json) pourrais etre sympa)
  $data = json_decode(file_get_contents('data.json'), true);
  print_r($data);
  echo(boolval($data['legacy']));
  echo('banane'.false.'frite');
  /* Création de data.json
  $data = array('legacy' => true , 'hidden' => false );
  file_put_contents('data.json', json_encode($data)); */
