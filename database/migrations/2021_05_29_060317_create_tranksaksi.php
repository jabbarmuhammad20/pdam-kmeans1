<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTranksaksi extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tranksaksi', function (Blueprint $table) {
            $table->id();
            $table->integer('user_id');
            $table->string('bulan');
            $table->integer('in_debit');
            $table->integer('keasaman');
            $table->integer('belum_lunas');
            $table->integer('sudah_dibayar');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tranksaksi');
    }
}
