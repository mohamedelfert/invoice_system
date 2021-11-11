<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\HomeController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\UserController;

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

Route::group(['middleware' => ['auth']], function() {

    Route::resource('invoices','InvoicesController');
    // this route to get products name for users by ajax when he chose section.
    Route::get('/section/{id}','InvoicesController@getProductsName');
    Route::get('/status_show/{id}', 'InvoicesController@payment_status')->name('status_show');
    Route::post('/status_update/{id}', 'InvoicesController@update_status')->name('status_update');
    // this route for print invoice.
    Route::get('/print_invoice/{id}', 'InvoicesController@print_invoice');
    // this route for export invoices to Excel Sheet.
    Route::get('invoices_export', 'InvoicesController@export');
    // these routes for invoices payment paid,unpaid,part paid,post paid.
    Route::get('invoices_paid', 'InvoicesController@show_paid_invoices');
    Route::get('invoices_unpaid', 'InvoicesController@show_unpaid_invoices')->middleware('permission:الفواتير الغير مدفوعه');
    Route::get('invoices_part_paid', 'InvoicesController@show_part_paid_invoices')->middleware('permission:الفواتير المدفوعه جزئيا');
    Route::get('invoices_post_paid', 'InvoicesController@show_post_paid_invoices')->middleware('permission:الفواتير المؤجله');

    Route::resource('invoices_archive','InvoicesArchiveController')->middleware('permission:الفواتير المؤرشفه');

    Route::get('/invoice_details/{id}','InvoicesDetailsController@index');
    Route::get('/viewFile/{invoice_number}/{file_name}','InvoicesDetailsController@openFile');
    Route::get('/download/{invoice_number}/{file_name}','InvoicesDetailsController@downloadFile');
    Route::post('delete_file','InvoicesDetailsController@destroy')->name('delete_file');

    Route::resource('sections','SectionController')->middleware('permission:الاقسام');

    Route::resource('products','ProductsController')->middleware('permission:المنتجات');

    Route::resource('invoices_attachments','InvoicesAttachmentsController');

    Route::get('invoices_report','InvoicesReportController@index');
    Route::post('invoices_search','InvoicesReportController@search');

    Route::get('customers_report','CustomersReportController@index');
    Route::post('customers_search','CustomersReportController@search');

    Route::get('mark_all_read','InvoicesController@mark_all_read');


    Route::resource('roles', 'RoleController');
    Route::resource('users', 'UserController');

    Route::get('profile/{id}','UserController@user_profile');

});

Route::get('/{page}', 'AdminController@index');

Route::fallback(function (){
    return 'Hm,This Page Not Found Here!';
});
