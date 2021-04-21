<?php

namespace Classes\Globals\Singletons;

use Classes\Globals\Singleton;

class Session extends Singleton {

    protected function __construct() {
        session_start();
    }

    public function setKey($key, $isArray = false) {
        $_SESSION[$key] = $isArray ? [] : null;
    }
    public function setValue($key, $value) {
        $_SESSION[$key] = $value;
    }
    public function putValue($key, $value) {
        if (is_array($_SESSION[$key])) {
            array_push($_SESSION[$key], $value);
        }
        else {
            $this->setKey($key, true);
            $this->putValue($key, $value);
        }
    }
    public function removeKey($key) {
        unset($_SESSION[$key]);
    }
}
