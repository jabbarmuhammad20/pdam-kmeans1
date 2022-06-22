<?php

use Illuminate\Support\Facades\Route;
use App\Http\Middleware\CheckRole;
use App\Http\Controller\KMeansController;
use App\Http\Controller\KMeans1Controller;
use App\Http\Controller\KMeans2Controller;
use App\Http\Controller\TranksaksiController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::get('reset', function () {
    Artisan::call('route:clear');
    Artisan::call('cache:clear');
    Artisan::call('config:clear');
    Artisan::call('config:cache');
});

Route::get('/', function () {
    return view('welcome');
});

Route::get('home','HomeController@index');

Route::get('/admin_setting', function () {
    return view('admin_setting');
});

Auth::routes();

// Halaman Hanya Untuk Admin
Route::group(['middleware' => ['auth', 'CheckRole:admin']], function () {
    Route::get('/daftar_pelanggan', [App\Http\Controllers\PelangganController::class, 'index'])->name('daftar_pelanggan');
    Route::get('/tambah_pelanggan', [App\Http\Controllers\PelangganController::class, 'create'])->name('tambah_pelanggan');
    Route::post('/tambah_pelangganStore', [App\Http\Controllers\PelangganController::class, 'store'])->name('tambah_pelangganStore');
    Route::get('/admin_editpelanggan/{id}', [App\Http\Controllers\PelangganController::class, 'edit']);
    Route::put('/admin_updatepelanggan/{id}', [App\Http\Controllers\PelangganController::class, 'update']);
    Route::get('pelanggan_exportExcel', [App\Http\Controllers\PelangganController::class, 'pelanggan_exportExcel']);
    Route::post('pelanggan_importExcel', [App\Http\Controllers\PelangganController::class, 'pelanggan_importExcel']);
    Route::get('admin_lihatPelanggan/{id}', [App\Http\Controllers\PelangganController::class, 'show']);
    Route::get('admin_deletedpelanggan/{id}', [App\Http\Controllers\PelangganController::class, 'destroy']);
    Route::get('admin_print',[App\Http\Controllers\PelangganController::class, 'print']);

    Route::get('/daftar_debitAir', [App\Http\Controllers\DebitController::class, 'index']);
    Route::get('admin_tambahdebitair/{id}',[App\Http\Controllers\DebitController::class, 'admin_tambahdebitair']);
    Route::put('/tambah_debit_air/{id}',[App\Http\Controllers\DebitController::class, 'admin_debit_store'])->name('admin_debitstore');
    Route::get('cekDebitAir/{id}',[App\Http\Controllers\PelangganController::class, 'cek_debit_air']);
    Route::get('admin_riwayat_debit_air',[App\Http\Controllers\DebitController::class, 'admin_riwayat_debit_air']);
    Route::put('/update_debitAir/{id}',[App\Http\Controllers\PelangganController::class, 'update_debitair']);
    Route::get('admin_deleteddebit/{id}', [App\Http\Controllers\DebitController::class, 'destroy']);
    
    Route::get('/daftar_debitAirKMeans',[App\Http\Controllers\KMeansController::class, 'index'])->name('Kmeans');
    Route::get('/daftar_debitAirKMeans1',[App\Http\Controllers\KMeans1Controller::class, 'index'])->name('Kmeans1');
    Route::get('/daftar_debitAirKMeans2',[App\Http\Controllers\KMeans2Controller::class, 'index'])->name('Kmeans2');
    
    Route::get('/daftar_pembayaran',[App\Http\Controllers\TranksaksiController::class, 'index']);
    Route::get('/admin_riwayatPembayaran',[App\Http\Controllers\TranksaksiController::class, 'admin_riwayatPembayaran']);
    Route::get('/admin_konfirmasiKeuangan/{id}',[App\Http\Controllers\TranksaksiController::class, 'create']);
    Route::post('/admin_konfirmasiKeuangan',[App\Http\Controllers\TranksaksiController::class, 'store']);
    Route::get('admin_deletedtranksaksi/{id}', [App\Http\Controllers\TranksaksiController::class, 'destroy']);

});

// Hanya admin dan Pelanggan
Route::group(['middleware' => ['auth', 'CheckRole:admin,pelanggan']], function () {
    Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
    Route::get('/pelanggan_index/{id}', [App\Http\Controllers\DebitController::class, 'pelanggan_index']);
    Route::get('/pelanggan_biodataPelanggan', [App\Http\Controllers\PelangganController::class, 'pelanggan_show']);
});