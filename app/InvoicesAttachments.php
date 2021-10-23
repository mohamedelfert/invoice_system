<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class InvoicesAttachments extends Model
{
    protected $table = 'invoices_attachments';

    protected $fillable = [
        'id',
        'invoice_id',
        'file_name',
        'invoice_number',
        'user'
    ];
}
