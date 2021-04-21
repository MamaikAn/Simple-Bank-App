<?php 

require 'bootstrap.php';

switch ($_SERVER['REQUEST_METHOD']) {
    case 'POST':
        require 'app/Controllers/FormCreate.php';
        break;
    default:
        require 'app/Controllers/MainPage.php';
}

?>