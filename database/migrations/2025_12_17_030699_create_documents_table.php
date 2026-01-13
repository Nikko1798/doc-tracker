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
        Schema::create('documents', function (Blueprint $table) {
            $table->id();
            $table->foreignId('complexity_id')->nullable()->constrained('codetables');
            $table->foreignId('document_type_id')->nullable()->constrained('document_types');
            $table->date('date_received')->nullable();
            $table->time('time_received')->nullable();
            $table->text('title')->nullable();
            $table->string('control_number')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('documents');
    }
};
