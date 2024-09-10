<?php

namespace App\Http\Controllers;

use App\Services\PushNotifService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class PaymentNotification extends Controller
{

    protected $pushNotifService;

    public function __construct(PushNotifService $pushNotifService)
    {
        $this->pushNotifService = $pushNotifService;
    }

    public function handleNotification(Request $request)
    {
        try {
            // Get all notification data from the request
            $notificationData = $request->all();

            $response = $this->pushNotifService->processNotification($notificationData);

            // Return a JSON response to indicate success
            return response()->json($response);

        } catch (\Throwable $e) {
            // Log error if something goes wrong
            Log::error('Error processing payment notification: ' . $e->getMessage());

            // Return a JSON response indicating an error
            return response()->json(['status' => 'error', 'message' => 'An error occurred while processing the notification.']);
        }
    }
}
