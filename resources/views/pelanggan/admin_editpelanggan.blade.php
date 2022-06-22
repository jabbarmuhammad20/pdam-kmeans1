@extends('layouts.adminlte')
@section('content')

    <section class="content-header">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-12">
                    <h1>Data Pelanggan</h1>
                </div>
                <div class="col-sm-12">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Data Pelanggan</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <div class="container-fluid">
        <div class="row">
            <!-- left column -->
            <div class="col-md-12">
                <!-- general form elements -->
                <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title">Edit Akun</h3>
                    </div>
                    <!-- /.card-header -->
                    <!-- form start -->
                    <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left"
                        action="/admin_updatepelanggan/{{ $pelanggan->id }}" method="post" enctype="multipart/form-data">
                        {{ csrf_field() }}
                        {{ method_field('PUT') }}

                        <div class="card-body">
                            <div class="form-group">
                                <label for="role">role</label>
                                <input type="text" class="form-control" id="role" name="role"
                                    value="{{ $pelanggan->role }}">
                            </div>

                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" class="form-control" id="email" name="email"
                                    value="{{ $pelanggan->email }}">
                            </div>

                            <div class="form-group">
                                <label for="name">Username</label>
                                <input type="text" class="form-control" id="name" name="name"
                                    value="{{ $pelanggan->name }}">
                            </div>
                        </div>
                </div>
            </div>
        </div>
    </div>


    <div class="container-fluid">
        <div class="row">
            <!-- left column -->
            <div class="col-md-12">
                <!-- general form elements -->
                <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title">Edit Dataku</h3>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <label for="nik">NIK</label>
                            <input type="integer" class="form-control" id="nik" name="nik" value="{{ $pelanggan->nik }}">
                        </div>

                        <div class="form-group">
                            <label for="kk">KK</label>
                            <input type="integer" class="form-control" id="kk" name="kk" value="{{ $pelanggan->kk }}">
                        </div>

                        <div class="form-group">
                            <label for="tem_lahir">Tempat Lahir</label>
                            <input type="text" class="form-control" id="tem_lahir" name="tem_lahir"
                                value="{{ $pelanggan->tem_lahir }}">
                        </div>

                        <div class="form-group">
                            <label for="tgl_lahir">Tanggal Lahir</label>
                            <input type="date" class="form-control" id="tgl_lahir" name="tgl_lahir"
                                value="{{ $pelanggan->tgl_lahir }}">
                        </div>

                        <div class="form-group">
                            <label for="alamat">Alamat</label>
                            <input type="text" class="form-control" id="alamat" name="alamat"
                                value="{{ $pelanggan->alamat }}">
                        </div>
                    </div>
                </div>



                <div class="card-footer">
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <button type="reset" class="btn btn-default">Reset</button>
                    <input type="button" class="btn btn-seccondary" value="Kembali" onclick="history.back(-1)" />
                </div>
                </form>
            </div>
        </div>
    </div>
    </div>

@endsection
