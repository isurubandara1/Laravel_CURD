<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Student;
use Illuminate\Support\Facades\Validator;

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

    Public function upload(Request $request){
        $validator= Validator::make($request->all(),
        ['name' => 'required',
        'email' => 'required|email']);

        if($validator->fails()){

            $data = [
                'status' => 422,
                'message' => $validator->messages(),
            ];

            return response()->json($data, 422);
        }
        else{
            $student = new Student();
            $student->name = $request->name;
            $student->email = $request->email;
            $student->save();

            $data = [
                'status' => 200,
                'message' => 'Student added successfully',
            ];

            return response()->json($data, 200);
        }
    
    }

    
}
