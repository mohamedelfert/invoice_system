<?php

namespace App\Http\Controllers;

use App\Invoices;
use App\InvoicesAttachments;
use App\InvoicesDetails;
use App\Products;
use App\Sections;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class InvoicesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $title = 'قائمه الفواتير';
        $all_invoices = Invoices::all();
        return view('invoices.invoices',compact('title','all_invoices'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $title = 'اضافه فاتوره جديده';
        $sections = Sections::all();
        $products = Products::all();
        return view('invoices.add_invoice',compact('title','sections','products'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $rules = [
            'invoice_number' => 'required|min:5|unique:Invoices',
            'invoice_date'   => 'required',
            'due_date'       => 'required',
            'product_id'     => 'required',
            'section_id'     => 'required',
            'amount_collect' => 'required',
            'commission'     => 'required',
            'discount'       => 'required',
            'rate_vat'       => 'required',
            'status'         => 'required',
            'note'           => 'required',
            'file'           => 'required'
        ];
        $validate_msg_ar = [
            'invoice_number.required' => 'يجب كتابه رقم الفاتوره',
            'invoice_number.min'      => 'يجب أن يكون رقم الفاتوره أكثر من 5 ارقام او احرف',
            'invoice_number.unique'   => 'رقم الفاتوره مسجل مسبقا',
            'invoice_date.required'   => 'يجب ادخال تاريخ الفاتوره',
            'due_date.required'       => 'يجب ادخال تاريخ استحقاق الفاتوره',
            'product_id.required'     => 'يجب اختيار المنتج',
            'section_id.required'     => 'يجب اختيار القسم',
            'amount_collect.required' => 'يجب كتابه المبلغ المستحق',
            'commission.required'     => 'يجب كتابه العموله',
            'discount.required'       => 'يجب كتابه الخصم',
            'rate_vat.required'       => 'يجب اختيار نسبه الضريبه',
            'status.required'         => 'يجب اختيار حاله الفاتوره',
            'note.required'           => 'يجب كتابه ملاحظات للفاتوره',
            'file.required'           => 'يجب ارفاق ملف او صوره للفاتوره'
        ];
        $data = $this->validate($request,$rules,$validate_msg_ar);

        /**
         * to add information in invoices Table
         **/
        $data['invoice_number'] = $request->invoice_number;
        $data['invoice_date']   = $request->invoice_date;
        $data['due_date']       = $request->due_date;
        $data['section_id']     = $request->section_id;
        $data['product_id']     = $request->product_id;
        $data['amount_collect'] = $request->amount_collect;
        $data['commission']     = $request->commission;
        $data['discount']       = $request->discount;
        $data['rate_vat']       = $request->rate_vat;
        $data['value_vat']      = $request->value_vat;
        $data['total']          = $request->total;

        $data['status'] = $request->status;

        if ($data['status'] === "غير مدفوعه"){
            $data['value_status'] = "1";
        }elseif ($data['status'] === "مدفوعه"){
            $data['value_status'] = "2";
        }elseif ($data['status'] === "مدفوعه جزئيا"){
            $data['value_status'] = "3";
        }elseif ($data['status'] === "مؤجله"){
            $data['value_status'] = "4";
        }

        $data['note'] = $request->note;

        Invoices::create($data);

        /**
        * to add information in invoicesDetails Table
        **/
        $invoice_id = Invoices::latest()->first()->id;

        $data['invoice_id'] = $invoice_id;
        $data['invoice_number'] = $request->invoice_number;
        $data['product']     = $request->product_id;
        $data['section']     = $request->section_id;

        $data['status'] = $request->status;

        if ($data['status'] === "غير مدفوعه"){
            $data['value_status'] = "1";
        }elseif ($data['status'] === "مدفوعه"){
            $data['value_status'] = "2";
        }elseif ($data['status'] === "مدفوعه جزئيا"){
            $data['value_status'] = "3";
        }elseif ($data['status'] === "مؤجله"){
            $data['value_status'] = "4";
        }

        $data['note'] = $request->note;
        $data['user'] = auth()->user()->name;

        InvoicesDetails::create($data);

        /**
         * to add information in invoicesAttachments Table
         **/
        if ($request->hasFile('file')){
            $invoice_id     = Invoices::latest()->first()->id;
            $file           = $request->file('file');
            $file_name      = $file->getClientOriginalName();
            $invoice_number = $request->invoice_number;
            $user           = auth()->user()->name;

            $attachment = new InvoicesAttachments();
            $attachment->invoice_id     = $invoice_id;
            $attachment->file_name      = $file_name;
            $attachment->invoice_number = $invoice_number;
            $attachment->user           = $user;
            $attachment->save();

            $file->move(public_path('Attachments/'.$invoice_number),$file_name);
        }

        session()->flash('success','تم اضافه الفاتوره بنجاح');
        return redirect('invoices');


    }

    /**
     * Display the specified resource.
     *
     * @param  \App\invoices  $invoices
     * @return \Illuminate\Http\Response
     */
    public function show(invoices $invoices)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\invoices  $invoices
     * @return \Illuminate\Http\Response
     */
    public function edit(invoices $invoices)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\invoices  $invoices
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, invoices $invoices)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\invoices  $invoices
     * @return \Illuminate\Http\Response
     */
    public function destroy(invoices $invoices)
    {
        //
    }

    /**
     * This Function To Get Product Name And ID By section_id.
     * using $id From Route /section/{id} With Ajax.
     * */
    public function getProductsName($id){
        $productName = DB::table('products')->where('section_id',$id)->pluck('product_name','id');
        return json_encode($productName);
    }
}
