<?php

namespace App\Http\Controllers;

use App\Invoices;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $title = 'فواتيري - لوحه التحكم';
        $count = Invoices::count();

        $paid_count = Invoices::where('value_status',2)->count();
        $paid_nespa = $paid_count / $count * 100;

        $not_paid    = Invoices::where('value_status',1)->count();
        $npaid_nespa = $not_paid / $count * 100;

        $part_paid       = Invoices::where('value_status',3)->count();
        $part_paid_nespa = $part_paid / $count * 100;

        $post_paid       = Invoices::where('value_status',4)->count();
        $post_paid_nespa = $post_paid / $count * 100;

        $chartjs = app()->chartjs
            ->name('barChartTest')
            ->type('bar')
            ->size(['width' => 520, 'height' => 200])
            ->labels(['الفواتير المدفوعه', 'الفواتير الغير مدفوعه','الفواتير المدفوعه جزئيا','الفواتير المؤجله'])
            ->datasets([
                [
                    "label" => "المدفوعه",
                    'backgroundColor' => ['#1cae7f'],
                    'data' => [$paid_nespa]
                ],
                [
                    "label" => "الغير مدفوعه",
                    'backgroundColor' => ['#f84f6c'],
                    'data' => [$npaid_nespa]
                ],
                [
                    "label" => "المدفوعه جزئيا",
                    'backgroundColor' => ['#0372e7'],
                    'data' => [$part_paid_nespa]
                ],
                [
                    "label" => "المؤجله",
                    'backgroundColor' => ['#f57c3c'],
                    'data' => [$post_paid_nespa]
                ]
            ])
            ->options([]);

        $chartjs2 = app()->chartjs
            ->name('pieChartTest')
            ->type('doughnut')
            ->size(['width' => 400, 'height' => 200])
            ->labels(['المدفوعه', 'الغير مدفوعه','المدفوعه جزئيا','المؤجله'])
            ->datasets([
                [
                    'backgroundColor' => ['#1cae7f', '#f84f6c','#0372e7','#f57c3c'],
                    'hoverBackgroundColor' => ['#1cae7f', '#f84f6c','#0372e7','#f57c3c'],
                    'data' => [$paid_nespa, $npaid_nespa, $part_paid_nespa,$post_paid_nespa]
                ]
            ])
            ->options([]);

        return view('home',compact('title','chartjs','chartjs2'));
    }
}
