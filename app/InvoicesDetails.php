<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class InvoicesDetails extends Model
{
    use SoftDeletes;

    protected $table = 'invoices_details';

    protected $fillable = [
        'id',
        'invoice_id',
        'invoice_number',
        'product_id',
        'section_id',
        'status',
        'value_status',
        'payment_date',
        'note',
        'user'
    ];

    public function getSectionName(){
        return $this->hasOne(Sections::class,'id','section_id');
    }

    public function getProductName(){
        return $this->hasOne(Products::class,'id','product_id');
    }
}
