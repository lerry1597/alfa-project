<?php

namespace App\Filament\Customer\Resources\OrderResource\Pages;

use App\Filament\Customer\Resources\OrderResource;
use App\Filament\Customer\Resources\TransactionResource;
use Filament\Actions;
use Filament\Resources\Pages\ViewRecord;
use Illuminate\Support\Facades\Log;

class ViewTransaction extends ViewRecord
{
    protected static string $resource = TransactionResource::class;

    protected ?string $heading = 'Order Detail';

    protected const STATUS_PENDING = 0;

    public function getBreadcrumbs(): array
    {
        return [
            TransactionResource::getUrl()  => 'Order', 'View', // Link to the Order index page
        ];
    }

    protected function getHeaderActions(): array
    {

        $actions = [
            // Actions\EditAction::make(),
        ];

        // Log::info($this->record->status);

        if($this->record->status === self::STATUS_PENDING){
            $actions[] = Actions\Action::make('proceedToPayment')
                ->label('Proceed to Payment')
                ->action(function () {
                    // Store transaction ID in session

                    session(['payment_id' => $this->record->id]);

                    // Redirect to the payment process page
                    return redirect()->route('filament.customer.pages.payment-page'); // Use the appropriate payment route
                })
                ->button();
        }

        return $actions;
    }
}
