<?php

namespace App\Console\Commands;

use App\Jobs\ProduceJob;
use Illuminate\Console\Command;

class ProducerCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'broker:produce';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Message broker producer command';

    /**
     * Execute the console command.
     *
     * @return void
     */
    public function handle(): void
    {
        ProduceJob::dispatch();
    }
}
