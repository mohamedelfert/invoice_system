<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class InvoicesDetails extends Model
{
    protected $table = 'invoices_details';

    protected $fillable = [
        'id',
        'invoice_id',
        'invoice_number',
        'product',
        'section',
        'status',
        'value_status',
        'note',
        'user'
    ];

    public function getSectionName(){
        return $this->hasOne(Sections::class,'id','section');
    }

    public function getProductName(){
        return $this->hasOne(Products::class,'id','product');
    }
}
