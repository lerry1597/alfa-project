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
        Schema::table('users', function (Blueprint $table) {
            $table->unsignedBigInteger('role_id')->nullable(); // Tambahkan kolom role_id

            // Buat foreign key dari role_id ke id di tabel roles
            $table->foreign('role_id')->references('id')->on('roles')->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            // Cek dan hapus foreign key hanya jika ada
            if (Schema::hasColumn('users', 'role_id')) {
                $table->dropForeign(['role_id']); // Menghapus foreign key
                $table->dropColumn('role_id'); // Menghapus kolom role_id
            }
        });
    }
};
