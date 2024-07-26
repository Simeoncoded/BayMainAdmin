<?php

namespace App\Http\Controllers;

use App\Models\Employee;
use Exception;
use Illuminate\Http\Request;
use Inertia\Inertia;

class EmployeeController extends Controller
{
    //


    public function index()
    {
        return Inertia::render('Employee', [
            'auth' => [
                'user' => auth()->user()
            ],
            'employees' => Employee::all()
        ]);
    }


    /**
     * CREATE NEW EMPLOYEE  
     * Summary of create
     * @param \Illuminate\Http\Request $request
     * 
     */

    public function create(Request $request)
    {
        try {
            Employee::create(
                $request->validate([
                    'name' => ['required', 'string', 'max:255'],
                    'email' => ['required', 'string', 'email', 'max:255', 'unique:employees'],
                    'contact' => ['required', 'string', 'max:20'],
                    'address' => ['required', 'string', 'max:255'],
                    'password' => ['required']
                ])
            );
        } catch (Exception $e) {
            dd($e->getMessage());
        }

        return to_route('employee');
    }

    public function delete(Request $request, $id)
    {
        Employee::find($id)->delete();
    }
}
