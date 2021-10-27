<?php

namespace App\Http\Controllers;

use App\InvoicesAttachments;
use http\Exception\BadConversionException;
use Illuminate\Http\Request;

class InvoicesAttachmentsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        /**
         * This to store any file add by user from invoice details view
         * if user need to add extra files to the invoice after he added this invoice
         **/
        $rules = ['file' => 'required|mimes:pdf,jpg,jpeg,png'];
        $validate_msg_ar = [
            'file.required' => 'يجب ارفاق ملف او صوره للفاتوره',
            'file.mimes'    => 'يجب ان يكون الملف باحد الصيغ : PDF , JPG , JPEG , PNG'
        ];
        $data = $this->validate($request,$rules,$validate_msg_ar);
        $file = $request->file('file');
        InvoicesAttachments::create([
            'file'           => $file,
            'file_name'      => $file->getClientOriginalName(),
            'invoice_number' => $request->invoice_number,
            'invoice_id'     => $request->invoice_id,
            'user'           => auth()->user()->name
        ]);
        $file->move(public_path('Attachments/'.$request->invoice_number),$file->getClientOriginalName());
        session()->flash('success','تم اضافه المرفق بنجاح');
        return back();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\invoicesAttachments  $invoicesAttachments
     * @return \Illuminate\Http\Response
     */
    public function show(invoicesAttachments $invoicesAttachments)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\invoicesAttachments  $invoicesAttachments
     * @return \Illuminate\Http\Response
     */
    public function edit(invoicesAttachments $invoicesAttachments)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\invoicesAttachments  $invoicesAttachments
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, invoicesAttachments $invoicesAttachments)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\invoicesAttachments  $invoicesAttachments
     * @return \Illuminate\Http\Response
     */
    public function destroy(invoicesAttachments $invoicesAttachments)
    {
        //
    }
}
