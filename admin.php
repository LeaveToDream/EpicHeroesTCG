<?php
	session_start(); 		// Sessions initialisation
	require_once('events/bdd.php'); // Connexion to database, with UTF-8 comunication
	require_once('events/var.php'); // Get common vars
	?>

<!doctype html>
<head lang="fr">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

	<title>Admin</title>

	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="assets/fancybox/jquery.fancybox-v=2.1.5.css" media="screen">
	<link rel="stylesheet" type="text/css" href="assets/css/style.css">
	<link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Titillium+Web:400,600,300,200&subset=latin,latin-ext'>
	<style> body { background-color : white ; } i { color: #222; } .alert { padding: 15px 15px 15px 15px; }</style>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="assets/wysiwyg/css/froala_style.min.css"/>
	<link rel="stylesheet" type="text/css" href="assets/wysiwyg/css/froala_editor.min.css"/>
	<link rel="stylesheet" type="text/css" href="assets/wysiwyg/css/plugins/code_view.css">
	<link rel="stylesheet" type="text/css" href="assets/wysiwyg/css/plugins/colors.css">
	<link rel="stylesheet" type="text/css" href="assets/wysiwyg/css/plugins/file.css">
	<link rel="stylesheet" type="text/css" href="assets/wysiwyg/css/plugins/line_breaker.css">
	<link rel="stylesheet" type="text/css" href="assets/wysiwyg/css/plugins/table.css">
</head>
<body>
	<?php include ('admin/admin.php'); ?>
	<!-- SCRIPTS -->
	<!-- SCRIPTS -->
	<script type="text/javascript" src="assets/js/html5shiv.js"></script>
	<script type="text/javascript" src="assets/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="assets/js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="assets/fancybox/jquery.fancybox.pack-v=2.1.5.js"></script>
	<script type="text/javascript" src="assets/js/script.js"></script>
	<script type="text/javascript" src="assets/wysiwyg/js/froala_editor.min.js"></script>
	<script type="text/javascript" src="assets/wysiwyg/js/plugins/align.min.js"></script>
	<script type="text/javascript" src="assets/wysiwyg/js/plugins/code_view.min.js"></script>
	<script type="text/javascript" src="assets/wysiwyg/js/plugins/colors.min.js"></script>
	<script type="text/javascript" src="assets/wysiwyg/js/plugins/font_size.min.js"></script>
	<script type="text/javascript" src="assets/wysiwyg/js/plugins/line_breaker.min.js"></script>
	<script type="text/javascript" src="assets/wysiwyg/js/plugins/link.min.js"></script>
	<script type="text/javascript" src="assets/wysiwyg/js/plugins/lists.min.js"></script>
	<script type="text/javascript" src="assets/wysiwyg/js/plugins/quote.min.js"></script>
	<script type="text/javascript" src="assets/wysiwyg/js/plugins/table.min.js"></script>
	<script type="text/javascript" src="assets/wysiwyg/js/plugins/url.min.js"></script>
	<script>
	$(function(){	$('.edit').froalaEditor()	});
	setTimeout(function() { $(".fr-box div:last-child" ).css({ zIndex:"-1" }); }, 10);
	function toggle(source) { // All-check checkbox
	  checkboxes = document.getElementsByClassName('clientCheckbox');
	  for(var i=0, n=checkboxes.length;i<n;i++) {
			checkboxes[i].checked = source.checked;
	  }
	}
	</script>
</body>
</html>
