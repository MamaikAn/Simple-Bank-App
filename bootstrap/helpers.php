<?php

use Classes\Globals\Singletons\Session;

function session() {
    return Session::getInstance();
}

function database() {
    return Database::getInstance();
}

?>