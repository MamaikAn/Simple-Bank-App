<?php

namespace App\Classes\Globals\Singletons;

use App\Classes\Globals\Singleton;
use App\Classes\Exceptions\IException;

class ExceptionHandler extends Singleton {
    public function handle(\Exception $e) {
        if ($e instanceof IException) $e->handle();
        else echo $e->getMessage();
    }
}

?>