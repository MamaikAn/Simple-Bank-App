<?php
    namespace App\Logic\Products;

    use App\Logic\Product;

    class Deposit extends Product{

        public $fields = ['bet', 'period_type'];

        protected $fillable = ['bet'];

        public function __construct() {
            $this->$fields = array_merge($this->fields, parent::$fields);
            $this->fillable = array_merge($this->fillable, parent::$fillable);
        }
    }
?>