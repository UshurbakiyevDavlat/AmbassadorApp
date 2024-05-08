<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class ConsumeCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'broker:consume';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Message broker consume command';

    /**
     * Execute the console command.
     * @throws \Exception
     */
    public function handle()
    {
        $conf = new \RdKafka\Conf();

        $conf->set('bootstrap.servers', env('KAFKA_BOOTSTRAP_SERVER'));
        $conf->set('security.protocol', env('KAFKA_SECURITY_PROTOCOL'));
        $conf->set('sasl.mechanism', env('KAFKA_SASL_MECHANISM'));
        $conf->set('sasl.username', env('KAFKA_SASL_USERNAME'));
        $conf->set('sasl.password', env('KAFKA_SASL_PASSWORD'));
        $conf->set('group.id', env('KAFKA_GROUP_ID'));
        $conf->set('auto.offset.reset', env('KAFKA_AUTO_RESET_OFFSET'));

        $consumer = new \RdKafka\KafkaConsumer($conf);

        while (true) {
            $consumer->subscribe(['default']);
            $message = $consumer->consume(120 * 1000);

            switch ($message->err) {
                case RD_KAFKA_RESP_ERR_NO_ERROR:
                    var_dump($message->payload);
                    break;
                case RD_KAFKA_RESP_ERR__PARTITION_EOF:
                    echo "No more messages; will wait for more\n";
                    break;
                case RD_KAFKA_RESP_ERR__TIMED_OUT:
                    echo "Timed out\n";
                    break;
                default:
                    throw new \Exception($message->errstr(), $message->err);
            }
        }
    }
}
