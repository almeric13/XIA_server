<?php
    try {
        // connection to the database.
        $pdo_options[PDO::ATTR_ERRMODE] = PDO::ERRMODE_EXCEPTION;
         $bdd = new PDO('mysql:host=localhost;dbname=xia', 'root', '', $pdo_options);


        // Execute SQL request on the database.
        $sql = "SELECT Produit_id, Produit_nom FROM produits where produit_id ='2';";
        $response = $bdd->query($sql);
        $output = $response->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        die('Erreur : ' . $e->getMessage());
    }

    // Print JSON encode of the array.
   print(json_encode($output));
  
  
  //var_dump($output);
  //echo $output[0];
 // ($test);
 // echo("{\"Produit_nom\":\"LAIT\"}");
?>
