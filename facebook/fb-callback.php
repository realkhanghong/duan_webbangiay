 <?php
require_once('../config.php');
include("Facebook/autoload.php");
include("fbconfig.php");
$helper = $fb->getRedirectLoginHelper();
if (isset($_GET['state'])) {
    $helper->getPersistentDataHandler()->set('state', $_GET['state']);
}
try {
  $accessToken = $helper->getAccessToken();
} catch(Facebook\Exceptions\FacebookResponseException $e) {
  // When Graph returns an error
  echo 'Graph returned an error: ' . $e->getMessage();
  exit;
} catch(Facebook\Exceptions\FacebookSDKException $e) {
  // When validation fails or other local issues
  echo 'Facebook SDK returned an error: ' . $e->getMessage();
  exit;
}

if (! isset($accessToken)) {
  if ($helper->getError()) {
    header('HTTP/1.0 401 Unauthorized');
    echo "Error: " . $helper->getError() . "\n";
    echo "Error Code: " . $helper->getErrorCode() . "\n";
    echo "Error Reason: " . $helper->getErrorReason() . "\n";
    echo "Error Description: " . $helper->getErrorDescription() . "\n";
  } else {
    header('HTTP/1.0 400 Bad Request');
    echo 'Bad request';
  }
  exit;
}
//Lấy thông tin người dùng trên fb
try
{
	$response = $fb->get('/me?fields=id,name,email', $accessToken->getValue());
}catch (Facebook\Exceptions\FacebookResponseException $e)
{
	echo 'Graph returned an error: ' . $e->getMessage();
	exit;	
}
catch (Facebook\Exceptions\FacebookSDKException $e)
{
	echo 'Facebook SDK returned an error: ' . $e->getMessage();
	exit;	
}
$fbUser = $response->getGraphUser();
// print_r($fbUser);exit;
if (!empty($fbUser)){
	require_once('function.php');
	loginFromSocialCallBack($fbUser);
}
// Logged in
// $me = $response->getGraphUser();
// echo 'Logged in as: '. $me->getName();
// echo 'ID:'. $me->getId();
// echo 'Email:'. $me->getEmail();
// $_SESSION['fb_access_token'] = (string) $accessToken;
// Từ đây bạn xử lý kiểm tra thông tin user trong database sau đó xử lý.
// 					echo 'xin chào '.$fbUser['name'];
?>