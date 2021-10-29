<?php

namespace App\Http\Controllers;

use App\Invoices;
use App\InvoicesAttachments;
use App\InvoicesDetails;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class InvoicesArchiveController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $title = 'الفواتير المؤرشفه';
        $archived_invoices = Invoices::onlyTrashed()->get();
        return view('invoices.invoices_archived',compact('title','archived_invoices'));
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
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        $id = $request->id;
        Invoices::where('id', $id)->restore();
        InvoicesDetails::where('invoice_id', $id)->restore();
        InvoicesAttachments::where('invoice_id', $id)->restore();
        session()->flash('restore');
        return redirect('invoices/');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $id             = $request->id;
        $invoice_number = $request->invoice_number;

        $invoices = Invoices::where('id', $id);
        Storage::disk('public_path')->deleteDirectory($invoice_number);

        $invoices->forceDelete();
        session()->flash('delete_invoice');
        return back();


    }
}
