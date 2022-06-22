@extends('layouts.adminlte')
@section('content')
    <div class="container-fluid">
        <div class="row">
            <!-- left column -->
            <div class="col-md-12">
                <!-- general form elements -->
                <div class="card card-warning">
                    <div class="card-header">
                        <h3 class="card-title">Tambah Debit Air</h3>
                    </div>
                    <!-- /.card-header -->
                    <!-- form start -->
                    <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left"
                        action={{ route('admin_debitstore', $pelanggan->id) }} method="post"
                        enctype="multipart/form-data">
                        {{ csrf_field() }}
                        {{ method_field('PUT') }}
                        <div class="card-body">
                            <div class="form-group">
                                <label>Bulan</label>
                                <select class="form-control" id="bulan" name="bulan">
                                    <disabled>
                                        <option value="-">-</option>
                                    </disabled>
                                    <option value="Januari">Januari</option>
                                    <option value="Februari">Februari</option>
                                    <option value="Maret">Maret</option>
                                    <option value="April">April</option>
                                    <option value="Mei">Mei</option>
                                    <option value="Juni">Juni</option>
                                    <option value="Juli">Juli</option>
                                    <option value="Agustus">Agustus</option>
                                    <option value="September">September</option>
                                    <option value="November">November</option>
                                    <option value="Desember">Desember</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="email">Masukan Debit Air</label>
                                <input type="number" class="form-control" id="debit_air" name="debit_air">
                                <div class="card-footer">
                                    <button type="submit" class="btn btn-primary">Simpan</button>
                                    <input type="button" class="btn btn-seccondary" value="Kembali"
                                        onclick="history.back(-1)" />
                                </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    @include('sweetalert::alert')
    @include('sweetalert::alert')
@endsection
