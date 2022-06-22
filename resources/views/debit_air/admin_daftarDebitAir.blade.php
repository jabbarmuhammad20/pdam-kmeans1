@extends('layouts.adminlte')
@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Daftar Debit Air
                            <a href="daftar_debitAirKMeans2" type="button" class="btn btn-primary btn-sm" title="Lihat"><i
                                    class="fa fa-up text-white"> Rendah</i></a>
                            <a href="daftar_debitAirKMeans1" type="button" class="btn btn-success btn-sm" title="Lihat"><i
                                    class="fa fa-up text-white"> Sedang</i></a>
                            <a href="daftar_debitAirKMeans" type="button" class="btn btn-danger btn-sm" title="Lihat"><i
                                    class="fa fa-up text-white"> Tinggi </i></a>
                        </h3><br>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <table id="daftar_debitair" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Nama</th>
                                        <th>Alamat</th>
                                        <th>Debit Air</th>
                                        <th>Aksi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @php $no = 1; @endphp
                                    @foreach ($users as $pelanggan)
                                        @if ($pelanggan->role == 'pelanggan')
                                            <tr>
                                                <td>{{ $no++ }}</td>
                                                <td>{{ $pelanggan->name }}</td>
                                                <td>{{ $pelanggan->alamat }}</td>
                                                <td>{{ $pelanggan->debit_air }}</td>
                                                <td><a href="admin_tambahdebitair/{{ $pelanggan->id }}" type="button"
                                                        class="btn btn-primary btn-sm" title="Tambah Debit Air"><i
                                                            class="fa fa-plus text-white"> Tambah Debit Air</i></a>
                                                    <a href="cekDebitAir/{{ $pelanggan->id }}" type="button"
                                                        class="btn btn-warning btn-sm" title="Reset Debit Air"><i
                                                            class="fa fa-undo text-white"> Resset</i></a>
                                            </tr>
                                        @endif
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
