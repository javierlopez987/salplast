<?php

class Database {
    private $connection;
    private static $instance;
    private $usuario;
    private $clave;

    private function __construct() {
        try {
            $this->usuario = 'cpses_sat8kcc0lz';
            $this->clave = '';
            $this->connection = new PDO('mysql:host=10.0.10.39;dbname=salplast_db_cancionero;port=3306', $this->usuario, $this->clave);
        } catch (PDOException $e) {
            var_dump($e);die();
            echo 'Falló la conexión: ' . $e->getMessage();
            die;
        }
    }

    public static function getInstance() {
        if(!self::$instance) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    public function getConnection() {
        return $this->connection;
    }
}