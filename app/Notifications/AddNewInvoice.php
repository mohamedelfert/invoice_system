<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
use Illuminate\Support\Facades\Auth;

class AddNewInvoice extends Notification
{
    use Queueable;

    private $invoice_id;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct($invoice_id)
    {
        $this->invoice_id = $invoice_id;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail','database'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        $url = 'http://127.0.0.1:8000/invoice_details/' . $this->invoice_id;
        return (new MailMessage)
                    ->greeting('فاتوره جديده')
                    ->line('تم اضافه فاتوره جديده')
                    ->action('عرض الفاتوره', $url)
                    ->line('شكرا لاستخدامك برنامج فواتيري (:');
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toDatabase($notifiable)
    {
        return [
            'id'    => $this->invoice_id,
            'user'  => Auth::user()->name,
            'title' => 'تم اضافه فاتوره جديده بواسطه : '
        ];
    }
}
