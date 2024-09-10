<?php

namespace App\Filament\Resources\CustomerResource\Pages;

use App\Filament\Resources\CustomerResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateCustomer extends CreateRecord
{
    protected static string $resource = CustomerResource::class;

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        // Custom validation
        unset($data['password_confirmation']);
        $data['password'] = bcrypt($data['password']);
        if(isset($data['role_id']) && $data['role_id'] === 'customer'){
            $data['role_id'] = 2;
        }

        return $data;
    }
}
