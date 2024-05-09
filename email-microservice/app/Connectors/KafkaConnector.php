<?php

declare(strict_types=1);

namespace App\Connectors;

use App\Queues\KafkaQueue;
use Illuminate\Queue\Connectors\ConnectorInterface;
use RdKafka\Conf;
use RdKafka\KafkaConsumer;

class KafkaConnector implements ConnectorInterface
{

    /**
     * Connector method for kafka queue
     *
     * @param array $config
     * @return KafkaQueue
     */
    public function connect(array $config): KafkaQueue
    {
        $conf = new Conf();

        $conf->set('bootstrap.servers', $config['bootstrap.servers']);
        $conf->set('security.protocol', $config['security.protocol']);
        $conf->set('sasl.mechanism', $config['sasl.mechanism']);
        $conf->set('sasl.username', $config['sasl.username']);
        $conf->set('sasl.password', $config['sasl.password']);
        $conf->set('group.id', $config['group.id']);
        $conf->set('auto.offset.reset', $config['auto.offset.reset']);

        $consumer = new KafkaConsumer($conf);

        return new KafkaQueue($consumer);
    }
}
