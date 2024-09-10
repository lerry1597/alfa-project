<?php

namespace App\Filament\Customer\Widgets;

use Filament\Widgets\Widget;

class SuccessWidget extends Widget
{
    protected static string $view = 'filament.customer.widgets.success-widget';

    public $title = 'Success';
    public $content = "We received your purchase request; we'll be in touch shortly!";

    public function mount($title = null, $content = null)
    {
        $this->title = $title ?? $this->title;
        $this->content = $content ?? $this->content;
    }

}
