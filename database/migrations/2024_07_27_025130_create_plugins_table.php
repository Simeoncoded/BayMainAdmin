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
        Schema::create('plugins', function (Blueprint $table) {
            $table->id();
            $table->string('plugin_code')->nullable();
            $table->string('name')->nullable();
            $table->string('image')->nullable();
            $table->text('solution')->nullable();
            $table->text('description')->nullable();
            $table->text('long_description')->nullable();
            $table->string('documentation_url')->nullable();
            $table->decimal('amount', 10, 2)->nullable();
            $table->string('version')->nullable();
            $table->string('vendor')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('plugins');
    }
};
