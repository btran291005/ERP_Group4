<?php

namespace App\Core;

/**
 * Minimal JWT issue/verify helper. Swap for firebase/php-jwt (already listed
 * in composer.json) once composer install has been run — this stub keeps the
 * scaffold runnable with zero dependencies on day 1.
 */
class Auth
{
    private static function secret(): string
    {
        return $_ENV['JWT_SECRET'] ?? 'change-me-in-.env';
    }

    public static function issueToken(string $employeeId, string $roleId): string
    {
        $payload = base64_encode(json_encode([
            'sub'   => $employeeId,
            'role'  => $roleId,
            'exp'   => time() + 8 * 3600,
        ]));
        $signature = hash_hmac('sha256', $payload, self::secret());

        return $payload . '.' . $signature;
    }

    public static function verifyToken(?string $token): ?array
    {
        if (!$token || !str_contains($token, '.')) {
            return null;
        }

        [$payload, $signature] = explode('.', $token, 2);

        if (!hash_equals(hash_hmac('sha256', $payload, self::secret()), $signature)) {
            return null;
        }

        $data = json_decode(base64_decode($payload), true);

        if (!$data || $data['exp'] < time()) {
            return null;
        }

        return $data; // ['sub' => EmployeeID, 'role' => RoleID, 'exp' => ...]
    }
}
