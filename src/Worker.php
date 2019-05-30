<?php

declare(strict_types=1);

namespace Stda\CodeIntegration;

class Worker
{
    private $name;

    private $position;

    public function __construct(string $name, string $position)
    {
        $this->name = $name;
        $this->position = $position;
    }

    public function changePosition(string $position): void
    {
        $this->position = $position;
    }

    public function getPosition(): string
    {
        return $this->position;
    }
}
