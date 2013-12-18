<?php
	// required classes to make request connection possible
	include('classes/Socket.php'); 
	include('classes/URL.php'); 
	include('classes/Request.php');
	
	// Change userid, password and your xml
	$theXml = '<?xml version="1.0" encoding="UTF-8"?>
                  <Shipment>
                  <Userid>Bloem01</Userid>
                  <Password>Tuin01</Password>
                  <Parcel>
                  <Keycode>orderid</Keycode>
                  <Name1>testfirstname</Name1>
                  <Name2>testlast</Name2>
                  <Address1>address1</Address1>
                  <Address3>address1</Address3>
                  <Postalcode>2565987</Postalcode>
                  <Countrycode>Netherlands</Countrycode>
                  <ShippingMethod>PPLUS</ShippingMethod>
                  </Parcel>
                  </Shipment>';
	
	// send request to ABC
	$RQ = new HTTP_Request('https://www.customer-pages.com/test/cgi-bin/ProcessXML.dll/parcel');
	$RQ->setMethod(HTTP_REQUEST_METHOD_POST);
	$RQ->addRawPostData($theXml);
	
	$RQ->sendRequest();
     

	$response = $RQ->getResponseBody();
	echo "<pre>";
        print_r($response);
?>