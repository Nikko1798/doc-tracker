<?php
use App\Http\Controllers\DocumentController;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

Route::prefix('document')->group(function () {
    Route::middleware('auth')->group(function () {
        Route::get('/', [DocumentController::class, 'index'])->name('document.index');
        Route::post('/store', [DocumentController::class, 'store'])->name('document.store');
        Route::get('/fetch-all-documents', [DocumentController::class, 'fetchAllDocuments'])->name('document.fetch-all-documents');
        
        Route::patch('/update-doc-status/{document}', [DocumentController::class, 'updateDocumentStatus'])->name('document.update-doc-status');
    });
    Route::middleware('guest')->group(function () {
        Route::get('/fetchPublicDocuments', [DocumentController::class, 'fetchPublicDocuments'])->name('document.fetch-public-documents');

    });
});