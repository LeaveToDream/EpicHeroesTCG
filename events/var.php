<?php
	require_once('var_modele.php');
	// Common Vars
	$data = json_decode(file_get_contents('events/data.json'), true);
	$email = "john.klv.org@gmail.com" ;
	$tel = "00 00 00 00 00" ;
	define('LEGACY_MOD', $data['legacy']);
	define('DISPLAY_MOD', $data['display']);

	// Home slide
	// Type slide
	$types = get_data("type");
	// Classe slide
	$classes = get_data("classe");
	// Heroe slide
	$heroes = get_data("hero");
	// Item slide
	$items = get_data("item");
	$weapons = get_weapons();
	// Deck slide
