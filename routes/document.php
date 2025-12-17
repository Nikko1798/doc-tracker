<?php
use App\Http\Controllers\DocumentController;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

Route::middleware('auth')->prefix('document')->group(function () {
    Route::get('/', [DocumentController::class, 'index'])->name('document.index');
    Route::post('/store', [DocumentController::class, 'store'])->name('document.store');
});