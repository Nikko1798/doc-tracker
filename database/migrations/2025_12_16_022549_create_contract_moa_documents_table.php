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
        Schema::create('contract_moa_documents', function (Blueprint $table) {
            $table->id();
            $table->text('other_details')->nullable();
            $table->string('project_or_program')->nullable();
            $table->string('authority_or_fund_source')->nullable();
            $table->foreignId('ncca_end_user_id')->nullable()->constrained('employees');
            $table->dateTime('date_time_ready')->nullable();
            $table->dateTime('date_time_released')->nullable();
            $table->text('remarks')->nullable();
            $table->text('service_to_ncca')->nullable();
            $table->text('concerned_party_or_supplier')->nullable();
            $table->decimal('total_service_amount', 10,2)->default(0.00);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('contract_moa_documents');
    }
};
