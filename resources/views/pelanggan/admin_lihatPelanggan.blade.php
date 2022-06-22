@extends('layouts.adminlte')
@section('content')

       
        <div class="card">
              <div class="card-header">
                <h3 class="card-title">Data Pelanggan</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <table class="table table-sm">
                  <thead>
                    <tr>
                      <th style="width: 10px">#</th>
                      <th>Uraian</th>
                      <th>Ket</th>
                      <th></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1.</td>
                      <td> Nama Indentitas</td>
                      <td>{{$pelanggan->name}}</td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>2.</td>
                      <td> Email </td>
                      <td>{{$pelanggan->email}}</td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>2.</td>
                      <td>NIK | KK</td>
                      <td>{{$pelanggan->nik}} | {{$pelanggan->kk}}</td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>3.</td>
                      <td>Tempat, Tanggal Lahir</td>
                      <td>{{$pelanggan->tem_lahir}}, {{$pelanggan->tgl_lahir}}</td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>4.</td>
                      <td>Alamat</td>
                      <td>{{$pelanggan->alamat}}</td>
                      <td></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
      
@endsection