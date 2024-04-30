<?php
include '../db.php';
// Check if the product_id and action are set

if(isset($_GET['product_id']) && isset($_GET['action']) && $_GET['action'] == 'delete') {
    // Sanitize input to prevent SQL injection
    $product_id = mysqli_real_escape_string($con, $_GET['product_id']);

    // Delete the product from the database
    $delete_query = "DELETE FROM products WHERE product_id = '$product_id'";
    $delete_result = mysqli_query($con, $delete_query);

    if($delete_result) {
        // Redirect back to productlist.php after successful deletion
        header("Location: productlist.php");
        exit(); // Ensure that script execution stops after redirection
    } else {
        echo "Error deleting product: " . mysqli_error($con);
    }
} else {
    echo "Invalid request.";
}

// Close database connection
mysqli_close($con);
?>