<?php

namespace App\Http\Controllers;

use App\Models\Employee;
use Illuminate\Http\Request;

class EmployeeController extends Controller
{
    //


    public function delete( Request $request , $id){ 
        Employee::find($id)->delete();
    }
}
