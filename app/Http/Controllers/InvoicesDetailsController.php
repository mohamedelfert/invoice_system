<?php

namespace App\Http\Controllers;

use App\Invoices;
use App\InvoicesAttachments;
use App\InvoicesDetails;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class InvoicesDetailsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($id)
    {
        $title = 'تفاصيل الفاتوره';
        $invoice         = Invoices::find($id);
        $invoice_details = InvoicesDetails::where('invoice_id',$id)->get();
        $invoice_attach  = InvoicesAttachments::where('invoice_id',$id)->get();
        return view('invoices.invoice_details',compact('title','invoice','invoice_details','invoice_attach'));
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\invoicesDetails  $invoicesDetails
     * @return \Illuminate\Http\Response
     */
    public function show(invoicesDetails $invoicesDetails)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\invoicesDetails  $invoicesDetails
     * @return \Illuminate\Http\Response
     */
    public function edit(invoicesDetails $invoicesDetails)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\invoicesDetails  $invoicesDetails
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, invoicesDetails $invoicesDetails)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\invoicesDetails  $invoicesDetails
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        InvoicesAttachments::find($request->file_id)->delete();
        Storage::disk('public_path')->delete($request->invoice_number.'/'.$request->file_name);
        session()->flash('success','تم حذف الملف بنجاح');
        return back();
    }

    public function openFile($invoice_number,$file_name){
        $viewFile = Storage::disk('public_path')->getDriver()->getAdapter()->applyPathPrefix($invoice_number.'/'.$file_name);
        return response()->file($viewFile);
    }

    public function downloadFile($invoice_number,$file_name){
        $download = Storage::disk('public_path')->getDriver()->getAdapter()->applyPathPrefix($invoice_number.'/'.$file_name);
        return response()->download($download);
    }
}
