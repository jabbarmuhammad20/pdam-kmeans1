@extends('layouts.adminlte')
@section('content')
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Riwayat Pembayaran</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Riwayat Pembayaran</li>
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
                        <h3 class="card-title"></h3>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <table id="daftar_pembayaran" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Tanggal</th>
                                        <th>Nama</th>
                                        <th>Debit Air</th>
                                        <th>Jumlah dibayar</th>
                                        <th>Aksi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @php $no = 1; @endphp
                                    @foreach ($tranksaksi as $riwayat)
                                        <tr>
                                            <td>{{ $no++ }}</td>
                                            <td>{{ $riwayat->created_at }}</td>
                                            <td>{{ $riwayat->User->name }}</td>
                                            <td>{{ $riwayat->in_debit }}</td>
                                            <td>{{ 'Rp. ' . number_format($riwayat->sudah_dibayar, 0, ',', '.') }}</td>
                                            <td>
                                                <a href="admin_deletedtranksaksi/{{ $riwayat->id }}" type="button"
                                                    class="btn btn-danger btn-sm"
                                                    onclick="return confirm('Yakin ingin menghapus data?')"><i
                                                        class="fa fa-trash text-white"></i> Hapus</a>
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
    </div>
    @include('sweetalert::alert')
@endsection
