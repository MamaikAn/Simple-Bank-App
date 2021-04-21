<?php

    namespace App\Classes\Validation;

    use App\Classes\Exceptions\ValidationException;

    trait Validation {
        public $rules = [];
        
        public $validationFatal = false;

        public $hasErrors = false;

        public function validate() {
            if (is_array($rules)) {
                foreach ($rules as $field => $ruleGroup) {
                    $ruleArray = explode('|',$ruleGroup);

                    if (!isset($this->data[$field])) {
                        if (array_search('required', $ruleArray) !== false) {
                            $this->createException($field, 'required');
                        }
                        else continue;
                    }
                    
                    foreach($ruleArray as $rule) {
                        $this->rule($field, $rule);
                    }
                }
            }
        }
        public function createException($field, $message) {
            $this->hasErrors = true;
            new ValidationException($field, $message, $this->validationFatal);
        }

        public function rule($field, $rule) {
            $hasError = false;
            $value = null;

            $offset = strpos($rule, ':');
            if ($offset !== false) {
                $field = substr($rule, 0, $offset);
                $value = substr($rule, $offset + 1);
            }
            
            switch($rule) {
                case 'regex':
                    if (!regex($value, $this->{$field})) $hasError = true;
                    break;
                case 'number':
                    if (!is_numeric($this->{$field})) $hasError = true;
                    break;
                case 'max': 
                    if (strlen($this->{$field}) != $value) $hasError = true;
                    break;
                case 'object':
                    if (!$this->{$field}->getId()) $hasError = true;
                    break;
                default: 
                    throw new \Exception('Undefined rule');
            }

            if ($hasError) $this->createException($field, $rule);
        }

        public function regex($ex, $value) {
            return preg_match($ex, $value);
        }
    }
?>