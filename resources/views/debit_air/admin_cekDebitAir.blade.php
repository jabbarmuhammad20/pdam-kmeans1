@extends('layouts.adminlte')
@section('content')
    <div class="container-fluid">
        <div class="row">
            <!-- left column -->
            <div class="col-md-12">
                <!-- general form elements -->
                <div class="card card-warning">
                    <div class="card-header">
                        <h3 class="card-title">Reset Debit Air</h3>
                    </div>
                    <!-- /.card-header -->
                    <!-- form start -->
                    <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left"
                        action="/update_debitAir/{{ $pelanggan->id }}" method="post" enctype="multipart/form-data">
                        {{ csrf_field() }}
                        {{ method_field('PUT') }}
                        <div class="card-body">
                            <div class="form-group">
                                <label for="email">Apakah anda ingin mereset nilai Debit Air {{ $pelanggan->debit_air }}
                                    menjadi 0 ?</label>
                                <input type="number" class="form-control" id="debit_air" name="debit_air" value="0"
                                    readonly />

                                <div class="card-footer">
                                    <button type="submit" class="btn btn-primary">Reset</button>
                                    <input type="button" class="btn btn-seccondary" value="Kembali"
                                        onclick="history.back(-1)" />
                                </div>
                    </form>
                </div>
            </div>
            </di>
        </div>
        @include('sweetalert::alert')
        @include('sweetalert::alert')
    @endsection
