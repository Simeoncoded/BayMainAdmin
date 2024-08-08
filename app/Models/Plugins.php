<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Plugins extends Model
{
    use HasFactory;

    protected $fillable = [
        'plugin_code',
        'image',
        'solution',
        'description',
        'long_description',
        'documentation_url',
        'amount',
        'version',
        'vendor'
    ];
}
