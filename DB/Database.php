<?php

class Database {
    private $connection;
    private static $instance;

    private function __construct() {
        try {
        $this->connection = new PDO('mysql:host=10.0.10.39;dbname=salplast_db_cancionero;charset=utf8', 'salplast_root', 'Federico_21');
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