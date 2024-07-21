<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Services extends Model
{
    use HasFactory;

    protected $table = 'services';

    protected $guarded = [];

    public static function  ServicesStatus(string $status) {
        return self::where('status', $status);
    }


// return latest services .. out the number you want as argument...
    // public static function latest(int $num){
    //     return self::orderBy('created_at', 'desc')->limit($num);  

    // }

    

}
