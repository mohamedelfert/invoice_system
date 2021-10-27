<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Invoices extends Model
{
    use SoftDeletes;

    protected $table = 'invoices';

    protected $fillable = [
        'id',
        'invoice_number',
        'invoice_date',
        'due_date',
        'product_id',
        'section_id',
        'amount_collect',
        'commission',
        'discount',
        'rate_vat',
        'value_vat',
        'total',
        'status',
        'value_status',
        'note',
        'payment_date'
    ];

    public function getUser(){
        return $this->hasOne(InvoicesDetails::class,'invoice_id','id');
    }

    public function getAttachment(){
        return $this->hasOne(InvoicesAttachments::class,'invoice_id','id');
    }

    public function getSectionName(){
        return $this->hasOne(Sections::class,'id','section_id');
    }

    public function getProductName(){
        return $this->hasOne(Products::class,'id','product_id');
    }

}
