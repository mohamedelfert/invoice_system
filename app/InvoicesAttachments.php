<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class InvoicesAttachments extends Model
{
    use SoftDeletes;

    protected $table = 'invoices_attachments';

    protected $fillable = [
        'id',
        'invoice_id',
        'file_name',
        'invoice_number',
        'user'
    ];
}
