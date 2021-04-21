<?php
    use App\Logic\Clients\Legal;
    // use App\Logic\Product\Deposit;

    if (!empty($_POST)) {
        if (!(isset($_POST['client'], $_POST['product']))) {
            throw new Exception('Unexpected behavior');
        }

        switch($_POST['client']) {
            case 'legal':
            case 'individual':
                break;
            default:
                throw new Exception('Unexpected behavior');
        }

        switch($_POST['product']) {
            case 'deposit':
            case 'credit':
                break;
            default:
            throw new Exception('Unexpected behavior');
        }
        
        $clientData = [];
        $productData = [];

        $clientType = $_POST['client'];
        $productType = $_POST['product'];

        $arrayLink = NULL;

        // form data parsing
        foreach($_POST as $key => $value) {
            if (substr( $key, 0, strlen($clientType)) === $clientType) {
                $arrayLink = &$clientData;
            }
            else if (substr( $key, 0, strlen($productType)) === $productType) {
                $arrayLink = &$productData;
            }
            else continue;

            $substrings = explode('-', $key);

            $path = $substrings[1];
            $length = count($substrings);

            for ($i = 1; $i < $length - 1; $path = $substrings[++$i]) {
                if (!isset($arrayLink[$path])) {
                    $arrayLink[$path] = array();
                }
                $pointer = &$arrayLink[$path];
                unset($arrayLink);
                $arrayLink = &$pointer;
                unset($pointer);
            }
            $arrayLink[$substrings[$length - 1]] = $value;
            unset($arrayLink);
        }

        $client = null;

        switch($clientType) {
            case 'legal':
                $client = new Legal($clientData);
                break;
            case 'individual':
                // new Individual($clientData);
                break;
        }

        $client->create();

        $product = null;
    }
?>