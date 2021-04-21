<?php

namespace Classes\Globals\Singletons;

use App\Classes\Globals\Singleton;

class Database extends Singleton{

    private $transactionBegan = false;

    private $pdo;

    protected function __construct() {
        $this->pdo = new \PDO('mysql:host=localhost;dbname=testapp2;charset=utf8', "testapp2", "qwerty", array(PDO::ATTR_PERSISTENT => true));
    }

    public function beginTransaction() {
        if (!$this->transactionBegan) {
            $this->pdo->beginTransaction();
            $this->$transactionBegan = true;
        }
        else $this->endTransaction(false);
    }

    public function query($statement, $values = NULL) {
        
        try {
            if (!$this->transactionBegan) {
                $this->beginTransaction();
            }

            $this->pdo->statement($statement);

            if ($values != NULL) {
                $this->pdo->exec($query);
            }

            return $this->fetchAll();
        }
        catch (\Exception $e) {
            $this->endTransaction(false);
            throw new \Exception('Error on database query execution');
        }
    }

    public function endTransaction($save = true) {
        if ($save) {
            $this->pdo->commit();
        }
        else $this->pdo->rollBack();
    }
}

?>