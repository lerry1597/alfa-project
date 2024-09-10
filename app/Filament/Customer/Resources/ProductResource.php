<?php

namespace App\Filament\Customer\Resources;

use App\Filament\Customer\Resources\ProductResource\Pages;
use App\Filament\Customer\Resources\ProductResource\RelationManagers;
use App\Models\Credential;
use App\Models\Order;
use App\Models\Product;
use App\Models\Transaction;
use Filament\Tables\Actions\Action;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Actions\Action as ActionsAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Filament\Forms\Components\Modal;
use Filament\Forms\Components\NumberInput;
use Filament\Forms\Components\Placeholder;
use Filament\Forms\Components\TextInput;
use Filament\Notifications\Notification;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class ProductResource extends Resource
{
    protected static ?string $model = Product::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('name')
                    ->searchable(),
                TextColumn::make('description')
                    ->limit(20),
                TextColumn::make('price')
                    ->formatStateUsing(function ($state) {
                        return 'Rp. ' . number_format($state, 0, ',', '.');
                    }),
                TextColumn::make('stock')->default(0)
                // TextColumn::make('is_active')
                //     ->formatStateUsing(function ($state) {
                //         return $state ? 'Yes' : 'No';  // Jika 1, tampilkan "Yes"; jika 0, tampilkan "No"
                //     })
            ])
            ->filters([
                //
            ])
            ->actions([
                Action::make('checkout')
                    ->label('Checkout')
                    ->icon('heroicon-s-shopping-cart')
                    ->color('success')
                    ->form([
                        // Menampilkan nama produk (readonly)
                        Placeholder::make('name')
                            ->label('Product Name')
                            ->content(fn(Product $record): string => $record->name),

                        // Menampilkan deskripsi produk (readonly)
                        Placeholder::make('description')
                            ->label('Description')
                            ->content(fn(Product $record): string => $record->description),

                        // Menampilkan harga produk (readonly)
                        Placeholder::make('price')
                            ->label('Price')
                            ->content(fn(Product $record): string => 'Rp. ' . number_format($record->price, 0, ',', '.')),

                        TextInput::make('quantity') // Menggunakan TextInput dengan type number
                            ->label('Quantity')
                            ->numeric()
                            ->required()
                            ->minValue(1)
                            ->maxValue(fn(Product $record) => $record->stock), // Atur nilai maksimum berdasarkan stok

                    ])
                    ->action(fn(Product $record, array $data) => self::checkoutProduct($record, $data))
                    ->disabled(fn(Product $record): bool => $record->stock <= 0),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    // Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListProducts::route('/'),
            // 'create' => Pages\CreateProduct::route('/create'),
            // 'edit' => Pages\EditProduct::route('/{record}/edit'),
        ];
    }

    public static function getEloquentQuery(): Builder
    {
        // Gunakan parent query dan filter produk yang aktif
        return parent::getEloquentQuery()
            ->where('is_active', true); // Hanya produk yang aktif yang akan ditampilkan
    }

    public static function checkoutProduct(Product $product, array $data)
    {
        $orderId = now()->timestamp;
        $pendding = 0;
        $quantity = $data['quantity'];

        // Hitung total harga
        $totalPrice = $product->price * $quantity;
        $order = Transaction::create([
            'user_id' => auth()->id(), // ID user yang sedang login
            'product_id' => $product->id,
            'quantity' => $quantity,
            'total_price' => $totalPrice,
            'order_id' => $orderId,
            'status' => $pendding
        ]);

        $namaPerusahaan = 'midtrans';
        $credential = Credential::where('name', $namaPerusahaan)->first();
        if (!$credential) {
            return Notification::make()->title('Error')->body('Payment gateway credentials not found.')->danger()->send();
        }

        $authString = base64_encode($credential->server_key . ':');

        // Deklarasi header
        $headers = [
            'Accept' => 'application/json',
            'Content-Type' => 'application/json',
            'Authorization' => 'Basic ' . $authString,
        ];

        // Deklarasi request body
        $requestBody = [
            'transaction_details' => [
                'order_id' => 'ORDER-' . $orderId,
                'gross_amount' => $totalPrice,
            ],
            'customer_details' => [
                'first_name' => auth()->user()->name,
                'email' => auth()->user()->email,
            ],
            'item_details' => [
                [
                    'id' => $product->id,
                    'price' => $product->price,
                    'quantity' => $quantity,
                    'name' => $product->name,
                ],
            ]
        ];

        // Kirim request ke API Midtrans menggunakan variabel yang dideklarasikan
        $response = Http::withHeaders($headers)->withoutVerifying()->post($credential->sandbox_url, $requestBody);

        if ($response->successful()) {
            $redirectUrl = $response->json('redirect_url');

            $order->update([
                'redirect_url' => $redirectUrl
            ]);

            // Redirect ke URL yang diberikan oleh API
            // return redirect()->away($redirectUrl);

            session(['payment_id' => $order->id]);

            return redirect()->route('filament.customer.pages.payment-page');
        }

        return Notification::make()->title('Checkout failed.')->danger()->send();

        // Kurangi stok produk
        // $product->stock -= $quantity;
        // $product->save();

        // Berikan pesan sukses
        // Notification::make()->title('Checkout Successful')->body('You have successfully checked out the product.')->success()->send();
    }
}
