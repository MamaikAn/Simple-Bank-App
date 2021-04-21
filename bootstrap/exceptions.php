<?php

use App\Classes\Globals\Singletons\ExceptionHandler;

set_exception_handler('exception_handler');

function exception_handler($exception) {
    ExceptionHandler::getInstance()->handle($exception);
}

?>