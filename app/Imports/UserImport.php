<?php

namespace App\Imports;

use App\Models\User;
use Maatwebsite\Excel\Concerns\ToModel;

class UserImport implements ToModel
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        return new User([
            'role' => $row[0], 
            'name' => $row[1], 
            'email' => $row[2], 
            'password'=>bcrypt ('pelanggan123'),
            'nik'=> $row[3],
            'kk'=> $row[4],
            'tem_lahir'=> $row[5],
            'tgl_lahir'=> $row[6],
            'alamat'=> $row[7],
            'uk_meter'=> $row[8],
            'debit_air'=> $row[9],
            'hrg'=> $row[10],
            'belum_bayar'=> $row[11],
        ]);
    }
}
