<?php
include "db.php";
include 'header.php';
// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get the form data
    $category = $_POST['product_cat'];
    $keywords = $_POST['search'];

    // Create the SQL query
    $sql = "SELECT * FROM products WHERE product_cat = ? AND product_keywords LIKE ?";

    // Prepare and bind parameters to the SQL statement
    $stmt = $con->prepare($sql);
    
    if (!$stmt) {
        die('Error preparing statement: ' . $con->error);
    }
    
    $like_keywords = '%' . $keywords . '%';
    $stmt->bind_param("is", $category, $like_keywords);

    // Execute the query
    $result = $stmt->execute();

    if (!$result) {
        die('Error executing query: ' . $stmt->error);
    }

    // Fetch the results
    $result = $stmt->get_result();
    if ($result->num_rows > 0) {
        // Output data of each row
        while($row = $result->fetch_assoc()) {
            $cat_query = "SELECT cat_title FROM categories WHERE cat_id = ?";
            $cat_stmt = $con->prepare($cat_query);
            $cat_stmt->bind_param("i", $row['product_cat']);
            $cat_stmt->execute();
            $cat_result = $cat_stmt->get_result();
            $category_name = $cat_result->fetch_assoc()['cat_title'];

            // Display product with category name
            $pro_id    = $row['product_id'];
            $pro_cat   = $category_name; // Use fetched category name
            $pro_brand = $row['product_brand'];
            $pro_title = $row['product_title'];
            $pro_price = $row['product_price'];
            $pro_image = $row['product_image'];
          
            
			echo "
                
                         <div class='col-md-3'>
								<a href='product.php?p=$pro_id'><div class='product'>
									<div class='product-img'>
										<img src='product_images/$pro_image' style='max-height: 170px;' alt=''>
										<div class='product-label'>
							
										</div>
									</div></a>
									<div class='product-body'>
										
										<h3 class='product-name header-cart-item-name'><a href='product.php?p=$pro_id'>$pro_title</a></h3>
                                        <h3 class='product-name header-cart-item-name'>$category_name</a></h3>
										<h4 class='product-price header-cart-item-info'>$pro_price</h4>
										<div class='product-rating'>
											<i class='fa fa-star'></i>
											<i class='fa fa-star'></i>
											<i class='fa fa-star'></i>
											<i class='fa fa-star'></i>
											<i class='fa fa-star'></i>
										</div>
										<div class='product-btns'>
											<button class='add-to-wishlist'><i class='fa fa-heart-o'></i><span class='tooltipp'>add to wishlist</span></button>
											<button class='add-to-compare'><i class='fa fa-exchange'></i><span class='tooltipp'>add to compare</span></button>
											<button class='quick-view'><i class='fa fa-eye'></i><span class='tooltipp'>quick view</span></button>
										</div>
									</div>
									<div class='add-to-cart'>
										<button pid='$pro_id' id='product' class='add-to-cart-btn block2-btn-towishlist' href='#'><i class='fa fa-shopping-cart'></i> add to cart</button>
									</div>
								</div>
                                </div>

			";
        }
    } else {
        echo "0 results";
    }

    // Close the statement
    $stmt->close();
    // Close the connection
    $con->close();
}
?>
<div>
<?php 

include "footer.php";
?>
</div