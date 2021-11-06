<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class InvoicesReportController extends Controller
{
    public function index(){
        $title = 'تقارير الفاوتير';
        return view('reports.invoices_report',compact('title'));
    }
}
