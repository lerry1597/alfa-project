<?php

namespace App\Services;

use Illuminate\Support\Facades\Log;
use App\Models\Product;
use App\Models\Transaction;
use Filament\Notifications\Notification;

class PushNotifService
{
    protected $signatureValidationService;
    protected $sukses = 1; // Deklarasi status pada level kelas
    protected $failed = 2;


    public function __construct(SignatureValidationService $signatureValidationService)
    {
        $this->signatureValidationService = $signatureValidationService;
    }

    public function processNotification(array $notificationData)
    {
        // Map data
        $mappedData = $this->mapData($notificationData);

        // Log mapped data
        Log::info('Midtrans Notification Received:', $mappedData);

        // Validate signature
        if (!$this->signatureValidationService->validateSignature($mappedData)) {
            Log::error('Signature validation failed.');
            return ['status' => 'error', 'message' => 'Invalid signature'];
        }

        // Update order
        $this->updateOrder($mappedData);

        return ['status' => 'success'];
    }

    private function mapData(array $data)
    {
        return [
            'va_number' => $data['va_numbers'][0]['va_number'] ?? null,
            'bank' => $data['va_numbers'][0]['bank'] ?? null,
            'transaction_time' => $data['transaction_time'] ?? null,
            'transaction_status' => $data['transaction_status'] ?? null,
            'transaction_id' => $data['transaction_id'] ?? null,
            'status_message' => $data['status_message'] ?? null,
            'status_code' => $data['status_code'] ?? null,
            'signature_key' => $data['signature_key'] ?? null,
            'settlement_time' => $data['settlement_time'] ?? null,
            'payment_type' => $data['payment_type'] ?? null,
            'payment_amount' => $data['payment_amounts'][0]['amount'] ?? null,
            'order_id' => $data['order_id'] ?? null,
            'merchant_id' => $data['merchant_id'] ?? null,
            'gross_amount' => $data['gross_amount'] ?? null,
            'fraud_status' => $data['fraud_status'] ?? null,
            'expiry_time' => $data['expiry_time'] ?? null,
            'currency' => $data['currency'] ?? null,
        ];
    }

    private function updateOrder(array $data)
    {
        $orderId = str_replace('ORDER-', '', $data['order_id']);
        // Find the transaction by order_id
        $transaction = Transaction::where('order_id', $orderId)->first();

        if ($transaction) {
            // Determine status based on transaction_status
            if ($data['transaction_status'] === 'settlement' || $data['transaction_status'] === 'capture') {
                $status = $this->sukses; // Use default status value
                $this->updateProductStock($transaction); // Reduce stock if transaction is successful
            } else {
                $status = $this->failed; // Keep existing status if not 'settlement' or 'capture'
            }

            // Update transaction details
            $transaction->update([
                'status' => $status,
                'payment_date_time' => now(),
                'updated_at' => now(),
            ]);

            Log::info('Order updated successfully for order_id: ' . $data['order_id']);
        } else {
            Log::error('Transaction not found for order_id: ' . $data['order_id']);
        }
    }

    private function updateProductStock(Transaction $transaction)
    {
        // Assume you have a product_id in the transaction or a related table
        // You might need to adjust this according to your actual database schema
        $product = Product::find($transaction->product_id);

        if ($product) {
            // Reduce stock by the quantity associated with the transaction
            $quantity = $transaction->quantity; // Ensure you have quantity information in your transaction model
            if ($product->stock >= $quantity) {
                $product->stock -= $quantity;
                $product->save();
                Log::info('Product stock updated successfully for product_id: ' . $product->id);
            } else {
                Log::error('Not enough stock for product_id: ' . $product->id);
            }
        } else {
            Log::error('Product not found for product_id: ' . $transaction->product_id);
        }
    }
}
