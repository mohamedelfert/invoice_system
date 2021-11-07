<?php

namespace App\Http\Controllers;

use App\Invoices;
use App\Products;
use App\Sections;
use Illuminate\Http\Request;

class CustomersReportController extends Controller
{
    public function index(){
        $title = 'تقارير العملاء';
        $sections = Sections::all();
        return view('reports.customers_report',compact('title','sections'));
    }

    public function search(Request $request){

        /**
         * if user select search with without section_id , product_id and specify date
         **/
        if ($request->section_id == '' && $request->product_id == '' && $request->start_at == '' && $request->end_at == ''){

            $invoices = Invoices::get();
            $title    = 'تقارير العملاء';
            $sections = Sections::all();
            return view('reports.customers_report',compact('invoices','sections','title'));

        }

        /**
         * if user select search with section_id and product_id without specify date
         **/
        elseif ($request->section_id && $request->product_id && $request->start_at == '' && $request->end_at == ''){

            $invoices = Invoices::select('*')->where('section_id','=',$request->section_id)
                                    ->where('product_id','=',$request->product_id)->get();
            $title    = 'تقارير العملاء';
            $sections = Sections::all();
            return view('reports.customers_report',compact('invoices','sections','title'));

        }

        /**
         * if user select search with section_id and product_id with specify date
         **/
        else{

            $start_at = date($request->start_at);
            $end_at   = date($request->end_at);
            $invoices = Invoices::whereBetween('invoice_date',[$start_at,$end_at])
                                    ->where('section_id','=',$request->section_id)
                                    ->where('product_id','=',$request->product_id)->get();
            $title    = 'تقارير العملاء';
            $sections = Sections::all();
            return view('reports.customers_report',compact('invoices','start_at','end_at','sections','title'));

        }

    }
}
