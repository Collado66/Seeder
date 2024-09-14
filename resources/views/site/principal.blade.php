@extends('site.layouts.basico')

@section('titulo', 'Home')

@section('conteudo')
    <div class="conteudo-destaque">

        <div class="esquerda">
            <div class="informacoes">
                <h1>Programação Web III</h1>
                <p>Utilizando Laravel criando Seeder.<p>
                <div class="chamada">
                    <img src="{{ asset('img/check.png') }}">
                    <span class="texto-branco">Programação PHP</span>
                </div>
                <div class="chamada">
                    <img src="{{ asset('img/check.png') }}">
                    <span class="texto-branco">Digite alguns usuários na Seeder</span>
                </div>
            </div>

            <div class="video">
                <img src="{{ asset('img/player_video.jpg') }}">
            </div>
        </div>

        <div class="direita">
            <div class="contato">
                <h1>Contato</h1>
                <p> por favor entre em contato formulário abaixo.<p>
                @component('site.layouts._components.form_contato', ['classe' => 'borda-branca'])
                @endcomponent
            </div>
        </div>
    </div>
@endsection
