<?php
	include("facebook/autoload.php");
	include("fbconfig.php");
	$helper = $fb->getRedirectLoginHelper();
	$permissions = ['email']; // Optional permissions
	$loginUrl = $helper->getLoginUrl('https://ossams.com/facebook/fb-callback.php', $permissions);
?>