<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<style type="text/css">
$('
#myAffix ').affix ({ offset: {
	top: 200, bottom: 
	 
	100
}
}
)
</style>
</head>
<body data-spy="scroll" data-target=".scrollspy">
	<div class="long-header col-lg-12"></div>
	<div class="tall-div col-lg-8">
		<div id="Link1" class="linkArea">
			<h2>Link 1 Area</h2>
		</div>
		<div id="Link2" class="linkArea">
			<h2>Link 2 Area</h2>
		</div>
		<div id="Link3" class="linkArea">
			<h2>Link 3 Area</h2>
		</div>
	</div>
	<nav id="myAffix" class="col-lg-4 col-sm-4 col-md-4" data-spy="affix">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h1>Table of Contents</h1>
			</div>
			<div class="panel-body scrollspy">
				<ul class="nav">
					<li>
						<a href="#Link1">Link 1</a>
					</li>
					<li>
						<a href="#Link2">Link 2</a>
					</li>
					<li>
						<a href="#Link3">Link 3</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>