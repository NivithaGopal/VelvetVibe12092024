<%@ page import="bean.FavoritesBean, dao.FavoritesDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add to Favorites</title>
    <link rel="stylesheet" href="path/to/bootstrap.min.css">
    <style>
        .container {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Add Service to Favorites</h2>
        <form action="addToFavAction.jsp" method="post">
            <input type="hidden" name="favorite_id" value="${param.favorite_id}">
            <input type="hidden" name="userId" value="${param.userId}">
            <input type="hidden" name="servicevv_id" value="${param.servicevv_id}">
            <input type="hidden" name="email" value="${param.email}">

            <div class="form-group">
                <label for="service_name">Service Name:</label>
                <input type="text" class="form-control" id="service_name" name="service_name" value="${param.service_name}" readonly>
            </div>

            <div class="form-group">
                <label for="category_name">Category Name:</label>
                <input type="text" class="form-control" id="category_name" name="category_name" value="${param.category_name}" readonly>
            </div>

            <div class="form-group">
                <label for="description">Description:</label>
                <textarea class="form-control" id="description" name="description" rows="4" readonly>${param.description}</textarea>
            </div>

            <div class="form-group">
                <label for="amount_from">Amount From:</label>
                <input type="number" class="form-control" id="amount_from" name="amount_from" value="${param.amount_from}" readonly>
            </div>

            <div class="form-group">
                <label for="amount_to">Amount To:</label>
                <input type="number" class="form-control" id="amount_to" name="amount_to" value="${param.amount_to}" readonly>
            </div>

            <div class="form-group">
                <label for="image1">Image 1:</label>
                <input type="text" class="form-control" id="image1" name="image1" value="${param.image1}" readonly>
            </div>

            <div class="form-group">
                <label for="image2">Image 2:</label>
                <input type="text" class="form-control" id="image2" name="image2" value="${param.image2}" readonly>
            </div>

            <div class="form-group">
                <label for="image3">Image 3:</label>
                <input type="text" class="form-control" id="image3" name="image3" value="${param.image3}" readonly>
            </div>

            <button type="submit" class="btn btn-primary">Add to Favorites</button>
            <a href="getservicesuser.jsp" class="btn btn-secondary">Back</a>
        </form>
    </div>
</body>
</html>
