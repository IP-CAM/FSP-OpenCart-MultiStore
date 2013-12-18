<?php
	// required classes to make request connection possible
	include('classes/Socket.php'); 
	include('classes/URL.php'); 
	include('classes/Request.php');
	
	// Change userid, password and your xml
	$theXml = '<?xml version="1.0" encoding="UTF-8"?><Shipment><Userid>Bloem01</Userid><Password>fQNFbdvmRo</Password>YOUR XML</Shipment>';
	
	// send request to ABC
	$RQ = new HTTP_Request('https://www.customer-pages.com/test/cgi-bin/ProcessXML.dll/parcel');
	$RQ->setMethod(HTTP_REQUEST_METHOD_POST);
	$RQ->addRawPostData($theXml);
	
	$RQ->sendRequest();
      
	$response = $RQ->getResponseBody();
      
        
	print $response;
?>