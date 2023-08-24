<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Equipo</title>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    @vite('resources/js/app.js')
</head>

<body>
    <div class="container mt-5">
        <form onsubmit="crear(event)">
            <div class="mb-3">
                <label for="Nombre" class="form-label">Nombre</label>
                <input type="text" class="form-control" name="nombre" id="nombre">
            </div>
            <div class="mb-3">
                <label for="programa" class="form-label">Programa</label>
                <input type="text" class="form-control" name="programa" id="programa">
            </div>
            <div class="mb-3">
                <label for="escudo" class="form-label">Escudo</label>
                <input type="file" class="form-control" name="escudo" id="escudo">
            </div>

            <label id="message" class="form-label"></label>

            <button type="submit" class="btn btn-primary">Crear Equipo</button>
        </form>
    </div>
</body>

<script>
    function crear(event) {
        event.preventDefault();

        data = new FormData()

        data.append("nombre", nombre.value)
        data.append("programa", programa.value)
        data.append("imagen", escudo.files[0])

        axios.post("api/equipo", data, {
                headers: {
                    'Content-Type': 'multipart/form-data',
                }
            })
            .then(res => {
                console.log(res);
                message.innerText = res.data
            })
            .catch(err => {
                console.log(err);
            })
    }
</script>

</html>