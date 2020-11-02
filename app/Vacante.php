<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Vacante extends Model
{
    protected $fillable = [
        'titulo','imagen','descripcion','skills','categoria_id','experiencia_id','ubicacion_id','salario_id',
    ];

    /* Relacion 1:1 */
    public function categoria(){
        return $this->belongsTo(Categoria::class);
    }

    /* Relacion 1:1 Salario y Vacante*/
    public function salario(){
        return $this->belongsTo(Salario::class);
    }

    /* Relacion 1:1 Ubicacion y Vacante*/
    public function ubicacion(){
        return $this->belongsTo(Ubicacion::class);
    }

    /* Relacion 1:1 Experiencia y Vacante*/
    public function experiencia(){
        return $this->belongsTo(Experiencia::class);
    }

    /* Relacion 1:1 Reclutador y Vacante*/
    public function reclutador(){
        return $this->belongsTo(User::class,"user_id");
    }

    /* Relacion 1:n Vacante y Candidato*/
    public function candidatos(){
        return $this->hasmany(Candidato::class);
    }
}
