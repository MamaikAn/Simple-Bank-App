<?php
    namespace App\Logic;
    
    use App\Logic\Client;
    use App\Model\HasOne;

    abstract class Product {

        public $fields = ['date_open', 'date_close', 'time', 'client', 'client_type'];

        protected $fillable = ['date_open', 'date_close', 'time'];

        public function client($data) {
            $client = $this->hasOne(Client::class, 'client', $data);
        }
    }
?>