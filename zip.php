<?php

echo shell_exec("zip -r demo".date('d-m-Y').".zip *");

//echo shell_exec("zip -r newnameofzippedfile.zip nameoffiletobezipped")

?>