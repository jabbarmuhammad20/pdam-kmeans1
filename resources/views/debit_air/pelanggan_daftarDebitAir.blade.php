@extends('layouts.adminlte')
@section('content')

    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Data Riwayat Pemakaian Air</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">General Form</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <!-- /.card-header -->
                        <div class="card-body">
                            <table id="daftar_pelanggan" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Bulan</th>
                                        <th>Debit Air</th>
                                        <th>Keasaman</th>
                                        <th>Jumlah Pembayaran</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @php $no = 1; @endphp
                                    @foreach ($debit_air as $pelanggan)
                                        <tr>
                                            <td>{{ $no++ }}</td>
                                            <td>{{ $pelanggan->bulan }}</td>
                                            <td>{{ $pelanggan->debit_air }}</td>
                                            <td>{{ $pelanggan->keasaman }}</td>
                                            <td>{{ $pelanggan->debit_air * $pelanggan->hrg }}</td>
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
    @include('sweetalert::alert')
