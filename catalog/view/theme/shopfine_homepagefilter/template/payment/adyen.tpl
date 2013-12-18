
        <?php if ($testmode) { ?>
        <div class="warning"><?php echo $text_testmode; ?></div>
        <?php } ?>
        <form method="POST" action="index.php?route=payment/adyen/doPaymentAdyen" id="adyen-encrypted-form" name="paymentForm" onsubmit="return checkallfields();" >

            <label><?php echo $text_card_holder_name;?></label><input type="text" id="adyen-encrypted-form-holder-name" value="" data-encrypted-name="holderName" /><br/>
            <label><?php echo $text_card_number;?></label><input type="text" id="adyen-encrypted-form-number" value=""  data-encrypted-name="number" /><br/>
            <label><?php echo $text_card_cvc;?></label><input type="text" id="adyen-encrypted-form-cvc" value=""  data-encrypted-name="cvc" /><br/>
            <label><?php echo $text_card_expiry;?></label> <select id="adyen-encrypted-form-expiry-month" data-encrypted-name="expiryMonth" class="select1">
                <option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option> </select>
            <select id="adyen-encrypted-form-expiry-year" data-encrypted-name="expiryYear" class="select2">
                <option value="2013">2013</option>
                <option value="2014">2014</option>
                <option value="2015">2015</option>
                <option value="2016">2016</option>
                <option value="2017">2017</option>
                <option value="2018">2018</option>
                <option value="2019">2019</option>
                <option value="2020">2020</option>
                <option value="2021">2021</option>
                <option value="2022">2022</option>
                <option value="2023">2023</option>
                <option value="2024">2024</option>
                <option value="2025">2025</option>
                <option value="2026">2026</option>
                <option value="2027">2027</option>
                <option value="2028">2028</option>
                <option value="2029">2029</option>
                <option value="2030">2030</option><option value="2031">2031</option><option value="2032">2032</option><option value="2033">2033</option><option value="2034">2034</option><option value="2035">2035</option><option value="2036">2036</option><option value="2037">2037</option><option value="2038">2038</option><option value="2039">2039</option><option value="2040">2040</option><option value="2041">2041</option><option value="2042">2042</option><option value="2043">2043</option><option value="2044">2044</option><option value="2045">2045</option><option value="2046">2046</option><option value="2047">2047</option><option value="2048">2048</option><option value="2049">2049</option><option value="2050">2050</option><option value="2051">2051</option><option value="2052">2052</option><option value="2053">2053</option></select><br/>
            <input type="hidden" id="adyen-encrypted-form-expiry-generationtime" value="generate-this-server-side" data-encrypted-name="generationtime" />
            <div class="buttons">
                <div class="right">
                    <input type="submit" value="<?php echo $button_confirm; ?>" class="btn btn-primary" id="do_payment_adyen" />
                </div>
            </div>
        </form>
    



<!-- How to use the Adyen encryption client-side JS library -->
<script type="text/javascript" src="catalog/view/javascript/adyen.encrypt.min.js"></script>

<?php if ($testmode) { ?>
<script type="text/javascript">
    
    // generate time client side for testing... Don't deploy on a real integration!!!
    document.getElementById('adyen-encrypted-form-expiry-generationtime').value = new Date().toISOString();
        
    // the form element to encrypt
    var form    = document.getElementById('adyen-encrypted-form');
            
    // the public key
    var key     =   "10001|AD9F978D44A02378FDB26833118654580226FD69C1970C8974D988"
        + "1971F79236DDC0568BFB4ED56D815DF520EA610B458A17E8F55331583ACB"
        + "5001DBBEAAAD3B19DA90089B40830261A266EF6B637EA8ECD6E76ACCF905"
        + "C52DC028754049D5EF091CC58D99ECD419B965D605CB5B88B6F150B8C1AC"
        + "E13CC2E73F71646AF7433E1B6B9AD488EF95FCA130BE9670C26259F6BAE2"
        + "9E8C44BA398EB43678B6444A27929F502A359BA8F388D2A277E61272DA76"
        + "7AB9718A70A22CDE1DAFFB441C3A12E12F882FD8302466CCFA075C2552A5"
        + "EACE18B95AD3CDAFEDCD316497D541312498953604A01FE287EF3ADFC59D"
        + "C25FE6007DD7E7D14FE7DB49428A6C009A570F"; 
 
    var options = {}; 
    // the form will be encrypted before it is submitted
    adyen.encrypt.createEncryptedForm( form, key, options);
    // document.paymentForm.submit();
    
  
</script>
<?php } else { ?>
<script type="text/javascript">
    
    // generate time client side for testing... Don't deploy on a real integration!!!
    document.getElementById('adyen-encrypted-form-expiry-generationtime').value = new Date().toISOString();
        
    // the form element to encrypt
    var form    = document.getElementById('adyen-encrypted-form');
            
    // the public key
    var key     =   "10001|81045ADF54E8D25A6F5EC94CEBC29A84E6F23CA9A116169B163C69"
        + "62B9B6C3BCFBF8D01DF7271AD60C0C398D2EFFD8DF4D49E1ACCF42D5A550"
        + "21542D61FE5FCAD80833A6EE39C3E6544EEE1AA657FFCBAD7631E77B71B8"
        + "F126FE977DABE363A5F67ABA9CAB59AD1EF6D7C6E5F7E76003204C552D7D"
        + "991DA41BF743CE465E5BDA985A57FDC9366EB9F5E8BA6675C6D062562B0C"
        + "E4A8221893E75A24B7F01DFC7C42004DD45CBA1880E294C590939E6DF8E5"
        + "899581B30BA9425858E32820B662ECA046EBF12B4A3E94A5F6E675DB762C"
        + "E852E807DA14EAF6F179374A141C6137E145CD26731CDB37B1BADCAA6D74"
        + "51E35C57A549FA7048C277128252900AFF1A93"; 
 
    var options = {}; 
    // the form will be encrypted before it is submitted
    adyen.encrypt.createEncryptedForm( form, key, options);
    // document.paymentForm.submit();
    
  
</script>
<?php } ?>

<script type="text/javascript">
    
function checkallfields()
    {

var msg = '';
var nameObj=document.getElementById('adyen-encrypted-form-holder-name');
var name=nameObj.value;
var numberObj=document.getElementById('adyen-encrypted-form-number');
var number=numberObj.value;              
var cvcObj=document.getElementById('adyen-encrypted-form-cvc');        
var cvc=cvcObj.value;
if(trim1(name)==''){
msg='<?php echo html_entity_decode($error_holderName,ENT_QUOTES,"UTF-8");?>';
nameObj.focus();
}
else if(trim1(number)==''){
msg='<?php echo html_entity_decode($error_number,ENT_QUOTES,"UTF-8");?>';
numberObj.focus();
}
else if(isNaN(number) || trim1(number).length<15){
msg='<?php echo html_entity_decode($error_number,ENT_QUOTES,"UTF-8");?>';
numberObj.focus();
}
else if(trim1(cvc)==''){
msg='<?php echo html_entity_decode($error_cvc,ENT_QUOTES,"UTF-8");?>';
cvcObj.focus();
}
else if(trim1(cvc).length<3 || trim1(cvc).length>4){
msg='<?php echo html_entity_decode($error_cvc,ENT_QUOTES,"UTF-8");?>';
cvcObj.focus();
}
                
if(msg!='')
                {
alert(msg);
return false;
}
}
function trim1 (str) 
            {
return str.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
}
    
</script>