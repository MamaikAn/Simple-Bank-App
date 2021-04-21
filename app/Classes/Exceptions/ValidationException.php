<?php

namespace App\Classes\Exceptions;

class ValidationException extends Exception implements IException
{
    protected $field;

    protected $message;

    public function __construct($field, $message, $fatal = false) {
        $this->field = $field;
        $this->message = $message;

        if ($fatal) {
            session()->removeKey('errors');
            parent::__construct($message);
            throw $this;
        }
        $this->putSessionError();
    }

    protected function putSessionError() {
        session()->putValue('errors', [$field => $message]);
    }

    public function handle() {
        return;
    }
}

?>