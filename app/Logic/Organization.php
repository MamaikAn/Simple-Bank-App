<?php
    namespace App\Logic;

    use App\Classes\Model\Model;
    
    class Organization extends Model{

        public $fields = ['name', 'address', 'ogrn', 'inn', 'kpp'];

        public $rules = [
            'name' => 'required|max:255|regex:/[\p{L}\s\d]+/u',
            'address' => 'required|max:255',
            'ogrn' => 'required|number|max:255',
            'inn' => 'required|number|max:255',
            'kpp' => 'required|number|max:255',
        ];
    }
?>