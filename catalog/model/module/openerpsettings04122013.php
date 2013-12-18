<?php

class ModelModuleOpenErpSettings extends Model {

    public function importToErp() {
        define('BCDB_DRIVER', 'mysql');
        define('BCDB_HOSTNAME', '85.17.236.45');
        define('BCDB_USERNAME', 'backbasefsp');
        define('BCDB_PASSWORD', 'Telefoon01');
        define('BCDB_DATABASE', 'backbasefsp');
        define('BCDB_PREFIX', '');
        /* Include XMLRPC library */
        include('xmlrpc/lib/xmlrpc.inc');
        echo "welcome";
        $order_id = $this->session->data['order_id'];
        /* get settings per store */
        $erp_module = array();
        $this->load->model('setting/setting');
        $erp_settings = $this->model_setting_setting->getSetting('open_erp_settings', $this->config->get('config_store_id'));
        if (isset($erp_settings['open_erp_settings_module'])) {
            $erp_module = $erp_settings['open_erp_settings_module'];
        }


        if ($erp_module) {



            //Backbase databse
            $connect = mysql_pconnect(BCDB_HOSTNAME, BCDB_USERNAME, BCDB_PASSWORD);
            mysql_select_db(BCDB_DATABASE, $connect);




            //Get all boom store,rules details from backbase
            $storeQuery = "select qlt_stores.*,rules_erp.rule_type,rules_erp.rule_id from qlt_stores 
    left join rules_erp on qlt_stores.financial_booking_rule=rules_erp.rule_id 
    where qlt_stores.store_id=" . $erp_module['boom_store_id'];

            $storeResult = mysql_query($storeQuery, $connect);
            if (mysql_num_rows($storeResult) > 0) {
                $storeData = mysql_fetch_assoc($storeResult);
            } else {

                $this->log->write('ERP Export Failed :  ERP export failed for order id ' . $order_id . 'Error:  Please check store configuration');
                return;
            }

            $customer_sales_company = 0;

            if ($storeData['rule_type'] == 'single') {
                $singleTypeQuery = "select * from rules_erp_single_details where rule_id=" . $storeData['rule_id'];
                $singleTypeResult = mysql_query($singleTypeQuery, $connect);
                if (mysql_num_rows($singleTypeResult) > 0) {
                    $singleTypeData = mysql_fetch_assoc($singleTypeResult);
                    $customer_sales_company = $singleTypeData['customer_sales_company_single'];
                }
            } else if ($storeData['rule_type'] == 'inter') {
                $interTypeQuery = "select * from rules_erp_inter_details where rule_id=" . $storeData['rule_id'];
                $interTypeResult = mysql_query($interTypeQuery, $connect);

                if (mysql_num_rows($interTypeResult) > 0) {
                    $interTypeData = mysql_fetch_assoc($interTypeResult);
                    $customer_sales_company = $interTypeData['customer_sales_company_inter'];
                }
            } else {
                $this->log->write("ERP Export Failed : ERP export failed for order id " . $order_id . " Error : Please select rule type");
                 return;
            }

            $erpCompQuery = "select * from qlt_companies where company_id =" . $customer_sales_company;
            $erpCompQueryResult = mysql_query($erpCompQuery, $connect);
            if (mysql_num_rows($erpCompQueryResult) > 0) {
                $erpCompQueryData = mysql_fetch_assoc($erpCompQueryResult);
            } else {

                $this->log->write("ERP Export Failed : ERP export failed for order id " . $order_id . "Error : This ERP company does not exist ");
                 return;
            }


            //openERP Code  


            $openERP_server = $erpCompQueryData['erp_db_host'];
            $openERP_dbname = $erpCompQueryData['erp_db_name'];
            $openERP_dbusername = $erpCompQueryData['erp_db_user'];
            $openERP_dbpassword = $erpCompQueryData['erp_db_pswd'];
            $openERP_company = $erpCompQueryData['company_erp_id'];
            $companyID = $openERP_company;

            $uid = $this->connect($openERP_server, $openERP_dbname, $openERP_dbusername, $openERP_dbpassword);
            if ($uid < 0) {
                $this->log->write('ERP Export Failed :  ERP export failed for order id ' . $order_id . 'Error : System not able to login openERP');
                 return;
            }
            $client = new xmlrpc_client($openERP_server . "/xmlrpc/object");

            //get Customer Billing Info from order table 
            $this->load->model('checkout/order');
            $order_info = $this->model_checkout_order->getOrder($order_id);




            $name = utf8_encode($order_info['firstname'] . '' . $order_info['lastname']);
            $source_document = '#OC' . $order_id;
            $street = utf8_encode($order_info['payment_address_1']);
            $postal = $order_info['payment_postcode'];
            $city = utf8_encode($order_info['payment_city']);
            $number = $order_info['payment_city'];
            $phone = $order_info['telephone'];
            $customer_refrence = '';
            $email = $order_info['email'];


            //Get Customer ID company based using customer Email

            $customerdDetArrayVal = array(
                'company_id' => new xmlrpcval($companyID, "int"),
                'field_name' => new xmlrpcval('email', "string"),
                'field_value' => new xmlrpcval($email, "string"),
                'partner_type' => new xmlrpcval('customer', "string")
            );


            $msg = new xmlrpcmsg('execute');
            $msg->addParam(new xmlrpcval($openERP_dbname, "string"));
            $msg->addParam(new xmlrpcval($uid, "int"));
            $msg->addParam(new xmlrpcval($openERP_dbpassword, "string"));
            $msg->addParam(new xmlrpcval("webservice.core.methods", "string"));
            $msg->addParam(new xmlrpcval("query_partner_company_wise", "string"));
            $msg->addParam(new xmlrpcval($customerdDetArrayVal, "struct"));
            $resp = $client->send($msg);

            if ($resp->faultCode())
                $error = $resp->faultString();
            else
                $customerArr = $resp->value()->scalarval();

           
            $customerID = '';
            if ($customerArr) {
               $customerID = $customerArr[0]->me['int'];
            }
          

            if ($customerID == '' && $customerID <= 0) {
                // Create Customer
                $arrayVal = array(
                    'name' => new xmlrpcval($name, "string"),
                    'company_id' => new xmlrpcval($companyID, "int"),
                    'supplier' => new xmlrpcval('false', "string"),
                    'customer' => new xmlrpcval('true', "string"),
                    'email' => new xmlrpcval($email, "string"),
                    'street' => new xmlrpcval($street, "string"),
                    'city' => new xmlrpcval($city, "string"),
                    'phone' => new xmlrpcval($phone, "string"),
                    'zip' => new xmlrpcval($postal, "string")
                );



                $msg = new xmlrpcmsg('execute');
                $msg->addParam(new xmlrpcval($openERP_dbname, "string"));
                $msg->addParam(new xmlrpcval($uid, "int"));
                $msg->addParam(new xmlrpcval($openERP_dbpassword, "string"));
                $msg->addParam(new xmlrpcval("webservice.core.methods", "string"));
                $msg->addParam(new xmlrpcval("create_customer_or_supplier", "string"));
                $msg->addParam(new xmlrpcval($arrayVal, "struct"));

                $resp = $client->send($msg);
                if ($resp->faultCode())
                    $error = $resp->faultString();
                $customerID = $resp->value()->scalarval();

               

                // End   
            }
             echo $customerID;
                exit;
        }
    }

    public function connect($openERP_server, $openERP_dbname, $openERP_dbusername, $openERP_dbpassword) {

        $server_url = $openERP_server . "/xmlrpc/";

        if (isset($_COOKIE["user_id"]) == true) {
            if ($_COOKIE["user_id"] > 0) {
                return $_COOKIE["user_id"];
            }
        }


        $sock = new xmlrpc_client($server_url . 'common');
        $msg = new xmlrpcmsg('login');
        $msg->addParam(new xmlrpcval($openERP_dbname, "string"));
        $msg->addParam(new xmlrpcval($openERP_dbusername, "string"));
        $msg->addParam(new xmlrpcval($openERP_dbpassword, "string"));
        $resp = $sock->send($msg);

        $val = $resp->value();

        $id = $val->scalarval();
        setcookie("user_id", $id, time() + 3600);

        if ($id > 0) {
            return $id;
        } else {
            return -1;
        }
    }

}
