<?php

namespace App\Http\Controllers;

use App\Invoices;
use App\InvoicesAttachments;
use App\InvoicesDetails;
use App\Products;
use App\Sections;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

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
            'section_id'     => 'required',
            'product_id'     => 'required',
            'amount_collect' => 'required',
            'commission'     => 'required',
            'discount'       => 'required',
            'rate_vat'       => 'required',
            'status'         => 'required',
            'note'           => 'required',
            'file'           => 'required|mimes:pdf,jpg,jpeg,png'
        ];
        $validate_msg_ar = [
            'invoice_number.required' => 'يجب كتابه رقم الفاتوره',
            'invoice_number.min'      => 'يجب أن يكون رقم الفاتوره أكثر من 5 ارقام او احرف',
            'invoice_number.unique'   => 'رقم الفاتوره مسجل مسبقا',
            'invoice_date.required'   => 'يجب ادخال تاريخ الفاتوره',
            'due_date.required'       => 'يجب ادخال تاريخ استحقاق الفاتوره',
            'section_id.required'     => 'يجب اختيار القسم',
            'product_id.required'     => 'يجب اختيار المنتج',
            'amount_collect.required' => 'يجب كتابه مبلغ التحصيل',
            'commission.required'     => 'يجب كتابه العموله',
            'discount.required'       => 'يجب كتابه الخصم',
            'rate_vat.required'       => 'يجب اختيار نسبه الضريبه',
            'status.required'         => 'يجب اختيار حاله الفاتوره',
            'note.required'           => 'يجب كتابه ملاحظات للفاتوره',
            'file.required'           => 'يجب ارفاق ملف او صوره للفاتوره',
            'file.mimes'              => 'يجب ان يكون الملف باحد الصيغ : PDF , JPG , JPEG , PNG'
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

        $data['payment_date'] = date('Y-m-d');
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
    public function show()
    {
        $title = 'الفواتير المؤرشفه';
        $archived_invoices = Invoices::where('deleted_at',null)->get();
        return view('invoices.invoices_archived',compact('title','archived_invoices'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\invoices  $invoices
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $title = 'تعديل فاتوره';
        $invoice = Invoices::find($id);
        $sections = Sections::all();
        return view('invoices.edit_invoice',compact('title','invoice','sections'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\invoices  $invoices
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,$id)
    {
        $rules = [
            'invoice_number' => 'required|min:5|unique:Invoices,invoice_number,'.$id,
            'invoice_date'   => 'required',
            'due_date'       => 'required',
            'section_id'     => 'required',
            'product_id'     => 'required',
            'amount_collect' => 'required',
            'commission'     => 'required',
            'discount'       => 'required',
            'rate_vat'       => 'required',
            'status'         => 'required',
            'note'           => 'required',
            'file'           => 'mimes:pdf,jpg,jpeg,png'
        ];
        $validate_msg_ar = [
            'invoice_number.required' => 'يجب كتابه رقم الفاتوره',
            'invoice_number.min'      => 'يجب أن يكون رقم الفاتوره أكثر من 5 ارقام او احرف',
            'invoice_number.unique'   => 'رقم الفاتوره مسجل مسبقا',
            'invoice_date.required'   => 'يجب ادخال تاريخ الفاتوره',
            'due_date.required'       => 'يجب ادخال تاريخ استحقاق الفاتوره',
            'section_id.required'     => 'يجب اختيار القسم',
            'product_id.required'     => 'يجب اختيار المنتج',
            'amount_collect.required' => 'يجب كتابه مبلغ التحصيل',
            'commission.required'     => 'يجب كتابه العموله',
            'discount.required'       => 'يجب كتابه الخصم',
            'rate_vat.required'       => 'يجب اختيار نسبه الضريبه',
            'status.required'         => 'يجب اختيار حاله الفاتوره',
            'note.required'           => 'يجب كتابه ملاحظات للفاتوره',
            'file.mimes'              => 'يجب ان يكون الملف باحد الصيغ : PDF , JPG , JPEG , PNG'
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
        Invoices::find($id)->update($data);

        /**
         * to add information in invoicesDetails Table
         **/
        $invoice_id             = $id;
        $data['invoice_id']     = $invoice_id;
        $data['invoice_number'] = $request->invoice_number;
        $data['product']        = $request->product_id;
        $data['section']        = $request->section_id;

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
        InvoicesDetails::find($id)->update($data);

        /**
         * to add information in invoicesAttachments Table
         **/
        if ($request->hasFile('file')){
            $invoice_id     = $id;
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
        }else{
            $invoice_id = $id;
            $data['invoice_id']     = $invoice_id;
            $data['invoice_number'] = $request->invoice_number;
            $data['user'] = auth()->user()->name;
            InvoicesAttachments::find($id)->update($data);
        }
        session()->flash('success','تم تعديل الفاتوره بنجاح');
        return redirect('invoices');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\invoices  $invoices
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $id = $request->id;

        if ($request->has('archive') and $request->has('id')) {

            $invoices = Invoices::where('id', $id)->first();
            $invoices->delete();
            InvoicesDetails::where('invoice_id', $id)->delete();
            InvoicesAttachments::where('invoice_id', $id)->delete();
            session()->flash('archive_invoice');

        }elseif ($request->has('restore') and $request->has('id')){

            $invoices = Invoices::where('id', $id)->first();
            $invoices->restore();
            InvoicesDetails::where('invoice_id', $id)->restore();
            InvoicesAttachments::where('invoice_id', $id)->restore();
            session()->flash('restore');

        } elseif ($request->has('force_delete') and $request->has('id')){

            $invoices = Invoices::where('id', $id)->first();
            $attachment = InvoicesAttachments::where('invoice_id',$id)->first();
            if (!empty($attachment->invoice_number)){
                Storage::disk('public_path')->deleteDirectory($attachment->invoice_number);
            }
            $invoices->forceDelete();
            session()->flash('delete_invoice');

        }

        return back();
    }

    /**
     * This Function To Get Product Name And ID By section_id.
     * using $id From Route /section/{id} With Ajax.
     * */
    public function getProductsName($id){
        $productName = DB::table('products')->where('section_id',$id)->pluck('product_name','id');
        return json_encode($productName);
    }

    /**
     * This Function to return view show invoice payment
     * */
    public function payment_status($id){
        $title = 'حاله دفع الفاتوره';
        $invoice = Invoices::find($id);
        $sections = Sections::all();
        return view('invoices.change_payment',compact('title','invoice','sections'));
    }

    /**
     * This Function to return view show invoice payment
     * */
    public function update_status(Request $request,$id){
        $rules = [
            'invoice_number' => 'required',
            'section_id'     => 'required',
            'product_id'     => 'required',
            'status'         => 'required',
            'note'           => 'required',
            'payment_date'   => 'required'
        ];
        $validate_msg_ar = [
            'invoice_number.required' => 'يجب كتابه رقم الفاتوره',
            'section_id.required'     => 'يجب اختيار القسم',
            'product_id.required'     => 'يجب اختيار المنتج',
            'status.required'         => 'يجب اختيار حاله الفاتوره',
            'note.required'           => 'يجب كتابه ملاحظات للفاتوره',
            'payment_date.required'   => 'يجب اختيار تاريخ الدفع'
        ];
        $data = $this->validate($request,$rules,$validate_msg_ar);

        /**
         * to add information in invoices Table
         **/
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
        Invoices::find($id)->update($data);

        /**
         * to add information in invoicesDetails Table
         **/
        $invoice_id             = $id;
        $data['invoice_id']     = $invoice_id;
        $data['invoice_number'] = $request->invoice_number;
        $data['product_id']     = $request->product_id;
        $data['section_id']     = $request->section_id;

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

        $data['payment_date'] = $request->payment_date;
        $data['note'] = $request->note;
        $data['user'] = auth()->user()->name;
        InvoicesDetails::create($data);

        session()->flash('success','تم تغيير حاله الدفع بنجاح');
        return redirect('invoices');
    }

    /**
     * this function to show paid invoices
     **/
    public function show_paid_invoices(){
        $title = 'قائمه الفواتير المدفوعه';
        $paid_invoices = Invoices::where('value_status',2)->get();
        return view('invoices.invoices_paid',compact('title','paid_invoices'));
    }

    /**
     * this function to show unpaid invoices
     **/
    public function show_unpaid_invoices(){
        $title = 'قائمه الفواتير الغير مدفوعه';
        $unpaid_invoices = Invoices::where('value_status',1)->get();
        return view('invoices.invoices_unpaid',compact('title','unpaid_invoices'));
    }

    /**
     * this function to show part paid invoices
     **/
    public function show_part_paid_invoices(){
        $title = 'قائمه الفواتير الدفوعه جزئيا';
        $part_paid_invoices = Invoices::where('value_status',3)->get();
        return view('invoices.invoices_part_paid',compact('title','part_paid_invoices'));
    }

    /**
     * this function to show post paid invoices
     **/
    public function show_post_paid_invoices(){
        $title = 'قائمه الفواتير المؤجله';
        $post_paid_invoices = Invoices::where('value_status',4)->get();
        return view('invoices.invoices_post_paid',compact('title','post_paid_invoices'));
    }
}
