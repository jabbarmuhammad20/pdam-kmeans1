@extends('layouts.adminlte')
@section('content')
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h1>DAFTAR PELANGGAN</h1>
                </div>
                <div class="col-sm-12">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Daftar Pelanggan</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h3> Cetak Laporan </h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <table id="daftar_pelanggan1" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>
                                            <center>ID Pel</center>
                                        </th>
                                        <th>
                                            <center> Nama</center>
                                        </th>
                                        <th>
                                            <center> Email</center>
                                        </th>
                                        <th>
                                            <center> Alamat</center>
                                        </th>
                                        <th>
                                            <center> Debit Air</center>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @php $no = 1; @endphp
                                    @foreach ($pelanggan as $pelanggan)
                                        <tr>
                                            <td>{{ $no++ }}</td>
                                            <td>
                                                <center>{{ $pelanggan->id }}</center>
                                            </td>
                                            <td>{{ $pelanggan->name }}</td>
                                            <td>{{ $pelanggan->email }}</td>
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
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
@endsection
<script>
    window.addEventListener("load", window.print());
</script>
