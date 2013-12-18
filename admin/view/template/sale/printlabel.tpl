<?php

echo $content;
?>

<script type="text/javascript">
    document.onreadystatechange = function() {
        console.log(window);
        if (document.readyState === "complete") {
//document is ready. Do your stuff here
            window.print();
        }
    }
    window.onload = function() {
        window.print();
    }
    console.log(window);
</script>