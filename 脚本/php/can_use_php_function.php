<?php

$array=get_defined_functions();//返回所有内置定义函数
foreach($array['internal'] as $arr){
    if ( preg_match('/[\x00- 0-9\'"\`$&.,|[{_defgops\x7F]+/i', $arr) ) continue;
    if ( strlen(count_chars(strtolower($arr), 0x3)) > 0xd ) continue;  //两个规则
    print($arr.'<br/>');
}

?>