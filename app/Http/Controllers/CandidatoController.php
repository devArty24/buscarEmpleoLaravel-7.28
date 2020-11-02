<?php

namespace App\Http\Controllers;

use App\Vacante;
use App\Candidato;
use Illuminate\Http\Request;
use App\Notifications\NuevoCandidato;

class CandidatoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        /* Obtener el id actual */
        $idVacante = $request->route("id");
        
        /* Obtener los candidatos y la vacante */
        $vacante = Vacante::findOrFail($idVacante);
        
        /* Utilizar policy para proteger que solo el usuario indicado vea las postulaciones */
        $this->authorize("view",$vacante);

        return view("candidatos.index",compact("vacante"));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        /* Validacion */
        $data= $request->validate([
            "nombre"=>"required",
            "email"=>"required|email",
            "cv"=>"required|mimes:pdf|max:3000",
            "vacante_id"=>"required"
        ]);

        /* Guardar en la DB, forma uno */
        /* $candidato = new Candidato();
        $candidato->nombre = $data["nombre"];
        $candidato->email = $data["email"];
        $candidato->vacante_id = $data["vacante_id"];
        $candidato->cv = "123.pdf";
        $candidato->save(); */

        /* Guardar en la DB, forma dos -> deberas crear un fillable en el modelo con los campos que seran insertados*/
        /* $candidato = new Candidato($data);
        $candidato->cv = "11234.pdf";
        $candidato->save(); */

        /* Guardar en la DB, forma tres -> es casi igual que la segunda debes crear un fillable en el modelo */
        /* $candidato = new Candidato();
        $candidato->fill($data);
        $candidato->cv = "11234.pdf";
        $candidato->save(); */

        if($request->file("cv")){
            $archivo = $request->file("cv");
            $nombreArchivo = time().".".$request->file("cv")->extension();
            $ubicacion = public_path("/storage/cv");
            $archivo->move($ubicacion,$nombreArchivo);
        }
        /* Guardar en la DB, forma cuatro ->Debes crear una relacion al otro modelo en caso de que se requiera para poder guardar */
        $vacante = Vacante::find($data["vacante_id"]);

        $vacante->candidatos()->create([
            "nombre"=>$data["nombre"],
            "email"=>$data["email"],
            "cv"=>$nombreArchivo
        ]);

        $reclutador = $vacante->reclutador;
        $reclutador->notify(new NuevoCandidato($vacante->titulo,$vacante->id));

        return back()->with("estado","Tus datos se enviaron correctamente! suerte");
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Candidato  $candidato
     * @return \Illuminate\Http\Response
     */
    public function show(Candidato $candidato)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Candidato  $candidato
     * @return \Illuminate\Http\Response
     */
    public function edit(Candidato $candidato)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Candidato  $candidato
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Candidato $candidato)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Candidato  $candidato
     * @return \Illuminate\Http\Response
     */
    public function destroy(Candidato $candidato)
    {
        //
    }
}
