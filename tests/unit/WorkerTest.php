<?php

declare(strict_types=1);

namespace Stda\CodeIntegration\Tests\Unit;

use Stda\CodeIntegration\Worker;
use PHPUnit\Framework\TestCase;

class WorkerTest extends TestCase
{
    public function testSwitchPosition(): void
    {
        $worker = new Worker('John', 'Cook');
        $worker->changePosition('Waiter');

        $this->assertEquals('Waiter', $worker->getPosition());
    }
}
