<?php


$thickness = '30';
$res = 1;
$text = $_REQUEST['order_id'];
$font_size = 2;

require('class/index.php');
require('class/FColor.php');
require('class/BarCode.php');
require('class/FDrawing.php');
if (include('class/code39.barcode.php')) {
    $color_black = new FColor(0, 0, 0);
    $color_white = new FColor(255, 255, 255);
    $code_generated = new code39($thickness, $color_black, $color_white, $res, $text, $font_size);
    $drawing = new FDrawing(1024, 1024, '', $color_white);
    $drawing->init();
    $drawing->add_barcode($code_generated);
    $drawing->draw_all();
    $im = $drawing->get_im();
    $im2 = imagecreate($code_generated->lastX, $code_generated->lastY);
    imagecopyresized($im2, $im, 0, 0, 0, 0, $code_generated->lastX, $code_generated->lastY, $code_generated->lastX, $code_generated->lastY);
    $drawing->set_im($im2);
    $img = $drawing->finish(1);
    ?>
<img src="<?php echo $img; ?>" />
<?php } else {
    header('Content: image/png');
    readfile('error.png');
}
?>