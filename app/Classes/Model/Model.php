<?php
    namespace App\Classes\Model;

    use App\Classes\Validation\Validation;
    use App\Classes\Model\HasOne;

    class Model {
        use Validation;

        public $fields = [];

        protected $fillable = [];

        protected $data = [];

        protected $tableName;

        protected $id;

        public function __set($name, $value) {
            if (in_array($name, $this->fields)) {
                $this->data[$name] = $value;
            }
            else throw new \Exception("Undefined variable $name in " . get_class($this));
        }

        public function __get($name) {
            if ($this->isset($name)) {
                return $this->data[$name];
            }
            else throw new \Exception("Undefined variable $name in " . get_class($this));
        }

        public function __isset($name) {
            return array_key_exists($name);
        }

        public function __construct($data = null) {
            foreach($this->fields as $field) {
                $this->data[$field] = NULL;
            }
            if ($data != null) {
                $this->fill($data);
            }
        }

        public function fill($data) {
            foreach($this->fillable as $field) {
                if (isset($data[$field])) {
                    $this->data[$field] = $data[$field];
                }
            }
        }

        public function create() {
            foreach($this->fields as $field) {
                if ($field instanceof HasOne) {
                    if (!$field->relatedModel->id) {
                        $field->relatedModel->create();
                    }
                }
            }
            
            $this->validate();
            if (!$this->hasErrors) {
                $this->saveToDatabase();
            }

            return $this;
        }

        public function get($id) {
            
        }

        public function list() {

        }

        public function findOrCreate() {
            
        }

        public function hasOne($class, $field, $data = null){
            $this->$field = new HasOne($class, $data);
        }

        public function getTableName() {
            return $this->tableName ? $this->tableName : strtolower(preg_replace('/(?<!^)[A-Z]/', '_$0', get_class($this)));
        }

        protected function saveToDatabase() {
            $saveData = ['id' => null];

            foreach($this->data as $key => $value) {
                if ($this->value instanceof HasOne) {
                    $saveData[$key.'_id'] = $this->value->relatedModel->id;
                }
            }
            $placeholders = implode(', ', array_fill(0, count($saveData), '?'));
            
            $statement = "INSERT INTO ? ({$placeholders}) VALUES ({$placeholders})
            SELECT LAST_INSERT_ID();";
            
            $values = array_merge((array)$this->getTableName, array_keys($saveData), array_values($arrayValues));

            $id = database()->query($statement, $values);

            $this->$id = $id[0];
        }
    }
?>