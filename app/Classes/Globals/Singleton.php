<?php
    namespace App\Classes\Globals;

    class Singleton {

        private static $instance = null;

        protected function __construct() {}

        protected function __clone() {}

        public static function getInstance() {
            if (!self::$instance) {
                self::$instance = new static();
            }
            return self::$instance;
        }
    }
?>