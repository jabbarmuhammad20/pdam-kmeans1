<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Auth;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Tranksaksi;
use App\Controllers\KMeansController;
use App\Controllers\KMeans1Controller;
use App\Controllers\KMeans2Controller;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $pelanggan = User::all()->count(); //untuk hitung pelanggan
        $lunas = Tranksaksi::all()->count(); //untuk hitung pelanggan lunas
            
        $data = User::get(['id', 'debit_air as value'])->toArray();
            $KMeansRes = array();
            $kstart = 2;
            $this->lengthFull = count($data);
            $result = $this->KMeans($data, $kstart)->count();
            $result1 = $this->KMeans1($data, $kstart)->count();
            $result2 = $this->KMeans2($data, $kstart)->count();
            return view('home',compact('pelanggan','lunas','result','result1','result2'));
        }
        
        public function kMeans($data, $k){
            $length = count($data);
            $value = array_column($data, 'value');
            $centroid = [];
            $i = 0;
            while($i < 3){
                $temp_cent = rand(min($value), max($value));
                // create unique centroid
                if(!in_array($temp_cent, $centroid)){
                    // put value into centroid array
                    array_push($centroid, $temp_cent);
                    $i++;
                }
                
            }
    
            // sort centroid
            usort($centroid, function($a, $b) { //Sort the array using a user defined function
                return $a > $b ? -1 : 1; //Compare the scores
            });
    
            $result = $this->kMeansRoutine($data, $centroid);
            $ids = [];
            
            // result['result']['2'] Rendah
            // result['result']['1'] Sedang 
            // result['result']['0'] Tinggi
            foreach($result['result']['0'] as $res){
                array_push($ids, $res['id']);
            }
    
            $debit = User::whereIn('id', $ids)->get();
            
            // return response()->json($debit);
            return $debit;
        }
    
        public function kMeansRoutine($data, $centroid){
            $lengthData = count($data);
            $lengthCentroid = count($centroid);
            $result = array();
    
            //Euclidean Distance
            for($x = 0; $x < $lengthCentroid; $x++){
                for($i = 0; $i < $lengthData; $i++) {
                    $result[$x][$i]["distance"] = sqrt(pow($centroid[$x]-$data[$i]["value"],2));
                    $result[$x][$i]["value"] = $data[$i]["value"];
                }
            }
    
            // grouping data
            for($x = 0; $x < $lengthData; $x++){
    
                for($num = 0; $num < $lengthCentroid; $num++){
                    $this->dataHrg[$num] = $result[$num][$x]["distance"];
                }
                $fRes = min($this->dataHrg);
                for($i = 0; $i < $lengthCentroid; $i++){
                    if($result[$i][$x]["distance"] == $fRes){
                        $res[$i][$x]["value"] = $data[$x]["value"];
                        $res[$i][$x]["id"] = $data[$x]["id"];
                    }
                }
            }
    
            // Create new Centroid
            // dd($res);
            for($i = 0; $i < $lengthCentroid; $i++){
                $sum = array_sum(array_column($res[$i],'value'));
                $newCentroid[] = $sum/count($res[$i]);
            }
    
            $resFind[] = $newCentroid;
    
            $loop = true;
            $z = 1;
            while($loop){
                if($z == 1){
                    // iterate, compare with first centroid
                    $resFind[$z] = $this->findNewCentroid($data, $newCentroid);
                }else{
                    // iterate, compare with previouse centroid.
                    $resFind[$z] = $this->findNewCentroid($data, $resFind[$z-1]);
                }
    
                // if centroid doesn't change, brake the loop
                if($resFind[$z-1] == $resFind[$z]){
                    $loop = false;
                    $this->finalCentroid = $resFind[$z];
                }
                $z++;
            }
    
            $finalRes = array(
                'first_centroid' => $centroid,
                'history_centroid' => $resFind,
                'last_centroid' => $this->finalCentroid,
                'result' => $this->resultFinal
            );
    
            return $finalRes;
        }
    
        public function findNewCentroid($data, $centroid){
    
            $lengthData = count($data);
            $lengthCentroid = count($centroid);
            $result = array();
    
            //Euclidean Distance
            for($x = 0; $x < $lengthCentroid; $x++){
                for($i = 0; $i < $lengthData; $i++) {
                    $result[$x][$i]["distance"] = sqrt(pow($centroid[$x]-$data[$i]["value"],2));
                    $result[$x][$i]["value"] = $data[$i]["value"];
                }
            }
    
            // Grouping data
            for($x = 0; $x < $lengthData; $x++){
    
                //membuat data harga menjadi array
                for($num = 0; $num < $lengthCentroid; $num++){
                    $this->dataHrg[$num] = $result[$num][$x]["distance"];
                }
                $fRes = min($this->dataHrg);
                for($i = 0; $i < $lengthCentroid; $i++){
                    //kelompokkan kedalam jarak yang terdekat
                    if($result[$i][$x]["distance"] == $fRes){
                        $res[$i][$x]["value"] = $data[$x]["value"];
                        $res[$i][$x]["id"] = $data[$x]["id"];
                    }
                }
            }
    
            // Save grouped data in private variable
            $this->resultFinal = $res;
    
            // Create new Centroid again
            for($i = 0; $i < $lengthCentroid; $i++){
                $sum = array_sum(array_column($res[$i],'value'));
                $newCentroid[] = $sum/count($res[$i]);
            }
    
            //echo json_encode($newCentroid);
    
            return $newCentroid;
    
        }

        public function kMeans1($data, $k){
            $length = count($data);
            $value = array_column($data, 'value');
            $centroid = [];
            $i = 0;
            while($i < 3){
                $temp_cent = rand(min($value), max($value));
                // create unique centroid
                if(!in_array($temp_cent, $centroid)){
                    // put value into centroid array
                    array_push($centroid, $temp_cent);
                    $i++;
                }
                
            }
    
            // sort centroid
            usort($centroid, function($a, $b) { //Sort the array using a user defined function
                return $a > $b ? -1 : 1; //Compare the scores
            });
    
            $result = $this->kMeansRoutine1($data, $centroid);
            $ids = [];
            
            // result['result']['2'] Rendah
            // result['result']['1'] Sedang 
            // result['result']['0'] Tinggi
            foreach($result['result']['1'] as $res){
                array_push($ids, $res['id']);
            }
    
            $debit = User::whereIn('id', $ids)->get();
            
            // return response()->json($debit);
            return $debit;
        }
    
        public function kMeansRoutine1($data, $centroid){
            $lengthData = count($data);
            $lengthCentroid = count($centroid);
            $result = array();
    
            //Euclidean Distance
            for($x = 0; $x < $lengthCentroid; $x++){
                for($i = 0; $i < $lengthData; $i++) {
                    $result[$x][$i]["distance"] = sqrt(pow($centroid[$x]-$data[$i]["value"],2));
                    $result[$x][$i]["value"] = $data[$i]["value"];
                }
            }
    
            // grouping data
            for($x = 0; $x < $lengthData; $x++){
    
                for($num = 0; $num < $lengthCentroid; $num++){
                    $this->dataHrg[$num] = $result[$num][$x]["distance"];
                }
                $fRes = min($this->dataHrg);
                for($i = 0; $i < $lengthCentroid; $i++){
                    if($result[$i][$x]["distance"] == $fRes){
                        $res[$i][$x]["value"] = $data[$x]["value"];
                        $res[$i][$x]["id"] = $data[$x]["id"];
                    }
                }
            }
    
            // Create new Centroid
            // dd($res);
            for($i = 0; $i < $lengthCentroid; $i++){
                $sum = array_sum(array_column($res[$i],'value'));
                $newCentroid[] = $sum/count($res[$i]);
            }
    
            $resFind[] = $newCentroid;
    
            $loop = true;
            $z = 1;
            while($loop){
                if($z == 1){
                    // iterate, compare with first centroid
                    $resFind[$z] = $this->findNewCentroid($data, $newCentroid);
                }else{
                    // iterate, compare with previouse centroid.
                    $resFind[$z] = $this->findNewCentroid($data, $resFind[$z-1]);
                }
    
                // if centroid doesn't change, brake the loop
                if($resFind[$z-1] == $resFind[$z]){
                    $loop = false;
                    $this->finalCentroid = $resFind[$z];
                }
                $z++;
            }
    
            $finalRes = array(
                'first_centroid' => $centroid,
                'history_centroid' => $resFind,
                'last_centroid' => $this->finalCentroid,
                'result' => $this->resultFinal
            );
    
            return $finalRes;
        }
    
        public function findNewCentroid1($data, $centroid){
    
            $lengthData = count($data);
            $lengthCentroid = count($centroid);
            $result = array();
    
            //Euclidean Distance
            for($x = 0; $x < $lengthCentroid; $x++){
                for($i = 0; $i < $lengthData; $i++) {
                    $result[$x][$i]["distance"] = sqrt(pow($centroid[$x]-$data[$i]["value"],2));
                    $result[$x][$i]["value"] = $data[$i]["value"];
                }
            }
    
            // Grouping data
            for($x = 0; $x < $lengthData; $x++){
    
                //membuat data harga menjadi array
                for($num = 0; $num < $lengthCentroid; $num++){
                    $this->dataHrg[$num] = $result[$num][$x]["distance"];
                }
                $fRes = min($this->dataHrg);
                for($i = 0; $i < $lengthCentroid; $i++){
                    //kelompokkan kedalam jarak yang terdekat
                    if($result[$i][$x]["distance"] == $fRes){
                        $res[$i][$x]["value"] = $data[$x]["value"];
                        $res[$i][$x]["id"] = $data[$x]["id"];
                    }
                }
            }
    
            // Save grouped data in private variable
            $this->resultFinal = $res;
    
            // Create new Centroid again
            for($i = 0; $i < $lengthCentroid; $i++){
                $sum = array_sum(array_column($res[$i],'value'));
                $newCentroid[] = $sum/count($res[$i]);
            }
    
            //echo json_encode($newCentroid);
    
            return $newCentroid;
    
        }


        // ====================-
        public function kMeans2($data, $k){
            $length = count($data);
            $value = array_column($data, 'value');
            $centroid = [];
            $i = 0;
            while($i < 3){
                $temp_cent = rand(min($value), max($value));
                // create unique centroid
                if(!in_array($temp_cent, $centroid)){
                    // put value into centroid array
                    array_push($centroid, $temp_cent);
                    $i++;
                }
                
            }
    
            // sort centroid
            usort($centroid, function($a, $b) { //Sort the array using a user defined function
                return $a > $b ? -1 : 1; //Compare the scores
            });
    
            $result = $this->kMeansRoutine($data, $centroid);
            $ids = [];
            
            // result['result']['2'] Rendah
            // result['result']['1'] Sedang 
            // result['result']['0'] Tinggi
            foreach($result['result']['2'] as $res){
                array_push($ids, $res['id']);
            }
    
            $debit = User::whereIn('id', $ids)->get();
            
            // return response()->json($debit);
            return $debit;
        }
    
        public function kMeansRoutine2($data, $centroid){
            $lengthData = count($data);
            $lengthCentroid = count($centroid);
            $result = array();
    
            //Euclidean Distance
            for($x = 0; $x < $lengthCentroid; $x++){
                for($i = 0; $i < $lengthData; $i++) {
                    $result[$x][$i]["distance"] = sqrt(pow($centroid[$x]-$data[$i]["value"],2));
                    $result[$x][$i]["value"] = $data[$i]["value"];
                }
            }
    
            // grouping data
            for($x = 0; $x < $lengthData; $x++){
    
                for($num = 0; $num < $lengthCentroid; $num++){
                    $this->dataHrg[$num] = $result[$num][$x]["distance"];
                }
                $fRes = min($this->dataHrg);
                for($i = 0; $i < $lengthCentroid; $i++){
                    if($result[$i][$x]["distance"] == $fRes){
                        $res[$i][$x]["value"] = $data[$x]["value"];
                        $res[$i][$x]["id"] = $data[$x]["id"];
                    }
                }
            }
    
            // Create new Centroid
            // dd($res);
            for($i = 0; $i < $lengthCentroid; $i++){
                $sum = array_sum(array_column($res[$i],'value'));
                $newCentroid[] = $sum/count($res[$i]);
            }
    
            $resFind[] = $newCentroid;
    
            $loop = true;
            $z = 1;
            while($loop){
                if($z == 1){
                    // iterate, compare with first centroid
                    $resFind[$z] = $this->findNewCentroid($data, $newCentroid);
                }else{
                    // iterate, compare with previouse centroid.
                    $resFind[$z] = $this->findNewCentroid($data, $resFind[$z-1]);
                }
    
                // if centroid doesn't change, brake the loop
                if($resFind[$z-1] == $resFind[$z]){
                    $loop = false;
                    $this->finalCentroid = $resFind[$z];
                }
                $z++;
            }
    
            $finalRes = array(
                'first_centroid' => $centroid,
                'history_centroid' => $resFind,
                'last_centroid' => $this->finalCentroid,
                'result' => $this->resultFinal
            );
    
            return $finalRes;
        }
    
        public function findNewCentroid2($data, $centroid){
    
            $lengthData = count($data);
            $lengthCentroid = count($centroid);
            $result = array();
    
            //Euclidean Distance
            for($x = 0; $x < $lengthCentroid; $x++){
                for($i = 0; $i < $lengthData; $i++) {
                    $result[$x][$i]["distance"] = sqrt(pow($centroid[$x]-$data[$i]["value"],2));
                    $result[$x][$i]["value"] = $data[$i]["value"];
                }
            }
    
            // Grouping data
            for($x = 0; $x < $lengthData; $x++){
    
                //membuat data harga menjadi array
                for($num = 0; $num < $lengthCentroid; $num++){
                    $this->dataHrg[$num] = $result[$num][$x]["distance"];
                }
                $fRes = min($this->dataHrg);
                for($i = 0; $i < $lengthCentroid; $i++){
                    //kelompokkan kedalam jarak yang terdekat
                    if($result[$i][$x]["distance"] == $fRes){
                        $res[$i][$x]["value"] = $data[$x]["value"];
                        $res[$i][$x]["id"] = $data[$x]["id"];
                    }
                }
            }
    
            // Save grouped data in private variable
            $this->resultFinal = $res;
    
            // Create new Centroid again
            for($i = 0; $i < $lengthCentroid; $i++){
                $sum = array_sum(array_column($res[$i],'value'));
                $newCentroid[] = $sum/count($res[$i]);
            }
    
            //echo json_encode($newCentroid);
    
            return $newCentroid;
    
        }
}
