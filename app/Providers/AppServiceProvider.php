<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Inertia\Inertia;
use App\Models\Codetable;
use Illuminate\Support\Facades\URL;
use Illuminate\Http\Request;


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
                'generatedrRoute'   => session('generatedrRoute'),
            ],
            'documentStatus' => fn () => Codetable::where('codename', 'DOCUMENT-STATUS')->get()
        ]);

          if ($this->app->environment('production')) {
            Request::setTrustedProxies(
                request()->getClientIp() ? [request()->getClientIp()] : [],
                Request::HEADER_X_FORWARDED_FOR | Request::HEADER_X_FORWARDED_PROTO
            );
            URL::forceScheme('https');
        }
    }
}
