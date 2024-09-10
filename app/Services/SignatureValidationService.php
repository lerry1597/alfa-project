<?php

namespace App\Services;

use App\Models\Credential;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;

class SignatureValidationService
{
    private $serverKey;

    public function __construct()
    {
        $namaPerusahaan = 'midtrans';
        $this->serverKey = Credential::where('name', $namaPerusahaan)->first();
    }

    public function validateSignature(array $data)
    {
        $signature = $data['signature_key'] ?? '';

        $signatureString = $data['order_id']
            . $data['status_code']
            . $data['gross_amount']
            . $this->serverKey->server_key;

        $generatedSignature = hash('sha512', $signatureString);

        Log::info('order id : ' . $data['order_id']);
        Log::info('status_code : ' . $data['status_code']);
        Log::info('gross_amount : ' . $data['gross_amount']);
        Log::info('server key : ' . $this->serverKey->server_key);
        Log::info('ganereted signature : ' . $generatedSignature);
        Log::info('signature : ' . $signature);

        return $generatedSignature === $signature;
    }
}
