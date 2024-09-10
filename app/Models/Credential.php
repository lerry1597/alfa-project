<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Credential extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'description',
        'merchant_id',
        'client_key',
        'server_key',
        'payment_notification_url',
        'recurring_notification_url',
        'pay_account_notification_url',
        'finish_redirect_url',
        'unfinish_redirect_url',
        'error_redirect_url',
    ];
}
