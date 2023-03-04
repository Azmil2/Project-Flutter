<?php

namespace App\Models;

use Alert;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class daftar_ruangan extends Model
{
    use HasFactory;
    public $fillable = ['ruangan', 'ruangan'];
    public $timestamps = true;
    public $table = 'daftar_ruangans';

    public function daftar_barang()
    {
        return $this->hasMany(daftar_barang::class, 'id_daftar_ruangan');
    }
    public static function boot()
    {
        parent::boot();

        self::deleting(function ($daftar_ruangan) {
            if ($daftar_ruangan->daftar_barang->count() > 0) {
                Alert::error('Gagal Menghapus', 'Nama Ruangan : ' . $daftar_ruangan->ruangan);
                Alert::error('Gagal Menghapus', 'Lokasi : ' . $daftar_ruangan->ruangan);
                return false;
            }
            Alert::success('Done', 'Data berhasil dihapus')->autoClose(2000);
        });
    }
}
