<?php

use Illuminate\Support\Facades\Route;

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

Route::get('/', function () {
    return view('auth.login');
});

Auth::routes();
//Auth::routes(['register' => false]); if you don't want to show register page

Route::get('/home', 'HomeController@index')->name('home');

Route::group(['middleware' => 'auth'],function (){

    Route::resource('invoices','InvoicesController');
    // this route to get products name for users by ajax when he chose section.
    Route::get('/section/{id}','InvoicesController@getProductsName');
    Route::get('/status_show/{id}', 'InvoicesController@payment_status')->name('status_show');
    Route::post('/status_update/{id}', 'InvoicesController@update_status')->name('status_update');

    Route::get('/invoice_details/{id}','InvoicesDetailsController@index');
    Route::get('/viewFile/{invoice_number}/{file_name}','InvoicesDetailsController@openFile');
    Route::get('/download/{invoice_number}/{file_name}','InvoicesDetailsController@downloadFile');
    Route::post('delete_file','InvoicesDetailsController@destroy')->name('delete_file');

    Route::resource('sections','SectionController');

    Route::resource('products','ProductsController');

    Route::resource('invoices_attachments','InvoicesAttachmentsController');
});


Route::get('/{page}', 'AdminController@index');
