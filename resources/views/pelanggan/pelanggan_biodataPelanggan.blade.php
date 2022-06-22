@extends('layouts.adminlte')
@section('content')
{!! Toastr::message() !!}

      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-12">
            <!-- general form elements -->
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Edit Akun</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form id="demo-form2"data-parsley-validate class="form-horizontal form-label-left"  method="post" enctype="multipart/form-data">

                <div class="card-body">
                  <div class="form-group">
                    <label for="role">role</label>
                    <input type="text" class="form-control" id="role" name="role" value="{{ Auth::user()->role }}">
                  </div>

                  <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email" value="{{ Auth::user()->email }}">
                  </div>

                  <div class="form-group">
                    <label for="name">Username</label>
                    <input type="text" class="form-control" id="name" name="name" value="{{ Auth::user()->name }}">
                  </div> 
              </div>
            </div>
          </div>
        </div>
      </div> 
              </div>
                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Submit</button>
                  <button type="reset" class="btn btn-default">Reset</button>
                  <button type="cancel" class="btn btn-danger">Cancel</button>
                </div>
              </form>
            </div>
            </div>
            </div>     
            </div>
            
@endsection
