<?php
use App\Http\Controllers\DocumentController;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

Route::prefix('document')->group(function () {
    Route::middleware('auth')->group(function () {
        Route::get('/', [DocumentController::class, 'index'])->name('document.index');
        Route::post('/store', [DocumentController::class, 'store'])->name('document.store');
    });
    Route::middleware('guest')->group(function () {
        Route::get('/fetchPublicDocuments', [DocumentController::class, 'fetchPublicDocuments'])->name('document.fetch-public-documents');

    });
});