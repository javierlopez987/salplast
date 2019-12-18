<?php

class Database {
    private $connection;
    private static $instance;
    private $usuario;
    private $clave;

    private function __construct() {
        try {
            $this->usuario = 'salplast_admin';
            $this->clave = 'Administrador_22';
            $this->connection = new PDO('mysql: host=10.0.10.39;dbname=salplast_db_cancionero;port=3306', $this->usuario, $this->clave);
        } catch (PDOException $e) {
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