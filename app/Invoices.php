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
        'product',
        'section',
        'discount',
        'rate_vat',
        'value_vat',
        'total',
        'status',
        'value_status',
        'note',
        'user',
    ];

}
