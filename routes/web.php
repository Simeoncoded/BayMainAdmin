<?php

use App\Http\Controllers\EmployeeController;
use App\Http\Controllers\ProfileController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use App\Models\Employee;
use App\Models\Clients;
//use App\Models\ClientDetail;
use App\Models\Contacts;
use App\Models\Services;
<<<<<<< HEAD


=======
use App\Models\Clients;
use App\Models\Plans;
use App\Models\Plugins;
use App\Http\Controllers\PluginController;
>>>>>>> b15924562664af1a845d880b6d77dff8e2fa9159

Route::middleware(['auth', 'verified'])->group(function () {
    Route::get('/dashboard', function () {
        return Inertia::render('Dashboard', [
            'auth' => [
                'user' => auth()->user(),
            ],    
            'employees' => Employee::all(),
            'messages' => Contacts::orderBy('created_at', 'desc')->take(3)->get(), 
            //'services' => Services::latest(1) 
            'services' =>Services::orderBy('created_at', 'desc')->take(3)->get()
        ]);
    })->name('dashboard');


});

Route::middleware(['auth', 'verified'])->group(function () {


    Route::get('/client', function () {
        return Inertia::render('Client', [
            'auth' => [
                'user' => auth()->user(),
            ],

<<<<<<< HEAD
            'client' => Clients::all()
=======
});


Route::middleware(['auth', 'verified'])->group(function () {

  Route::get('/client/{$pin}', function ($pin) {
        return Inertia::render('ClientDetail', [
            'auth' => [
                'user' => auth()->user(),
            ],
            'client' => Clients::where('client_pin', $pin)->first()
>>>>>>> b15924562664af1a845d880b6d77dff8e2fa9159
        ]);
    })->name('client');

});


Route::middleware(['auth', 'verified'])->group(function () {


<<<<<<< HEAD
    Route::get('/clientdetail', function() {
        return Inertia::render('ClientDetail', [
            'auth' => [
                'user' => auth()->user(),
            ],

            'client' => Clients::where('')
        ]);
    })->name('clientdetail');

});

=======
    Route::get('/plan', function () {
        return Inertia::render('Plan', [
            'auth' => [
                'user' => auth()->user(),
            ],
            'plans' => Plans::all(),
            'plugins' => Plugins::all()
        ]);
    })->name('plan');




>>>>>>> b15924562664af1a845d880b6d77dff8e2fa9159
Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});


/**
 * ------------------------------------------------------------
 * EMPLOYEE ROUTE GROUPS 
 * ------------------------------------------------------------
 */
Route::group(['middleware '=> 'auth', 'prefix'=> 'employee'], function () {

    Route::get('/', [EmployeeController::class, 'index'])->name('employee');
    Route::post('/delete/{id}', [EmployeeController::class, 'delete']);
    Route::post('/update/{id}', [EmployeeController::class, 'update']);
    Route::post('/create', [EmployeeController::class, 'create']);

}); 

//PLUGIN ROUTE

// PLUGIN ROUTE
Route::group(['middleware' => 'auth', 'prefix' => 'plugin'], function () {
    Route::post('/create', [PluginController::class, 'create']);
    Route::post('/delete/{id}', [PluginController::class, 'delete']);
});



/**
 * ROOT ROUTING
 */

Route::get('/', function () {
    return Inertia::render('Welcome', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
    ]);
});



require __DIR__.'/auth.php';

