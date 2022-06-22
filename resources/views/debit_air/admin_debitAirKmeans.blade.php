@extends('layouts.adminlte')
@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Daftar Penggunaan Debit Air</h3>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <table id="daftar_debitairkmean" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Nama</th>
                                        <th>Alamat</th>
                                        <th>Debit Air</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @php $no = 1; @endphp
                                    @foreach ($result as $pelanggan)
                                        <tr>
                                            <td>{{ $no++ }}</td>
                                            <td>{{ $pelanggan->name }}</td>
                                            <td>{{ $pelanggan->alamat }}</td>
                                            <td>{{ $pelanggan->debit_air }}</td>
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
    @endsection
