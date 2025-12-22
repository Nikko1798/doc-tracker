<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Inertia\Inertia;
use App\Models\Codetable;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        //
        Inertia::share([
            'flash' => fn () => [
                'success' => session('success'),
                'error'   => session('error'),
            ],
            'documentStatus' => fn () => Codetable::where('codename', 'DOCUMENT-STATUS')->get()
        ]);
    }
}
