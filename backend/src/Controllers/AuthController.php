<?php

namespace App\Controllers;

use App\Core\Auth;
use App\Core\Database;
use App\Core\Request;
use App\Core\Response;

class AuthController
{
    public function login(Request $request): void
    {
        $email    = $request->input('email');
        $password = $request->input('password');

        if (!$email || !$password) {
            Response::error('Email and password are required', 422);
        }

        $stmt = Database::connection()->prepare(
            'SELECT EmployeeID, FullName, RoleID, PasswordHash, Status FROM Employee WHERE Email = ?'
        );
        $stmt->execute([$email]);
        $employee = $stmt->fetch();

        if (!$employee || $employee['Status'] !== 'Active' || !password_verify($password, $employee['PasswordHash'])) {
            Response::error('Invalid credentials', 401);
        }

        $token = Auth::issueToken($employee['EmployeeID'], $employee['RoleID']);

        Response::json([
            'token'    => $token,
            'employee' => [
                'id'     => $employee['EmployeeID'],
                'name'   => $employee['FullName'],
                'roleId' => $employee['RoleID'],
            ],
        ]);
    }
}
