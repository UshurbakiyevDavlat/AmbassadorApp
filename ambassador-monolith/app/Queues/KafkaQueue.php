<?php

declare(strict_types=1);

namespace App\Queues;

use Exception;
use Illuminate\Queue\Queue;
use RdKafka\TopicConf;

class KafkaQueue extends Queue implements \Illuminate\Contracts\Queue\Queue
{

    private const REQ_TIMEOUT = 5000;
    private const MESSAGE_TIMEOUT = 30000;
    private const REQ_ACKS = -1;
    private const TOPIC = 'default';
    private const PARTITION = 0;

    public function __construct(private $producer, private $consumer)
    {
    }

    public function size($queue = null)
    {
        // TODO: Implement size() method.
    }

    /**
     * Producer method
     *
     * @param $job
     * @param $data
     * @param $queue
     * @return void
     */
    public function push($job, $data = '', $queue = null): void
    {
        $topicConf = new TopicConf();
        $topicConf->set('message.timeout.ms', (string)self::MESSAGE_TIMEOUT);
        $topicConf->set('request.required.acks', (string)self::REQ_ACKS);
        $topicConf->set('request.timeout.ms', (string)self::REQ_TIMEOUT);

        $topic = $this->producer->newTopic(self::TOPIC, $topicConf);
        $topic->produce(RD_KAFKA_PARTITION_UA, self::PARTITION, serialize($job));
        $this->producer->flush(static::REQ_TIMEOUT);
    }

    public function pushRaw($payload, $queue = null, array $options = [])
    {
        // TODO: Implement pushRaw() method.
    }

    public function later($delay, $job, $data = '', $queue = null)
    {
        // TODO: Implement later() method.
    }

    /**
     * Consumer method
     *
     * @param $queue
     * @throws Exception
     */
    public function pop($queue = null): void
    {
        $this->consumer->subscribe(['default']);
        $message = $this->consumer->consume(120 * 1000);

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
                throw new Exception($message->errstr(), $message->err);
        }
    }
}
