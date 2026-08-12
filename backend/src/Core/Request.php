<?php

namespace App\Core;

class Request
{
    public array $body;
    public array $query;
    public string $method;
    public string $path;

    public function __construct()
    {
        $this->method = $_SERVER['REQUEST_METHOD'];
        $this->path   = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
        $this->query  = $_GET;

        $raw = file_get_contents('php://input');
        $this->body = $raw ? (json_decode($raw, true) ?? []) : [];
    }

    public function input(string $key, $default = null)
    {
        return $this->body[$key] ?? $this->query[$key] ?? $default;
    }

    public function bearerToken(): ?string
    {
        $header = $_SERVER['HTTP_AUTHORIZATION'] ?? '';
        if (str_starts_with($header, 'Bearer ')) {
            return substr($header, 7);
        }
        return null;
    }
}
