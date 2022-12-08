<?php

declare(strict_types=1);

namespace Tests;

use Aerospike;
use PHPUnit\Framework\TestCase;
use Reflectionlass;

class AerospikeTest extends TestCase {

  public function test(): void
  {
    $this->aerospikeMock = $this->createMock(\Aerospike::class);
    $this->assertTrue(true);
  }

}