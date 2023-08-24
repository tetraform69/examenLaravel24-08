<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sorteo</title>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    @vite('resources/js/app.js')
</head>

<body>
    <button onclick="sorteo()">Sorteo de los equipos</button>

    <div class="container" id="equipos">

        <div class="row">
            <div class="card m-2" style="width: 18rem;">
                <img src="{{ Storage::url('public/YWImqpj8bJjGjpwhJiIdnG0DisJmi9l8z8aray9e.jpg') }}" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">equipo A</h5>
                    <p class="card-text">prueba</p>
                </div>
            </div>

            <div class="card m-2" style="width: 18rem;">
                <img src="{{ Storage::url('public/YWImqpj8bJjGjpwhJiIdnG0DisJmi9l8z8aray9e.jpg') }}" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">equipo B</h5>
                    <p class="card-text">prueba</p>
                </div>
            </div>
        </div>
    </div>
</body>

<script>
    const partidos = []


    function sorteo() {
        axios.get('api/equipo')
            .then(res => {
                console.log(res);

                rivales = res.data.toSorted()
                locales = res.data.toSorted()

                for (let i = 0; i < res.data.length; i++) {
                    makePartido(rivales, locales)
                }
                console.log(partidos);

                html = ""
                partidos.forEach(p => {
                    html += `<div class="row">
                        <div class="card m-2" style="width: 18rem;">
                            <img src="{{ Storage::url('${p.local.escudo}') }}" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">${p.local.nombre}</h5>
                                <p class="card-text">${p.local.programa}</p>
                            </div>
                        </div>

                        <div class="card m-2" style="width: 18rem;">
                            <img src="${p.rival.escudo}" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">${p.rival.nombre}</h5>
                                <p class="card-text">${p.rival.programa}</p>
                            </div>
                        </div>
                    </div>`
                });

                equipos.innerHTML = html
            })
            .catch(err => {
                console.log(err);
            })
    }

    function makePartido(rivales, locales) {
        local = getRandomInt(0, locales.length - 1)
        rival = getRandomInt(0, rivales.length - 1)

        if (rival != local) {
            partido = {
                local: locales[local],
                rival: rivales[rival],
            }

            partidos.push(partido)
        } else {
            makePartido(rivales, locales)
        }
    }

    function getRandomInt(min, max) {
        min = Math.ceil(min);
        max = Math.floor(max);
        return Math.floor(Math.random() * (max - min + 1) + min);
    }
</script>