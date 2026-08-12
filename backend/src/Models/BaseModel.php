<?php

namespace App\Models;

use App\Core\Database;
use PDO;

abstract class BaseModel
{
    protected static string $table;
    protected static string $primaryKey;

    public static function all(int $limit = 200): array
    {
        $stmt = Database::connection()->prepare(
            'SELECT * FROM ' . static::$table . ' LIMIT ?'
        );
        $stmt->bindValue(1, $limit, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll();
    }

    public static function find(string|int $id): ?array
    {
        $stmt = Database::connection()->prepare(
            'SELECT * FROM ' . static::$table . ' WHERE ' . static::$primaryKey . ' = ?'
        );
        $stmt->execute([$id]);
        $row = $stmt->fetch();
        return $row ?: null;
    }

    public static function create(array $data): string|int
    {
        $columns = array_keys($data);
        $placeholders = array_fill(0, count($columns), '?');

        $stmt = Database::connection()->prepare(sprintf(
            'INSERT INTO %s (%s) VALUES (%s)',
            static::$table,
            implode(', ', $columns),
            implode(', ', $placeholders)
        ));
        $stmt->execute(array_values($data));

        return $data[static::$primaryKey] ?? Database::connection()->lastInsertId();
    }

    public static function update(string|int $id, array $data): bool
    {
        $assignments = implode(', ', array_map(fn($col) => "$col = ?", array_keys($data)));

        $stmt = Database::connection()->prepare(sprintf(
            'UPDATE %s SET %s WHERE %s = ?',
            static::$table,
            $assignments,
            static::$primaryKey
        ));

        return $stmt->execute([...array_values($data), $id]);
    }

    public static function delete(string|int $id): bool
    {
        $stmt = Database::connection()->prepare(
            'DELETE FROM ' . static::$table . ' WHERE ' . static::$primaryKey . ' = ?'
        );
        return $stmt->execute([$id]);
    }
}
