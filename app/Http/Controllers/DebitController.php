<?php

namespace App\Http\Controllers;
use Auth;
use DB;
use App\Models\User;
use App\Models\DebitAir;
use Illuminate\Http\Request;

class DebitController extends Controller
{
    // melihat daftar data untuk admin
    public function index()
    {
        $users = User::all();
        return view('debit_air/admin_daftarDebitAir',compact('users'));
    }

    public function admin_riwayat_debit_air()
    {
        $debitair = Debitair::all();
        return view('debit_air/admin_riwayatDebitAir',['debitair'=>$debitair]);
    }
    // Melihat daftar debit air menurut pelanggan
    public function pelanggan_index($id)
    {
        $debit_air= User::where('id', Auth::user()->id)->paginate(10);
        return view('/debit_air/pelanggan_daftarDebitAir', ['debit_air' =>$debit_air]);
    }

    public function admin_tambahdebitair($id)
    {
        $pelanggan = User::findOrFail($id);
        return view('debit_air/admin_tambahDebitAir',compact('pelanggan'));
    }

    public function admin_debit_store (Request $request ,$id){
        $users = User::where('id', $id)->first();
        $users->bulan = $request->bulan;
        $users->debit_air = $request->debit_air;
        $users->update();
        return redirect()->to('daftar_debitAir')->with(['success' => 'Debit Air Berhasil Disimpan']);  
    }

    public function destroy($id)
    {
        DB::table('debit_air')->where('id', $id)->delete();
        return redirect()->back()->with(['success' => 'Data Debit Berhasil Dihapus']);
    }
}
