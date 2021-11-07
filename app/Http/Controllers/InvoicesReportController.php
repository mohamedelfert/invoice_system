<?php

namespace App\Http\Controllers;

use App\Invoices;
use Illuminate\Http\Request;

class InvoicesReportController extends Controller
{
    public function index(){
        $title = 'تقارير الفاوتير';
        return view('reports.invoices_report',compact('title'));
    }

    public function search(Request $request){
        $radio = $request->rdio;

        /**
         * if user select search with invoices type
         **/
        if ($radio == 1){

            /**
             * if user select search with invoices type and select all invoices without specify date
             **/
            if ($request->invoice_type === 'الكل' && $request->start_at == '' && $request->end_at == ''){

                $invoices = Invoices::all();
                $type     = $request->invoice_type;
                $title    = 'تقارير الفاوتير';
                return view('reports.invoices_report',compact('invoices','type','title'));

            }

            /**
             * if user select search with invoices type and select all invoices with specify date
             **/
            elseif ($request->invoice_type === 'الكل' && $request->start_at && $request->end_at){

                $start_at = date($request->start_at);
                $end_at   = date($request->end_at);
                $invoices = Invoices::whereBetween('invoice_date',[$start_at,$end_at])->get();
                $type     = $request->invoice_type;
                $title    = 'تقارير الفاوتير';
                return view('reports.invoices_report',compact('invoices','start_at','end_at','type','title'));

            }

            /**
             * if user select search with invoices type without specify date
             **/
            elseif ($request->invoice_type && $request->start_at == '' && $request->end_at == ''){

                $invoices = Invoices::select('*')->where('status','=',$request->invoice_type)->get();
                $type     = $request->invoice_type;
                $title    = 'تقارير الفاوتير';
                return view('reports.invoices_report',compact('invoices','type','title'));

            }

            /**
             * if user select search with invoices type with specify date
             **/
            else{

                $start_at = date($request->start_at);
                $end_at   = date($request->end_at);
                $invoices = Invoices::whereBetween('invoice_date',[$start_at,$end_at])
                                        ->where('status','=',$request->invoice_type)->get();
                $type = $request->invoice_type;
                $title = 'تقارير الفاوتير';
                return view('reports.invoices_report',compact('invoices','start_at','end_at','type','title'));

            }

        }

        /**
         * if user select search with invoices number
         **/
        else{
            $invoices = Invoices::select('*')->where('invoice_number','=',$request->invoice_number)->get();
            $title    = 'تقارير الفاوتير';
            return view('reports.invoices_report',compact('invoices','title'));
        }
    }
}
