<?php

class Database {
    private $connection;
    private static $instance;
    private $dbname;
    private $host;
    private $post;
    private $usuario;
    private $clave;

    private function __construct() {
        try {
            $this->dbname = 'salplast_db';
            $this->host = '10.0.10.39';
            $this->port = '3306';
            $this->usuario = 'salplast_admin';
            $this->clave = 'Administrador_22';
            $this->connection = new PDO('mysql:host='. $this->host .';dbname='. $this->dbname .';charset=utf8;port='. $this->port, $this->usuario, $this->clave);
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