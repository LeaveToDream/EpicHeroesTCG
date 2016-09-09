<?php
  if(array_key_exists('event', $_POST)){
  	$event=$_POST['event'];

    switch ($event) {
      case 'toggleLegacy':
        //Lecture (sinon, extract(.json) pourrais etre sympa)
        $data = json_decode(file_get_contents('data.json'), true);//Le true, c'est pour avoir un array et pas un object jesaispluscomment
        //Edition
        $data['legacy'] = !$data['legacy'];
        //Ecriture
        $result = file_put_contents('data.json', json_encode($data));
        if($result===false)
    			echo json_encode(array('status'=>'failed'));
    		else
    			echo json_encode(array('status'=>'succes'));
        break;

      case 'toggleDisplay':
        //Lecture
        $data = json_decode(file_get_contents('data.json'), true);
        //Edition
        $data['display'] = !$data['display'];
        //Ecriture
        $result = file_put_contents('data.json', json_encode($data));
        if($result===false)
    			echo json_encode(array('status'=>'failed', 'error'=>'file_put_contents() failed writing'));
    		else
    			echo json_encode(array('status'=>'succes'));
        break;

      default:
        echo json_encode(array('status'=>'failed', 'error'=>'Not a legal query'));
        break;
    }
  }
