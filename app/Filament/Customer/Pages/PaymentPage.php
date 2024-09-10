<?php

namespace App\Filament\Customer\Pages;

use App\Models\Order;
use App\Models\Transaction;
use Doctrine\DBAL\Schema\View;
use Filament\Notifications\Notification;
use Filament\Pages\Page;
use Illuminate\Contracts\View\View as ViewView;
use Illuminate\Support\Facades\Redirect;

class PaymentPage extends Page
{
    // protected static ?string $navigationIcon = 'heroicon-o-document-text';

    protected static ?string $title = 'Payment Page';

    protected static string $view = 'filament.customer.pages.payment-page';

    // Nonaktifkan halaman dari navigasi
    protected static bool $shouldRegisterNavigation = false;

    public $paymentUrl;

    public function mount()
    {
        $id = session('payment_id');

        if($id){
            $order = Transaction::find($id);
            if($order && $order->redirect_url){
                $this->paymentUrl = $order->redirect_url;
                return;
            }
        }

        return Notification::make()->title('Payment id / Order id not found')->danger()->send();
    }
}
