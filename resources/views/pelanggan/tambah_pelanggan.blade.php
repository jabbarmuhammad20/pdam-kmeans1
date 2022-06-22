@extends('layouts.adminlte')
@section('content')
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-12">
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Tambah Pelanggan</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" action="/tambah_pelangganStore" method="post" enctype="multipart/form-data">
                {{ csrf_field() }}

                    <div class="card-body">
                      <!-- select -->
                      <div class="form-group">
                        <label>Role</label>
                        <select class="custom-select" id="role" name="role">
                         <option disabled >-</option>
                          <option value="admin">Admin</option>
                          <option value="pelanggan">Pelanggan</option>
                        </select>
                      </div>

                  <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="email">
                  </div>

                  <div class="form-group">
                    <label for="name">Username</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="name">
                  </div>

                  <div class="form-group">
                    <label for="name">Password</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="">
                  </div>

                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Submit</button>
                  <input type="button" class="btn btn-seccondary" value="Kembali" onclick="history.back(-1)" /> 
                </div>
              </form>
            </div>
            </div>
            </div>
            </div>
            @include('sweetalert::alert')
@endsection
