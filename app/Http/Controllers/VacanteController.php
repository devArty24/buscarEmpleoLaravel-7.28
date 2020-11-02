<?php

namespace App\Http\Controllers;

use App\Salario;
use App\Vacante;
use App\Categoria;
use App\Ubicacion;
use App\Experiencia;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;

class VacanteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $vacantes = Vacante::where("user_id",auth()->user()->id)->latest()->simplePaginate(1);

        return view("vacantes.index",compact("vacantes"));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        /* COnsulta a base */
        $categorias = Categoria::all();
        $experiencias = Experiencia::all();
        $ubicaciones = Ubicacion::all();
        $salarios = Salario::all();

        return view("vacantes.create")->with("categorias",$categorias)->with("experiencias",$experiencias)->with("ubicaciones",$ubicaciones)->with("salarios",$salarios);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = $request->validate([
            "titulo"=>"required|min:8",
            "categoria"=>"required",
            "experiencia"=>"required",
            "ubicacion"=>"required",
            "salario"=>"required",
            "descripcion"=>"required|min:50",
            "imagen"=>"required",
            "skills"=>"required",
        ]);

        /* Almacenar en la DB */
        auth()->user()->vacante()->create([
            "titulo"=> $data["titulo"],
            "imagen"=> $data["imagen"],
            "descripcion"=> $data["descripcion"],
            "skills"=> $data["skills"],
            "categoria_id"=> $data["categoria"],
            "experiencia_id"=> $data["experiencia"],
            "ubicacion_id"=> $data["ubicacion"],
            "salario_id"=> $data["salario"],
        ]);
        return redirect()->action("VacanteController@index");
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Vacante  $vacante
     * @return \Illuminate\Http\Response
     */
    public function show(Vacante $vacante)
    {
        /* ESte es una manera para que no se muestren las vacantes si ya se han desactivado */
        if($vacante->activa === 0) return abort(404);
        return view("vacantes.show")->with("vacante",$vacante);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Vacante  $vacante
     * @return \Illuminate\Http\Response
     */
    public function edit(Vacante $vacante)
    {
        /* Utilizar un policy */
        $this->authorize("view",$vacante);

        $categorias = Categoria::all();
        $experiencias = Experiencia::all();
        $ubicaciones = Ubicacion::all();
        $salarios = Salario::all();

        return view("vacantes.edit")->with("categorias",$categorias)->with("experiencias",$experiencias)->with("ubicaciones",$ubicaciones)
                                    ->with("salarios",$salarios)->with("vacante",$vacante);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Vacante  $vacante
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Vacante $vacante)
    {
        /* Utilizar un policy */
        $this->authorize("update",$vacante);

        /* Validacion del formulario */
        $data = $request->validate([
            "titulo"=>"required|min:8",
            "categoria"=>"required",
            "experiencia"=>"required",
            "ubicacion"=>"required",
            "salario"=>"required",
            "descripcion"=>"required|min:50",
            "imagen"=>"required",
            "skills"=>"required",
        ]);

        /* Asignar del formulario a la base para que sea guardado */
        $vacante->titulo = $data['titulo'];
        $vacante->skills = $data['skills'];
        $vacante->imagen = $data['imagen'];
        $vacante->descripcion = $data['descripcion'];
        $vacante->categoria_id = $data['categoria'];
        $vacante->experiencia_id = $data['experiencia'];
        $vacante->ubicacion_id = $data['ubicacion'];
        $vacante->salario_id = $data['salario'];
        $vacante->save();

        return redirect()->action("VacanteController@index");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Vacante  $vacante
     * @return \Illuminate\Http\Response
     */
    public function destroy(Vacante $vacante)
    {
        /* Utilizar un policy para proteger quien puede borrar registros */
        $this->authorize("delete",$vacante);

        $vacante->delete();
        return response()->json(["mensaje"=>"Se elimino la vacante ".$vacante->titulo]);
    }

    /* Funciones Extras */
    public function imagen(Request $request){
        $imagen = $request->file("file");
        $nombreImagen = time().".".$imagen->extension();
        $imagen->move(public_path("storage/vacantes"), $nombreImagen);
        return response()->json(["correcto"=>$nombreImagen]);
    }

    public function borrarimagen(Request $request){
        /* Valida si la peticon request es por ajax */
        if($request->ajax()){
            $imagen = $request->get("imagen");

            if(File::exists("storage/vacantes/".$imagen)){
                File::delete("storage/vacantes/".$imagen);
            }

            return response("Imagen eliminada",200);
        }
    }

    public function estado(Request $request,Vacante $vacante){
        /* Leer nuevo estado y asignarlo */
        $vacante->activa = $request->estado;
        /* Guardarlo en la DB */
        $vacante->save();
        return response()->json(["respuesta"=>"Correcto"]);
    }

    public function buscar(Request $request){
        /* Validar la busqueda */
        $data = $request->validate([
            "categoria"=>"required",
            "ubicacion"=>"required"
        ]);
        
        /* Asignar Valores */
        $categoria = $data["categoria"];
        $ubicacion = $data["ubicacion"];

        $vacantes = Vacante::latest()->where("categoria_id",$categoria)
        ->where("ubicacion_id",$ubicacion)->get();

        return view("buscar.index",compact("vacantes"));
    }

    public function resultados(){

    }
}
