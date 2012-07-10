<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>dShopping - Bienvenido</title>
	<meta http-equiv="Content-Language" content="Spanish" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" type="text/css" href="<?echo THEME_DIR; ?>style.css" media="screen" />
</head>

<body>

<!-- Icons, search bar & user sand box -->
<div id="dshopping">
	<div class="search">
		<form action="search.php" method="post">
			<p>
				<a href=""><img src="<?echo THEME_DIR; ?>images/home.gif" alt="Home" /></a>
				<a href=""><img src="<?echo THEME_DIR; ?>images/contact.gif" alt="Contacto" /></a>
				<a href=""><img src="<?echo THEME_DIR; ?>images/sitemap.gif" alt="Sitemap" /></a>
				<a href=""><img src="<?echo THEME_DIR; ?>images/rss.gif" alt="Rss Feed" /></a> &nbsp;
				<input type="text" name="search" class="searchTxt" /> <input type="submit" value="Buscar" class="submit" />
			</p>
		</form>
	</div>
	
	<div class="user">
		<p>¡Bienvenido <strong>colega</strong>! <a href="">Identifícate</a> o <a href="">regístrate</a> :-)</p>
	</div>
</div>

<div>
	&nbsp;
</div>

<!-- web site starts -->
<div id="wrap">
	<!-- border top -->
	<div id="top">
	</div>

	<div id="content">
		<!-- header arena: app logo & navigation menu -->
		<div class="header">
			<a href="index.php"><img src="<?echo THEME_DIR; ?>images/dshopping.jpg" alt="Inicio" /></a>
			
			<ul id="navSquare">
				<li><a href="#" class="active">Inicio</a></li>
				<li><a href="#">Información</a></li>
				<li><a href="#">Buscar</a></li>
				<li><a href="#">Mi cuenta</a></li>
				<li><a href="#">Contacto</a></li>
			</ul>
		</div>

		<!-- follow the bread! -->
		<div class="breadcrumbs">
			Estás en: <a href="#">Inicio</a>
		</div>
