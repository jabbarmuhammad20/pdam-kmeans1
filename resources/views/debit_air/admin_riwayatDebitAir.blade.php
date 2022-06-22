@extends('layouts.adminlte')
@section('content')
  <div class="container-fluid">
    <div class="row">
      <div class="col-12">
        <div class="card">
          <div class="card-header">
            <h3 class="card-title">Daftar Debit Air
           </h3><br>
            <!-- /.card-header -->
            <div class="card-body"> 
            <table id="daftar_debitair" class="table table-bordered table-hover">
                <thead>
                <tr>
                <th>#</th>
                <th>Bulan</th>
                <th>Nama</th>
                <th>Debit Air</th>
                <th>Keasaman</th>
                <th>Keterangan</th>
                <th>Aksi</th>
                </tr>
                </thead>
                <tbody>
                @php $no = 1; @endphp
                @foreach($debitair as $debit)
                <tr>
                <td>{{$no++}}</td>
                <td>{{$debit->bulan}}</td>
                <td>{{$debit->User->name}}</td>
                <td>{{$debit->debit_air}}</td>
                <td>{{$debit->keasaman}}</td>
                <td>{{$debit->ket}}</td>
                <td>
                <a href="admin_deleteddebit/{{$debit->id}}" type="button" class="btn btn-danger btn-sm" onclick="return confirm('Yakin ingin menghapus data?')"><i class="fa fa-trash text-white"> </i> Hapus</a>
                </td>
                </tr>
                @endforeach
                </tbody>
                </table>      
            </div>
            <!-- /.card-body -->
          </div>
        <!-- /.card -->
      </div>
    </div>
  </div>
@include('sweetalert::alert')
@endsection