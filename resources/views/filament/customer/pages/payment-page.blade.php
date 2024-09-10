<x-filament-panels::page>
    @if($this->paymentUrl)
    <iframe src="{{ $this->paymentUrl }}" width="100%" height="600px" frameborder="0"></iframe>
    @else
    <p>URL not available or payment ID not found.</p>
    @endif
</x-filament-panels::page>