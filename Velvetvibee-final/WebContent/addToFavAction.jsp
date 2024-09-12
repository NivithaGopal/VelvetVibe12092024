<%@ page import="bean.FavoritesBean, dao.FavoritesDAO"%>
<%@ page
	import="javax.servlet.http.HttpServletResponse, javax.servlet.http.HttpServletRequest"%>
<%@ page import="java.io.IOException"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add to Favorites Action</title>
</head>
<body>
	<%
        String email = request.getParameter("email");
        int userId = Integer.parseInt(request.getParameter("userId"));
        int servicevv_id = Integer.parseInt(request.getParameter("servicevv_id"));
        String service_name = request.getParameter("service_name");
        String category_name = request.getParameter("category_name");
        String description = request.getParameter("description");
        int amount_from = Integer.parseInt(request.getParameter("amount_from"));
        int amount_to = Integer.parseInt(request.getParameter("amount_to"));
        String image1 = request.getParameter("image1");
        String image2 = request.getParameter("image2");
        String image3 = request.getParameter("image3");

        FavoritesBean favorite = new FavoritesBean();
        favorite.setUserId(userId);
        favorite.setServicevv_id(servicevv_id);
        favorite.setEmail(email);
        favorite.setService_name(service_name);
        favorite.setCategory_name(category_name);
        favorite.setDescription(description);
        favorite.setAmount_from(amount_from);
        favorite.setAmount_to(amount_to);
        favorite.setImage1(image1);
        favorite.setImage2(image2);
        favorite.setImage3(image3);

        FavoritesDAO favoritesDAO = new FavoritesDAO();
        boolean result = favoritesDAO.addFavorite(favorite);

        if (result) {
            out.println("<script>alert('Service added to favorites successfully!'); window.location.href='getservicesuser.jsp';</script>");
        } else {
            out.println("<script>alert('Failed to add service to favorites. Please try again.'); window.location.href='addToFav.jsp?favorite_id=" + favorite.getFavorite_id() + "&userId=" + userId + "&servicevv_id=" + servicevv_id + "&email=" + email + "&service_name=" + service_name + "&category_name=" + category_name + "&description=" + description + "&amount_from=" + amount_from + "&amount_to=" + amount_to + "&image1=" + image1 + "&image2=" + image2 + "&image3=" + image3 + "';</script>");
        }
        
        %>
    </body>
</html>