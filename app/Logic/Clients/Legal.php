<?php
    namespace App\Logic\Clients;

    use App\Logic\Client;
    use App\Logic\Organization;
    use App\Logic\Leader;

    class Legal extends Client {
        public $fields = [
            'leader', 'organization'
        ];

        public $rules = [
            'leader' => 'required',
            'organization' => 'required'
        ];

        public function fill($data) {
            if (isset($data['leader'])) {
                $this->leader($data['leader']);
            }
            if (isset($data['organization'])) {
                $this->organization($data['organization']);
            }
        }

        public function leader($data = null) {
            $this->hasOne(Leader::class, 'leader', $data);
        }

        public function organization($data = null) {
            $this->hasOne(Organization::class, 'organization', $data);
        }
    }
?>