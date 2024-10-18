<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Student;

class StudentController extends Controller
{
    Public function index(){
        $students = Student::all();

       // return response()->json($students);

       $data = [
           'status' => 200,
           'students' => $students,
       ];
       return response()->json($data,200,
       );
    }
}
