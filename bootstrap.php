<?php
    define('__HOST__', __DIR__);

    require('vendor/autoload.php');

    $loads = glob('bootstrap/*.php');
    foreach ($loads as $load) {
        require($load);   
    }
?>