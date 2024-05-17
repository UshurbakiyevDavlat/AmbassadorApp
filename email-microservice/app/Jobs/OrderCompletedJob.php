<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Mail\Message;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Mail;

class OrderCompletedJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct(private $data)
    {
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle(): void
    {
        var_dump('sending email');

        Mail::send('admin', ['order' => $this->data], function (Message $message) {
            $message->subject('An Order has been completed');
            $message->to('admin@admin.com');
        });

        Mail::send('ambassador', ['order' => $this->data], function (Message $message) {
            $message->subject('An Order has been completed');
            $message->to($this->data['ambassador_email']);
        });

        var_dump('Email sent');
    }
}
