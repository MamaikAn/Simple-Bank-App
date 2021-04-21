<?php
    namespace App\Logic;

    use App\Classes\Model\Model;

    abstract class Client extends Model{
        //abstract public function formatResult(); //for xml

        abstract public function getCurrentType();
    }
?>