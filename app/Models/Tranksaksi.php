<?php namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tranksaksi extends Model {
    use HasFactory;
    public $table="tranksaksi";
    protected $fillable=[ 'id',
    'user_id',
    'bulan',
    'in_debit',
    'keasaman',
    'belum_lunas',
    'sudah_dibayar',
    ];

    public function User() {
        return $this->belongsTo('App\Models\User');
    }

    public function DebitAir() {
        return $this->belongsTo('App\Models\DebitAir');
    }

}