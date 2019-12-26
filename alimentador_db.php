<?php

session_start();

setlocale(LC_ALL, 'pt_BR', 'pt_BR.utf-8', 'portuguese', 'pt_BR.utf-8');
date_default_timezone_set('America/Sao_Paulo');

class Database{
    protected static $db;
    private function __construct(){

        $db_host = "localhost";
        $db_nome = "netfritz";
        $db_usuario = "root";
        $db_senha = "";
        $db_driver = "mysql";

        try{
            self::$db = new PDO("$db_driver:host=$db_host; dbname=$db_nome", $db_usuario, $db_senha);
            self::$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            self::$db->exec('SET NAMES utf8');
        }
        catch (PDOException $e){
            die("Connection Error: " . $e->getMessage());
        }
    }
    public static function connection(){
        if (!self::$db){
            new Database();
        }
        return self::$db;
    }
}

if(!isset($_GET['alimentar'])){?>

<h1>Alimentar</h1>
<p><a href="?alimentar=elenco">Elenco</a> | <a href="?alimentar=generos">Generos</a> | <a href="?alimentar=envolvidos">Envolvidos</a></p>

<?php }

    $nomes = array("Alice", "Sophia", "Helena", "Valentina", "Laura", "Isabella", "Manuela", "Júlia", "Heloísa", "Luiza", "Maria Luiza", "Lorena", "Lívia", "Giovanna", "Maria Eduarda", "Beatriz", "Maria Clara", "Cecília", "Eloá", "Lara", "Maria Júlia", "Isadora", "Mariana", "Emanuelly", "Ana Júlia", "Ana Luiza", "Ana Clara", "Melissa", "Yasmin", "Maria Alice", "Isabelly", "Lavínia", "Esther", "Sarah", "Elisa", "Antonella", "Rafaela", "Maria Cecília", "Miguel", "Arthur", "Bernardo", "Heitor", "Davi", "Lorenzo", "Théo", "Pedro", "Gabriel", "Enzo", "Matheus", "Lucas", "Benjamin", "Nicolas", "Guilherme", "Rafael", "Joaquim", "Samuel", "Enzo Gabriel", "João Miguel", "Henrique", "Gustavo", "Murilo", "Pedro Henrique", "Pietro", "Lucca", "Felipe", "João Pedro", "Isaac", "Benício", "Daniel", "Anthony", "Leonardo", "Davi Lucca", "Bryan", "Eduardo", "João Lucas", "Victor"); //75 nomes
    $tamanho_nomes = sizeof($nomes)-1;

    $sobrenomes = array("Smith", "Johnson", "Williams", "Jones", "Brown", "Davis", "Miller", "Wilson", "Moore", "Taylor", "Anderson", "Thomas", "Jackson", "White", "Harris", "Martin", "Thompson", "Garcia", "Martinez", "Robinson", "Clark", "Rodriguez", "Lewis", "Lee", "Walker", "Hall", "Allen", "Young", "Hernandez", "King", "Wright", "Lopez", "Hill", "Scott", "Green", "Adams", "Baker", "Gonzalez", "Nelson", "Carter", "Mitchell", "Perez", "Roberts", "Turner", "Phillips", "Campbell", "Parker", "Evans", "Edwards", "Collins", "Stewart", "Sanchez", "Morris", "Rogers", "Reed", "Cook", "Morgan", "Bell", "Murphy", "Bailey", "Rivera", "Cooper", "Richardson", "Cox", "Howard", "Ward", "Torres", "Peterson", "Gray", "Ramirez", "James", "Watson", "Brooks", "Kelly", "Sanders", "Price", "Bennett", "Wood", "Barnes", "Ross", "Henderson", "Coleman", "Jenkins", "Perry", "Powell", "Long", "Patterson", "Hughes", "Flores", "Washington", "Butler", "Simmons", "Foster", "Gonzales", "Bryant", "Alexander", "Russell", "Griffin", "Diaz"); //99 sobrenomes
    $tamanho_sobrenomes = sizeof($sobrenomes)-1;

if($_GET['alimentar'] == 'envolvidos'){

    //echo "cod   nome_artistico  nome_rael   genero  data_nasc   cod_premiacao   cod_origem<br>";
    echo "INSERT INTO `origem` (`cod`, `descricao`) VALUES";
    for ($i=1; $i <= 50; $i++) { 
        $nome_artistico = $nomes[rand(0,$tamanho_nomes)].' '.$sobrenomes[rand(0,$tamanho_sobrenomes)];
        $nome_rael = $nomes[rand(0,$tamanho_nomes)].' '.$sobrenomes[rand(0,$tamanho_sobrenomes)];
        $generos = rand(1,2);
        $ano = rand(1930,2019);
        $mes = rand(1,12);
        $dia = rand(1,30);
        $data_nasc = $ano.'-'.$mes.'-'.$dia;
        $cod_premiacao = rand(1,12);
        $cod_origem = rand(1,22);
        if($generos==1){
            $genero='Masculino';
        }
        else{
            $genero='Feminino';
        }
        echo $i.' | '.$nome_artistico.' | '.$nome_rael.' | '.$genero.' | '.$data_nasc.' | '.$cod_premiacao.' | '.$cod_origem.'<br>';

        /*$insert = "INSERT INTO genero (cod, tipo) VALUES ('$i', '".$generos[$i]."')";
        $PDO  = Database::connection();
        $exec = $PDO->exec($insert);

        if ($exec) {
            echo 'Inseriu: '.$i.' | '.$generos[$i].'<br>';
        }
        
        else {
            echo 'Erro!<br>';
        }*/
    }

}

if($_GET['alimentar'] == 'elenco'){

    for ($i=1; $i <= 50; $i++) { 
        $personagem = $nomes[rand(0,$tamanho_nomes)].' '.$sobrenomes[rand(0,$tamanho_sobrenomes)];
        $envolvido = rand(1,7);
        $obra = rand(1,10);
        echo $personagem.' | '.$envolvido.' | '.$obra.'<br>';

        /*$insert = "INSERT INTO genero (cod, tipo) VALUES ('$i', '".$generos[$i]."')";
        $PDO  = Database::connection();
        $exec = $PDO->exec($insert);

        if ($exec) {
            echo 'Inseriu: '.$i.' | '.$generos[$i].'<br>';
        }
        
        else {
            echo 'Erro!<br>';
        }*/
    }

}

if($_GET['alimentar'] == 'genero'){
    $generos = array("Ação", "Animação", "Aventura", "Chanchada", "Cinema catástrofe", "Comédia", "Comédia romântica", "Comédia dramática", "Comédia de ação", "Cult", "Documentários", "Drama", "Espionagem", "Erótico", "Fantasia", "Faroeste", "Ficção científica", "Séries", "Guerra", "Machinima", "Musical", "Filme noir", "Policial", "Pornochanchada", "Pornográfico", "Romance", "Suspense", "Terror", "Trash"); //29 generos
    $tamanho_generos = sizeof($generos);

    /*for ($i=1; $i < 10; $i++) { 
        echo $i.' '.$generos[$i].' $generos[$i]<br>';
    }*/
    

    for ($i=1; $i < $tamanho_generos; $i++) { 
        $insert = "INSERT INTO genero (cod, tipo) VALUES ('$i', '".$generos[$i]."')";
        $PDO  = Database::connection();
        $exec = $PDO->exec($insert);

        if ($exec) {
            echo 'Inseriu: '.$i.' | '.$generos[$i].'<br>';
        }
        
        else {
            echo 'Erro!<br>';
        }
    }


}



?>
