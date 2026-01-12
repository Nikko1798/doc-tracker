<?php

use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use Laravel\Fortify\Features;

use App\Models\DocumentType;
use App\Models\Codetable;
use App\Models\Office;
use App\Models\Employee;
use App\Models\Document;

Route::get('/', function () {
    if(Auth::user())
    {
        return redirect()->route('dashboard');
    }
    else{
        return Inertia::render('Welcome', [
            'canRegister' => Features::enabled(Features::registration()),
        ]);
    }
})->name('home');

Route::get('dashboard', function () {
    
    $documentTypes=DocumentType::select('id', 'name')
    ->where('isParent', false)->get();
    $complexities=Codetable::where('codename', 'COMPLEXITY')->get();
    $offices=Office::all();
    $employees=Employee::all();
    return Inertia::render('Dashboard', [
        'documentTypes'=>$documentTypes,
        'complexities' => $complexities,
        'offices'=>$offices,
        'employees'=>$employees,
    ]);
})->middleware(['auth', 'verified'])->name('dashboard');

require __DIR__.'/settings.php';
require __DIR__.'/document.php';
