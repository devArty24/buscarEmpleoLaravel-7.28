<aside class="md:w-2/5 bg-teal-500 p5 rounded m-3">
    <h2 class="text-2xl my-5 text-white uppercase font-bold text-center">
        Contacta al reclutador
    </h2>
    <form action="{{route("candidatos.store")}}" method="POST" enctype="multipart/form-data">
        @csrf
        <div class="mb-4">
            <label for="nombre" class="block text-white text-sm font-bold mb-4">
                Nombre:
            </label>
            <input type="text" id="nombre" name="nombre" value="{{old("nombre")}}" class="p-3 bg-gray-100 rounded form-imput w-full @error('nombre') border bordr-red-500 @enderror" placeholder="Tu nombre">
            @error('nombre')
                <div class="bg-red-100 border-l-4 border-red-500 text-red-700 p-4 w-full mt-5" role="alert">
                    <p>{{$message}}</p>
                </div>
            @enderror

            <label for="email" class="block text-white text-sm font-bold mb-4">
                Email:
            </label>
            <input type="text" id="email" name="email" value="{{old("email")}}" class="p-3 bg-gray-100 rounded form-imput w-full @error('email') border bordr-red-500 @enderror" placeholder="Tu correo">
            @error('email')
                <div class="bg-red-100 border-l-4 border-red-500 text-red-700 p-4 w-full mt-5" role="alert">
                    <p>{{$message}}</p>
                </div>
            @enderror

            <label for="cv" class="block text-white text-sm font-bold mb-4">
                Currriculum (PDF):
            </label>
            <input type="file" id="cv" name="cv" class="p-3 rounded form-imput w-full @error('cv') border bordr-red-500 @enderror" accept="application/pdf">
            @error('cv')
                <div class="bg-red-100 border-l-4 border-red-500 text-red-700 p-4 w-full mt-5" role="alert">
                    <p>{{$message}}</p>
                </div>
            @enderror

            <input type="hidden" name="vacante_id" value="{{$vacante->id}}">

            <input type="submit" class="bg-teal-600 w-full hover:bg-teal-700 text-gray-100 p-3 focus:outline-none focus:shadow-outline uppercase" value="contactar">
        </div>
    </form>
</aside>