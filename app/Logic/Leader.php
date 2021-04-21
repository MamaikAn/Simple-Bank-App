<?php
    namespace App\Logic;

    use App\Classes\Model\Model;
    
    class Leader extends Model{

        public $fields = ['name', 'surname', 'thirdname', 'inn'];

        public $fillable = ['name', 'surname', 'thirdname', 'inn'];

        public $rules = [
            'name' => 'required|max:255|regex:/[\p{L}\s\d]+/u',
            'surname' => 'required|max:255|regex:/[\p{L}\s\d]+/u',
            'thirdname' => 'required|max:255|regex:/[\p{L}\s\d]+/u',
            'inn' => 'required|number'
        ];
    }
?>