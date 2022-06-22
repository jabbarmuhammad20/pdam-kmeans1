<?php

namespace App\Http\Controllers;
use App\Models\User;
use App\Models\DebitAir;
use App\Exports\UserExport;
use App\Imports\Userimport;
use App\Auth;
use Illuminate\Support\Facades\Hash;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Http\Request;
use DB;


class PelangganController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $users = User::all();
        return view('pelanggan/admin_daftarPelanggan',compact('users'));
    }

    public function print(){
        $pelanggan = User::all();
        return view('pelanggan/admin_print',compact('pelanggan'));
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('pelanggan/tambah_pelanggan');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [

            'name' => 'min:5',
            'email' => 'required|email|unique:users',
            'role' => 'required',
        ]);

        $users = new \App\Models\User;
        $users->role = $request->role;
        $users->name = $request->name;
        $users->email = $request->email;
        $users->password = hash::make($request->password);
        $users->save();
        
        return redirect()->back()->with('toast_success', 'Data berhasil Ditambah!');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    // Menampilkan biodata pelanggan menurut pelanggan
    public function show($id)
    {
        $pelanggan = User::findOrFail($id);
        return view('/pelanggan/admin_lihatPelanggan', compact('pelanggan', 'pelanggan'));
    }
    public function pelanggan_show()
    {
        
        return view('/pelanggan/pelanggan_biodataPelanggan');
    }

    /**
     * Show the form for editing the specified resource.
     *php artisan serve
     
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $pelanggan = User::findOrFail($id);
        return view('pelanggan/admin_editpelanggan', compact('pelanggan', 'pelanggan'));
    }
    public function cek_debit_air($id)
    {
        $pelanggan = User::findOrFail($id);
        return view('debit_air/admin_cekDebitAir', compact('pelanggan', 'pelanggan'));
    }

    public function update_debitair(Request $request, $id)
    {
        $users = User::where('id', $id)->first();
        $users->debit_air = $request->debit_air;
        $users->update();
        return redirect()->to('daftar_debitAir')->with(['success' => 'Debit Air Berhasil Direset']);  
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $users = User::where('id', $id)->first();
        $users->fill($request->all());
        $users->update();
        return redirect()->to('daftar_pelanggan')->with(['success' => 'Data Berhasil Disimpan']);
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        DB::table('users')->where('id', $id)->delete();
        return redirect()->back()->with(['success' => 'Data Pelanggan Berhasil Dihapus']);
    }

    public function pelanggan_exportExcel()
	{
		return Excel::download(new UserExport, 'Daftar Pelanggan.xlsx');
	}
    public function pelanggan_importExcel( Request $request)
	{
		{
            // validasi
            $this->validate($request, [
                'file' => 'required|mimes:csv,xls,xlsx'
            ]);
     
            // menangkap file excel
            $file = $request->file('file');
     
            // membuat nama file unik
            $nama_file = rand().$file->getClientOriginalName();
     
            // upload ke folder file_siswa di dalam folder public
            $file->move('file_pelanggan',$nama_file);
     
            // import data
            Excel::import(new UserImport, public_path('/file_pelanggan/'.$nama_file));
     
            // alihkan halaman kembali
            return redirect('/daftar_pelanggan');
        }
	}
}
