<?php

class ModelModuleOpenErpSettings extends Model {

    public function importToErp() {

        /* Get settings per store */
        $erp_module = array();
        $this->load->model('setting/setting');

        $erp_settings = $this->model_setting_setting->getSetting('open_erp_settings', $this->config->get('config_store_id'));
        if (isset($erp_settings['open_erp_settings_module'])) {
            $erp_module = $erp_settings['open_erp_settings_module'][0];
        }

        $order_id = $this->session->data['order_id'];
        if (isset($erp_module['boom_store_id']) && !empty($erp_module['boom_store_id']) && $erp_module['status']) {
            if (!defined('BCDB_DATABASE')) {
                define('BCDB_DRIVER', 'mysql');
                define('BCDB_HOSTNAME', '85.17.236.45');
                define('BCDB_USERNAME', 'backbasefsp');
                define('BCDB_PASSWORD', 'Telefoon01');
                define('BCDB_PREFIX', '');
            }

            /* Include XMLRPC library */
            include('xmlrpc/lib/xmlrpc.inc');
            $order_product_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int) $order_id . "'");
            $order_total_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_total WHERE order_id = '" . (int) $order_id . "' ORDER BY sort_order ASC");

            // If ERP Modules settings 'YES'...Start HERE
            //Backbase databse
            $connect = mysql_pconnect(BCDB_HOSTNAME, BCDB_USERNAME, BCDB_PASSWORD);
            mysql_select_db($erp_module['backbase_database'], $connect);

            //Get all boom store,rules details from backbase
            $storeQuery = "SELECT qlt_stores.*,rules_erp.rule_type,rules_erp.rule_id 
                FROM qlt_stores
                LEFT JOIN rules_erp
                ON qlt_stores.financial_booking_rule=rules_erp.rule_id 
                WHERE qlt_stores.store_id=" . $erp_module['boom_store_id'];

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
            $webstore = $this->config->get('config_name');
            $street = utf8_encode($order_info['payment_address_1']);
            $postal = $order_info['payment_postcode'];
            $city = utf8_encode($order_info['payment_city']);
//            $number = $order_info['payment_city'];
            $phone = $order_info['telephone'];
//            $customer_refrence = '';
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

            if ($resp->faultCode()) {
                $error = $resp->faultString();
            } else {
                $customerArr = $resp->value()->scalarval();
            }

            $customerID = '';
            if ($customerArr) {
                $customerID = $customerArr[0]->me['int'];
            }

            // If customer not available in ERP then create new one
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

                if ($resp->faultCode()) {
                    $error = $resp->faultString();
                }

                $customerID = $resp->value()->scalarval();
            }

             
            //Customer End  
            // Get all products detail related to this order 
            $j = 0;
            $invoice_line = '';

            if ($order_product_query->num_rows > 0) {
                foreach ($order_product_query->rows as $product) {
                    $acc_type_id = 1;
                    $tax_type_id = 1;
                    /// get Tax type and Sales Type....... this for old opencart (for new opencart we set deafult values above)
                    if (isset($product['cart_pidtime'])) {
                        if (isset($this->session->data[$product['cart_pidtime']]['taxID']) && !empty($this->session->data[$product['cart_pidtime']]['taxID'])) {
                            $tax_type_id = $this->session->data[$product['cart_pidtime']]['taxID'];
                        }
                        if (isset($this->session->data[$product['cart_pidtime']]['salesType']) && !empty($this->session->data[$product['cart_pidtime']]['salesType'])) {
                            $acc_type_id = $this->session->data[$product['cart_pidtime']]['salesType'];
                        }
                    }
                    //Product ID related code start here
                    //Check Product aleady exist in ERP or not	   
                    $msg = new xmlrpcmsg('execute');
                    $msg->addParam(new xmlrpcval($openERP_dbname, "string"));
                    $msg->addParam(new xmlrpcval($uid, "int"));
                    $msg->addParam(new xmlrpcval($openERP_dbpassword, "string"));
                    $msg->addParam(new xmlrpcval("webservice.core.methods", "string"));
                    $msg->addParam(new xmlrpcval("query_product_by_code", "string"));
                    $msg->addParam(new xmlrpcval($product['model'], "string"));

                    $resp = $client->send($msg);

                    if ($resp->faultCode()) {
                        $error = $resp->faultString();
                    } else {
                        $productInfo = $resp->value()->scalarval();
                    }

                    $productID = '';
                    if ($productInfo) {
                        $productID = $productInfo[0]->me['int'];
                    }

                    // If not then create new product
                    if ($productID == '' && $productID <= 0) {
                        $productarrayVal = array(
                            'name' => new xmlrpcval(utf8_encode($product['name']), "string"),
                            'default_code' => new xmlrpcval($product['model'], "string")
                        );

                        $msg = new xmlrpcmsg('execute');
                        $msg->addParam(new xmlrpcval($openERP_dbname, "string"));
                        $msg->addParam(new xmlrpcval($uid, "int"));
                        $msg->addParam(new xmlrpcval($openERP_dbpassword, "string"));
                        $msg->addParam(new xmlrpcval("webservice.core.methods", "string"));
                        $msg->addParam(new xmlrpcval("create_product", "string"));
                        $msg->addParam(new xmlrpcval($productarrayVal, "struct"));

                        $resp = $client->send($msg);

                        if ($resp->faultCode()) {
                            $error = $resp->faultString();
                        } else {
                            $productID = $resp->value()->scalarval();
                        }
                    }
                    //Product ID related code end here
                    //Get ERP Account ID
                    $salesAcntQuery = "select acc_sales from qlt_companies_acc_details where company_id=" . $erpCompQueryData['company_id'] . " and company_erp_id=" . $companyID . " and acc_type_id=" . $acc_type_id;
                    $salesAcntResult = mysql_query($salesAcntQuery, $connect);
                    if (mysql_num_rows($salesAcntResult) > 0) {
                        $salesAcntData = mysql_fetch_assoc($salesAcntResult);
                        $sales_account = $salesAcntData['acc_sales'];
                    } else {
                        $sales_account = 0;
                    }

                    //Get ERP Tax ID
                    $taxQuery = "select tax_sales_id from qlt_companies_tax_details where company_id=" . $erpCompQueryData['company_id'] . " and company_erp_id=" . $companyID . " and tax_type_id=" . $tax_type_id;
                    $taxResult = mysql_query($taxQuery, $connect);
                    if (mysql_num_rows($taxResult) > 0) {
                        $taxData = mysql_fetch_assoc($taxResult);
                        $taxID = $taxData['tax_sales_id'];
                    } else {
                        $taxID = 0;
                    }

                    if ($j == 0) {
                        $invoice_line = 'product_id:' . $productID . '?name:' . utf8_encode($product['name']) . '?account_id:' . $sales_account . '?invoice_tax_id:' . $taxID . '?price_unit:' . $product['price'] . '?quantity:' . $product['quantity'];
                    } else {
                        $invoice_line.='~product_id:' . $productID . '?name:' . utf8_encode($product['name']) . '?account_id:' . $sales_account . '?invoice_tax_id:' . $taxID . '?price_unit:' . $product['price'] . '?quantity:' . $product['quantity'];
                    }
                    $j++;

                    ////// Addon articles lines only for old opencart (for new oprn cart we have no Addon articles)
                    if (isset($product['cart_pidtime'])) {
                        if (isset($this->session->data[$product['cart_pidtime']]['addons']) && !empty($this->session->data[$product['cart_pidtime']]['addons'])) {
                            foreach ($this->session->data[$product['cart_pidtime']]['addons'] as $addons) {
                                $acc_type_id = 1;
                                $tax_type_id = 1;

                                if (isset($addons['taxID']) && !empty($addons['taxID'])) {
                                    if ($addons['taxID'] > 0) {
                                        $tax_type_id = $addons['taxID'];
                                    }
                                }

                                if (isset($addons['salesType']) && !empty($addons['salesType'])) {
                                    if ($addons['salesType'] > 0) {
                                        $acc_type_id = $addons['salesType'];
                                    }
                                }

                                //Get ERP Account ID
                                $salesAcntQuery = "select acc_sales from qlt_companies_acc_details where company_id=" . $erpCompQueryData['company_id'] . " and company_erp_id=" . $companyID . " and acc_type_id=" . $acc_type_id;
                                $salesAcntResult = mysql_query($salesAcntQuery, $connect);
                                if (mysql_num_rows($salesAcntResult) > 0) {
                                    $salesAcntData = mysql_fetch_assoc($salesAcntResult);
                                    $sales_account = $salesAcntData['acc_sales'];
                                } else {
                                    $sales_account = 0;
                                }

                                //Get ERP Tax ID
                                $taxQuery = "select tax_sales_id from qlt_companies_tax_details where company_id=" . $erpCompQueryData['company_id'] . " and company_erp_id=" . $companyID . " and tax_type_id=" . $tax_type_id;
                                $taxResult = mysql_query($taxQuery, $connect);
                                if (mysql_num_rows($taxResult) > 0) {
                                    $taxData = mysql_fetch_assoc($taxResult);
                                    $taxID = $taxData['tax_sales_id'];
                                } else {
                                    $taxID = 0;
                                }

                                $invoice_line.='~product_id:' . $productID . '?name:' . utf8_encode($addons['name']) . '?account_id:' . $sales_account . '?invoice_tax_id:' . $taxID . '?price_unit:' . $addons['value'] . '?quantity:1';
                            }
                        }
                    }
                }
                // Ordered products foreach end here.
            }

            //Shipping Amount Line
            $shipAmount = '';
            if ($order_total_query->num_rows > 0) {
                foreach ($order_total_query->rows as $totals) {
                    if ($totals['code'] == 'shipping') {
                        $shipAmount = $totals['value'];
                    }
                }
            }

            if ($shipAmount != '' && $shipAmount > 0) {
                //Get ERP Account ID
                $salesAcntQuery = "select acc_sales from qlt_companies_acc_details where company_id=" . $erpCompQueryData['company_id'] . " and company_erp_id=" . $companyID . " and acc_type_id=8";
                $salesAcntResult = mysql_query($salesAcntQuery, $connect);
                if (mysql_num_rows($salesAcntResult) > 0) {
                    $salesAcntData = mysql_fetch_assoc($salesAcntResult);
                    $sales_account = $salesAcntData['acc_sales'];
                } else {
                    $sales_account = 0;
                }

                //Get ERP Tax ID
                $taxQuery = "select tax_sales_id from qlt_companies_tax_details where company_id=" . $erpCompQueryData['company_id'] . " and company_erp_id=" . $companyID . " and tax_type_id=1";
                $taxResult = mysql_query($taxQuery, $connect);
                if (mysql_num_rows($taxResult) > 0) {
                    $taxData = mysql_fetch_assoc($taxResult);
                    $taxID = $taxData['tax_sales_id'];
                } else {
                    $taxID = 0;
                }

                //Check Product exist	   
                $msg = new xmlrpcmsg('execute');
                $msg->addParam(new xmlrpcval($openERP_dbname, "string"));
                $msg->addParam(new xmlrpcval($uid, "int"));
                $msg->addParam(new xmlrpcval($openERP_dbpassword, "string"));
                $msg->addParam(new xmlrpcval("webservice.core.methods", "string"));
                $msg->addParam(new xmlrpcval("query_product_by_code", "string"));
                $msg->addParam(new xmlrpcval('ship012', "string"));

                $resp = $client->send($msg);

                if ($resp->faultCode()) {
                    $error = $resp->faultString();
                } else {
                    $productInfo = $resp->value()->scalarval();
                }

                $productID = '';
                if ($productInfo) {
                    $productID = $productInfo[0]->me['int'];
                }

                // If not then create new product
                if ($productID == '' && $productID <= 0) {
                    $productarrayVal = array(
                        'name' => new xmlrpcval(utf8_encode('Shipping'), "string"),
                        'default_code' => new xmlrpcval('ship012', "string")
                    );

                    $msg = new xmlrpcmsg('execute');
                    $msg->addParam(new xmlrpcval($openERP_dbname, "string"));
                    $msg->addParam(new xmlrpcval($uid, "int"));
                    $msg->addParam(new xmlrpcval($openERP_dbpassword, "string"));
                    $msg->addParam(new xmlrpcval("webservice.core.methods", "string"));
                    $msg->addParam(new xmlrpcval("create_product", "string"));
                    $msg->addParam(new xmlrpcval($productarrayVal, "struct"));

                    $resp = $client->send($msg);

                    if ($resp->faultCode()) {
                        $error = $resp->faultString();
                    } else {
                        $productID = $resp->value()->scalarval();
                    }
                }
                $invoice_line.='~product_id:' . $productID . '?name:Shipping?account_id:' . $sales_account . '?invoice_tax_id:' . $taxID . '?price_unit:' . $shipAmount . '?quantity:1';
            }

            //Shipping Amount Line end here
            //Create Invoice
            $invoice_nr = 'I' . $erp_module['store_invoice_prefix'] .'-'. $order_id;
            $vatCode = '';
            $invoiceID = '';
            $error = '';
            $invoicearrayVal = array(
                'partner_id' => new xmlrpcval($customerID, "int"),
                'fiscal_position' => new xmlrpcval(false, "string"),
                'journal_id' => new xmlrpcval($erpCompQueryData['erp_company_sales_journal'], "int"),
                'date_invoice' => new xmlrpcval(date("m/d/Y"), "string"),
//                'date_due' => new xmlrpcval(date("m/d/Y"), "string"),
                'account_id' => new xmlrpcval($erpCompQueryData['erp_company_sales_acc'], "int"),
                'comment' => new xmlrpcval(false, "string"),
                'currency_id' => new xmlrpcval($erpCompQueryData['erp_currency'], "int"),
                'payment_term' => new xmlrpcval($erpCompQueryData['erp_payterms'], "int"),
                'company_id' => new xmlrpcval($companyID, "int"),
                'origin' => new xmlrpcval($invoice_nr, "string"),
                'name' => new xmlrpcval($source_document, "string"),
                'vat_tax_number' => new xmlrpcval($vatCode, "string"),
                'web_store' => new xmlrpcval($webstore, "string"),
                'type' => new xmlrpcval('out_invoice', "string"),
                'invoice_line_data' => new xmlrpcval($invoice_line, "string")
            );

            $msg = new xmlrpcmsg('execute');
            $msg->addParam(new xmlrpcval($openERP_dbname, "string"));
            $msg->addParam(new xmlrpcval($uid, "int"));
            $msg->addParam(new xmlrpcval($openERP_dbpassword, "string"));
            $msg->addParam(new xmlrpcval("webservice.core.methods", "string"));
            $msg->addParam(new xmlrpcval("create_invoice", "string"));
            $msg->addParam(new xmlrpcval($invoicearrayVal, "struct"));

            $resp = $client->send($msg);
           
            if ($resp->faultCode()) {
               $error = $resp->faultString();
            } else {
                $invoiceID = $resp->value()->scalarval();
            }

            if ($invoiceID == '') {
                $this->log->write('ERP Export Failed :  ERP export failed for order id ' . $order_id . 'Error :' . $error);
                return;
            } else {
                $this->log->write('ERP Export done successfully for order id ' . $order_id . '.');
                return;
            }
            // End  
        }
        // If ERP Modules settings 'YES'...END HERE
        // If ERP Modules settings 'NO'...START HERE
        else {
            $this->log->write('ERP Export Failed :  ERP export failed for order id ' . $order_id . 'Error : openERP settings missing for this opencart store.');
            return;
        }
        // If ERP Modules settings 'NO'...END HERE
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
