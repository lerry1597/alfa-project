<?php

namespace App\Filament\Customer\Pages;

use App\Filament\Customer\Widgets\SuccessWidget;
use Filament\Pages\Page;

class TransactionSuccess extends Page
{
    // protected static ?string $navigationIcon = 'heroicon-o-document-text';

    protected static ?string $title = '';

    protected static string $view = 'filament.customer.pages.transaction-success';

    protected static bool $shouldRegisterNavigation = false;

    public $transactionId;
    public $message;

    public function mount($transactionId = null)
    {
        $this->transactionId = $transactionId;
        $this->message = 'Transaction Successful!';
    }
}
