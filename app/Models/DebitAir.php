<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Debitair extends Model
{
    use HasFactory;
    public $table = "debit_air";
    protected $fillable = [
    'id',
    'user_id',
    'debit_air',
    'keasaman',
    'ket',
    ];
    public function User()
    {
     return $this->belongsTo('App\Models\User');
    }
    public function Tranksaksi()
    {
     return $this->belongsTo('App\Models\Tranksaksi');
    }
}
