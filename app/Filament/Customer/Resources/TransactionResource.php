<?php

namespace App\Filament\Customer\Resources;

use App\Filament\Customer\Resources\OrderResource\Pages;
use App\Filament\Customer\Resources\OrderResource\RelationManagers;
use App\Filament\Customer\Resources\UserResource\RelationManagers\OrderRelationManager;
use App\Filament\Customer\Resources\UserResource\RelationManagers\TransactionRelationManager;
use App\Models\Order;
use App\Models\Transaction;
use Filament\Forms;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Infolists\Components\TextEntry;
use Filament\Infolists\Infolist;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Facades\Auth;

class TransactionResource extends Resource
{
    protected static ?string $model = Transaction::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    protected static ?string $navigationLabel = 'Order';

    public static function infolist(Infolist $infolist): Infolist
    {
        return $infolist
            ->schema([
                TextEntry::make('product.name'),
                TextEntry::make('quantity'),
                TextEntry::make('total_price')
                    ->formatStateUsing(function ($state) {
                        return 'Rp. ' . number_format($state, 0, ',', '.');
                    }),
                TextEntry::make('payment_date_time')->label('Payment Date Time'),
                // TextEntry::make('redirect_url'),
                TextEntry::make('order_id'),
                TextEntry::make('status')
                    ->label('Payment Status')
                    ->formatStateUsing(function ($state) {
                        switch ($state) {
                            case 0:
                                return 'Pending';
                            case 1:
                                return 'Sukses';
                            case 2:
                                return 'Failed';
                            default:
                                return 'Unknown'; // Optional for any unexpected values
                        }
                    })
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                // TextColumn::make('user.name'),
                TextColumn::make('product.name')->label('Procut Name'),
                TextColumn::make('created_at')->sortable(),
                TextColumn::make('order_id')->searchable()
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\ViewAction::make(),
                // Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    // Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getEloquentQuery(): Builder
    {
        $user = Auth::user();

        // Membatasi query hanya untuk transaksi milik user yang sedang login
        return parent::getEloquentQuery()->where('user_id', $user->id);
    }

    public static function getRelations(): array
    {
        return [];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListTransactions::route('/'),
            'create' => Pages\CreateTransaction::route('/create'),
            'view' => Pages\ViewTransaction::route('/{record}'),
            'edit' => Pages\EditTransaction::route('/{record}/edit'),
        ];
    }
}
