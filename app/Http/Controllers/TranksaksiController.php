<?php

namespace App\Http\Controllers;
use App\Models\User;
use App\Models\Tranksaksi;
use App\Models\DebitAir;
use DB;

use Illuminate\Http\Request;

class TranksaksiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    //  Daftar Pembayaran
    public function index()
    {
        $users = User::all();
        return view('tranksaksi/admin_daftarPembayaran',['users'=>$users]);
    }

    // Riwayat Pembayaran
    public function admin_riwayatPembayaran()
    {
        $tranksaksi = Tranksaksi::all();
        return view('tranksaksi/admin_riwayatPembayaran',['tranksaksi'=>$tranksaksi]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create($id)
    {
        $users = User::findOrFail($id);
        return view ('/tranksaksi/admin_konfirmasiPembayaran',compact('users'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $tranksaksi = new \App\Models\Tranksaksi;
        $tranksaksi->user_id = $request->user_id;
        $tranksaksi->bulan = $request->bulan;
        // untuk menginput debit brp debit air anda bayar
        $tranksaksi->in_debit = $request->in_debit;
        // sudah dibayar = debit air * tarif perdebit 
        $tranksaksi->sudah_dibayar = $request->sudah_dibayar;
        $tranksaksi->save();
        
        return redirect('/admin_riwayatPembayaran')->with('success', 'Data berhasil Diproses!');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
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
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        DB::table('Tranksaksi')->where('id', $id)->delete();
        return redirect()->back()->with(['success' => 'Data Berhasil Dihapus']);
    }
}
