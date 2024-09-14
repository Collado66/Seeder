<?php

use Illuminate\Database\Seeder;
use App\Fornecedor;

class FornecedorSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //instanciando o objeto
        $fornecedor = new Fornecedor();
        $fornecedor->nome = 'Marcelo';
        $fornecedor->site = 'marcelo.com.br';
        $fornecedor->uf = 'SP';
        $fornecedor->email = 'contato@marcelo.com.br';
        $fornecedor->save();//persiste os dados no banco

        //o método create (atenção para o atributo fillable da classe dentro do Model)
        Fornecedor::create([
            'nome' => 'Jose',
            'site' => 'jose.com.br',
            'uf' => 'BA',
            'email' => 'contato@jose.com.br'
        ]);

        //insert metodo estático passando array associativo
        DB::table('fornecedores')->insert([
            'nome' => 'Maria',
            'site' => 'maria.com.br',
            'uf' => 'MG',
            'email' => 'contato@maria.com.br'
        ]);
    }
}
