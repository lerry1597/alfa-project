<?php

namespace App\Filament\Customer\Resources\OrderResource\Pages;

use App\Filament\Customer\Resources\OrderResource;
use App\Filament\Customer\Resources\TransactionResource;
use App\Models\Transaction;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListTransactions extends ListRecords
{
    protected static string $resource = TransactionResource::class;

    protected ?string $heading = 'Order';

    protected static ?string $title = 'Order';

    public function getBreadcrumbs(): array
    {
        return [
            TransactionResource::getUrl()  => 'Order', 'List', // Link to the Order index page
        ];
    }
    
    protected function getHeaderActions(): array
    {
        return [
            // Actions\CreateAction::make(),
        ];
    }
}
