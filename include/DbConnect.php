<?php
/**
 *
 * @About:      Database connection manager class
 * @File:       Database.php
 * @Date:       $Date:$ Nov-2015
 * @Version:    $Rev:$ 1.0
 * @Developer:  Federico Guzman (federicoguzman@gmail.com)
 **/
class DbConnect {
 
    public $conn;
 
    /**
     * Establishing database connection
     * @return database connection handler
     */
    function connect() {
        include_once dirname(__FILE__) . '/Config.php';
        $msn = null;
        try {
            $this->conn = new PDO('mysql:host=' .
                            DB_HOST.';dbname='.
                            DB_NAME.';charset=utf8', 
                            DB_USERNAME, 
                            DB_PASSWORD);

            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $this->conn->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);

            return null;

        } catch(PDOException $ex) {
            // if the environment is development, show error details, otherwise show generic message
            if ( (defined('ENVIRONMENT')) && (ENVIRONMENT == 'development') ) {
                $msn = 'An error occured connecting to the database! Details: ' . $ex->getMessage();
            } else {
                $msn = 'An error occured connecting to the database!';
            }
            return $msn;
        }
    }
 
}
?>