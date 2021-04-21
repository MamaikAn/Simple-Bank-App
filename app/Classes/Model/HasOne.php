<?php
    namespace App\Classes\Model;

    class HasOne {

        public $relatedModel;

        public function __construct($class, $data = null) {
            if ($data instanceof $class) {
                $this->relatedModel = $data;
            }
            else $this->relatedModel = new $class($data);
        }
    }
?>