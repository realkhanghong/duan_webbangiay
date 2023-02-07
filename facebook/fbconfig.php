<?php
	$fb = new Facebook\Facebook([
	  'app_id' => '644014070730767', // Replace {app-id} with your app id
	  'app_secret' => '421352b9aa774900d06c749967b4da9a',
	  'default_graph_version' => 'v15.0',
	  ]);

	$helper = $fb->getRedirectLoginHelper();

	$permissions = ['email']; // Optional permissions
	$loginUrl = $helper->getLoginUrl('https://ossams.com/facebook/fb-callback.php', $permissions);

	echo '<a href="' . htmlspecialchars($loginUrl) . '"></a>';
?>