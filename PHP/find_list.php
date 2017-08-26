<?php
    try {
        // connection to the database.
        $pdo_options[PDO::ATTR_ERRMODE] = PDO::ERRMODE_EXCEPTION;
        $bdd = new PDO('mysql:host=localhost;dbname=XIA', 'XIA', 'westworld211116', $pdo_options);

        // Execute SQL request on the database.
        $sql = 'SELECT * FROM ' . $_GET['type']. ' where famille_id = \'' . $_GET['famille_id'] . '\';';
//echo $sql;
        $response = $bdd->query($sql);
        $output = $response->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        die('Erreur : ' . $e->getMessage());
    }

    // Print JSON encode of the array.
    echo(json_encode($output));
?>
