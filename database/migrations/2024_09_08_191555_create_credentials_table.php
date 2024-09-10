<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('credentials', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('description')->nullable();
            $table->string('sandbox_url');
            $table->string('merchant_id');
            $table->string('client_key');
            $table->string('server_key');
            $table->string('payment_notification_url')->nullable();
            $table->string('recurring_notification_url')->nullable();
            $table->string('pay_account_notification_url')->nullable();
            $table->string('finish_redirect_url')->nullable();
            $table->string('unfinish_redirect_url')->nullable();
            $table->string('error_redirect_url')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('credentials');
    }
};
